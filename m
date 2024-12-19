Return-Path: <linux-media+bounces-23810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E99F7FC6
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF7FD1887149
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E58226899;
	Thu, 19 Dec 2024 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MPHCu1C6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4B22578A
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734625750; cv=none; b=lquOkk65DokAenRLx4snzCHsKUmtORhH2fVWiNiAunux/A++RJzrC/z9B7t1v3X3k6XP+KuCPsC5sz0Bdd5WXZvsz6TtQ/cW7/758b7X5wFCqW6kgPuFqvEg/FHY8Ap2+6gmEZTUQEqGUnFniCzfVXpxH3VpIBSbGWcoJPJ3xhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734625750; c=relaxed/simple;
	bh=oKIq5vnmx1xQOzVkLsM5Wqe3GsjrviAYVLCXlbjtP04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i19k0OKFjLSG2MJAmuvTOaH1qKAK/9Seq0X8WO5X1U5MjIIUH7OsFTOkVcu1X6skWgX5e7cBbbBWEN5xbbAV37EUbfiALuobUGMzC4q4QTDq5kzM96ERchf4Uxzs7CIoimuieWV31qhm5mXHi9VZaOB/cbHr77J0gxAUqYr/PAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MPHCu1C6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734625747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=So5R73QcSisDFY3wMbd2J1hSFrs51I/ICzSiUu4MnMg=;
	b=MPHCu1C6LBRl80NpN7lCju+h4AqSrv8Jd6TAeeZi7hmcwLcubVEmM8ALVBbLqv8E/Nsc3D
	ELKmJDHd2BD3ngVNTPkAahYhxomkCFN5eHz9Tuy6eyaSElTR2yp6EHVrik61R0AiFuTdzl
	2VsgG7HAlOL2sVZHXPLMsnR8Z1xzYac=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-j0pLUuxkNy-zObXYToc3yg-1; Thu, 19 Dec 2024 11:29:03 -0500
X-MC-Unique: j0pLUuxkNy-zObXYToc3yg-1
X-Mimecast-MFC-AGG-ID: j0pLUuxkNy-zObXYToc3yg
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d09962822bso1042150a12.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 08:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734625742; x=1735230542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=So5R73QcSisDFY3wMbd2J1hSFrs51I/ICzSiUu4MnMg=;
        b=VCKP6cuLjZGRfs+K9MITB2Lwduq0F3byBNJiv3tekT4aWhNdzwMA73DUwygodcu95H
         dCqR1X6iTJl4KtPXDM8aKStGvH3FsSmEf4orVgsqN2sC5PavQI4NYsgwPChlvjAGz+Ci
         WqY4Jujsx8XQAKkI2mNdWzBfBRLF/B+T8q16y8WltaGlQZmpxTS4sptsXwjDtzDkkOF1
         aDvdn4zaMGko+fdcZvBVlS0+n+iLxDSwWZBfMUgCdhG+ymy+ZUchQEMK9YlJnS9CqhPc
         pKaSRn9pXdx2LihmsxhmVkK8kKmpBe6olEyNu+9DIfSX8IniPNBrt7+TuYIsE1cGetdF
         8E5w==
X-Forwarded-Encrypted: i=1; AJvYcCUcOlT2iX9K386CzFFFBESU/iQMTVqDVJFMM2KlXIXRFd8Hc3Jq1Wy7edvfy1NHDC9knSe3IZQgBopkUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcadXeashDEAwHsE5R/jT1G3Mb6qqQTq7K1fPI5dbKG6Jpv7e
	rmjx9F6F0DbnHwuZftrgp3TIbfTnoBvjU2jnGQOxz8MOs0z3kaqZF+5ctxOy2jhi3yFAiOIgt4j
	DNf1cGHzNxGGpxBIYVNi/JScGdIsmIAgQSQ0feDQwZzIEJa7piVX++NmZ0hbO
X-Gm-Gg: ASbGncuEF0496eeKqMJf7/EAQAE8gQ86zj4wfM0rj3eS+fF73caEQ4Y3sDWerV+6E2D
	v9jlWpEb7OhQq/m4st/q1PkWZDpy3i/al3ClYYnyIyGxb2eXLooPyLYY6bPRfSfjdQWZ8BlB0xe
	cnjiIuFWX+2qwCwzbeBfTnrqYUK608RxBSrRLNn+ErKRLBqsaC1gUNwM0IO0iinSwuPLYgbIgCO
	ufvhZ7vOMCNe4TGFcuorazgIRqt+xSB4wiResrAx2sK7yY3KkTxpJArW9bFIOXHD2vRpUSs2y+j
	QmgQ7HPgokVas066hrgLY0117w0+VmZT1QsR3GQXYA16nmKLolC4tn5EKAHJU3tGcbmGGmCKxzJ
	gF6wyMkzjeyUcbjDMKAX0zYbml+0BUd8=
