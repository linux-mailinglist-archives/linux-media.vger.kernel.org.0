Return-Path: <linux-media+bounces-23578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4948B9F4A85
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 13:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A7291688DC
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3316D1E5726;
	Tue, 17 Dec 2024 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YGDBzuBo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1114F1D47A2
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436926; cv=none; b=H69XRgPwsek/Hr4+dVVNbb3SFpZe/+Lo5mu27rqS/6ZJZdXxSuAWbiAjktsBXgCA2vi+UMssgxzpWRSqm6hGosAu0Vpw6SLz5QeEAeMuHRhk8CFU+tM/PpTRmkNcL3zZ7EgFUxjGZriGD4rWN41Qxr/f2yyrpXXEbvRlOfpQVMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436926; c=relaxed/simple;
	bh=LmAFnP32x2ACBhQykstKdB5p93BNskY0ys08wTFRGuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWVTOiVIwsZ9ozcg9kKeGQWJOK1H7oir+kj0WwSQzpf9/Lc9T1aqeSv5usji1peS0FO2IORDzEsErI1r0TZz0YgXyEZ3guz2T5b4GqiCJRRPLq2a+JKoRKO427vpm59wuBQvfbXeimTJJsZh+bvftMR+tuH2sewH4hFeFwai648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YGDBzuBo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 378823E;
	Tue, 17 Dec 2024 13:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734436886;
	bh=LmAFnP32x2ACBhQykstKdB5p93BNskY0ys08wTFRGuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGDBzuBo127ivXuMgeykYJDq7dWoP2QknrHEt1lvRlFqrBm1WF9bpLybWTL8ctXmn
	 +N8iIsOKW6N3YKNMqUhHPcj4HVGK6IzehGGXNqW6l9Ui9IJdbgHiedNPxE544g5hy8
	 Xtkio6IZwgSf7BeoYhXTgM+2gRnlNVP10QCY16XY=
Date: Tue, 17 Dec 2024 14:02:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] media: uvcvideo: Add no drop parameter for
 MJPEG_NO_EOF quirk
Message-ID: <20241217120200.GD2025@pendragon.ideasonboard.com>
References: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
 <20241217112138.1891708-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217112138.1891708-2-isaac.scott@ideasonboard.com>

On Tue, Dec 17, 2024 at 11:21:38AM +0000, Isaac Scott wrote:
> In use cases where a camera needs to use the UVC_QUIRK_MJPEG_NO_EOF,
> erroneous frames that do not conform to MJPEG standards are correctly
> being marked as erroneous. However, when using the camera in a product,
> manufacturers usually want to enable the quirk in order to pass the
> buffers into user space. To do this, they have to enable the uvc_no_drop
> parameter. To avoid the extra steps to configure the kernel in such a
> way, enable the no_drop parameter by default to comply with this use
> case.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 947c4bf6bfeb..45028b45906a 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1948,6 +1948,13 @@ int uvc_register_video_device(struct uvc_device *dev,
>  {
>  	int ret;
>  
> +	/*
> +	 * If the MJPEG stream occasionally loses the EOF marker, we set the
> +	 * no_drop parameter by default to avoid dropping frames erroneously.
> +	 */
> +	if (dev->quirks & UVC_QUIRK_MJPEG_NO_EOF)
> +		uvc_no_drop_param = 1;

One issue with this is that it becomes impossible for someone to unset
the no_drop parameter.

This being said, I think we should have enabled no_drop by default. I
wonder if that's a change we could do.

> +
>  	/* Initialize the video buffers queue. */
>  	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
>  	if (ret)

-- 
Regards,

Laurent Pinchart

