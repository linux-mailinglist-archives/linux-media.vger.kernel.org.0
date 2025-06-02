Return-Path: <linux-media+bounces-33890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2223FACAC29
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E364189AED3
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0801F4E3B;
	Mon,  2 Jun 2025 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jc8kDqO9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1051EE02F;
	Mon,  2 Jun 2025 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858300; cv=none; b=jVelnSbLmZtXJ+qBfj7P0FJeWKepLNf6JOLO/0/vOf644u2aVP7tUcD/Cg3UBUUwhDuHVvYvcZXg856RIGLS6O3ay1BiY2DsZXHPebdBDul5wtYLOwAwOHxwC5/YRZEa3OwRSCF94n9G1RVIFyzG7Sv8Eso9rwbzBqs4T5htG20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858300; c=relaxed/simple;
	bh=ZnIdkB15WwUpVr6n6Zit4iYM7WbhK6kpmIhZUXLteU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdtjpSD8JtEvMwwOYSbkNZA8/a3V4ZAJ4BRMITvlDZeUR6ATAjIYxBSygQRrjZr4MA4nt/EOoM58/XA5StaRZVf3Dk/OtfpIhrhURBl3eTckpg7YvCxZo/UFffQgn1BrsKHu02xaJdxmjMw8rhESjM5CrhahkRLmKMBAlG1VqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jc8kDqO9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9DDC4CEEB;
	Mon,  2 Jun 2025 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748858300;
	bh=ZnIdkB15WwUpVr6n6Zit4iYM7WbhK6kpmIhZUXLteU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jc8kDqO9hDxgm634jwhd6+lB5P+8qZ5JOXMeZ9bkc7sdDd2hpSMP7s+VApNtC3Ee/
	 EM5Z8ClDh+EScDQNjTzRiVsGx+bNMD5mbrBZbcACTgG24cnWrSOn5QZzE+dZg7t+tI
	 bBRib01l/gT+VQTvuRXVXTeJVGf+oinKsv2lNxk8kmLJconsYzaZDolButb44+sfC3
	 fa+JRy2uog/0sTPtKqHtHvpf5xfwXrlpaJqm8XnNEgcwVBTiO2BZSGCy6KjDvPR2Y8
	 LkLzre5kh6T3J9eAfaATCLOryYbFV7q1hdHoQjNC8J9pQsSQUekmUxmW0SuUYZlGgB
	 UwsP0t4LCekVA==
