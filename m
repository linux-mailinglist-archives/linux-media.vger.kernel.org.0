Return-Path: <linux-media+bounces-13056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730D9055AF
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 16:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D35FCB21D90
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9008C17F50C;
	Wed, 12 Jun 2024 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BjoEEDtN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02A1E504
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203693; cv=none; b=ab0+EaF+gjkOG8z4ra9qYAaON4ZFHvW9It3JMBgJUZmruP73lDSYNHroYmGomlqVRYOE7d6o1I9Dt1ACofrSVk4K3KFSsRHLfIE43d8N550h8ohuOW7Q2t4e91Z4ekJh0kvBBuSIw1z3ZyvOZ0hK5y/AKVWgkPdETDwdzNLVLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203693; c=relaxed/simple;
	bh=edFY/OMkIEVsnnnGxossJATTepPVKSyb163nKpmjUD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMbLBiGkzAFiDyX85QfFVZAjFpORAdCZKkDJDpaEY6F/i6gieKaeSQun8k+GskKB3Qv4sHORH8nLk3S4gzCfsmCjLVuHjpS6aWJcfduJBCQvEDIUP8w82g/GMvP6Yq9d3ffdXTWEGdxL0GkqOKYk/OLmLYAdHGtxKMFZk3MsT6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BjoEEDtN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10EDE4AB;
	Wed, 12 Jun 2024 16:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718203675;
	bh=edFY/OMkIEVsnnnGxossJATTepPVKSyb163nKpmjUD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjoEEDtNhZrOXXzBHhxWMtmHZrmtyFViGX7Nh8UrfMYfjm7wvXP5BxGqzQO0QHHK8
	 eRMhH6ZNxKe8ekTGoHVinhl9WeLjpRLYo7o1ZR2L07yJYh2Lzfg/5qB7FUrxoLeRfe
	 88HzLN27yz+RklSKRxhdGG0v8uAtvRaQaaxZyLdI=
Date: Wed, 12 Jun 2024 17:47:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 3/8] media: rkisp1: Remove cached format info
Message-ID: <20240612144748.GB15991@pendragon.ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-4-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240605165434.432230-4-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Jun 05, 2024 at 06:54:22PM +0200, Jacopo Mondi wrote:
> The struct rkisp1_params type contains a v4l2_format instance which
> is used to store the buffer format and sizes to be used in enum_fmt and
> g_fmt operations.
> 
> To prepare for supporting multiple meta output formats, to introduce
> support for extensible buffer formats, remove the cached format info
> and initialize them explicitly in the enum_fmt and g_fmt operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 --
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 28 ++++++-------------
>  2 files changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 26573f6ae575..2a715f964f6e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -372,7 +372,6 @@ struct rkisp1_params_ops {
>   * @ops:		pointer to the variant-specific operations
>   * @config_lock:	locks the buffer list 'params'
>   * @params:		queue of rkisp1_buffer
> - * @vdev_fmt:		v4l2_format of the metadata format
>   * @quantization:	the quantization configured on the isp's src pad
>   * @raw_type:		the bayer pattern on the isp video sink pad
>   */
> @@ -383,7 +382,6 @@ struct rkisp1_params {
>  
>  	spinlock_t config_lock; /* locks the buffers list 'params' */
>  	struct list_head params;
> -	struct v4l2_format vdev_fmt;
>  
>  	enum v4l2_quantization quantization;
>  	enum v4l2_ycbcr_encoding ycbcr_encoding;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 173d1ea41874..1f449f29b241 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1742,12 +1742,11 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>  					   struct v4l2_fmtdesc *f)
>  {
>  	struct video_device *video = video_devdata(file);
> -	struct rkisp1_params *params = video_get_drvdata(video);
>  
>  	if (f->index > 0 || f->type != video->queue->type)
>  		return -EINVAL;
>  
> -	f->pixelformat = params->vdev_fmt.fmt.meta.dataformat;
> +	f->pixelformat = V4L2_META_FMT_RK_ISP1_PARAMS;
>  
>  	return 0;
>  }
> @@ -1756,15 +1755,14 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
>  					struct v4l2_format *f)
>  {
>  	struct video_device *video = video_devdata(file);
> -	struct rkisp1_params *params = video_get_drvdata(video);
>  	struct v4l2_meta_format *meta = &f->fmt.meta;
>  
>  	if (f->type != video->queue->type)
>  		return -EINVAL;
>  
>  	memset(meta, 0, sizeof(*meta));
> -	meta->dataformat = params->vdev_fmt.fmt.meta.dataformat;
> -	meta->buffersize = params->vdev_fmt.fmt.meta.buffersize;
> +	meta->dataformat = V4L2_META_FMT_RK_ISP1_PARAMS;
> +	meta->buffersize = sizeof(struct rkisp1_params_cfg);
>  
>  	return 0;
>  }
> @@ -1897,19 +1895,6 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
>  	return vb2_queue_init(q);
>  }
>  
> -static void rkisp1_init_params(struct rkisp1_params *params)
> -{
> -	params->vdev_fmt.fmt.meta.dataformat =
> -		V4L2_META_FMT_RK_ISP1_PARAMS;
> -	params->vdev_fmt.fmt.meta.buffersize =
> -		sizeof(struct rkisp1_params_cfg);
> -
> -	if (params->rkisp1->info->isp_ver == RKISP1_V12)
> -		params->ops = &rkisp1_v12_params_ops;
> -	else
> -		params->ops = &rkisp1_v10_params_ops;
> -}
> -
>  int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_params *params = &rkisp1->params;
> @@ -1938,7 +1923,12 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>  	vdev->vfl_dir = VFL_DIR_TX;
>  	rkisp1_params_init_vb2_queue(vdev->queue, params);
> -	rkisp1_init_params(params);
> +
> +	if (params->rkisp1->info->isp_ver == RKISP1_V12)
> +		params->ops = &rkisp1_v12_params_ops;
> +	else
> +		params->ops = &rkisp1_v10_params_ops;
> +
>  	video_set_drvdata(vdev, params);
>  
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;

-- 
Regards,

Laurent Pinchart

