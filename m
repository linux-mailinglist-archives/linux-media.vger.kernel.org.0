Return-Path: <linux-media+bounces-33898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A24ACAD77
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E03D91891A96
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0ED211472;
	Mon,  2 Jun 2025 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktnscg/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA920E026;
	Mon,  2 Jun 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748864588; cv=none; b=XKel3mYHxB85rYwSXV3t+nirK1l4X3aTrTUoKDpe1aXe/93U284IWdmBrRmAjLhwI2AME1Frs2mbGOpQqbbKZbfRw1KdZrbJkVv1YGdqd8RwPlYiXSFEM2YyrAxN6i9M9g8KTdpJhiFjk+KmesP+UDObQ3SFFD3xOBaCZd4wRgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748864588; c=relaxed/simple;
	bh=JVLrJ8f5yXPr+YmPDvTTlCVB2/YsXVgAn6ZIZWWwEK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMS4EN8ooWv3ni4ACEx1YnuR+1ya59pgEtHDZFGlJfsfTfjAkbQj4zpyLI3hjvzOOAVPmcjrCt1dSGqWSY7B0sUU799/g44qWMnrQOfj4mZ+q8rGbLv8RgkvGNOlx9dDTupYhy0zEAfGRhK3eHbocoQvkhH2q4nFzYq/77UHpB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktnscg/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887A4C4CEEB;
	Mon,  2 Jun 2025 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748864588;
	bh=JVLrJ8f5yXPr+YmPDvTTlCVB2/YsXVgAn6ZIZWWwEK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ktnscg/Zhp3zYbKj1e7OO3r01c47xlv8I3Bs3zBlVAVwH/5yLROvizAO4RmjxSFdy
	 KTeQNPVtk4i3h9f4gGH3uh/tAHM4ct7t4u4EvXYCQUdI201286Rv9Gh71i7DYONZ/B
	 HFSYTJwCTZq2cRPxc2esqnyLP6yovolPXIFxzTnhPOpYEGx4lZl5gLgekH0Qr9NdPt
	 68PJ5dzwJjpQ6377uMa/dJxTLxaHWVSqLOelD5BjPOAhAmDxg90uOmpUg1xCoyZNLd
	 KgcenC7U5gpXnhj+WeVCRTptbKrH5t4YrnQaH16kjz9Ml7g/NnICEjs3BCOKepbbIn
	 IWbaxOUkpNDog==
Message-ID: <3022f455-f6f4-470b-9989-e37b2f8a0b51@kernel.org>
Date: Mon, 2 Jun 2025 13:43:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
 <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org>
 <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
 <b88a8847-6e19-4d5e-a847-5deee69ab7b4@kernel.org>
 <CANiDSCsXNu2xa_ATGUJbKY_t7xxXgSGdpZMf+P4LT+x3qcP1tg@mail.gmail.com>
 <69885612-75ea-422c-ba13-07eaf4325005@kernel.org>
 <CANiDSCtSKCn+mx8pGwuYCre9Wb7gONJYjLqc6tYLWQL3YXBmrw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCtSKCn+mx8pGwuYCre9Wb7gONJYjLqc6tYLWQL3YXBmrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Jun-25 13:40, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 2 Jun 2025 at 13:24, Hans de Goede <hansg@kernel.org> wrote:
>>
>> On 2-Jun-25 13:11, Ricardo Ribalda wrote:
>>> On Mon, 2 Jun 2025 at 13:07, Hans de Goede <hansg@kernel.org> wrote:
>>>>
>>>> Hi Ricardo,
>>>>
>>>> On 2-Jun-25 12:27, Ricardo Ribalda wrote:
>>>>> Hi Hans
>>>>>
>>>>> On Mon, 2 Jun 2025 at 12:11, Hans de Goede <hansg@kernel.org> wrote:
>>>>>>
>>>>>> Hi Ricardo,
>>>>>>
>>>>>> On 28-May-25 19:58, Ricardo Ribalda wrote:
>>>>>>> Right now we cannot support granular power saving on compat syscalls
>>>>>>> because the VIDIOC_*32 NRs defines are not accessible to drivers.
>>>>>>>
>>>>>>> Use the video_translate_cmd() helper to convert the compat syscall NRs
>>>>>>> into syscall NRs.
>>>>>>>
>>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>>>> ---
>>>>>>>  drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
>>>>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
>>>>>>>  include/media/v4l2-ioctl.h           | 1 +
>>>>>>>  3 files changed, 5 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>>>>>> index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
>>>>>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>>>>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>>>>>> @@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
>>>>>>>  static long uvc_v4l2_unlocked_ioctl(struct file *file,
>>>>>>>                                   unsigned int cmd, unsigned long arg)
>>>>>>>  {
>>>>>>> -     /*
>>>>>>> -      * For now, we do not support granular power saving for compat
>>>>>>> -      * syscalls.
>>>>>>> -      */
>>>>>>> -     if (in_compat_syscall())
>>>>>>> -             return uvc_v4l2_pm_ioctl(file, cmd, arg);
>>>>>>> +     unsigned int converted_cmd = video_translate_cmd(cmd);
>>>>>>
>>>>>> It looks like something went wrong here and you did not test-compile this?
>>>>>> video_translate_cmd() is private to drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>> so this should not compile.
>>>>>
>>>>> Hmm... Actually I am pretty sure that I tested it on real hardware.
>>>>>
>>>>> Did you miss the EXPORT_SYMBOL() on the patch?
>>>>
>>>> Ah yes I did miss that, sorry.
>>>
>>> My bad, I doubt it till the last second if I should split it or not :)
>>>
>>>>
>>>> For the next time please split core changes out into their own
>>>> separate patches.
>>>>
>>>> In this case I think the core changes are not necessary instead
>>>> you can just do:
>>>>
>>>>         unsigned int converted_cmd = cmd;
>>>>
>>>> #ifdef CONFIG_COMPAT
>>>>         converted_cmd = v4l2_compat_translate_cmd(cmd);
>>>> #endif
>>>
>>> I believe this should work as well:
>>>
>>> unsigned int converted_cmd = cmd;
>>> if (in_compat_syscall())
>>>   converted_cmd = v4l2_compat_translate_cmd(cmd);
>>>
>>> the compiler knows that CONFIG_COMPAT=n means in_compat_syscall() will
>>> be always fails.
>>>
>>> If it is ok with you (and it actually works :) ) I will use this version.
>>
>> I agree that that is cleaner/better and I also think it should work,
>> so lets go with that.
> 
> Actually, v4l2_compat_translate_cmd() does not seem to be EXPORT_SYMBOL()ed
> 
> So I still need to do some changes in the core.
> (It also does not handle COMPAT_32BIT_TIME... but in this case it
> seems to be the same).
> 
> 
> Any preference between what to use: v4l2_compat_translate_cmd() vs
> video_translate_cmd()?

v4l2_compat_translate_cmd() is already exposed in include/media/v4l2-ioctl.h
so I think it is best to go with that function.

Regards,

Hans


