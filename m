Return-Path: <linux-media+bounces-23808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DD39F7EDD
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3320716BC73
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54302227596;
	Thu, 19 Dec 2024 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KeQAColO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B9C218AC8
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 16:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624347; cv=none; b=ANrZd2gyN2nWYizCROT4yzEUsWrZRPFkQ1rGy60NbcFxTBz/X2YjGJFY3bHsUA6aUhgGTaTngAHJA1XX/o7MQU0XGxCBb5lgdsv7PK4gh53rrQoPKy9d9J861adbwLWKRzBN7UzHWVYawWK9qHcghlb2qEP8EV/DLqzyDn+Cqr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624347; c=relaxed/simple;
	bh=ueRydOxQOkEzoL6wtj33s3w+nIvQHeGkmeC4EgwtjnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2dYTHN7nhMhHPUnF9h89FHAGCKpecWDVb5qow9D5gIsnUAa+8wQT3XJzrGnzvfzk3MUP19kMPjWr/u8di3V2FDlvK3wV2C32k1Ogtv6M6gLog7V+wxw4y0e3+WyqMTEN8PrOtYxfq9cuMFqERwXyX9perC11EkhwiLS9cJVHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KeQAColO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734624344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S55zZeofYg2GWYRTp6hBnhelF/87d1MdB4o7NxnMN2U=;
	b=KeQAColOZ+uclh4U7BHJaqSzjwsCoFZst7Xdsomat3UD1PgiOk55ycZvG0Sd4ThL/rNXyd
	/mvWbka71o/J9r21FvT8yfnmjPbJjM40U5U3Q+aXRvS+mC8nGcUu2Ngw8d4yHOXe5rsxMw
	T77vTH4xkU6wdfumzXJLHo3TAh4yr24=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-JD1YlYZlODuez7J4TubvJw-1; Thu, 19 Dec 2024 11:05:42 -0500
X-MC-Unique: JD1YlYZlODuez7J4TubvJw-1
X-Mimecast-MFC-AGG-ID: JD1YlYZlODuez7J4TubvJw
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6845cf116so118283366b.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 08:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624342; x=1735229142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S55zZeofYg2GWYRTp6hBnhelF/87d1MdB4o7NxnMN2U=;
        b=Ei0tSVUr9f2KEjtBh8pW5L6pp0Mq6JuCvxnhJN2c3McEu3LI9EBAp/1q+8bvlVRjqT
         KwXuImAPlqafsjBa5CdyJlLHIHOw4/qFvfIkzdpO7XTPZ+bLLOXbJvZBnG4YsrU8AFZY
         fTnl8o+QMCAYH8BY5kOUDy7psfweNWjAIOriX8hqqdGUpuBm63Uphe3nKyhmL3MXSibx
         fAIY1HXWr+QVZ/tHI0o3I+zA2CbPwyigCBFLoahYK5cN7O6lrZH2qEuop3nkFn7xWPI3
         176C3a2ef2cjxu0qMxOTMJFngWRKh3MoK/8mZobSX6jt+RFxRR+cLUucXdK8X0CVtaQl
         vXXg==
X-Forwarded-Encrypted: i=1; AJvYcCUqpazY0V0E4CflCNLqtyZsvSFd4dfCQzFao2Dk/w4MbSexDmEYya7s/ETcSqET/VGk5Jf/0Lz+oZ/Q7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbF9SkbpkU5o6/O/6ebsyd+d9Y78aE7vkZemqMB/6qoCsIPc2
	q1PWd5Y+OzCenUyOurUuICw5O4Gnjna1E8KxHsRiUVithfKir3ixHKGpPzdM0/LSrrSEE4hXYH8
	E/37u1hzkQ13NW/rFXFbbYG4iWufjLV5cJtTQI+fbcbKmcQqrJp6SuPe4byly
X-Gm-Gg: ASbGncuL5fheb/zYnTBkpJcii0dKFpAU43ObvliQ+HAGnGNbv1GoE06ZNoRtbtxaLf4
	ifQX7kJiaUl9o+bv2BHnSvMfRt9pe9MomVAQr9s5TaKEPhbOXyp8/OdOWZiOhWN3kXdvHQsV6dH
	PAcUyh+BnRmNkmpPvxaIn+hr4XK4uyV/3qeuIJExmm980HASnRzwHO6cgbO3mE8ZcvXOnAXiawB
	fGrddaz4k8v/NYMz+uSaw0gUsp0rJ2P1UKfI2N/NjhZ/XqFTlOi9KMT+2KqFC/G92lRgcMwfkCb
	hjtrcQCgrfMESDk1WH7W4odOX7f7f8i8xZebsHXt/R6qDPceg/rE8Tb5EiCzt3ZAJSygrTkI+vK
	LLKyTFu3kEY0E0c+TZopUVuvcnLa2B7A=
X-Received: by 2002:a17:907:94c7:b0:aab:a02c:764e with SMTP id a640c23a62f3a-aac081547d2mr366916666b.14.1734624341515;
        Thu, 19 Dec 2024 08:05:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwv2+kzoBQuPbNIGSxInVAGWyKyoK+jCqBN/PbPIMMVzfTub5vnMztqJjHxjmeJe+lp9vamQ==
X-Received: by 2002:a17:907:94c7:b0:aab:a02c:764e with SMTP id a640c23a62f3a-aac081547d2mr366911366b.14.1734624340966;
        Thu, 19 Dec 2024 08:05:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f05fd7csm78573366b.172.2024.12.19.08.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 08:05:40 -0800 (PST)
