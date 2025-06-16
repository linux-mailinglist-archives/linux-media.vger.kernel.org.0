Return-Path: <linux-media+bounces-34934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D2ADB33A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC94F18883B0
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989C11DE8AD;
	Mon, 16 Jun 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbJkyAJq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34131C7017;
	Mon, 16 Jun 2025 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083259; cv=none; b=dAnlmQy7nexZicG6Ml+wKpyQu/zkziK5rglOxeElY3CgSS52n0Nfp678khX+2fxoAL7LqIOT4B8LJfF8VQCY/BpKXvcdglRA8YJsgsSpTKHs7UgjDgF9Du/WJrBX642RVIfRGaKVA+NSauddLrqiUjwLYFYJmHGNFqjIubxpmd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083259; c=relaxed/simple;
	bh=elgV9jXTHL63UfPq1LTVDv6vDcsNUSc2Lea4oY8k9Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6LK3raVLOdhiQEU96//B1l4/imeE10G1/iwosj1IQN/kzIwdEGR5dx8iIPnXs8HM36MmdcgE02rEziFDFIT+mhL0q1Vp0MgWe9+E3GzmqQCSbWbL/XVbl4tN3AGvppOc6t88YoN0/j5iiPRkm7nehk7iPBgVJtWJZV4L3jENKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbJkyAJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC030C4CEEA;
	Mon, 16 Jun 2025 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750083258;
	bh=elgV9jXTHL63UfPq1LTVDv6vDcsNUSc2Lea4oY8k9Og=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hbJkyAJq1opfWLyNaQh7zcHXN2jWXNdSJNFwdnIWujUJk/pu4ip+IwRLGLdf3WgO0
	 6+Wv8FID4NAyEcPZWDQXQIT75qsmiigpc0GGvNUzdIoqJ4zUN+Pi5oqCwyoKdN0dib
	 Mmg6w7nbEl+1VzEtSX2f5GH9H0xO3bk2QGGs1KmF1ESQibD3IuKxHpLDo1yfu5hpOV
	 1SNWcrzrrFhP8t3j2T7bmZcUyDlf4EU0obuiR4y5FkmTlXqDxCxGunsoIClp9wDRl1
	 cnSpF66r+IgS5tbk+IOfDTaM5o/pM+rAzKAh7ea4Lm7SzcWYF0vhnrGBZkVB0Vsw5t
	 u8QSn4ZLUPu5w==
Message-ID: <ba461646-c639-4e66-9f6d-c34f59d39f82@kernel.org>
Date: Mon, 16 Jun 2025 16:14:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert
 PM logic
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans@jjverkuil.nl>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
 <20250602-uvc-grannular-invert-v2-7-c871934ad880@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-7-c871934ad880@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Jun-25 15:06, Ricardo Ribalda wrote:
> Instead of listing the IOCTLs that do not need to turn on the camera,
> list the IOCTLs that need to turn it on. This makes the code more
> maintainable.
> 
> This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
> will not turn on the camera.
> 
> Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 61 ++++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 020def11b60e00ca2875dd96f23ef9591fed11d9..13388879091c46ff74582226146521b5b5eb3d10 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1219,43 +1219,54 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
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

s/do need/need/

otherwise this looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> -	switch (cmd) {
> -	case UVCIOC_CTRL_MAP:
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
> +	case UVCIOC_CTRL_QUERY:
> +	case VIDIOC_G_CTRL:
> +	case VIDIOC_G_EXT_CTRLS:
> +	case VIDIOC_G_INPUT:
> +	case VIDIOC_QUERYCTRL:
> +	case VIDIOC_QUERYMENU:
> +	case VIDIOC_QUERY_EXT_CTRL:
> +	case VIDIOC_S_CTRL:
> +	case VIDIOC_S_EXT_CTRLS:
> +	case VIDIOC_S_FMT:
> +	case VIDIOC_S_INPUT:
> +	case VIDIOC_S_PARM:
> +	case VIDIOC_TRY_EXT_CTRLS:
> +	case VIDIOC_TRY_FMT:
> +		return uvc_v4l2_pm_ioctl(file, cmd, arg);
> +	}
> +
> +	/* The other IOCTLs can run with the camera off. */
> +	return video_ioctl2(file, cmd, arg);
> +}
> +
>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>  	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
>  	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
> 


