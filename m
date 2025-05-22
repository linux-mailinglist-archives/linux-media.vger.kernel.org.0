Return-Path: <linux-media+bounces-33169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D78C6AC1028
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E25349E1CE0
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBF4299953;
	Thu, 22 May 2025 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PzBqiEJQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1A51022;
	Thu, 22 May 2025 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928541; cv=none; b=BGu2opFE0Lg6HIgJkKQyFYZ/DvTIIpkFyB7RAK2iXlD0cJePIKYGqwnIA+2xJcwhBhgjrZp8imd+KwjfCp0KcrzR+ePqba6syP6fMXnoYWtxBpyhEiAsC9tioG+iYwv8tVbrhRcWEnK2l8+4EYoFWyOpyYCu9Q2N/a00fjg49sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928541; c=relaxed/simple;
	bh=Pk1SR0qc+6xGK/ApAUwCssUMbaYjc92Qk7n6tZrTahg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7C/7UJdHd+pt/R0LQ92rl+QZ434eikX7tSBjSBg1QGHQWuaKsI0Uz2lZ5IwNs36xk4z8Ki9uJghCvs8Oi1oaIDt5GKTjcpl6SOsy5R6ei9VJb26fhempQ018CCQ1YFc7l9/4EKq8kT1AMnOQk4uhp6X/klEpJTswR1pXkj3DzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PzBqiEJQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3874D8FA;
	Thu, 22 May 2025 17:41:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747928515;
	bh=Pk1SR0qc+6xGK/ApAUwCssUMbaYjc92Qk7n6tZrTahg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzBqiEJQHdBh2knAAhxgQbesGuijbf2mhWv+b76u1M+H2gHMEZUz3cgcyxQEh/vco
	 SQOOyaVD++IkBhiueVsq1vvvzGFL/kjFmdN75sIgfxkZ/NntfKeVHycI8pCwtrloAo
	 Tx1quKm21RNTEP99PU6UIP0PoeWDByrYoUBHg9Rk=
Date: Thu, 22 May 2025 17:42:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rkisp1: Cleanup error handling
Message-ID: <20250522154210.GT12514@pendragon.ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
 <20250522150944.400046-3-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522150944.400046-3-stefan.klug@ideasonboard.com>

Hi Stefan,

Thank you for the patch.

On Thu, May 22, 2025 at 05:08:38PM +0200, Stefan Klug wrote:
> Do not call media_entity_cleanup() when media_entity_pads_init() fails.

Why is it an issue ? The media_entity_cleanup() documentation clearly
states

 * Calling media_entity_cleanup() on a media_entity whose memory has been
 * zeroed but that has not been initialized with media_entity_pad_init() is
 * valid and is a no-op.

This is by design to simplify error handling in drivers.

> As a drive-by fix handle an (very unlikely) error in
> rkisp1_params_init_vb2_queue().
> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c    | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..918eb06c7465 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	vdev->queue = &node->buf_queue;
>  	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>  	vdev->vfl_dir = VFL_DIR_TX;
> -	rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	if (ret)
> +		goto err_mutex;
>  
>  	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
>  
> @@ -2777,19 +2779,20 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		goto error;
> +		goto err_mutex;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		goto error;
> +		goto err_media;
>  	}
>  
>  	return 0;
>  
> -error:
> +err_media:
>  	media_entity_cleanup(&vdev->entity);
> +err_mutex:
>  	mutex_destroy(&node->vlock);
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart

