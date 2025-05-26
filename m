Return-Path: <linux-media+bounces-33395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94BAC40A2
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A2417A8DD7
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA8720C03E;
	Mon, 26 May 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qUzxbqHQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCD410F9;
	Mon, 26 May 2025 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748267204; cv=none; b=Mn3lDV5KCTezyOHbFN7jT9++IHbwcI+QNbjieW4tjhPFrj9gcVI2pdV+rmcphB+oqcwTf+7hxxSlGaLT4Lh15EyL8QEOb+KcJJOVVD3tNlOhkHxpVw+OwrI8nqBChRIi4IDmmzbikN4JbuqV1vt6VaxLjI4M0VhkptOsH6OxBtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748267204; c=relaxed/simple;
	bh=BacTL2lSs3oB0dyf25h3YDqLkjvIEfjNzmqTyRyMX+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgPqHNJznYFWJozW+HV4ZGv6WiXehb5qpyw4McSvlPuwBz+D23Dhd4MJKSgkFc7DJvLvjtSLKZ8PDVGGsoUnt0QCV/KgM8e1/hJEr1be7gNj0x+Dcf6ihlvQrHxAf8j2ceaSnXFkovrd5k0lwA6VtdKGds0oWfCKnQ0OTE+XsRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qUzxbqHQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC42D982;
	Mon, 26 May 2025 15:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748267175;
	bh=BacTL2lSs3oB0dyf25h3YDqLkjvIEfjNzmqTyRyMX+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUzxbqHQ3o5/MF2vN1jGRMB7+BD2BhtE5w7w0nS9PJT90MC9c22LU/amOV5OE5oCk
	 SsVP0e3Hp/vN35vfrG8Mrs5iS657dW/VGEqq4/jbnefCwfSNE3/kSxTh7tnc+lgWTm
	 321n0aET8/HQzTPA35bkMEM/HYGyirMzZyUyI3X0=
Date: Mon, 26 May 2025 15:46:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: uvcvideo: Do not mark valid metadata as
 invalid
Message-ID: <20250526134634.GM17743@pendragon.ideasonboard.com>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-1-f79974fc2d20@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404-uvc-meta-v5-1-f79974fc2d20@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, Apr 04, 2025 at 06:37:34AM +0000, Ricardo Ribalda wrote:
> Currently, the driver performs a length check of the metadata buffer
> before the actual metadata size is known and before the metadata is
> decided to be copied. This results in valid metadata buffers being
> incorrectly marked as invalid.
> 
> Move the length check to occur after the metadata size is determined and
> is decided to be copied.
> 
> Cc: stable@vger.kernel.org
> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  	if (!meta_buf || length == 2)
>  		return;
>  
> -	if (meta_buf->length - meta_buf->bytesused <
> -	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
> -		meta_buf->error = 1;
> -		return;
> -	}
> -
>  	has_pts = mem[1] & UVC_STREAM_PTS;
>  	has_scr = mem[1] & UVC_STREAM_SCR;
>  
> @@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  				  !memcmp(scr, stream->clock.last_scr, 6)))
>  		return;
>  
> +	if (meta_buf->length - meta_buf->bytesused <
> +	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
> +		meta_buf->error = 1;
> +		return;
> +	}
> +
>  	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
>  	local_irq_save(flags);
>  	time = uvc_video_get_time();

-- 
Regards,

Laurent Pinchart

