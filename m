Return-Path: <linux-media+bounces-13590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB590DA19
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E491C1C21D19
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB75F13A400;
	Tue, 18 Jun 2024 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TS6oxu81"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3CA1CA80;
	Tue, 18 Jun 2024 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729794; cv=none; b=TuYG5OwOMTR2hFP3tI+6NsZFBDck7vWtTnE80FIM0NWvxBSBK4zZ0Kn2NadRg8E0FuNM5PXl22yG/Tc68Xpzd2+g3NElfqms1UzrmyGuo4lUCkSSb/bhzDBU6gUBvSy03J+l1fJJwtea31/DxP67WDaxqaqn81xHZU2MZXA9m+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729794; c=relaxed/simple;
	bh=4HXM/Z2zy0x4FuaF+TIYORjgkbFI/EiPBdvwxIgB6BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWn2xNyUoeh6QIGAnr5riCwaLqSDcopuzEoljSkbXsBGVdNStNKuQa9rUJrPlUn+Ing5wxwj7+2wVUARfIDdy8E/8YaOEQwH+hszYJVkvp+vQgOpHCNIAUepiRWNE3I6GWCxNxvzPHBwXCkar7zS1ki5Y0qXTbR8BmDfmbA6w/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TS6oxu81; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A29D9564;
	Tue, 18 Jun 2024 18:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718729772;
	bh=4HXM/Z2zy0x4FuaF+TIYORjgkbFI/EiPBdvwxIgB6BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TS6oxu81/AcbXDwlnvojBpa5FV15DW0Gwa/09AbrWszhW5Jcz8pDJopsHLE+v+wHV
	 APkxKsrfyHW0IoWhBQVmR8B2A/jMpZNJSzO8aVLZOuPnAnHIR5vwJ74pLXlmv9rInN
	 +RiNgInwETiRr63VMzJU59EAdfdZ1d08ZzxUv1f8=
Date: Tue, 18 Jun 2024 18:56:27 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 17/19] media: renesas: vsp1: Initialize control
 handler after subdev
Message-ID: <rald5ewpijptokbg27wmrcrri2cu2bbeeh4dey6kohrdpieeoi@wnovtuoovm55>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-18-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-18-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:30:07AM GMT, Laurent Pinchart wrote:
> Some VSP modules initialize their control handler after initializing the
> subdev, while some initialize it before. This makes the code
> inconsistent and more error prone. Standardize on control initialization
> after initializing the subdev.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The existing code doesn't check for errors after having created
controls. Anyway, if this will ever be done on top, it will be enough
to call vsp1_entity_destroy() in case of errors as it clears up the
control handler already.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_hgo.c    | 20 +++++++++----------
>  .../media/platform/renesas/vsp1/vsp1_hgt.c    | 12 +++++------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> index 237dc4c7c5ed..21cffe6947a2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> @@ -192,6 +192,16 @@ struct vsp1_hgo *vsp1_hgo_create(struct vsp1_device *vsp1)
>  	if (hgo == NULL)
>  		return ERR_PTR(-ENOMEM);
>
> +	/* Initialize the video device and queue for statistics data. */
> +	ret = vsp1_histogram_init(vsp1, &hgo->histo, VSP1_ENTITY_HGO, "hgo",
> +				  &hgo_entity_ops, hgo_mbus_formats,
> +				  ARRAY_SIZE(hgo_mbus_formats),
> +				  HGO_DATA_SIZE, V4L2_META_FMT_VSP1_HGO);
> +	if (ret < 0) {
> +		vsp1_entity_destroy(&hgo->histo.entity);
> +		return ERR_PTR(ret);
> +	}
> +
>  	/* Initialize the control handler. */
>  	v4l2_ctrl_handler_init(&hgo->ctrls.handler,
>  			       vsp1->info->gen >= 3 ? 2 : 1);
> @@ -207,15 +217,5 @@ struct vsp1_hgo *vsp1_hgo_create(struct vsp1_device *vsp1)
>
>  	hgo->histo.entity.subdev.ctrl_handler = &hgo->ctrls.handler;
>
> -	/* Initialize the video device and queue for statistics data. */
> -	ret = vsp1_histogram_init(vsp1, &hgo->histo, VSP1_ENTITY_HGO, "hgo",
> -				  &hgo_entity_ops, hgo_mbus_formats,
> -				  ARRAY_SIZE(hgo_mbus_formats),
> -				  HGO_DATA_SIZE, V4L2_META_FMT_VSP1_HGO);
> -	if (ret < 0) {
> -		vsp1_entity_destroy(&hgo->histo.entity);
> -		return ERR_PTR(ret);
> -	}
> -
>  	return hgo;
>  }
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> index b73eac676ef0..a447ed1c59c3 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> @@ -191,12 +191,6 @@ struct vsp1_hgt *vsp1_hgt_create(struct vsp1_device *vsp1)
>  	if (hgt == NULL)
>  		return ERR_PTR(-ENOMEM);
>
> -	/* Initialize the control handler. */
> -	v4l2_ctrl_handler_init(&hgt->ctrls, 1);
> -	v4l2_ctrl_new_custom(&hgt->ctrls, &hgt_hue_areas, NULL);
> -
> -	hgt->histo.entity.subdev.ctrl_handler = &hgt->ctrls;
> -
>  	/* Initialize the video device and queue for statistics data. */
>  	ret = vsp1_histogram_init(vsp1, &hgt->histo, VSP1_ENTITY_HGT, "hgt",
>  				  &hgt_entity_ops, hgt_mbus_formats,
> @@ -207,6 +201,12 @@ struct vsp1_hgt *vsp1_hgt_create(struct vsp1_device *vsp1)
>  		return ERR_PTR(ret);
>  	}
>
> +	/* Initialize the control handler. */
> +	v4l2_ctrl_handler_init(&hgt->ctrls, 1);
> +	v4l2_ctrl_new_custom(&hgt->ctrls, &hgt_hue_areas, NULL);
> +
> +	hgt->histo.entity.subdev.ctrl_handler = &hgt->ctrls;
> +
>  	v4l2_ctrl_handler_setup(&hgt->ctrls);
>
>  	return hgt;
> --
> Regards,
>
> Laurent Pinchart
>
>

