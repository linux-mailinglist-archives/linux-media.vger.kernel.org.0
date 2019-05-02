Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A60E1212C
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 19:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfEBRoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 13:44:05 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33135 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfEBRoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 13:44:05 -0400
Received: by mail-ed1-f66.google.com with SMTP id n17so2890816edb.0;
        Thu, 02 May 2019 10:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nYBHajXZECXt8T/IMhMmZNu90uwNgGgmz/HcZlw49H4=;
        b=XrPuU75JPW3MEw5RPSs6sle4oa2lpJsTQFaA9sXPM8ZPHaELiYXScOEqSYTi4QhfLv
         rN/MO6ExBt85KdEJ9LmB/M+qNlMQd/wWio0HBGnaussc6tWAWIhAX4UQvyjO8CU/Vohs
         lqqBJzqeSSsJKL+5rNj7JbqQNtZZ1uvZnas0O6v7ecwdNZuyfBANnr/uNWv/I3hbstCA
         /JwmTaYq1wN8v30CqHcorM4ouUTaKvthxvVfZGa5kYB/V0uTsLYyYSXHDZJmRFInTO1A
         ICBYDkab9tiCbZJam02kQkcBCwpbjuMuYzh2QvwViAyWVNtnXESTOrENnu/cQGT7zwq8
         Isjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nYBHajXZECXt8T/IMhMmZNu90uwNgGgmz/HcZlw49H4=;
        b=epRNLEghB5FbsoWOLxJXr1tKZrioY5lCc6Qluf29zhhFqDzGtXahzNXtyuOFXPviuU
         dKUac6BBR5Vm1oENZvy7JjL7ZUM8IRC0wEx1VuCjuoCWHrxu0ZD85c/uhr9Lz4LhSLig
         HbPO1f9pC+THT6wXEtmiPv/asihxf1lEljiGqWUOaD+tJI+p6xjdJ9czbWRX40LGrL8z
         ruR5c4LpZFU+PTC0daHnW7jkgHIUa0vq0CkY7/TLHTfJ5NgvZGP6Ebf4xsxuO5qOa3GA
         5csAULdLYZThqikdhzVihNTnUar1iEZTYWNLZiEcxcaIZiBTyu+bl3LDlo2hBIbvp1lQ
         bzQw==
X-Gm-Message-State: APjAAAW8avkqyfyoP5X+4rHCIWzhN6JHJyCX7yjsm8d6xSD7lUaFnox5
        cMWf2tWSphsabAn0+2MXwFdZaSUI
X-Google-Smtp-Source: APXvYqxNadhPK7RE3Kdcvi8xFS3mpmM2xw13Tv1SWGLGBmsiRlYmpDVF29h6niE3X/3uK/F3JS57Ow==
X-Received: by 2002:a17:906:7d08:: with SMTP id u8mr2446225ejo.1.1556819041392;
        Thu, 02 May 2019 10:44:01 -0700 (PDT)
Received: from [172.30.88.227] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id r55sm659619edd.94.2019.05.02.10.43.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 10:44:00 -0700 (PDT)
Subject: Re: Questions regarding Documentation/media/uapi/v4l/field-order.rst
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        "Rodin, Michael (Ferchau; ADITG/ESM1)" <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     "Friedrich, Eugen (ADITG/ESM1)" <efriedrich@de.adit-jv.com>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <AC35D0CFBC66A84AAA9DF4334B52828D13614162@HI2EXCH01.adit-jv.com>
 <187c237b-6b75-f408-ae41-6065baf5cd7f@xs4all.nl>
 <4f57076c-9a41-dfe3-2d26-568be09b1637@gmail.com>
 <23fb5b15-a952-ed2f-0da4-bf4c5a5d93b5@xs4all.nl>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <884977d8-e25a-7a1f-3ac5-40e543abb1af@gmail.com>
