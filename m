Return-Path: <linux-media+bounces-14682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E19AF9287E0
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 13:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CDC21F22A0E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 11:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972AD1494DE;
	Fri,  5 Jul 2024 11:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="na1UT5c+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEC21494C8
	for <linux-media@vger.kernel.org>; Fri,  5 Jul 2024 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720178615; cv=none; b=DRf8Vt63R5J9foqF4W0C9+hN2wi0JIRpRl+Gg7dwJifnq+vhYC2Scww+j1WE0RcjlRpaFjPyd9Jcx4BE67NLqYweBlcnCf6RFzcXSjaDQ4EH7gdtITf+Dj/paR/fiTooA1s58OHvkLgS5D2IRvAeUArECAorHLgaELXNDq7HUog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720178615; c=relaxed/simple;
	bh=KMH7SkmehXzDA+Q6JJXdYmtr2RyGaKZFYGrSUa/HYvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnyzARA+blry9ds0dfdNnQrCylysj0eFfLK+Je8m2bOE7qNAoZ/pJBXhgBytezsfr2bSUZnaDCedC6/2X86lhkNCrqJLHvF5A5uwxSl++d2J/4Uhsal0xly4oC+bJv7CcIn+LN3i/MIQ0LITXj3WMDnaMwlehJCFhii+3IHhB5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=na1UT5c+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AAD07F3;
	Fri,  5 Jul 2024 13:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720178581;
	bh=KMH7SkmehXzDA+Q6JJXdYmtr2RyGaKZFYGrSUa/HYvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=na1UT5c+tbk+JTYXUzuv4YWUbiCmEsuV+bEpEr6zQcIU8s8pS581GpM/g7i0nEyxa
	 xjTvODBVjRYdswgqVAX0uIDMx4RMcG1suqZxObZqFRqXdM5DKNXqsQ69DdQ2OL+Suu
	 ev/Ehz160p94bDo/QUg7BlSqo9V0+8Uizkv5f6C0=
Date: Fri, 5 Jul 2024 20:23:22 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 7/7] media: rkisp1: Implement s_fmt/try_fmt
Message-ID: <ZofXqtRwQRWOj1AE@pyrite.rasen.tech>
References: <20240703161048.247124-1-jacopo.mondi@ideasonboard.com>
 <20240703161048.247124-8-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703161048.247124-8-jacopo.mondi@ideasonboard.com>

On Wed, Jul 03, 2024 at 06:10:46PM +0200, Jacopo Mondi wrote:
> Implement in the rkisp1 driver support for the s_fmt and try_fmt
> operation to allow userspace to select between the extensible
> and the fixed parameters formats.
> 
> Implement enum_mbus_code to enumerate the fixed and the extensible
> formats and disallow changing the data format while the queue is busy.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 58 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 3ef410337aa2..ea1ad92d2b21 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -75,6 +75,17 @@ static const struct v4l2_meta_format rkisp1_params_formats[] = {
>  	},
>  };
>  
> +static const struct v4l2_meta_format *
> +rkisp1_params_get_format_info(u32 dataformat)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_params_formats); i++) {
> +		if (rkisp1_params_formats[i].dataformat == dataformat)
> +			return &rkisp1_params_formats[i];
> +	}
> +
> +	return &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
> +}
> +
>  static inline void
>  rkisp1_param_set_bits(struct rkisp1_params *params, u32 reg, u32 bit_mask)
>  {
> @@ -2233,12 +2244,12 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>  					   struct v4l2_fmtdesc *f)
>  {
>  	struct video_device *video = video_devdata(file);
> -	struct rkisp1_params *params = video_get_drvdata(video);
>  
> -	if (f->index > 0 || f->type != video->queue->type)
> +	if (f->index >= ARRAY_SIZE(rkisp1_params_formats) ||
> +	    f->type != video->queue->type)
>  		return -EINVAL;
>  
> -	f->pixelformat = params->metafmt->dataformat;
> +	f->pixelformat = rkisp1_params_formats[f->index].dataformat;
>  
>  	return 0;
>  }
> @@ -2253,9 +2264,40 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
>  	if (f->type != video->queue->type)
>  		return -EINVAL;
>  
> -	memset(meta, 0, sizeof(*meta));
> -	meta->dataformat = params->metafmt->dataformat;
> -	meta->buffersize = params->metafmt->buffersize;
> +	*meta = *params->metafmt;
> +
> +	return 0;
> +}
> +
> +static int rkisp1_params_try_fmt_meta_out(struct file *file, void *fh,
> +					  struct v4l2_format *f)
> +{
> +	struct video_device *video = video_devdata(file);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (f->type != video->queue->type)
> +		return -EINVAL;
> +
> +	*meta = *rkisp1_params_get_format_info(meta->dataformat);
> +
> +	return 0;
> +}
> +
> +static int rkisp1_params_s_fmt_meta_out(struct file *file, void *fh,
> +					struct v4l2_format *f)
> +{
> +	struct video_device *video = video_devdata(file);
> +	struct rkisp1_params *params = video_get_drvdata(video);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (f->type != video->queue->type)
> +		return -EINVAL;
> +
> +	if (vb2_is_busy(video->queue))
> +		return -EBUSY;
> +
> +	params->metafmt = rkisp1_params_get_format_info(meta->dataformat);
> +	*meta = *params->metafmt;
>  
>  	return 0;
>  }
> @@ -2285,8 +2327,8 @@ static const struct v4l2_ioctl_ops rkisp1_params_ioctl = {
>  	.vidioc_streamoff = vb2_ioctl_streamoff,
>  	.vidioc_enum_fmt_meta_out = rkisp1_params_enum_fmt_meta_out,
>  	.vidioc_g_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> -	.vidioc_s_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> -	.vidioc_try_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> +	.vidioc_s_fmt_meta_out = rkisp1_params_s_fmt_meta_out,
> +	.vidioc_try_fmt_meta_out = rkisp1_params_try_fmt_meta_out,
>  	.vidioc_querycap = rkisp1_params_querycap,
>  	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>  	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> -- 
> 2.45.2
> 

