Return-Path: <linux-media+bounces-34689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9AAD7EEB
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 01:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE0D83B03F2
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 23:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4552E1734;
	Thu, 12 Jun 2025 23:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QJ9kax9p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A052E0B63;
	Thu, 12 Jun 2025 23:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749770920; cv=none; b=Gsw7W+451C7Yb5doN8Xs5mPEmCWyvBhser5rZMnG/b9/oBBzNgYrdop1RRH+x/KthaWbr4XNOQAJvFJdzUh91RZI7yv/u6VuIceymd34W5Rk6pLR04O7FQPTMScmYPFFOfEdhlel/XI5E1FHQFpnJCBxCjYjRnqFkacDz1D+Wxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749770920; c=relaxed/simple;
	bh=idrVi7lk312ixrQ/K8c25f5P7qw0yKXV4eJjSiQ6pQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LU/zV5WwWpp85C2N4oUeFUts/VdYazU7D3v8J5yafOlAUAOPI4a/vCvsG+OQtABbeMIbpJ3CjWlGJ8F7VzZF40svZW2Tkytwq+2qXD5PMfohQB02b0IhYnEI4bkxXQIl7fS/kH5uNVd9qE19eoUlXZXqTbVyGJV3qmdomh1qOCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QJ9kax9p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33068A98;
	Fri, 13 Jun 2025 01:28:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749770906;
	bh=idrVi7lk312ixrQ/K8c25f5P7qw0yKXV4eJjSiQ6pQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJ9kax9pe4GjBmPcmazZB4ShTYXoQUKmmgqdn8TTf18FHaGbUxzKTSTrtSV74bKmj
	 M1zDwiYnfXFyW9W3siWKF0kwdGWFeWLvemD/cgAiP6Hiw78SI4/HuPRmrbRpM6+P2T
	 5ZjRc7WHaqTfgypeMkb/8xYk+I3VE2FYaSlKE8bg=
Date: Fri, 13 Jun 2025 02:28:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 10/12] media: rcar-vin: Only expose VIN controls
Message-ID: <20250612232820.GG10542@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-11-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-11-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 06, 2025 at 08:26:04PM +0200, Niklas Söderlund wrote:
> Before moving Gen2 to media controller simplify the creation of controls
> by not exposing the sub-device controls on the video device. This could
> be done while enabling media controller but doing it separately reduces
> the changes needed to do so.
> 
> The rework also allows the cleanup and remove paths to be simplified by
> folding all special cases into the only remaining call site.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v4
> - Broken out from a larger patch.
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 84 ++++---------------
>  1 file changed, 18 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 8cb3d0a3520f..597e868a6bc5 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -365,14 +365,6 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
>  	return ret;
>  }
>  
> -static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
> -{
> -	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
> -		v4l2_async_nf_unregister(&vin->group->notifier);
> -		v4l2_async_nf_cleanup(&vin->group->notifier);
> -	}
> -}
> -
>  static int rvin_parallel_parse_of(struct rvin_dev *vin)
>  {
>  	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
> @@ -510,7 +502,7 @@ static void rvin_free_controls(struct rvin_dev *vin)
>  	vin->vdev.ctrl_handler = NULL;
>  }
>  
> -static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
> +static int rvin_create_controls(struct rvin_dev *vin)
>  {
>  	int ret;
>  
> @@ -528,16 +520,6 @@ static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev
>  		return ret;
>  	}
>  

Now that the control handler for the video device only has a single
control, you can reduce the number of buckets:

-	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
+	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);

> -	/* For the non-MC mode add controls from the subdevice. */
> -	if (subdev) {
> -		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
> -					    subdev->ctrl_handler, NULL, true);
> -		if (ret < 0) {
> -			rvin_free_controls(vin);
> -			return ret;
> -		}
> -	}
> -
>  	vin->vdev.ctrl_handler = &vin->ctrl_handler;
>  
>  	return 0;
> @@ -627,11 +609,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
>  	if (ret < 0 && ret != -ENOIOCTLCMD)
>  		return ret;
>  
> -	/* Add the controls */
> -	ret = rvin_create_controls(vin, subdev);
> -	if (ret < 0)
> -		return ret;
> -
>  	vin->parallel.subdev = subdev;
>  
>  	return 0;
> @@ -885,34 +862,17 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
>  	return ret;
>  }
>  
> -static void rvin_csi2_cleanup(struct rvin_dev *vin)
> -{
> -	rvin_group_notifier_cleanup(vin);
> -	rvin_free_controls(vin);
> -}
> -
>  static int rvin_csi2_init(struct rvin_dev *vin)
>  {
>  	int ret;
>  
> -
> -	ret = rvin_create_controls(vin, NULL);
> -	if (ret < 0)
> -		return ret;
> -
>  	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_csi2_media_ops);
>  	if (ret)
> -		goto err_controls;
> +		return ret;
>  
>  	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
>  	if (ret)
> -		goto err_group;
> -
> -	return 0;
> -err_group:
> -	rvin_group_put(vin);
> -err_controls:
> -	rvin_free_controls(vin);
> +		rvin_group_put(vin);
>  
>  	return ret;
>  }
> @@ -966,34 +926,17 @@ static int rvin_isp_setup_links(struct rvin_group *group)
>  	return ret;
>  }
>  
> -static void rvin_isp_cleanup(struct rvin_dev *vin)
> -{
> -	rvin_group_notifier_cleanup(vin);
> -	rvin_free_controls(vin);
> -}
> -
>  static int rvin_isp_init(struct rvin_dev *vin)
>  {
>  	int ret;
>  
> -
> -	ret = rvin_create_controls(vin, NULL);
> -	if (ret < 0)
> -		return ret;
> -
>  	ret = rvin_group_get(vin, rvin_isp_setup_links, NULL);
>  	if (ret)
> -		goto err_controls;
> +		return ret;
>  
>  	ret = rvin_group_notifier_init(vin, 2, RVIN_ISP_MAX);
>  	if (ret)
> -		goto err_group;
> -
> -	return 0;
> -err_group:
> -	rvin_group_put(vin);
> -err_controls:
> -	rvin_free_controls(vin);
> +		rvin_group_put(vin);
>  
>  	return ret;
>  }
> @@ -1372,6 +1315,10 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = rvin_create_controls(vin);
> +	if (ret < 0)
> +		return ret;

Don't you need to call rvin_dma_unregister() here ?

> +
>  	if (vin->info->use_isp) {
>  		ret = rvin_isp_init(vin);
>  	} else if (vin->info->use_mc) {
> @@ -1390,6 +1337,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	}
>  
>  	if (ret) {
> +		rvin_free_controls(vin);
>  		rvin_dma_unregister(vin);
>  		rvin_id_put(vin);
>  		return ret;

Error labels at the end of the function will make this more manageable.

> @@ -1409,13 +1357,17 @@ static void rcar_vin_remove(struct platform_device *pdev)
>  
>  	rvin_v4l2_unregister(vin);
>  
> -	if (vin->info->use_isp)
> -		rvin_isp_cleanup(vin);
> -	else if (vin->info->use_mc)
> -		rvin_csi2_cleanup(vin);
> +	if (vin->info->use_isp || vin->info->use_mc) {
> +		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
> +			v4l2_async_nf_unregister(&vin->group->notifier);
> +			v4l2_async_nf_cleanup(&vin->group->notifier);
> +		}
> +	}
>  
>  	rvin_group_put(vin);
>  
> +	rvin_free_controls(vin);
> +
>  	rvin_id_put(vin);
>  
>  	rvin_dma_unregister(vin);

-- 
Regards,

Laurent Pinchart