Date:   Thu, 2 May 2019 10:43:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23fb5b15-a952-ed2f-0da4-bf4c5a5d93b5@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/2/19 12:33 AM, Hans Verkuil wrote:
> On 5/1/19 2:09 AM, Steve Longerbeam wrote:
>> Hi Hans,
>>
>> Thanks for the clarifications.
>>
>> I have one additional comment.
>>
>> The distinction between which field is _older_ (e.g. the field that was
>> recorded or captured first by the video camera) and which field is
>> _transmitted_ first needs to be more clear IMHO.
>>
>> Even if there is no distinction, that is, all video equipment transmit
>> fields in the same order they were recorded, I think this should be
>> clarified better. The doc is using both terminology (captured first vs.
>> transmitted first) so it would be helpful to clarify that they mean the
>> same thing.
> Thank you for the suggestion. This can be improved. I'll add it as a TODO,
> but it's not high on my prio list, I'm afraid. If you don't want to wait
> for me, then feel free to post a patch.

Ok, I will suggest a patch.

Steve

>
>
>
>
> On 4/23/19 7:05 AM, Hans Verkuil wrote:
>>> On 4/16/19 3:54 PM, Rodin, Michael (Ferchau; ADITG/ESM1) wrote:
>>>> Hi,
>>>>
>>>> I would like to ask several questions regarding the documentation of the enum "v4l2_field" [1].
>>>> These questions came up during my investigations of issues with interaction between
>>>> the gstreamer plugin v4l2src and the rcar video input driver [2].
>>>>
>>>> The documentation [1] specifies that:
>>>> "All video capture and output devices must report the current field order.
>>>> Some drivers may permit the selection of a different order, to this end
>>>> applications initialize the field field of struct v4l2_pix_format before
>>>> calling the VIDIOC_S_FMT ioctl. If this is not desired it should have
>>>> the value V4L2_FIELD_ANY (0)."
>>>>
>>>> If I have understood these lines correctly, this means that if userspace sets "field" member of
>>>> the struct "v4l2_pix_format" to V4L2_FIELD_ANY and uses this as parameter for the VIDIOC_S_FMT ioctl,
>>>> then a driver should select/report the field order, which was previously set by media-ctl utility
>>>> in the next subdevice, which is connected to the /dev/videoX node
>>>> (From my understanding this would be equivalent to the "current field order").
>>>>
>>>> If the described behavior is correct, then the description in the table row for V4L2_FIELD_ANY in [1] is incomplete:
>>>> "Applications request this field order when any one of the V4L2_FIELD_NONE, V4L2_FIELD_TOP, V4L2_FIELD_BOTTOM, or V4L2_FIELD_INTERLACED formats is acceptable."
>>>> What if V4L2_FIELD_ALTERNATE or V4L2_FIELD_SEQ_TB or V4L2_FIELD_SEQ_BT are also acceptable for the application?
>>>> I think that the specification is either unprecise or my understanding of the specification is wrong.
>>> The spec is a bit out of date: those missing field values were probably added after this
>>> text was written. I'll make a patch fixing this.
>>>
>>>> Another potential issue, which I found in this documentation is that it does not distinguish between
>>>> multiple contexts in which enum v4l2_field can be used. I can think of at least two different contexts:
>>>> - When used to select the field order with VIDIOC_S_FMT ioctl.
>>>> - When used to report the field order in a buffer: for example application sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl and then gets buffers, which have V4L2_FIELD_TOP/BOTTOM set.
>>> IMHO the text is reasonably clear on that. But if you have suggestions to
>>> improve it, then make a proposal.
>>>
>>>> Now with this in mind, when I read the description of V4L2_FIELD_NONE:
>>>> "The driver may also indicate this order when it cannot distinguish between V4L2_FIELD_TOP and V4L2_FIELD_BOTTOM."
>>> Whoops, that makes no sense. There are no drivers that do this. I'll remove this
>>> line. If a driver can't tell the difference, then it should just pick FIELD_TOP
>>> or BOTTOM.
>>>
>>>> I see two possible meanings/interpretations:
>>>> - If application sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl, report V4L2_FIELD_NONE back
>>>>      so the application knows that the driver can not provide any TOP/BOTTOM metadata in the buffers
>>>>      (which may be necessary for the application for example for deinterlacing) before it has got any buffer.
>>>> - If application sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl, driver reports V4L2_FIELD_ALTERNATE back,
>>>>      even if it can not distinguish between TOP/BOTTOM. But when the application starts to read buffers,
>>>>      they have V4L2_FIELD_NONE set if it's not possible to distinguish between TOP/BOTTOM.
>>> Actually, drivers cannot ever return NONE for a top or bottom field. FIELD_NONE
>>> indicates that a full frame has arrived, and doing something else would break
>>> userspace.
>>>
>>>> Also there is another ambiguity in the description of V4L2_FIELD_NONE:
>>>> "Images are in progressive format, not interlaced."
>>>> What does "interlaced" mean in this case? Does it mean the other possible enum values or just the V4L2_FIELD_INTERLACED?
>>> It means that the source video transmitted full frames, not top and bottom
>>> fields. I clarified the text a bit.
>>>
>>>> If this just means V4L2_FIELD_INTERLACED, then it would imply that for example V4L2_FIELD_SEQ_TB
>>>> and V4L2_FIELD_ALTERNATE are progressive formats, which is obviously not true.
>>>> And also generally, in which of described contexts should be V4L2_FIELD_NONE set or reported (buffer or VIDIOC_S_FMT ioctl)?
>>> For video capture (that's what we are talking about here) it is returned by the
>>> driver in v4l2_buffer, never by userspace. Userspace can try to request a specific
>>> field value when calling S_FMT, but the driver can overwrite it.
>>>
>>> The possible field values that a driver can support are dependent on the video
>>> source (i.e. sensors are always FIELD_NONE) and the hardware capabilities.
>>>
>>>> Another point is that V4L2_FIELD_INTERLACED is also used by v4l2src to tell rcar-vin driver to combine the fields before giving them to application,
>>>> so basically it requests progressive signal. So the meanings of V4L2_FIELD_INTERLACED and V4L2_FIELD_NONE are basically the same in this case.
>>> Certainly not. FIELD_INTERLACED combines two fields into a single buffer, but the
>>> odd and even lines in the frame were captured at different times. Whereas for
>>> FIELD_NONE all lines were captured at the same time.
>>>
>>> So a FIELD_INTERLACED buffer may need to undergo additional deinterlacing.
>>>
>>> If the hardware already does high-quality deinterlacing then that might be
>>> a reason for the driver to return FIELD_NONE to avoid additional deinterlacing
>>> in userspace.
>>>
>>> In practice there are three main categories in the way the field is handled:
>>>
>>> 1) The video source is a webcam: field is always FIELD_NONE, set by the driver.
>>>
>>> 2) The video source is HDMI: if the video is progressive, then the field is always
>>>      FIELD_NONE. If the video is interlaced, then the field is always FIELD_ALTERNATE
>>>      in v4l2_format and alternating FIELD_TOP and BOTTOM in v4l2_buffer.
>>>
>>> 3) The video source is SDTV (i.e. S-Video or composite): the video is always
>>>      interlaced, and it depends on the hardware which field values are supported,
>>>      except for FIELD_NONE, which is never returned as far as I am aware.
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> Thank you in advance and sorry for the long mail!
>>>>
>>>> [1] Documentation/media/uapi/v4l/field-order.rst
>>>> [2] drivers/media/platform/rcar-vin
>>>>
>>>> Best regards
>>>>
>>>> Michael Rodin
>>>>
>>>> Advanced Driver Information Technology GmbH
>>>> Engineering Software Multimedia 1 (ADITG/ESM1)
>>>> Robert-Bosch-Str. 200
>>>> 31139 Hildesheim
>>>> Germany
>>>>
>>>> Tel. +49 5121 49 6936
>>>> Fax +49 5121 49 6999
>>>> mrodin@de.adit-jv.com
>>>> Web: www.adit-jv.com
>>>>
>>>> ADIT is a joint venture company of Robert Bosch GmbH/Robert Bosch Car Multimedia GmbH and DENSO Corporation
>>>> Sitz: Hildesheim, Registergericht: Amtsgericht Hildesheim HRB 3438
>>>> Geschaeftsfuehrung: Wilhelm Grabow, Ken Yaguchi
>>>>