X-Received: by 2002:a05:6402:350d:b0:5d1:fb79:c1b2 with SMTP id 4fb4d7f45d1cf-5d8025c743emr3370223a12.11.1734625742418;
        Thu, 19 Dec 2024 08:29:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg79ItjB5SIzLn6TdKcIl17PUCrEkAPLeQR65C/1Y7SIrhTQkXTpDrepiNCNXWFZyk9vze2w==
X-Received: by 2002:a05:6402:350d:b0:5d1:fb79:c1b2 with SMTP id 4fb4d7f45d1cf-5d8025c743emr3370194a12.11.1734625741939;
        Thu, 19 Dec 2024 08:29:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701b2absm783363a12.81.2024.12.19.08.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 08:29:01 -0800 (PST)
Message-ID: <9ea278a7-6ad3-4e3d-ac1d-8df3f7e97d9a@redhat.com>
Date: Thu, 19 Dec 2024 17:29:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating
 controls
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
 <20241218232730.GF5518@pendragon.ideasonboard.com>
 <CANiDSCu4krUbXq_RiaP5dSZVGdA6CxmUBzxEEPqMNCS4Ar05mw@mail.gmail.com>
 <20241219144124.GB2510@pendragon.ideasonboard.com>
 <CANiDSCtbkitSDkk-gsb1XwKyYWeCb6pVZJQhYGQjtAyM36oTmA@mail.gmail.com>
 <20241219154103.GD19884@pendragon.ideasonboard.com>
 <CANiDSCshYk2OyF_p1inwSdEhMnP0OV2vStFgbMgEHJZzLcG9pg@mail.gmail.com>
 <372a4cd2-60ea-4ce8-848f-318e34d62cbf@redhat.com>
 <CANiDSCubXD6NEKSB6pycgPPLNj5-e+qggMGFx_TabRoo0ePOHg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCubXD6NEKSB6pycgPPLNj5-e+qggMGFx_TabRoo0ePOHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Dec-24 5:18 PM, Ricardo Ribalda wrote:
