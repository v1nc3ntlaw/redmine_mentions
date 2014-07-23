class MentionMailer < ActionMailer::Base
  layout 'mailer'
  default from: Setting.mail_from
  def self.default_url_options
    Mailer.default_url_options
  end

  def notify_mentioning(issue, journal, user)
    @issue = issue
    @issue_url = url_for(:controller => 'issues', :action => 'show', :id => issue, :anchor => "change-#{journal.id}")
    @journal = journal
    subject = "[#{issue.project.name} - #{issue.tracker.name} ##{issue.id}] You were mentioned. #{issue.subject}"
    mail(to: user.mail, subject: subject)
  end
end
