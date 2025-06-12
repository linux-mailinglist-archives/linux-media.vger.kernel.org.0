Return-Path: <linux-media+bounces-34687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6AAD7ED3
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 01:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32E13A1991
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 23:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06A42D662B;
	Thu, 12 Jun 2025 23:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="urdYdMF4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073B823184A;
	Thu, 12 Jun 2025 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749770123; cv=none; b=k7mHdUuWpl1atZjqXROwCFkPnPqnIN8ZeW/kcKDLdPWsNmEZgicFd2AiMZE51TH+YDqijvrI8ZuH5tIqOH60dj2YJZArJQrxb0BtPl+Bvb0X7MXUyRtHCPvYDuZCEXo88Mb0vualBJxGwIaQdaU5K7cWj1K0I38yvzNUF+21HJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749770123; c=relaxed/simple;
	bh=KHREQufhSPDiIJ3T1/gtXzkNn2AfVaDhOqvoo5iOwkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIfEH/ImpIQ938oDCpeiTOgJqvV8feMvxsAatvJi6aOo3B3wRui4EtHIR8fxpluTTt2uTtnyeCRSJZ84wpxoka0nlxIKACJE3EOUKtBZjlpRbz6LDnreuBwIVSvM3XbSIrksJ7iaWEggx+ytSn30UF55ajm2te6llaMatPiD/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=urdYdMF4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E69C27E1;
	Fri, 13 Jun 2025 01:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749770110;
	bh=KHREQufhSPDiIJ3T1/gtXzkNn2AfVaDhOqvoo5iOwkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urdYdMF4RUnULKvGUTmGZ1bbEq2itVGIWSn23DkLOZkBK6CuiTjGudUevbwsWK+Gd
	 GUWEa3HCJM5lMDYzbhtBcBsqneR6lnwnnySAWmk2CjbtUsrNA3fztdWrJfRI3DSnf2
	 1QPXCMi4ypTaYTUnP6JI8uSPwamIJFfWVh786NX4=
Date: Fri, 13 Jun 2025 02:15:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 07/12] media: rcar-vin: Merge all notifiers
Message-ID: <20250612231504.GE10542@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-8-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-8-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 06, 2025 at 08:26:01PM +0200, Niklas Söderlund wrote:
> The VIN usage of v4l-async is complex and stems from organic growth of
> the driver of supporting both private local subdevices (Gen2, Gen3) and
> subdevices shared between all VIN instances (Gen3 and Gen4).
> 
> The driver used a separate notifier for each VIN for the private local
> ones, and a shared group notifier for the shared ones. This was complex
> and lead to subtle bugs when unbinding and later rebinding subdevices in
> one of the notifiers having to handle different edge cases depending on
> if it also had subdevices in the other notifiers etc.
> 
> To simplify this have the Gen2 devices allocate and form a VIN group
> too. This way all subdevices on all models can be collect in a
> single group notifier. Then there is only a single complete callback for
> all where the video devices and subdevice nodes can be registered etc.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> * Changes since v4
> - Fix spelling in commit message and comments.
> - Use mutex guard to simplify error path.
> - Fix code style, add braces and blank lines.
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 256 ++++++++----------
>  .../platform/renesas/rcar-vin/rcar-vin.h      |   2 -
>  2 files changed, 106 insertions(+), 152 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 100432080ad7..c5510e3b258f 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -43,6 +43,9 @@
>  
>  #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
>  
> +static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> +					  struct v4l2_subdev *subdev);
> +
>  /* -----------------------------------------------------------------------------
>   * Gen3 Group Allocator
>   */
> @@ -233,7 +236,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  		}
>  	}
>  
> -	return vin->group->link_setup(vin->group);
> +	if (vin->group->link_setup)
> +		return vin->group->link_setup(vin->group);
> +
> +	return  0;
>  }
>  
>  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> @@ -241,20 +247,32 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>  				     struct v4l2_async_connection *asc)
>  {
>  	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -	unsigned int i;
> +	struct rvin_group *group = vin->group;
>  
> -	for (i = 0; i < RCAR_VIN_NUM; i++)
> -		if (vin->group->vin[i])
> -			rvin_v4l2_unregister(vin->group->vin[i]);
> +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> +		if (group->vin[i])
> +			rvin_v4l2_unregister(group->vin[i]);
> +	}
>  
>  	mutex_lock(&vin->group->lock);
>  
> -	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
> -		if (vin->group->remotes[i].asc != asc)
> +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> +		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
>  			continue;
> -		vin->group->remotes[i].subdev = NULL;
> +
> +		group->vin[i]->parallel.subdev = NULL;
> +
> +		vin_dbg(group->vin[i], "Unbind parallel subdev %s\n",
> +			subdev->name);
> +	}
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++) {
> +		if (group->remotes[i].asc != asc)
> +			continue;
> +
> +		group->remotes[i].subdev = NULL;
> +
>  		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
> -		break;
>  	}
>  
>  	mutex_unlock(&vin->group->lock);
> @@ -267,21 +285,38 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_connection *asc)
>  {
>  	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -	unsigned int i;
> +	struct rvin_group *group = vin->group;
>  
> -	mutex_lock(&vin->group->lock);
> +	guard(mutex)(&group->lock);
>  
> -	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
> +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> +		int ret;
> +
> +		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
> +			continue;
> +
> +		ret = rvin_parallel_subdevice_attach(group->vin[i], subdev);
> +		if (ret)
> +			return ret;
> +
> +		v4l2_set_subdev_hostdata(subdev, group->vin[i]);
> +
> +		vin_dbg(group->vin[i], "Bound subdev %s\n", subdev->name);
> +
> +		return 0;
> +	}
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++) {
>  		if (vin->group->remotes[i].asc != asc)
>  			continue;
> +
>  		vin->group->remotes[i].subdev = subdev;
>  		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
> -		break;
> +
> +		return 0;
>  	}
>  
> -	mutex_unlock(&vin->group->lock);
> -
> -	return 0;
> +	return -ENODEV;
>  }
>  
>  static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
> @@ -371,7 +406,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
>  	}
>  
>  	fwnode = fwnode_graph_get_remote_endpoint(ep);
> -	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> +	asc = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
>  				       struct v4l2_async_connection);
>  	if (IS_ERR(asc))
>  		return PTR_ERR(asc);
> @@ -417,6 +452,12 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  		if (!(vin_mask & BIT(i)))
>  			continue;
>  
> +		/* Parse local subdevice. */
> +		ret = rvin_parallel_parse_of(vin->group->vin[i]);
> +		if (ret)
> +			return ret;
> +
> +		/* Prase shared subdevices. */

