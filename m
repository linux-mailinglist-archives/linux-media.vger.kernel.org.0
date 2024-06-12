Return-Path: <linux-media+bounces-13021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B08904FFF
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 12:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B4991F2123D
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4585716E870;
	Wed, 12 Jun 2024 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JwPFxHSY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D916D9D0
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186799; cv=none; b=Kgawme863Qw4G0+KZUlNoTC4XAvO1J0Fvi0jJxKnV8sNA4PbulVM6B/8ECM/HBBAks7Bw6XPbuCt3Q9kB7LojbDVTRyZr/35ixDvT7nG6wd2hIQp8a2dXQJEefpGZRXsXPzQwXdZviK0GbmhuQV29Evz1OBMzTTgeZoR62lp3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186799; c=relaxed/simple;
	bh=yVPnKVigzKyS1VBe/Ox6TU+fGyWGqbsXWew0gtZbZ0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNDI8N+sc+i0AIu3+4fBCDmrKp9lW0xs9kPShPylVE4PiAggwESyhLogAgiwv/i0e2wFQyq0cOgOiSSXK3ZVEaMoWGLdobBnx0gi2CT39/FfeZ785CfwtH0KS9rKQxIEe+q2ah83jkrkutHXqQ0Pa75EHOPwtjtkXLUmZg2ds+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JwPFxHSY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 097074AB;
	Wed, 12 Jun 2024 12:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718186781;
	bh=yVPnKVigzKyS1VBe/Ox6TU+fGyWGqbsXWew0gtZbZ0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JwPFxHSYpUdHFNFic3/wJaDX1xk463OxFEnHhYBo6n+F3Mrh3s12jfO5lQ2LHQ/FQ
	 kB0fxYfb0wTClgbAZr1erwORklNxraGBofO2scTp9R8F3RqgH/4cK7UPN3w1/Vn529
	 sPujonvoJ1cdKh6kmomvSL4/aQVuQnZx4mkKInyY=
Message-ID: <942797ce-fd7f-45bb-beb0-93774c4be9dd@ideasonboard.com>
Date: Wed, 12 Jun 2024 11:06:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: rkisp1: Remove cached format info
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-4-jacopo.mondi@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240605165434.432230-4-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 05/06/2024 17:54, Jacopo Mondi wrote:
> The struct rkisp1_params type contains a v4l2_format instance which
> is used to store the buffer format and sizes to be used in enum_fmt and
> g_fmt operations.
>
> To prepare for supporting multiple meta output formats, to introduce
> support for extensible buffer formats, remove the cached format info
> and initialize them explicitly in the enum_fmt and g_fmt operations.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>   .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 --
>   .../platform/rockchip/rkisp1/rkisp1-params.c  | 28 ++++++-------------
>   2 files changed, 9 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 26573f6ae575..2a715f964f6e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -372,7 +372,6 @@ struct rkisp1_params_ops {
>    * @ops:		pointer to the variant-specific operations
>    * @config_lock:	locks the buffer list 'params'
>    * @params:		queue of rkisp1_buffer
> - * @vdev_fmt:		v4l2_format of the metadata format
>    * @quantization:	the quantization configured on the isp's src pad
>    * @raw_type:		the bayer pattern on the isp video sink pad
>    */
> @@ -383,7 +382,6 @@ struct rkisp1_params {
>   
>   	spinlock_t config_lock; /* locks the buffers list 'params' */
>   	struct list_head params;
> -	struct v4l2_format vdev_fmt;
>   
>   	enum v4l2_quantization quantization;
>   	enum v4l2_ycbcr_encoding ycbcr_encoding;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 173d1ea41874..1f449f29b241 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1742,12 +1742,11 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>   					   struct v4l2_fmtdesc *f)
>   {
>   	struct video_device *video = video_devdata(file);
> -	struct rkisp1_params *params = video_get_drvdata(video);
>   
>   	if (f->index > 0 || f->type != video->queue->type)
>   		return -EINVAL;
>   
> -	f->pixelformat = params->vdev_fmt.fmt.meta.dataformat;
> +	f->pixelformat = V4L2_META_FMT_RK_ISP1_PARAMS;
>   
>   	return 0;
>   }
> @@ -1756,15 +1755,14 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
>   					struct v4l2_format *f)
>   {
>   	struct video_device *video = video_devdata(file);
> -	struct rkisp1_params *params = video_get_drvdata(video);
>   	struct v4l2_meta_format *meta = &f->fmt.meta;
>   
>   	if (f->type != video->queue->type)
>   		return -EINVAL;
>   
>   	memset(meta, 0, sizeof(*meta));
> -	meta->dataformat = params->vdev_fmt.fmt.meta.dataformat;
> -	meta->buffersize = params->vdev_fmt.fmt.meta.buffersize;
> +	meta->dataformat = V4L2_META_FMT_RK_ISP1_PARAMS;
> +	meta->buffersize = sizeof(struct rkisp1_params_cfg);
>   
>   	return 0;
>   }
> @@ -1897,19 +1895,6 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
>   	return vb2_queue_init(q);
>   }
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
>   int rkisp1_params_register(struct rkisp1_device *rkisp1)
>   {
>   	struct rkisp1_params *params = &rkisp1->params;
> @@ -1938,7 +1923,12 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>   	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>   	vdev->vfl_dir = VFL_DIR_TX;
>   	rkisp1_params_init_vb2_queue(vdev->queue, params);
> -	rkisp1_init_params(params);
> +
> +	if (params->rkisp1->info->isp_ver == RKISP1_V12)
> +		params->ops = &rkisp1_v12_params_ops;
> +	else
> +		params->ops = &rkisp1_v10_params_ops;
> +
>   	video_set_drvdata(vdev, params);
>   
>   	node->pad.flags = MEDIA_PAD_FL_SOURCE;

