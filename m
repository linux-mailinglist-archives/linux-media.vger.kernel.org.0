Return-Path: <linux-media+bounces-34092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24078ACEBC7
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88EBC1898473
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 08:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2452063F0;
	Thu,  5 Jun 2025 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lonhup31"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E41FBC92;
	Thu,  5 Jun 2025 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111949; cv=none; b=jnzKk738l08uighaV8bliya6QL/3w/vHLdKtCsiJD5PYe7tBixP7EleCJxevbX7x9uHZ1ffGylYw1/dncwg00lSY2vAGsEc8UjzSxUuyXA5s+ARknFpxdGdetBLtsO+EYG77IWQNpYHkV9jLLSyNVaL0PSOKW1tjkVRs7899508=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111949; c=relaxed/simple;
	bh=jZB5GUQNSLUZGeN1I47kzPPREnhFS78kamPsE8HrUzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuhH3f/MNuWGEFzZ2YtmKofVnPe/O1gvW4KJjHZ6nd7J2i/PKKNP5fPPN7jU/4U7kaRcq7ynIKsRWEYfpHlmPG2a778AsHhqhBUz12mdP+xz6tbvJs/Ozsnu2ioDixCKB2WIzwXKmEq/qaZV9+wpvaJsst5MUcA6VxLh+CTbn6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lonhup31; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFFC0593;
	Thu,  5 Jun 2025 10:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749111936;
	bh=jZB5GUQNSLUZGeN1I47kzPPREnhFS78kamPsE8HrUzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lonhup31Z1S3y5FuC22Cm3h5rArwmYJu7MnAAx33eIbQHvdQYmdDjQ1wzP5kmtq6U
	 2GsNC2Iuk1QtHC5CsCVMZvyKwPkRguP3zf8a0KS8kJg54+kGrwSeKwV+JC52DFw3Ux
	 Qh4N58hl/fKgt9Ra00eOlpcp2qW8Qh9OlXkMWoic=
Date: Thu, 5 Jun 2025 11:25:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] media: rkisp1: Properly handle result of
 rkisp1_params_init_vb2_queue()
Message-ID: <20250605082529.GH3755@pendragon.ideasonboard.com>
References: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
 <20250523-supported-params-and-wdr-v3-1-7283b8536694@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250523-supported-params-and-wdr-v3-1-7283b8536694@ideasonboard.com>

Hi Stefan,

Thank you for the patch.

On Fri, May 23, 2025 at 05:14:30PM +0200, Stefan Klug wrote:
> Properly handle the return of rkisp1_params_init_vb2_queue(). It is very
> unlikely that this ever fails without code changes but should be handled
> anyways.
> 
> While at it rename the error label for easier extension in the upcoming
> patch.

I'd have kept that change for the next patch, as it's hard to review
here without looking at upcoming changes. There's no need for a v4 just
because of this.

> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v3:
> - Moved these changes into its own patch
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..24a8de697f2b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	vdev->queue = &node->buf_queue;
>  	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>  	vdev->vfl_dir = VFL_DIR_TX;
> -	rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	if (ret)
> +		goto err_media;
>  
>  	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
>  
> @@ -2777,18 +2779,18 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		goto error;
> +		goto err_media;
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
>  	mutex_destroy(&node->vlock);
>  	return ret;

-- 
Regards,

Laurent Pinchart

