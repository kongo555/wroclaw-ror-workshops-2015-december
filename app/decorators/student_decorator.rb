class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    if subject_item.subject_item_notes.empty?
      return "0.00"
    else
      total = 0.0
      subject_item.subject_item_notes.each do |item|
        total += item.value
      end
      total /= subject_item.subject_item_notes.length

      return sprintf( "%0.02f", total.round(2))
    end
  end

  def birthday
    if birthdate.present?
      return birthdate.strftime('%Y-%m_%d')
    else
      return ""
    end
  end
end