Message-ID: <372a4cd2-60ea-4ce8-848f-318e34d62cbf@redhat.com>
Date: Thu, 19 Dec 2024 17:05:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating
 controls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
 <20241218232730.GF5518@pendragon.ideasonboard.com>
 <CANiDSCu4krUbXq_RiaP5dSZVGdA6CxmUBzxEEPqMNCS4Ar05mw@mail.gmail.com>
 <20241219144124.GB2510@pendragon.ideasonboard.com>
 <CANiDSCtbkitSDkk-gsb1XwKyYWeCb6pVZJQhYGQjtAyM36oTmA@mail.gmail.com>
 <20241219154103.GD19884@pendragon.ideasonboard.com>
 <CANiDSCshYk2OyF_p1inwSdEhMnP0OV2vStFgbMgEHJZzLcG9pg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCshYk2OyF_p1inwSdEhMnP0OV2vStFgbMgEHJZzLcG9pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Dec-24 4:53 PM, Ricardo Ribalda wrote:
> On Thu, 19 Dec 2024 at 16:41, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Thu, Dec 19, 2024 at 04:35:37PM +0100, Ricardo Ribalda wrote:
>>> On Thu, 19 Dec 2024 at 15:41, Laurent Pinchart wrote:
>>>> On Thu, Dec 19, 2024 at 09:17:31AM +0100, Ricardo Ribalda wrote:
>>>>> On Thu, 19 Dec 2024 at 00:27, Laurent Pinchart wrote:
>>>>>> On Fri, Dec 13, 2024 at 11:21:02AM +0000, Ricardo Ribalda wrote:
>>>>>>> To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
>>>>>>> values that were not cached previously. If that read fails, we used to
>>>>>>> report back the error to the user.
>>>>>>>
>>>>>>> Unfortunately this does not play nice with userspace. When they are
>>>>>>> enumerating the contols, the only expect an error when there are no
>>>>>>> "next" control.
>>>>>>>
>>>>>>> This is probably a corner case, and could be handled in userspace, but
>>>>>>> both v4l2-ctl and yavta fail to enumerate all the controls if we return
>>>>>>> then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
>>>>>>> userspace apps handling this wrongly as well.
>>>>>>>
>>>>>>> This patch get around this issue by ignoring the hardware errors and
>>>>>>> always returning 0 if a control exists.
>>>>>>>
>>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>>>> ---
>>>>>>> Hi 2*Hans and Laurent!
>>>>>>>
>>>>>>> I came around a device that was listing just a couple of controls when
>>>>>>> it should be listing much more.
>>>>>>>
>>>>>>> Some debugging latter I found that the device was returning -EIO when
>>>>>>> all the focal controls were read.
>>>>>>
>>>>>> Was it transient and random errors, or does the device always fail for
>>>>>> those controls ?
>>>>>
>>>>> For one of the devices the control is always failing (or I could not
>>>>> find a combination that made it work).
>>>>>
>>>>> For the other it was more or less random.
>>>>
>>>> Are there other controls that failed for that device ? And what
>>>> request(s) fail, is it only GET_CUR or also GET_MIN/GET_MAX/GET_RES ?
>>>
>>> It is a mix.
>>>
>>>> What's the approximate frequency of those random failures ?
>>>>
>>>>>>> This could be solved in userspace.. but I suspect that a lot of people
>>>>>>> has copied the implementation of v4l-utils or yavta.
>>>>>>>
>>>>>>> What do you think of this workaround?
>>>>>>
>>>>>> Pretending that the control could be queried is problematic. We'll
>>>>>> return invalid values to the user, I don't think that's a good idea. If
>>>>>> the problematic device always returns error for focus controls, we could
>>>>>> add a quirk, and extend the uvc_device_info structure to list the
>>>>>> controls to ignore.
>>>>>>
>>>>>> Another option would be to skip over controls that return -EIO within
>>>>>> the kernel, and mark those controls are broken. I think this could be
>>>>>> done transparently for userspace, the first time we try to populate the
>>>>>> cache for such controls, a -EIO error would mark the control as broken,
>>>>>> and from a userspace point of view it wouldn't be visible through as
>>>>>> ioctl.
>>>>>
>>>>> I see a couple of issues with this:
>>>>> - There are controls that fail randomly.
>>>>> - There are controls that fail based on the value of other controls
>>>>> (yeah, I know).
>>>>
>>>> I was fearing there would be random (or random-looking) failures, as
>>>> that can preclude marking the controls as broken and fully hiding them
>>>> from userspace :-(
>>>>
>>>>> - There are controls that do not implement RES, MIN, or MAX, but
>>>>> besides that, they are completely functional.
>>>>> In any of those cases we do not want to skip those controls.
>>>>>
>>>>> I am not against quirking specific cameras once we detect that they
>>>>> are broken...
>>>>
>>>> Hopefully there won't be too many of those, right ? Righhhht... ?
>>>
>>> So far I have identified 4 in a week, and I am not testing obscure
>>> camera modules....
>>
>> Can you provide more information about those modules ? USB descriptors
>> maybe, and the list of controls that fail, and how they fail ?
> 
> These are the ones I can share now:
> 
> "13d3:5519": Focus value out of range
> focus_absolute 0x009a090a (int)    : min=355 max=790 step=1 default=6
> value=500 flags=inactive

Hmm this one looks like min and default are swapped ?

So I guess this one needs a quirk which checks if default < min
and in that case swaps them (the check is to avoid swapping
with fixed fw). If these are built into chromebooks how about
doing a fwupdate for the camera instead ?

> "3277:0003": Focus returns -EIO
> Focus Absolute and Focus, Automatic Continuous: return -EIO for at
> least one of get_ max/min/res
> 
> "0408:302f": Error reading AutoExposure Flags
> UVC_GET_INFO returns invalid flags

Regards,

Hans