> On Thu, 19 Dec 2024 at 17:05, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 19-Dec-24 4:53 PM, Ricardo Ribalda wrote:
>>> On Thu, 19 Dec 2024 at 16:41, Laurent Pinchart
>>> <laurent.pinchart@ideasonboard.com> wrote:
>>>>
>>>> On Thu, Dec 19, 2024 at 04:35:37PM +0100, Ricardo Ribalda wrote:
>>>>> On Thu, 19 Dec 2024 at 15:41, Laurent Pinchart wrote:
>>>>>> On Thu, Dec 19, 2024 at 09:17:31AM +0100, Ricardo Ribalda wrote:
>>>>>>> On Thu, 19 Dec 2024 at 00:27, Laurent Pinchart wrote:
>>>>>>>> On Fri, Dec 13, 2024 at 11:21:02AM +0000, Ricardo Ribalda wrote:
>>>>>>>>> To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
>>>>>>>>> values that were not cached previously. If that read fails, we used to
>>>>>>>>> report back the error to the user.
>>>>>>>>>
>>>>>>>>> Unfortunately this does not play nice with userspace. When they are
>>>>>>>>> enumerating the contols, the only expect an error when there are no
>>>>>>>>> "next" control.
>>>>>>>>>
>>>>>>>>> This is probably a corner case, and could be handled in userspace, but
>>>>>>>>> both v4l2-ctl and yavta fail to enumerate all the controls if we return
>>>>>>>>> then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
>>>>>>>>> userspace apps handling this wrongly as well.
>>>>>>>>>
>>>>>>>>> This patch get around this issue by ignoring the hardware errors and
>>>>>>>>> always returning 0 if a control exists.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>>>>>> ---
>>>>>>>>> Hi 2*Hans and Laurent!
>>>>>>>>>
>>>>>>>>> I came around a device that was listing just a couple of controls when
>>>>>>>>> it should be listing much more.
>>>>>>>>>
>>>>>>>>> Some debugging latter I found that the device was returning -EIO when
>>>>>>>>> all the focal controls were read.
>>>>>>>>
>>>>>>>> Was it transient and random errors, or does the device always fail for
>>>>>>>> those controls ?
>>>>>>>
>>>>>>> For one of the devices the control is always failing (or I could not
>>>>>>> find a combination that made it work).
>>>>>>>
>>>>>>> For the other it was more or less random.
>>>>>>
>>>>>> Are there other controls that failed for that device ? And what
>>>>>> request(s) fail, is it only GET_CUR or also GET_MIN/GET_MAX/GET_RES ?
>>>>>
>>>>> It is a mix.
>>>>>
>>>>>> What's the approximate frequency of those random failures ?
>>>>>>
>>>>>>>>> This could be solved in userspace.. but I suspect that a lot of people
>>>>>>>>> has copied the implementation of v4l-utils or yavta.
>>>>>>>>>
>>>>>>>>> What do you think of this workaround?
>>>>>>>>
>>>>>>>> Pretending that the control could be queried is problematic. We'll
>>>>>>>> return invalid values to the user, I don't think that's a good idea. If
>>>>>>>> the problematic device always returns error for focus controls, we could
>>>>>>>> add a quirk, and extend the uvc_device_info structure to list the
>>>>>>>> controls to ignore.
>>>>>>>>
>>>>>>>> Another option would be to skip over controls that return -EIO within
>>>>>>>> the kernel, and mark those controls are broken. I think this could be
>>>>>>>> done transparently for userspace, the first time we try to populate the
>>>>>>>> cache for such controls, a -EIO error would mark the control as broken,
>>>>>>>> and from a userspace point of view it wouldn't be visible through as
>>>>>>>> ioctl.
>>>>>>>
>>>>>>> I see a couple of issues with this:
>>>>>>> - There are controls that fail randomly.
>>>>>>> - There are controls that fail based on the value of other controls
>>>>>>> (yeah, I know).
>>>>>>
>>>>>> I was fearing there would be random (or random-looking) failures, as
>>>>>> that can preclude marking the controls as broken and fully hiding them
>>>>>> from userspace :-(
>>>>>>
>>>>>>> - There are controls that do not implement RES, MIN, or MAX, but
>>>>>>> besides that, they are completely functional.
>>>>>>> In any of those cases we do not want to skip those controls.
>>>>>>>
>>>>>>> I am not against quirking specific cameras once we detect that they
>>>>>>> are broken...
>>>>>>
>>>>>> Hopefully there won't be too many of those, right ? Righhhht... ?
>>>>>
>>>>> So far I have identified 4 in a week, and I am not testing obscure
>>>>> camera modules....
>>>>
>>>> Can you provide more information about those modules ? USB descriptors
>>>> maybe, and the list of controls that fail, and how they fail ?
>>>
>>> These are the ones I can share now:
>>>
>>> "13d3:5519": Focus value out of range
>>> focus_absolute 0x009a090a (int)    : min=355 max=790 step=1 default=6
>>> value=500 flags=inactive
>>
>> Hmm this one looks like min and default are swapped ?
>>
>> So I guess this one needs a quirk which checks if default < min
>> and in that case swaps them (the check is to avoid swapping
>> with fixed fw). If these are built into chromebooks how about
>> doing a fwupdate for the camera instead ?
> 
> We do fwupdate whenever possible. But some modules are not updateable.
> They either: lack DFU, or the flash is read-only, or the update
> process has a non acceptable fail rate.

Ok, I was just wondering if we could avoid having to add
a quirk for this model.

> We aim to detect compliance errors early in the development process.
> V4L2-compliance now (almost) works with the uvcvideo driver. And that
> helps a lot :)
> 
> I plan to add quirks for the cameras that I can test. But we still
> need a solution for all the external cameras and modules that are not
> in the lab.

I agree we need some solution for this, especially the broken
controls hiding others is a problem which needs some workaround.

I'm not sure what that workaround should look like though.
Just returning 0 as your v2 patch does seems less then ideal.

Lets continue discussing this after the Christmas break.

Regards,

Hans



>>> "3277:0003": Focus returns -EIO
>>> Focus Absolute and Focus, Automatic Continuous: return -EIO for at
>>> least one of get_ max/min/res
>>>
>>> "0408:302f": Error reading AutoExposure Flags
>>> UVC_GET_INFO returns invalid flags
>>
>> Regards,
>>
>> Hans
>>
>>
>>
> 
> 