Message-ID: <7905ecb9-6e18-4b3d-99ab-830aac19d3ad@kernel.org>
Date: Mon, 2 Jun 2025 11:58:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM
 logic
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans@jjverkuil.nl>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-7-d01581f9cc25@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-7-d01581f9cc25@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 28-May-25 19:58, Ricardo Ribalda wrote:
> Instead of listing the IOCTLs that do not need to turn on the camera,
> list the IOCTLs that need to turn it on. This makes the code more
> maintainable.
> 
> This patch is designed to be a NOP. Non relevant IOCTLs will be removed
> in future patches.
> 
> Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 117 +++++++++++++++++++++++++++++++--------
>  1 file changed, 93 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 2c6f3cf6bcc3f116bbdb3383d9af7d5be9832537..e7373a2ae3c37ca02f9076773154901a603820ac 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1264,42 +1264,111 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  }
>  #endif
>  
> -static long uvc_v4l2_unlocked_ioctl(struct file *file,
> -				    unsigned int cmd, unsigned long arg)
> +static long uvc_v4l2_pm_ioctl(struct file *file,
> +			      unsigned int cmd, unsigned long arg)
>  {
>  	struct uvc_fh *handle = file->private_data;
>  	int ret;
>  
> -	/* The following IOCTLs do not need to turn on the camera. */
> -	switch (cmd) {
> -	case VIDIOC_CREATE_BUFS:
> -	case VIDIOC_DQBUF:
> -	case VIDIOC_ENUM_FMT:
> -	case VIDIOC_ENUM_FRAMEINTERVALS:
> -	case VIDIOC_ENUM_FRAMESIZES:
> -	case VIDIOC_ENUMINPUT:
> -	case VIDIOC_EXPBUF:
> -	case VIDIOC_G_FMT:
> -	case VIDIOC_G_PARM:
> -	case VIDIOC_G_SELECTION:
> -	case VIDIOC_QBUF:
> -	case VIDIOC_QUERYCAP:
> -	case VIDIOC_REQBUFS:
> -	case VIDIOC_SUBSCRIBE_EVENT:
> -	case VIDIOC_UNSUBSCRIBE_EVENT:
> -		return video_ioctl2(file, cmd, arg);
> -	}
> -
>  	ret = uvc_pm_get(handle->stream->dev);
>  	if (ret)
>  		return ret;
> -
>  	ret = video_ioctl2(file, cmd, arg);
> -
>  	uvc_pm_put(handle->stream->dev);
> +
>  	return ret;
>  }
>  
> +static long uvc_v4l2_unlocked_ioctl(struct file *file,
> +				    unsigned int cmd, unsigned long arg)
> +{
> +	/*
> +	 * For now, we do not support granular power saving for compat
> +	 * syscalls.
> +	 */
> +	if (in_compat_syscall())
> +		return uvc_v4l2_pm_ioctl(file, cmd, arg);
> +
> +	/* The following IOCTLs do need to turn on the camera. */
> +	switch (cmd) {
> +	case UVCIOC_CTRL_MAP:
> +	case UVCIOC_CTRL_QUERY:
> +	case VIDIOC_CROPCAP:
> +	case VIDIOC_DBG_G_CHIP_INFO:
> +	case VIDIOC_DBG_G_REGISTER:
> +	case VIDIOC_DBG_S_REGISTER:
> +	case VIDIOC_DECODER_CMD:
> +	case VIDIOC_DQEVENT:
> +	case VIDIOC_DV_TIMINGS_CAP:
> +	case VIDIOC_ENCODER_CMD:
> +	case VIDIOC_ENUMAUDIO:
> +	case VIDIOC_ENUMAUDOUT:
> +	case VIDIOC_ENUMOUTPUT:
> +	case VIDIOC_ENUMSTD:
> +	case VIDIOC_ENUM_DV_TIMINGS:
> +	case VIDIOC_ENUM_FREQ_BANDS:
> +	case VIDIOC_G_AUDIO:
> +	case VIDIOC_G_AUDOUT:
> +	case VIDIOC_G_CROP:
> +	case VIDIOC_G_CTRL:
> +	case VIDIOC_G_DV_TIMINGS:
> +	case VIDIOC_G_EDID:
> +	case VIDIOC_G_ENC_INDEX:
> +	case VIDIOC_G_EXT_CTRLS:
> +	case VIDIOC_G_FBUF:
> +	case VIDIOC_G_FREQUENCY:
> +	case VIDIOC_G_INPUT:
> +	case VIDIOC_G_JPEGCOMP:
> +	case VIDIOC_G_MODULATOR:
> +	case VIDIOC_G_OUTPUT:
> +	case VIDIOC_G_PRIORITY:
> +	case VIDIOC_G_SLICED_VBI_CAP:
> +	case VIDIOC_G_STD:
> +	case VIDIOC_G_TUNER:
> +	case VIDIOC_LOG_STATUS:
> +	case VIDIOC_OVERLAY:
> +	case VIDIOC_PREPARE_BUF:
> +	case VIDIOC_QUERYBUF:
> +	case VIDIOC_QUERYCAP:
> +	case VIDIOC_QUERYCTRL:
> +	case VIDIOC_QUERYMENU:
> +	case VIDIOC_QUERYSTD:
> +	case VIDIOC_QUERY_DV_TIMINGS:
> +	case VIDIOC_QUERY_EXT_CTRL:
> +	case VIDIOC_REMOVE_BUFS:
> +	case VIDIOC_STREAMOFF:
> +	case VIDIOC_STREAMON:
> +	case VIDIOC_S_AUDIO:
> +	case VIDIOC_S_AUDOUT:
> +	case VIDIOC_S_CROP:
> +	case VIDIOC_S_CTRL:
> +	case VIDIOC_S_DV_TIMINGS:
> +	case VIDIOC_S_EDID:
> +	case VIDIOC_S_EXT_CTRLS:
> +	case VIDIOC_S_FBUF:
> +	case VIDIOC_S_FMT:
> +	case VIDIOC_S_FREQUENCY:
> +	case VIDIOC_S_HW_FREQ_SEEK:
> +	case VIDIOC_S_INPUT:
> +	case VIDIOC_S_JPEGCOMP:
> +	case VIDIOC_S_MODULATOR:
> +	case VIDIOC_S_OUTPUT:
> +	case VIDIOC_S_PARM:
> +	case VIDIOC_S_PRIORITY:
> +	case VIDIOC_S_SELECTION:
> +	case VIDIOC_S_STD:
> +	case VIDIOC_S_TUNER:
> +	case VIDIOC_TRY_DECODER_CMD:
> +	case VIDIOC_TRY_ENCODER_CMD:
> +	case VIDIOC_TRY_EXT_CTRLS:
> +	case VIDIOC_TRY_FMT:
> +		return uvc_v4l2_pm_ioctl(file, cmd, arg);
> +	}

IMHO adding a whole bunch of ioctls which are not supported by UVC at all here
and then dropping them again in patch 8/9 is not helpful.

I understand that your purpose is to have this initial patch
be a no-op, still doing the uvc_pm_get() + uvc_pm_put() for
unsupported IOCTLs but I don't really see that as something
useful to do while at the same time introducing unnecessary churn.

My preference would be to drop unsupported IOCTLs from this list
right away with a remark in the commit message that this changes
the behavior for unsupported IOCTLs.

For something like UVCIOC_CTRL_MAP I do agree that it is best
to keep it here and drop it later separately. Or maybe it would
be cleaner to add UVCIOC_CTRL_MAP to the list of IOCTLs _not_
needing pm before this patch ?

Regards,

Hans



> +
> +	/* The other IOCTLs can run with the camera off. */
> +	return video_ioctl2(file, cmd, arg);
> +}
> +
>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>  	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
>  	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
> 


