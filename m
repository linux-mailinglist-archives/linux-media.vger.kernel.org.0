Return-Path: <linux-media+bounces-36352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E895AEEA2C
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526E31BC3B3C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC3724503C;
	Mon, 30 Jun 2025 22:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vg4u7wh3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ADB21C161;
	Mon, 30 Jun 2025 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322375; cv=none; b=o4TMeyW7oywH5vH0aD++pX2YQA4D89UFk/12oh35LnXTx4ryb/Q5O9+HC4KHH6dDSjpBMzVaUehBh1DX9rn3QyLWuJCQqDOBpi8T397WjJyecircxOYddXJPXGaMMLxRN/q3FHpvmeuExNsxe9TiJEv0Dpvvjqa9qIlwl7K1oQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322375; c=relaxed/simple;
	bh=ywo5xG10qEL/PmGcJLop0F3WizcSPgoGQDCvcIqhRs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8TkyoWVtbwdN37/Pkvn0/pCRDT4tcAe1jRBEzfnk4K9W0UGxIelRZrnDGTdk/5J5zJ59u5vo2qAqlFMAcsap/CMnritcXv0xXq3puS7ffwg9wvfVm2cLw66SkuhH52abMeBfg2v/fBhwQX84ZBreOkdiPPIJk1ufYxMays2V80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vg4u7wh3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5BA786A6;
	Tue,  1 Jul 2025 00:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751322350;
	bh=ywo5xG10qEL/PmGcJLop0F3WizcSPgoGQDCvcIqhRs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vg4u7wh3em1w7h5WWSduiae3z3bysZC8T8/famWZE6Xp/Q6iaorQ3d65BXNV9hygg
	 WoSKN3PTtEUCDcybik5Db1+ypycyh0wsiKxDpmj3pHkCzokFKA2ZrBp9rCoJzmlHKs
	 Ao4uw90bkpHqLqmBNwUct6mLuRMT1NzAGvRzUaIc=
Date: Tue, 1 Jul 2025 01:25:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v3 8/8] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert
 PM logic
Message-ID: <20250630222546.GC15184@pendragon.ideasonboard.com>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
 <20250630-uvc-grannular-invert-v3-8-abd5cb5c45b7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-uvc-grannular-invert-v3-8-abd5cb5c45b7@chromium.org>

Hi Ricardo,

On Mon, Jun 30, 2025 at 02:20:33PM +0000, Ricardo Ribalda wrote:
> Instead of listing the IOCTLs that do not need to turn on the camera,
> list the IOCTLs that need to turn it on. This makes the code more
> maintainable.
> 
> This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
> will not turn on the camera.

The idea is good, but you'll have to add UVCIOC_CTRL_MAP back (see 6/8).

> Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 52 +++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 350cd2cc88f872d2e8bd19e2b8fb067894916364..94dc97448446d36a85a1b36d16c29f22af89c640 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1222,37 +1222,35 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
>  				    unsigned int cmd, unsigned long arg)
>  {
>  	struct uvc_fh *handle = file->private_data;
> +	unsigned int converted_cmd = v4l2_translate_cmd(cmd);
>  	int ret;
>  
> -	/* The following IOCTLs do not need to turn on the camera. */
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
> -	ret = uvc_pm_get(handle->stream->dev);
> -	if (ret)
> +	/* The following IOCTLs need to turn on the camera. */
> +	switch (converted_cmd) {
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
> +		ret = uvc_pm_get(handle->stream->dev);
> +		if (ret)
> +			return ret;
> +		ret = video_ioctl2(file, cmd, arg);
> +		uvc_pm_put(handle->stream->dev);
>  		return ret;
> +	}
>  
> -	ret = video_ioctl2(file, cmd, arg);
> -
> -	uvc_pm_put(handle->stream->dev);
> -	return ret;
> +	/* The other IOCTLs can run with the camera off. */
> +	return video_ioctl2(file, cmd, arg);
>  }
>  
>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {

-- 
Regards,

Laurent Pinchart

