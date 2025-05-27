Return-Path: <linux-media+bounces-33447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF6AC4D11
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77DB317DA13
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 11:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1016258CEC;
	Tue, 27 May 2025 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TRghfbit"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66915253350;
	Tue, 27 May 2025 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344811; cv=none; b=Fyu8U3BauKS3iAYVDNTbT1+RObLX255oyoErcIBXtriAkCK2Fw9fLJ25I48vOEEXHIW3QUECPgUnYXYlmSqjRF+QiiGDNNeUxKqIKEVYHmZWl3GBmzNTIHhijYqEcI9EV5jj1b86Qecv8ErxRmjro86ViqCvBuc5OFl6KQywBAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344811; c=relaxed/simple;
	bh=Cknz/Q44fnr1lLpJC38Y777nGDu6cbOMC43VL7y+V1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j12xCkzuKFE4JcxbOXtnqSLg/cJ/lYM4dgVV4pps8sAZKbMe+H9Q1u+e9ZwcjTAAGF7cbTOdp/oiPR3AE4/BxNe8pDl0WKTgMX/EQRbRbCUttOqtOU/7sUIzIXR5pi36Adepo5OSFLcz5lWDioeMGPWjz6kSWhRcN4yCYwjzAKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TRghfbit; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [145.15.244.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF3922B3;
	Tue, 27 May 2025 13:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748344782;
	bh=Cknz/Q44fnr1lLpJC38Y777nGDu6cbOMC43VL7y+V1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRghfbitjDRddWO6xNfmkAdAbsWuxO30vu6kpZf9PCfvnQ7vUlNpsZvRUfbI3PHq0
	 F0i9hJWioIRcEw9Nang46eTm0V0s/be+qdLxhGTHzX4ne12ITqVoqgOj0DMVqWeTfh
	 oeZPpf9JZVPYnLII/p27L3C5k4GF4gotCeifPIQM=
Date: Tue, 27 May 2025 13:19:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/6] media: rcar-vin: Change link setup argument
Message-ID: <20250527111901.GI12492@pendragon.ideasonboard.com>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521132037.1463746-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, May 21, 2025 at 03:20:33PM +0200, Niklas Söderlund wrote:
> The link setup callback once acted on each VIN instance, and expected to
> be called once for each VIN instance. This have changed as the driver
> grew support for later hardware generations and the callback is now
> expected to setup links for all VIN in the group.
> 
> The argument to the callback have however remained a pointer to a single
> VIN instance. This pointer was then used to get the group structure. Fix
> this and pass the group as the single argument to the link setup
> callback making the expectation of the function clear.
> 
> There is no intentional change in behavior.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 52 ++++++++++++-------
>  .../platform/renesas/rcar-vin/rcar-vin.h      |  2 +-
>  2 files changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index b9ea5b8db559..1be408d6c508 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -65,7 +65,7 @@ static void rvin_group_cleanup(struct rvin_group *group)
>  }
>  
>  static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
> -			   int (*link_setup)(struct rvin_dev *),
> +			   int (*link_setup)(struct rvin_group *),
>  			   const struct media_device_ops *ops)
>  {
>  	struct media_device *mdev = &group->mdev;
> @@ -115,7 +115,7 @@ static void rvin_group_release(struct kref *kref)
>  }
>  
>  static int rvin_group_get(struct rvin_dev *vin,
> -			  int (*link_setup)(struct rvin_dev *),
> +			  int (*link_setup)(struct rvin_group *),
>  			  const struct media_device_ops *ops)
>  {
>  	struct rvin_group *group;
> @@ -246,7 +246,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  		}
>  	}
>  
> -	return vin->group->link_setup(vin);
> +	return vin->group->link_setup(vin->group);
>  }
>  
>  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> @@ -909,35 +909,46 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
>  	return 0;
>  }
>  
> -static int rvin_csi2_setup_links(struct rvin_dev *vin)
> +static int rvin_csi2_setup_links(struct rvin_group *group)
>  {
> -	const struct rvin_group_route *route;
> +	const struct rvin_group_route *routes, *route;

	const struct rvin_group_route *routes = NULL;
	const struct rvin_group_route *route;

>  	unsigned int id;
>  	int ret = -EINVAL;
>  
> +	/* Find any VIN in group to get route info. */
> +	routes = NULL;
> +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {

Use ARRAY_SIZE()

> +		if (group->vin[i]) {
> +			routes = group->vin[i]->info->routes;
> +			break;
> +		}
> +	}
> +	if (!routes)
> +		return -ENODEV;

I wonder if the info pointer should also be stored in the rvin_group
structure.

> +
>  	/* Create all media device links between VINs and CSI-2's. */
> -	mutex_lock(&vin->group->lock);
> -	for (route = vin->info->routes; route->chsel; route++) {
> +	mutex_lock(&group->lock);
> +	for (route = routes; route->chsel; route++) {
>  		/* Check that VIN' master is part of the group. */
> -		if (!vin->group->vin[route->master])
> +		if (!group->vin[route->master])
>  			continue;
>  
>  		/* Check that CSI-2 is part of the group. */
> -		if (!vin->group->remotes[route->csi].subdev)
> +		if (!group->remotes[route->csi].subdev)
>  			continue;
>  
>  		for (id = route->master; id < route->master + 4; id++) {
>  			/* Check that VIN is part of the group. */
> -			if (!vin->group->vin[id])
> +			if (!group->vin[id])
>  				continue;
>  
> -			ret = rvin_csi2_create_link(vin->group, id, route);
> +			ret = rvin_csi2_create_link(group, id, route);
>  			if (ret)
>  				goto out;
>  		}
>  	}
>  out:
> -	mutex_unlock(&vin->group->lock);
> +	mutex_unlock(&group->lock);
>  
>  	return ret;
>  }
> @@ -991,30 +1002,33 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>   * ISP
>   */
>  
> -static int rvin_isp_setup_links(struct rvin_dev *vin)
> +static int rvin_isp_setup_links(struct rvin_group *group)
>  {
>  	unsigned int i;
>  	int ret = -EINVAL;
>  
>  	/* Create all media device links between VINs and ISP's. */
> -	mutex_lock(&vin->group->lock);
> +	mutex_lock(&group->lock);
>  	for (i = 0; i < RCAR_VIN_NUM; i++) {
>  		struct media_pad *source_pad, *sink_pad;
>  		struct media_entity *source, *sink;
>  		unsigned int source_slot = i / 8;
>  		unsigned int source_idx = i % 8 + 1;
> +		struct rvin_dev *vin;

		struct rvin_dev *vin = group->vin[i];

>  
> -		if (!vin->group->vin[i])
> +		vin = group->vin[i];
> +
> +		if (!vin)
>  			continue;
>  
>  		/* Check that ISP is part of the group. */
> -		if (!vin->group->remotes[source_slot].subdev)
> +		if (!group->remotes[source_slot].subdev)
>  			continue;
>  
> -		source = &vin->group->remotes[source_slot].subdev->entity;
> +		source = &group->remotes[source_slot].subdev->entity;
>  		source_pad = &source->pads[source_idx];
>  
> -		sink = &vin->group->vin[i]->vdev.entity;
> +		sink = &vin->vdev.entity;
>  		sink_pad = &sink->pads[0];
>  
>  		/* Skip if link already exists. */
> @@ -1030,7 +1044,7 @@ static int rvin_isp_setup_links(struct rvin_dev *vin)
>  			break;
>  		}
>  	}
> -	mutex_unlock(&vin->group->lock);
> +	mutex_unlock(&group->lock);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index 83d1b2734c41..7d4fce248976 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -257,7 +257,7 @@ struct rvin_group {
>  	struct v4l2_async_notifier notifier;
>  	struct rvin_dev *vin[RCAR_VIN_NUM];
>  
> -	int (*link_setup)(struct rvin_dev *vin);
> +	int (*link_setup)(struct rvin_group *group);
>  
>  	struct {
>  		struct v4l2_async_connection *asc;

-- 
Regards,

Laurent Pinchart

