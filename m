Return-Path: <linux-media+bounces-34556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3831AD6487
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 02:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85EB63AC8F2
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 00:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5B01DA23;
	Thu, 12 Jun 2025 00:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LUe/8Hg6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D7711CAF;
	Thu, 12 Jun 2025 00:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688278; cv=none; b=FHZLS/dj2Rqr9rEGbFAhI8v1ZpZlm6E/UG5N38akPPKJZb8q2ytOAsaj2CbG0Qbqc7o2crlQhmjDRqV+NtuWqmoLeV8G8Bdo6pQ/2Pfz7krd7FFPTuD0ywjVrwqfvkSCLhG+qIPEsHuA/fcGL4FSclARbiGXOWMv74cZg0Ji2DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688278; c=relaxed/simple;
	bh=DyRfflzLEisox0q5EfayJmbJHbzM1gcrjE066seRdF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3mbPH/wJ05GjFPYUXb0l7Rx+qDSVBR5ASeP1HUpFwyHfFYEJHk3iDr22eAO67q+9AQIsIQsl11LFgyOnErzmYKKwiWnXFs5ta0UZSxt1fS7TTn+LfqJJ9ubNB/lTL2pBYeLHQStPKyHMzE4vyRoqzovv5FZGH7zjNoBSzmEols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LUe/8Hg6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81CE222A;
	Thu, 12 Jun 2025 02:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749688266;
	bh=DyRfflzLEisox0q5EfayJmbJHbzM1gcrjE066seRdF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUe/8Hg6tP5di+AtdZTQYEQykbwG0+KUOcQzuLbH2L6PYm2kLKYfCPc3ZcfqzWJZb
	 GeT7DtZBDvRYaWZE9/YhqNvnvMtGBcKrGogbgoffizk8yjOPoIKMyJTQQM8Goi4WDn
	 kBsAjg8wuNdOLM5f9wXNnUUNT9R7khYGhvv/XpYE=
Date: Thu, 12 Jun 2025 03:31:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 03/12] media: rcar-vin: Change link setup argument
Message-ID: <20250612003101.GE22977@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-4-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 06, 2025 at 08:25:57PM +0200, Niklas Söderlund wrote:
> The link setup callback once acted on each VIN instance, and expected to
> be called once for each VIN instance. This have changed as the driver
> grew support for later hardware generations and the callback is now
> expected to setup links for all VIN in the group.
> 
> The argument to the callback have however remained a pointer to a single

s/have/has/

> VIN instance. This pointer was then used to get the group structure. Fix
> this and pass the group as the single argument to the link setup
> callback making the expectation of the function clear.
> 
> There is no intentional change in behavior.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v4
> - Use the group->info structure added in previous patch instead of
>   iterating over all VIN to find one that is instantiated to get the
>   same information.
> - Condense variable declaration in rvin_isp_setup_links().
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 37 ++++++++++---------
>  .../platform/renesas/rcar-vin/rcar-vin.h      |  2 +-
>  2 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 66efe075adae..73d713868391 100644
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
> @@ -247,7 +247,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  		}
>  	}
>  
> -	return vin->group->link_setup(vin);
> +	return vin->group->link_setup(vin->group);
>  }
>  
>  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> @@ -910,35 +910,35 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
>  	return 0;
>  }
>  
> -static int rvin_csi2_setup_links(struct rvin_dev *vin)
> +static int rvin_csi2_setup_links(struct rvin_group *group)
>  {
>  	const struct rvin_group_route *route;
>  	unsigned int id;
>  	int ret = -EINVAL;
>  
>  	/* Create all media device links between VINs and CSI-2's. */
> -	mutex_lock(&vin->group->lock);
> -	for (route = vin->info->routes; route->chsel; route++) {
> +	mutex_lock(&group->lock);
> +	for (route = group->info->routes; route->chsel; route++) {
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
> @@ -992,30 +992,31 @@ static int rvin_csi2_init(struct rvin_dev *vin)
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
> +		struct rvin_dev *vin = group->vin[i];
>  
> -		if (!vin->group->vin[i])
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
> @@ -1031,7 +1032,7 @@ static int rvin_isp_setup_links(struct rvin_dev *vin)
>  			break;
>  		}
>  	}
> -	mutex_unlock(&vin->group->lock);
> +	mutex_unlock(&group->lock);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index 313703cd1103..cb8e8fa54f96 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -259,7 +259,7 @@ struct rvin_group {
>  	const struct rvin_info *info;
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