s/Prase/Parse/

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		for (id = 0; id < max_id; id++) {
>  			if (vin->group->remotes[id].asc)
>  				continue;
> @@ -596,124 +637,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
>  	return 0;
>  }
>  
> -static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> -{
> -	rvin_v4l2_unregister(vin);
> -	vin->parallel.subdev = NULL;
> -
> -	if (!vin->info->use_mc)
> -		rvin_free_controls(vin);
> -}
> -
> -static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
> -{
> -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -	struct media_entity *source;
> -	struct media_entity *sink;
> -	int ret;
> -
> -	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
> -	if (ret < 0) {
> -		vin_err(vin, "Failed to register subdev nodes\n");
> -		return ret;
> -	}
> -
> -	if (!video_is_registered(&vin->vdev)) {
> -		ret = rvin_v4l2_register(vin);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	if (!vin->info->use_mc)
> -		return 0;
> -
> -	/* If we're running with media-controller, link the subdevs. */
> -	source = &vin->parallel.subdev->entity;
> -	sink = &vin->vdev.entity;
> -
> -	ret = media_create_pad_link(source, vin->parallel.source_pad,
> -				    sink, vin->parallel.sink_pad, 0);
> -	if (ret)
> -		vin_err(vin, "Error adding link from %s to %s: %d\n",
> -			source->name, sink->name, ret);
> -
> -	return ret;
> -}
> -
> -static void rvin_parallel_notify_unbind(struct v4l2_async_notifier *notifier,
> -					struct v4l2_subdev *subdev,
> -					struct v4l2_async_connection *asc)
> -{
> -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -
> -	vin_dbg(vin, "unbind parallel subdev %s\n", subdev->name);
> -
> -	mutex_lock(&vin->lock);
> -	rvin_parallel_subdevice_detach(vin);
> -	mutex_unlock(&vin->lock);
> -}
> -
> -static int rvin_parallel_notify_bound(struct v4l2_async_notifier *notifier,
> -				      struct v4l2_subdev *subdev,
> -				      struct v4l2_async_connection *asc)
> -{
> -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -	int ret;
> -
> -	mutex_lock(&vin->lock);
> -	ret = rvin_parallel_subdevice_attach(vin, subdev);
> -	mutex_unlock(&vin->lock);
> -	if (ret)
> -		return ret;
> -
> -	v4l2_set_subdev_hostdata(subdev, vin);
> -
> -	vin_dbg(vin, "bound subdev %s source pad: %u sink pad: %u\n",
> -		subdev->name, vin->parallel.source_pad,
> -		vin->parallel.sink_pad);
> -
> -	return 0;
> -}
> -
> -static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
> -	.bound = rvin_parallel_notify_bound,
> -	.unbind = rvin_parallel_notify_unbind,
> -	.complete = rvin_parallel_notify_complete,
> -};
> -
> -static void rvin_parallel_cleanup(struct rvin_dev *vin)
> -{
> -	v4l2_async_nf_unregister(&vin->notifier);
> -	v4l2_async_nf_cleanup(&vin->notifier);
> -}
> -
> -static int rvin_parallel_init(struct rvin_dev *vin)
> -{
> -	int ret;
> -
> -	v4l2_async_nf_init(&vin->notifier, &vin->v4l2_dev);
> -
> -	ret = rvin_parallel_parse_of(vin);
> -	if (ret)
> -		return ret;
> -
> -	if (!vin->parallel.asc)
> -		return -ENODEV;
> -
> -	vin_dbg(vin, "Found parallel subdevice %pOF\n",
> -		to_of_node(vin->parallel.asc->match.fwnode));
> -
> -	vin->notifier.ops = &rvin_parallel_notify_ops;
> -	ret = v4l2_async_nf_register(&vin->notifier);
> -	if (ret < 0) {
> -		vin_err(vin, "Notifier registration failed\n");
> -		v4l2_async_nf_cleanup(&vin->notifier);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  /* -----------------------------------------------------------------------------
>   * CSI-2
>   */
> @@ -888,11 +811,52 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
>  	return 0;
>  }
>  
> +static int rvin_parallel_setup_links(struct rvin_group *group)
> +{
> +	u32 flags = MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
> +
> +	guard(mutex)(&group->lock);
> +
> +	/* If the group also has links don't enable the link. */
> +	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++) {
> +		if (group->remotes[i].subdev) {
> +			flags = 0;
> +			break;
> +		}
> +	}
> +
> +	/* Create links. */
> +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> +		struct rvin_dev *vin = group->vin[i];
> +		struct media_entity *source;
> +		struct media_entity *sink;
> +		int ret;
> +
> +		/* Nothing to do if there is no VIN or parallel subdev. */
> +		if (!vin || !vin->parallel.subdev)
> +			continue;
> +
> +		source = &vin->parallel.subdev->entity;
> +		sink = &vin->vdev.entity;
> +
> +		ret = media_create_pad_link(source, vin->parallel.source_pad,
> +					    sink, 0, flags);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rvin_csi2_setup_links(struct rvin_group *group)
>  {
>  	const struct rvin_group_route *route;
>  	unsigned int id;
> -	int ret = -EINVAL;
> +	int ret;
> +
> +	ret = rvin_parallel_setup_links(group);
> +	if (ret)
> +		return ret;
>  
>  	/* Create all media device links between VINs and CSI-2's. */
>  	mutex_lock(&group->lock);
> @@ -923,9 +887,7 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
>  
>  static void rvin_csi2_cleanup(struct rvin_dev *vin)
>  {
> -	rvin_parallel_cleanup(vin);
>  	rvin_group_notifier_cleanup(vin);
> -	rvin_group_put(vin);
>  	rvin_free_controls(vin);
>  }
>  
> @@ -946,18 +908,11 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>  	if (ret)
>  		goto err_controls;
>  
> -	/* It's OK to not have a parallel subdevice. */
> -	ret = rvin_parallel_init(vin);
> -	if (ret && ret != -ENODEV)
> -		goto err_group;
> -
>  	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
>  	if (ret)
> -		goto err_parallel;
> +		goto err_group;
>  
>  	return 0;
> -err_parallel:
> -	rvin_parallel_cleanup(vin);
>  err_group:
>  	rvin_group_put(vin);
>  err_controls:
> @@ -1018,7 +973,6 @@ static int rvin_isp_setup_links(struct rvin_group *group)
>  static void rvin_isp_cleanup(struct rvin_dev *vin)
>  {
>  	rvin_group_notifier_cleanup(vin);
> -	rvin_group_put(vin);
>  	rvin_free_controls(vin);
>  }
>  
> @@ -1430,7 +1384,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  		    rvin_group_id_to_master(vin->id) == vin->id)
>  			vin->scaler = vin->info->scaler;
>  	} else {
> -		ret = rvin_parallel_init(vin);
> +		ret = rvin_group_get(vin, NULL, NULL);
> +		if (!ret)
> +			ret = rvin_group_notifier_init(vin, 0, 0);
>  
>  		if (vin->info->scaler)
>  			vin->scaler = vin->info->scaler;
> @@ -1460,8 +1416,8 @@ static void rcar_vin_remove(struct platform_device *pdev)
>  		rvin_isp_cleanup(vin);
>  	else if (vin->info->use_mc)
>  		rvin_csi2_cleanup(vin);
> -	else
> -		rvin_parallel_cleanup(vin);
> +
> +	rvin_group_put(vin);
>  
>  	rvin_id_put(vin);
>  
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index cb8e8fa54f96..38ae2bd20b72 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -149,7 +149,6 @@ struct rvin_info {
>   * @vdev:		V4L2 video device associated with VIN
>   * @v4l2_dev:		V4L2 device
>   * @ctrl_handler:	V4L2 control handler
> - * @notifier:		V4L2 asynchronous subdevs notifier
>   *
>   * @parallel:		parallel input subdevice descriptor
>   *
> @@ -189,7 +188,6 @@ struct rvin_dev {
>  	struct video_device vdev;
>  	struct v4l2_device v4l2_dev;
>  	struct v4l2_ctrl_handler ctrl_handler;
> -	struct v4l2_async_notifier notifier;
>  
>  	struct rvin_parallel_entity parallel;
>  

-- 
Regards,

Laurent Pinchart

