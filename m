Return-Path: <linux-media+bounces-15766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6D9475C0
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 09:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB72EB209A6
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 07:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D881482F0;
	Mon,  5 Aug 2024 07:09:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404B6A01E
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841766; cv=none; b=ATnkQdj2Bt7qQke4yn+6A16teRaaEarobrLCg4FwxOUY+hbgVpR2IsDhRQqRX8SKeGS6qIpW+zfSTP8R0NBIgMQ/PukFfiLhUHpeNjxu5x1W0NuIQp2Ffz0PqU1iAU1cI8Zn4UAAb4WNEWVVRQJFmGxC8GPFpewmbuM6NCu03q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841766; c=relaxed/simple;
	bh=h7EtrcJVBa/KlojyLEPKLzhzJA665nsnD0tXcCvrJK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgTNp1v03MUvglsgpZK9oDJNc4HfHOWmC0ZtAyET70g8/X95IDS6lyBryAg9OpdLz/b7Fu2ZEmyXOfmoR5CsKAKCqq8vMjG2kBqsC6IBZnSzee/Zn7/6OJbR4WkegL4M1s3wm5DPGL/aUk4fIpqILKGGSRJqpPO6fozydqh9uD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FC1C32782;
	Mon,  5 Aug 2024 07:09:22 +0000 (UTC)
Message-ID: <c84c6f16-28f4-4172-8960-95fb76f76096@xs4all.nl>
Date: Mon, 5 Aug 2024 09:09:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v2 FOR v6.11] uvcvideo fixes and improvements
To: Mauro Carvalho Chehab <maurochehab@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media <linux-media@vger.kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240617184749.GB23867@pendragon.ideasonboard.com>
 <20240617202800.GA19966@pendragon.ideasonboard.com>
 <20240805090241.2df0f4b0@foz.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240805090241.2df0f4b0@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2024 09:04, Mauro Carvalho Chehab wrote:
> Em Mon, 17 Jun 2024 23:28:00 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> 
>> Hi Hans, Mauro,
>>
>> The following changes since commit 91798162245991e26949ef62851719bb2177a9c2:
>>
>>   media: v4l: add missing MODULE_DESCRIPTION() macros (2024-06-15 11:16:40 +0200)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-uvc-20240617-2
>>
>> for you to fetch changes up to 8c40efeda94108d65c52038ea82ee83b2fb933e2:
>>
>>   media: uvcvideo: Remove mappings form uvc_device_info (2024-06-17 23:21:13 +0300)
>>
>> ----------------------------------------------------------------
>> uvcvideo fixes and improvements
>>
>> ----------------------------------------------------------------
>> Daniel Schaefer (1):
>>       media: uvcvideo: Override default flags
>>
>> Laurent Pinchart (1):
>>       media: uvcvideo: Force UVC version to 1.0a for 0408:4035
>>
>> Michal Pecio (1):
>>       media: uvcvideo: Fix the bandwdith quirk on USB 3.x
>>
>> Oleksandr Natalenko (1):
>>       media: uvcvideo: Add quirk for invalid dev_sof in Logitech C920
>>
>> Ricardo Ribalda (14):
>>       media: uvcvideo: Support timestamp lists of any size
>>       media: uvcvideo: Ignore empty TS packets
>>       media: uvcvideo: Quirk for invalid dev_sof in Logitech C922
>>       media: uvcvideo: Allow hw clock updates with buffers not full
>>       media: uvcvideo: Refactor clock circular buffer
>>       media: uvcvideo: Fix hw timestamp handling for slow FPS
>>       media: uvcvideo: Fix integer overflow calculating timestamp
>>       media: uvcvideo: Enforce alignment of frame and interval
>>       media: uvcvideo: Allow custom control mapping
>>       media: uvcvideo: Refactor Power Line Frequency limit selection
>>       media: uvcvideo: Probe the PLF characteristics
>>       media: uvcvideo: Cleanup version-specific mapping
>>       media: uvcvideo: Remove PLF device quirking
>>       media: uvcvideo: Remove mappings form uvc_device_info
>>
>>  drivers/media/usb/uvc/uvc_ctrl.c   | 193 +++++++++++++++++++++----------------
>>  drivers/media/usb/uvc/uvc_driver.c | 160 ++++++------------------------
>>  drivers/media/usb/uvc/uvc_video.c  | 169 ++++++++++++++++++++++----------
>>  drivers/media/usb/uvc/uvcvideo.h   |  10 +-
>>  4 files changed, 261 insertions(+), 271 deletions(-)
>>
> 
> Hmm... while the PR has 18 patches, after applying this series on the top of
> media-stage, there is just one hunk at the diffstat:
> 
> $ git diff  2c25dcc23619
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4fe26e82e3d1..8557b8ef2ec2 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2692,6 +2692,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>                 }
>  
>                 __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +
> +               if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> +                   ctrl->info.selector == mapping->selector)
> +                       __uvc_ctrl_add_mapping(chain, ctrl, mapping);
>         }
>  }
> 
> Perhaps this was already applied but you forgot to update patchwork?

It's already applied. I might have forgotten to mark this PR as 'Accepted'.

Regards,

	Hans

> 
> If not the case, please rebase this branch and submit only the patch 
> which adds the new logic.
> 
> Regards


