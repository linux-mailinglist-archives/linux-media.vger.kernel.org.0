Return-Path: <linux-media+bounces-34788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9AAAD948C
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 20:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1424F1E4827
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 18:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA7722F774;
	Fri, 13 Jun 2025 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vfhD9Mzd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC0C20F09B;
	Fri, 13 Jun 2025 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749839930; cv=none; b=BD1bhQ2KchGTriCV5j9nqWujGWj3SkVC8bLiGU9pf/IseGV3sCYN42efrVy8BYDUArrbxziiYxwLIPDYsn7Awscy4oUpk2i/ctUXC3aJLO+WTanTqUjD8kK9Bp3R7TXiECXVyCkz4qr3hMV+9LO+LjyFdhkvBT4Bf6TnA8KyCGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749839930; c=relaxed/simple;
	bh=QkDUGyiQ8azH59zSbfbu680cHKpIUkIqBVE2yLlblUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrASFVewxFQR7+yHWisZddxk6XTfSHkjU38yJNnpJbRV1zbX8FeFS8jshEbhcfDNrX2xERmDJhg28VUfUcLnoWiWaNigoRfcvHN8y9rC8JbR8iblBN/y+xnCAWGRE67f7KyUUbhOYP2fwYAhKTfpTSzk2WhG5aBBtSWL9+kIPsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vfhD9Mzd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD3E3ED;
	Fri, 13 Jun 2025 20:38:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749839917;
	bh=QkDUGyiQ8azH59zSbfbu680cHKpIUkIqBVE2yLlblUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vfhD9Mzd31x5wYYSx3L+faS+5s0xLXmHfZgTXEN8igbiA8seE98f6UPTI3q2tz5aS
	 NaeClvUJc41ecxUj/SD235DUNybtnF3qiZGsc752jAY1zPwy3IytWwmUbVw8AoEykG
	 +aq6/YojCoNMfDwmiVCW8478I/4IbAFYMXnDUrYs=
Date: Fri, 13 Jun 2025 21:38:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 11/13] media: rcar-vin: Only expose VIN controls
Message-ID: <20250613183831.GK25137@pendragon.ideasonboard.com>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
 <20250613153434.2001800-12-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613153434.2001800-12-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 13, 2025 at 05:34:32PM +0200, Niklas Söderlund wrote:
> Before moving Gen2 to media controller simplify the creation of controls
> by not exposing the sub-device controls on the video device. This could
> be done while enabling media controller but doing it separately reduces
> the changes needed to do so.
> 
> The rework also allows the cleanup and remove paths to be simplified by
> folding all special cases into the only remaining call site.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v5
> - Reduce number of control buckets to 1.
> 
> * Changes since v4
> - Broken out from a larger patch.
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 89 +++++--------------
>  1 file changed, 21 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 7367b5c993cd..74fc90cf5800 100644
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
> @@ -510,11 +502,11 @@ static void rvin_free_controls(struct rvin_dev *vin)
>  	vin->vdev.ctrl_handler = NULL;
>  }
>  
> -static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
> +static int rvin_create_controls(struct rvin_dev *vin)
>  {
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
> +	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -528,16 +520,6 @@ static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev
>  		return ret;
>  	}
>  
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
> @@ -1374,6 +1317,10 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_id;
>  
> +	ret = rvin_create_controls(vin);
> +	if (ret < 0)
> +		goto err_id;
> +
>  	if (vin->info->use_isp) {
>  		ret = rvin_isp_init(vin);
>  	} else if (vin->info->use_mc) {
> @@ -1392,13 +1339,15 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	}
>  
>  	if (ret)
> -		goto err_id;
> +		goto err_ctrl;
>  
>  	pm_suspend_ignore_children(&pdev->dev, true);
>  	pm_runtime_enable(&pdev->dev);
>  
>  	return 0;
>  
> +err_ctrl:
> +	rvin_free_controls(vin);
>  err_id:
>  	rvin_id_put(vin);
>  err_dma:
> @@ -1415,13 +1364,17 @@ static void rcar_vin_remove(struct platform_device *pdev)
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

