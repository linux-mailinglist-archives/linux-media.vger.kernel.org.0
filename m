Return-Path: <linux-media+bounces-33449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4FFAC4D6C
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 421423B20CE
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 11:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D057B1FF1A0;
	Tue, 27 May 2025 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UuIZUKC4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9805F179A7;
	Tue, 27 May 2025 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345542; cv=none; b=HPAsiUesyuYjoyHPf6ZtCHQAcbx51CflY+l7XLAujML31ERyvBjwRoqFmIdz09EsfN7oeDJiIzLU+re4b4iNxr/BGhWKk/S2Bq3s0ExC/GtKiQY8dyV807n+OmFUpXCwnQBfGXGnDN6tytOHijmb1D+2nsVqLEFJ2G2aQI2Em9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345542; c=relaxed/simple;
	bh=uE6ja0L+XoQ3HN5Ua4MFUgO9q/rSiWGGmnC5bL8BTO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5j6dwOOWipiWNk6/hW1Ge/udFNDoxFB8eB7mbMqAd1Eb6P9biTWXqXlH+DoidLY1aJkWVzXtYQh3Nmr+qFaHVzlO51PKViNFFnG7kgqQkDjYKvXw/7BPlfPZmEoUxtSfpvzIj+IsFv6KVPbOGoR7IrciK+B8X2Sha/ipomad0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UuIZUKC4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [145.15.244.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C3DE2B3;
	Tue, 27 May 2025 13:31:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748345513;
	bh=uE6ja0L+XoQ3HN5Ua4MFUgO9q/rSiWGGmnC5bL8BTO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UuIZUKC4nmX3KOdBPrHmXGmk+LPakJXOiE1UGPjO418zBpS0iqWPMdtRXSjKvVzrT
	 3/IVkaZ/+qC45mTO1RcfETbHGM2PiU3RrWxrnV2uPsRe4UXO4la7BMFuGPccSQW0CX
	 wn1o1uG+v2+9Q4j0Ac5UVF+ZS3QGJUA2UF3ysdMQ=
Date: Tue, 27 May 2025 13:32:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: rcar-vin: Prepare for unifying all
 v4l-async notifiers
Message-ID: <20250527113212.GK12492@pendragon.ideasonboard.com>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

On Wed, May 21, 2025 at 03:20:35PM +0200, Niklas Söderlund wrote:
> The R-Car VIN driver is needless complex and uses more then one
> v4l-async notifier to attach to all its subdevices. Prepare for unifying
> them by moving rvin_parallel_parse_of() to where it needs to be when
> they are unified.
> 
> The function is moved verbatim and there is no change in behavior.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 106 +++++++++---------
>  1 file changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index d9ad56fb2aa9..60ec57d73a12 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -337,6 +337,59 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
>  	}
>  }
>  
> +static int rvin_parallel_parse_of(struct rvin_dev *vin)
> +{
> +	struct fwnode_handle *ep, *fwnode;
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_UNKNOWN,
> +	};
> +	struct v4l2_async_connection *asc;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
> +	if (!ep)
> +		return 0;
> +
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	switch (vep.bus_type) {
> +	case V4L2_MBUS_PARALLEL:
> +	case V4L2_MBUS_BT656:
> +		vin_dbg(vin, "Found %s media bus\n",
> +			vep.bus_type == V4L2_MBUS_PARALLEL ?
> +			"PARALLEL" : "BT656");
> +		vin->parallel.mbus_type = vep.bus_type;
> +		vin->parallel.bus = vep.bus.parallel;
> +		break;
> +	default:
> +		vin_err(vin, "Unknown media bus type\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> +				       struct v4l2_async_connection);
> +	if (IS_ERR(asc)) {
> +		ret = PTR_ERR(asc);
> +		goto out;
> +	}
> +
> +	vin->parallel.asc = asc;
> +
> +	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> +out:
> +	fwnode_handle_put(fwnode);
> +
> +	return ret;
> +}
> +
>  static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  				    unsigned int max_id)
>  {
> @@ -635,59 +688,6 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
>  	.complete = rvin_parallel_notify_complete,
>  };
>  
> -static int rvin_parallel_parse_of(struct rvin_dev *vin)
> -{
> -	struct fwnode_handle *ep, *fwnode;
> -	struct v4l2_fwnode_endpoint vep = {
> -		.bus_type = V4L2_MBUS_UNKNOWN,
> -	};
> -	struct v4l2_async_connection *asc;
> -	int ret;
> -
> -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
> -	if (!ep)
> -		return 0;
> -
> -	fwnode = fwnode_graph_get_remote_endpoint(ep);
> -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> -	fwnode_handle_put(ep);
> -	if (ret) {
> -		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
> -	switch (vep.bus_type) {
> -	case V4L2_MBUS_PARALLEL:
> -	case V4L2_MBUS_BT656:
> -		vin_dbg(vin, "Found %s media bus\n",
> -			vep.bus_type == V4L2_MBUS_PARALLEL ?
> -			"PARALLEL" : "BT656");
> -		vin->parallel.mbus_type = vep.bus_type;
> -		vin->parallel.bus = vep.bus.parallel;
> -		break;
> -	default:
> -		vin_err(vin, "Unknown media bus type\n");
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
> -	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> -				       struct v4l2_async_connection);
> -	if (IS_ERR(asc)) {
> -		ret = PTR_ERR(asc);
> -		goto out;
> -	}
> -
> -	vin->parallel.asc = asc;
> -
> -	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> -out:
> -	fwnode_handle_put(fwnode);
> -
> -	return ret;
> -}
> -
>  static void rvin_parallel_cleanup(struct rvin_dev *vin)
>  {
>  	v4l2_async_nf_unregister(&vin->notifier);

-- 
Regards,

Laurent Pinchart

