Return-Path: <linux-media+bounces-48486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EFCCB090B
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EC7530EDEA2
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4727A320CAC;
	Tue,  9 Dec 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwqE8ieX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891E2FF17F;
	Tue,  9 Dec 2025 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765297670; cv=none; b=lL8toUCNLJj4PL8Yb1I3cyh76/2Wi6IM3Tsbc1J+J1rcxKinwH/PgYKluZaZOZoWaiMXjOuEbRPaBtepTBJ2WsLsuQ+iinWp8/2/NC1b0iJx0dIwv76N2SvF11KpvCgRBxR7ZU5nitbQ+7/aG8P3rzyV1rCiuFFPTu12Sp6E0ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765297670; c=relaxed/simple;
	bh=M9J/8oq1k1eXewaM2oMMb9Kce+d+ZmyzbfvvXR5HTiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJFV/nmwOp7F4FbqSuItZTyAL2Z2+2q3VtvVoDym5ExqrT0XyEXFcOfvExlMEBhcEQ+4ZdkANQndYGQ3uwt0i0wCSTxsKqXtK/9EUoIvlnIyygJoq3Ri3ItoHqvX3HIvxl7/RQuyhhlM0TbeLUMdIvv/iMNT1ZEo6Wd0OlWPr+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwqE8ieX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66D4C4CEF5;
	Tue,  9 Dec 2025 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765297670;
	bh=M9J/8oq1k1eXewaM2oMMb9Kce+d+ZmyzbfvvXR5HTiw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bwqE8ieXtkp/+0RqeWcXM35Sv4/IEOhl8St1K2QEuEwJgy2YhRcv9xujODNJh6Ni5
	 im8aMmnAXP4P5dP/xzJQ4jIuy3s5T+LRexUMypVdpZu4f2YPwiWXGN67vweTO7GgcN
	 v+c7AzIuPjxmVJKo/iWw5hkOFuq0gNGomA6+PyN1j6sunXPrEFfsDuNFUXiSKf+gFT
	 7tj5KIMwbQWz52c38nxJCSHMyTM8Hbdd9nGyKvIh2Jd4boYycs3pqiHRuNjKFPjJlS
	 ikhEQ8I15rOgQP0nXecRNWuEtnluWhX4pDh8GrUYsaydeUgyaTHLyOEwPjvh+3aHun
	 5woP6JQN0X3PQ==
Message-ID: <0c711920-b052-40d9-a30f-d6a581ccd650@kernel.org>
Date: Tue, 9 Dec 2025 17:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-3-0359ffb98c9e@chromium.org>
 <f7cbf5ab-7564-4c81-84c9-b38b09e977f9@kernel.org>
 <CANiDSCvr7VRw91-AuJ8JTuhsuJNcg5XqLVvgjJycmqOKMcf3fg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCvr7VRw91-AuJ8JTuhsuJNcg5XqLVvgjJycmqOKMcf3fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricaro,

On 9-Dec-25 7:41 AM, Ricardo Ribalda wrote:
> Hi Hans
> 
> 
> On Mon, 8 Dec 2025 at 20:17, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi,
>>
>> On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
>>> The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
>>> control.
>>>
>>> This mapping is usually created by the uvcdynctrl userspace utility. We
>>> would like to get the mappings into the driver instead.
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
>>>  drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
>>>  2 files changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
>>> index dbb30ad389ae4d53bc734b4269ebea20ecdd7535..b09d2f8ba66ecde67f1e35fd77858a505ad44eb1 100644
>>> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
>>> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
>>> @@ -109,6 +109,8 @@ IOCTL reference
>>>  UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
>>>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>> +**This IOCTL is deprecated and will be eventually removed**
>>> +
>>>  Argument: struct uvc_xu_control_mapping
>>>
>>>  **Description**:
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index 9e4a251eca88085a1b4e0e854370015855be92ee..03c64b5698bf4331fed8437fa6e9c726a07450bd 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -1044,6 +1044,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
>>>       switch (cmd) {
>>>       /* Dynamic controls. */
>>>       case UVCIOC_CTRL_MAP:
>>> +             pr_warn_once("uvcvideo: " DEPRECATED
>>> +                          "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
>>>               return uvc_ioctl_xu_ctrl_map(chain, arg);
>>>
>>>       case UVCIOC_CTRL_QUERY:
>>
>> Deprecating and then removing this is going to be a long slow process.
>>
>> I was thinking that rather then remove it we would keep accepting the ioctl but instead
>> of calling uvc_ioctl_xu_ctrl_map() we would simply return 0. E.g. change the above to:
>>
>>         case UVCIOC_CTRL_MAP:
>>                 pr_warn_once("uvcvideo: " DEPRECATED
>>                              "UVCIOC_CTRL_MAP ioctl will eventually be ignored.\n");
>>                 return uvc_ioctl_xu_ctrl_map(chain, arg);
>>
>> And then say in one year after a kernel with the above is released change it to:
>>
>>         case UVCIOC_CTRL_MAP:
>>                 pr_warn_once("uvcvideo: " DEPRECATED
>>                              "UVCIOC_CTRL_MAP ioctls are ignored.\n");
>>                 return 0;
>>
>>
>> I think removing it in 1 year is too soon, but ignoring it is ok. This does mean
>> that people will lose the custom v4l2-ctrls for which patch 2/6 is not adding
>> mappings into the driver in 1 year after a kernel with the warning is released...
>>
>> I'm not 100% sure about this plan, so please let me know what you think. For
>> outright deprecation warning + full removal I think we need to wait at least
>> 2 years after shipping a kernel with the deprecation warning.
> 
> Let me rephrase what you have written:
> 
> today:
> pr_warn_once("uvcvideo: " DEPRECATED "UVCIOC_CTRL_MAP ioctl will be
> eventually ignored.\n");
> return uvc_ioctl_xu_ctrl_map(chain, arg);

Ack for the above

What I was trying to say for the 1 year / 2 year thing is
not do "x after 1 year" and then "y after 2 years", but do 
either "x after 1 year" *or* "y after 2 years"

So:

> in 1 year:
> pr_warn_once("uvcvideo: " DEPRECATED "UVCIOC_CTRL_MAP ioctl is ignored.\n");
> return 0;

*or*

> in  2 years:
> return -ENOIOCTLCMD;

The idea being that when we start doing warn-once + return 0
we can already remove all the code and keeping just the case
label + pr_warn + return 0, which is not a lot of code to keep
around.

> Normally I would prefer not to lie to userspace (saying that the
> mapping was done, but not doing it).
> 
> But in this case, UVCIOC_CTRL_MAP does not seem to be very widely used
> (check previous email), so I do not think it really matters if we skip
> the "1 year step" and just return -ENOIOCTLCMD in 2 years.
> 
> I leave it up to you to decide the deprecation steps.

Laurent do you have any opinion on this ?

Regards,

Hans



