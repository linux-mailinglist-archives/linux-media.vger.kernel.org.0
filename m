Return-Path: <linux-media+bounces-21220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C99C31AD
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 11:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92661C20951
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 10:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EEB153BF8;
	Sun, 10 Nov 2024 10:48:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A8323D;
	Sun, 10 Nov 2024 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731235679; cv=none; b=nRYOl8ECKW2a9DnrqwbquaMW5A756YUj9HgxHXnhYlN2uo9wCjTXQdz0WihiTO3w/xfpnnNHLsCpcz2msj87dt/kiEajA/nUsMmIq+MaGEffDRXn+iYewdxdKAYM1dWnooiNPRQJepaIbrpk9YfUkEf2YTdhjw9FmieRJN79GYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731235679; c=relaxed/simple;
	bh=8XlUl5XB+VZm2zlEdmFv6xvhMYwfnhh6B4baWXxXoOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7yuvPGblBxE2Z/D0+je0kAn3r8/YJViRTsFAizBlLOJiFTB+acvitVP5Dyytsb9EciE/o/uL+lFzJq+khbfdiAfB/KZQSQenrhn+m+rTq0NMysuT79wca+ctqnlUqTNCeltFlaiFEZAt3/4jJ+m3xclakix+p0Ff7bjixL58pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D5FC4CECD;
	Sun, 10 Nov 2024 10:47:57 +0000 (UTC)
Message-ID: <ef6c4737-44f6-472b-8130-fe58f7930c4a@xs4all.nl>
Date: Sun, 10 Nov 2024 11:47:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110110257.5160a7d1@foz.lan>
 <2fd9053f-34b6-4e97-a898-98fd71a485e8@xs4all.nl>
 <CANiDSCt=Qht8CwAxCkpn=5owtQ_JBUkK+9yaLsZ5W2RJJxbz8A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CANiDSCt=Qht8CwAxCkpn=5owtQ_JBUkK+9yaLsZ5W2RJJxbz8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2024 11:37, Ricardo Ribalda wrote:
> On Sun, 10 Nov 2024 at 11:29, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 10/11/2024 11:02, Mauro Carvalho Chehab wrote:
>>> Em Sat, 9 Nov 2024 17:29:54 +0100
>>> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>>>
>>>>>
>>>>> I think that should sort the issue, assuming that 1. above holds true.
>>>>>
>>>>> One downside is that this stops UVC button presses from working when
>>>>> not streaming. But userspace will typically only open the /dev/video#
>>>>> node if it plans to stream anyways so there should not be much of
>>>>> a difference wrt button press behavior.
>>>>
>>>> I do not personally use the button, but it is currently implemented as
>>>> a standard HID device.
>>>
>>> IMO, controlling the privacy via evdev is the best approach then. There's
>>> no need for a RW control neither at subdev or at device level. It could
>>> make sense a Read only to allow apps to read, but still it shall be up to
>>> the Kernel to protect the stream if the button is pressed.
>>>
>>>> Making it only work during streamon() might be
>>>> a bit weird.
>>>> I am afraid that if there is a button we should keep the current behaviour.
>>>
>>> Privacy matters only when streaming. IMO the Kernel check for it needs to
>>> be done at DQBUF time and at read() calls, as one can enable/disable the
>>> camera while doing videoconf calls. I do that a lot with app "soft" buttons,
>>> and on devices that physically support cutting the video.
>>
>> We could add a vb2_s_privacy(bool privacy) function to vb2 to tell vb2 if the privacy
>> mode is on. And if so, take action. E.g. calling QBUF/DQBUF would return a -EACCES error.
>>
>> That will ensure consistent behavior for all drivers that have a privacy function.
> 
> I am not against adding a feature like this, but we still need a way
> to notify userspace about a change of the privacy state when the user
> presses it.
> Controls are great for this.
> 
>>
>> Note that there are two types of privacy GPIO: one that triggers when a physical
>> cover is moved, blocking the sensor, and one that is a button relying on software
>> to stop streaming video. In the first case it is informative, but you can keep
>> streaming.
> 
> I am curious who implements a software privacy switch. I would
> definitely use a physical cover in those devices.
> 
> Chromebooks only support physical cover and hardware privacy switch. I
> have not seen software privacy switches.

I actually thought this discussion was about software privacy switched.
I haven't seen any, but it wouldn't surprise me if there are webcams that do something
like that.

For proper privacy covers I don't think you need a vb2 implementation, even if you
keep streaming you should just see black video, no need to refuse QBUF/DQBUF.

Regards,

	Hans

> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> I don't trust myself privacy soft buttons, specially when handled in userspace,
>>> so what I have are webcam covers (and a small stick glued at a laptop camera
>>> that has a too small sensor for a webcam cover). I only remove the cover/stick
>>> when I want to participate on videoconf with video enabled with the builtin
>>> camera.
>>>
>>> Regards
>>>
>>> Thanks,
>>> Mauro
>>>
>>
> 
> 


