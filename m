Return-Path: <linux-media+bounces-33448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EBAAC4D6A
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A5E37A3A7A
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 11:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C070E25DCE0;
	Tue, 27 May 2025 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tYYKtd8Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B3325C71D;
	Tue, 27 May 2025 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345524; cv=none; b=A4Pg3QjWBFJDG8JMNKLfUWQGs8P7oRTXzm5sL669/mwvWwmj6OHt1Dx3qYo41H0ImTpJaHub8cbMzTkhZawxJ5DYFtiuVRb4nopnT6z2842S8WsR30/dbkHE9s3yTDoosB+P3VEgSwPg7Etxy0CVYFZZzNzt7+6T6kNpcpZuQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345524; c=relaxed/simple;
	bh=h+ZBx7kHRqB6BgXATeKIIHa4MIKRj5KlXFHZxrzR52s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKN1L5RJ72lSnZ8BW9Qd5dX8JIdSZ+kgtqiLmOxUrfm4kEoXI5a8MOXmOoDmlfgZUFji3YTJc1I3GG70yP/2RQp3jRC5oVt/3/i9S1caSVTp4y7OrxO6P3FNwQjIWnk9xHKoIvZO/JK00ZpyoE8AjfXo83aGnjV6mbwsBwQnLzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tYYKtd8Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [145.15.244.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27EDA2B3;
	Tue, 27 May 2025 13:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748345495;
	bh=h+ZBx7kHRqB6BgXATeKIIHa4MIKRj5KlXFHZxrzR52s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYYKtd8Y3U+caaT0isZf3dtO/68nptOXKEjMbcBEatFBoPfQ2auUr6+A3PQADJyA4
	 brGxoCBkxkf6yNOwrC/xkWRbvUxEf9PNwWBuVg2xLgNkdKtSseYPjT4Z00w4FjGGWv
	 wGzqF4tK5EQvyJYXdfBRl1oa/5qYlWc61YxcVlDM=
Date: Tue, 27 May 2025 13:31:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/6] media: rcar-vin: Generate a VIN group ID for Gen2
Message-ID: <20250527113144.GJ12492@pendragon.ideasonboard.com>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521132037.1463746-4-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, May 21, 2025 at 03:20:34PM +0200, Niklas Söderlund wrote:
> Prepare to move Gen2 and earlier models to media controller by
> generating a unique VIN group id for each VIN instance. On Gen3 and Gen4
> it is important to have a specific id in the group as media graph routes
> depend on this. On Gen2 and earlier models all that will matter is to
> have a unique id in the range.
> 
> Break out the id generation to a own function keeping the logic for Gen3
> and Gen4 while generating a sequential id for Gen2 models.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Move ID allocation to probe.
> - Use ida_alloc_range() instead of implementing our own schema by
>   counting DT nodes.
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 78 ++++++++++++++-----
>  1 file changed, 59 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 1be408d6c508..d9ad56fb2aa9 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -10,6 +10,7 @@
>   * Based on the soc-camera rcar_vin driver
>   */
>  
> +#include <linux/idr.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
> @@ -55,6 +56,7 @@
>   * be only one group for all instances.
>   */
>  
> +static DEFINE_IDA(rvin_ida);
>  static DEFINE_MUTEX(rvin_group_lock);
>  static struct rvin_group *rvin_group_data;
>  
> @@ -119,23 +121,8 @@ static int rvin_group_get(struct rvin_dev *vin,
>  			  const struct media_device_ops *ops)
>  {
>  	struct rvin_group *group;
> -	u32 id;
>  	int ret;
>  
> -	/* Make sure VIN id is present and sane */
> -	ret = of_property_read_u32(vin->dev->of_node, "renesas,id", &id);
> -	if (ret) {
> -		vin_err(vin, "%pOF: No renesas,id property found\n",
> -			vin->dev->of_node);
> -		return -EINVAL;
> -	}
> -
> -	if (id >= RCAR_VIN_NUM) {
> -		vin_err(vin, "%pOF: Invalid renesas,id '%u'\n",
> -			vin->dev->of_node, id);
> -		return -EINVAL;
> -	}
> -
>  	/* Join or create a VIN group */
>  	mutex_lock(&rvin_group_lock);
>  	if (rvin_group_data) {
> @@ -164,16 +151,15 @@ static int rvin_group_get(struct rvin_dev *vin,
>  	/* Add VIN to group */
>  	mutex_lock(&group->lock);
>  
> -	if (group->vin[id]) {
> -		vin_err(vin, "Duplicate renesas,id property value %u\n", id);
> +	if (group->vin[vin->id]) {
> +		vin_err(vin, "Duplicate renesas,id property value %u\n", vin->id);
>  		mutex_unlock(&group->lock);
>  		kref_put(&group->refcount, rvin_group_release);
>  		return -EINVAL;
>  	}
>  
> -	group->vin[id] = vin;
> +	group->vin[vin->id] = vin;
>  
> -	vin->id = id;
>  	vin->group = group;
>  	vin->v4l2_dev.mdev = &group->mdev;
>  
> @@ -1375,6 +1361,54 @@ static const struct of_device_id rvin_of_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, rvin_of_id_table);
>  
> +static int rvin_id_get(struct rvin_dev *vin)
> +{
> +	u32 oid;
> +	int id;
> +
> +	switch (vin->info->model) {
> +	case RCAR_GEN3:
> +	case RCAR_GEN4:
> +		if (of_property_read_u32(vin->dev->of_node, "renesas,id", &oid))

I would keep the original error message here:

			vin_err(vin, "%pOF: No renesas,id property found\n",
				vin->dev->of_node);

> +			break;

And you can return -EINVAL directly.

> +
> +		if (oid < 0 || oid >= RCAR_VIN_NUM) {
> +			vin_err(vin, "%pOF: Invalid renesas,id '%u'\n",
> +				vin->dev->of_node, oid);
> +			return -EINVAL;
> +		}
> +
> +		vin->id = oid;
> +
> +		return 0;
> +	default:
> +		id = ida_alloc_range(&rvin_ida, 0, RCAR_VIN_NUM - 1,
> +				     GFP_KERNEL);
> +		if (id < 0)
> +			break;

Same here, I'd add a specific error message and return:

			vin_err(vin, "Can't allocate group ID\n");
			return -EINVAL;

> +
> +		vin->id = id;
> +
> +		return 0;
> +	}
> +
> +	vin_err(vin, "Can't figure out VIN id\n");
> +
> +	return -EINVAL;

And you can drop this.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +}
> +
> +static void rvin_id_put(struct rvin_dev *vin)
> +{
> +	switch (vin->info->model) {
> +	case RCAR_GEN3:
> +	case RCAR_GEN4:
> +		break;
> +	default:
> +		ida_free(&rvin_ida, vin->id);
> +		break;
> +	}
> +}
> +
>  static int rcar_vin_probe(struct platform_device *pdev)
>  {
>  	struct rvin_dev *vin;
> @@ -1402,6 +1436,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, vin);
>  
> +	if (rvin_id_get(vin))
> +		return -EINVAL;
> +
>  	if (vin->info->use_isp) {
>  		ret = rvin_isp_init(vin);
>  	} else if (vin->info->use_mc) {
> @@ -1419,6 +1456,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  
>  	if (ret) {
>  		rvin_dma_unregister(vin);
> +		rvin_id_put(vin);
>  		return ret;
>  	}
>  
> @@ -1443,6 +1481,8 @@ static void rcar_vin_remove(struct platform_device *pdev)
>  	else
>  		rvin_parallel_cleanup(vin);
>  
> +	rvin_id_put(vin);
> +
>  	rvin_dma_unregister(vin);
>  }
>  

-- 
Regards,

Laurent Pinchart

