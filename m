Return-Path: <linux-media+bounces-28874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00BA73DAC
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 19:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC13C189BD59
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 18:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF35219A94;
	Thu, 27 Mar 2025 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HzGia89E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D41CAB3;
	Thu, 27 Mar 2025 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743098452; cv=none; b=VMf6bpv8a9fj8/9hOQb7KECGSXE/vIeQ8Nt/Lj9GdZHj1VhXaLZHYPL3F6s8eivr/9gcMkDEV4jC6TgOILKlWvuuQ9ntVROzcvHupkLXlf2HMdu5lxBK0ZfSw6YBCtDrAvdN1iwD3/CmTXCpMk3MAq/aCDG9Y6QXFdOeb/tTfQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743098452; c=relaxed/simple;
	bh=BKdIoUSIEwJVplYU3DQJFsiruu9jHTgb2T6sJ6yIJmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUu/fh8pOim1OhV75aJiq4U6afr3H4eV5ctnEPmSg2keadFxQkmB7CttwQ7wTNKhuyDvCMERxR+FXLrO2Uytz2k+k2UnDlMJsk7OfZ3Kp2JDg/6pXAm2sS4m5weFoKNKG2iG63UONiHyfIlINItw+S5ZVf0Rmm2tVVCHD6v/LzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HzGia89E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F129446;
	Thu, 27 Mar 2025 18:59:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743098340;
	bh=BKdIoUSIEwJVplYU3DQJFsiruu9jHTgb2T6sJ6yIJmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzGia89EmkDmiQIEsYX7zLKt9I71ztQ4y023jz76pUQ+ui9v9v4t7/j6k9uhj52Hn
	 +yGvyFOVLPDodvh8wNq5HSk4qSOremCXKgn8Nw/adWPX0mnCohiUkOhz6vTsjLayfZ
	 q8RjtgNYMZjQ6A/WKYNzzHfaJDYT/6/CtRd6sX58=
Date: Thu, 27 Mar 2025 20:00:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v5 5/5] media: uvcvideo: Do not turn on the camera for
 some ioctls
Message-ID: <20250327180026.GD11416@pendragon.ideasonboard.com>
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
 <20250303-uvc-granpower-ng-v5-5-a3dfbe29fe91@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303-uvc-granpower-ng-v5-5-a3dfbe29fe91@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 03, 2025 at 07:13:42PM +0000, Ricardo Ribalda wrote:
> There are some ioctls that do not need to turn on the camera. Do not
> call uvc_pm_get in those cases.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 6af93e00b304..de8d26164996 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1450,6 +1450,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
>  {
>  	struct uvc_fh *handle = file->private_data;
>  
> +	/* The following IOCTLs do not need to turn on the camera. */
> +	switch (cmd) {
> +	case VIDIOC_CREATE_BUFS:
> +	case VIDIOC_DQBUF:
> +	case VIDIOC_ENUM_FMT:
> +	case VIDIOC_ENUM_FRAMEINTERVALS:
> +	case VIDIOC_ENUM_FRAMESIZES:
> +	case VIDIOC_ENUMINPUT:
> +	case VIDIOC_EXPBUF:
> +	case VIDIOC_G_FMT:
> +	case VIDIOC_G_PARM:
> +	case VIDIOC_G_SELECTION:
> +	case VIDIOC_QBUF:
> +	case VIDIOC_QUERYCAP:
> +	case VIDIOC_REQBUFS:
> +	case VIDIOC_SUBSCRIBE_EVENT:
> +	case VIDIOC_UNSUBSCRIBE_EVENT:
> +		return video_ioctl2(file, cmd, arg);
> +	}
> +
>  	guard(uvc_pm)(handle->stream->dev);
>  
>  	return video_ioctl2(file, cmd, arg);

-- 
Regards,

Laurent Pinchart

