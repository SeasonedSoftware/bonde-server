# -*- coding: utf-8 -*-
class Mobilization < ActiveRecord::Base
  acts_as_taggable

  enum status: { active: 'active', draft: 'draft', archived: 'archived' }

  include Shareable
  include Filterable

  validates :name, :user_id, :goal, presence: true
  validates :slug, presence: :true
	validates_uniqueness_of :slug
  validates_length_of :slug, maximum: 63
  validates :custom_domain, uniqueness: true, allow_nil: true

  belongs_to :user
  belongs_to :community

  has_many :blocks
  has_many :widgets, through: :blocks
  has_many :form_entries, through: :widgets

  before_validation :slugify
  before_save :set_color_scheme
  before_save :refresh_host_rule
  before_create :set_twitter_share_text

  scope :not_deleted, -> { where(deleted_at: nil) }

  scope :by_status, -> status { where(status: status) }

  def url
    if self.custom_domain.present?
      "http://#{self.custom_domain}"
    else
      "http://#{self.slug}.#{ENV["CLIENT_HOST"]}"
    end
  end

  def copy_from template
    self.color_scheme = template.color_scheme
    self.facebook_share_title = template.facebook_share_title
    self.facebook_share_description = template.facebook_share_description
    self.header_font = template.header_font
    self.body_font = template.body_font
    self.facebook_share_image = template.facebook_share_image
    self.custom_domain = template.custom_domain
    self.twitter_share_text = template.twitter_share_text
    self
  end

  def refresh_host_rule
    if custom_domain_changed?
      self.traefik_host_rule = "Host:#{custom_domain.downcase}"
    end
  end

  private

  def slugify
		if ((Mobilization.where(slug: self.slug).count > 0) or self.slug.nil?)
      self.slug = "#{self.class.count+1}-#{self.name.try(:parameterize)}" if !(Mobilization.where(id: self.id, slug: self.slug).count > 0)
		end
  end

  def set_twitter_share_text
    self.twitter_share_text = "Acabei de colaborar com #{self.name}. Participe você também: "
  end

  def set_color_scheme
    if self.community.present?
      self.color_scheme = "#{self.community.name.delete(' ').parameterize}-scheme"
    end
  end

end
