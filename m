Return-Path: <linux-media+bounces-33437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5CAC48FF
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 09:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 010601885BBC
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1951E2307;
	Tue, 27 May 2025 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXa3eBaU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BD41D6DDD;
	Tue, 27 May 2025 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329314; cv=none; b=LqyNTkG+RcG8GQ0/9+c/UKImp0fRztIMf+NU2fK/Ix3j5cqghfkxSKXM6OdyDbiIPTXqeSiDaDxjHvdajNe+ltTqErq7ivcutX2UOCgyEr2jL2lorZi6GfgSJA1fyIDwTzVpxykmh29NBwR0L+5B+yg6rK0h7iEjvEhiMU2rnOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329314; c=relaxed/simple;
	bh=QTkwDWpFiXOcXX0tTp/C2kKyVC4ozE8ohrp8jvgiQlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGUzQp9ZcwiYCQrA27k5PqWaDhVNpNQKo9gXyPcRA0c4kKYC3Wa+R5KU8yNGb0gIh9plhACs8J+zeYh9aHxZTR+ZJ6UA+tJh1iNc+ZNTDvWGeEknM1h1y6H1jDGTW/rabtoCV5H+ZmLbMUACRWndBrLOIrJEEqT/ZQV3F+9GPXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXa3eBaU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748329313; x=1779865313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QTkwDWpFiXOcXX0tTp/C2kKyVC4ozE8ohrp8jvgiQlI=;
  b=dXa3eBaURCQ5qearTs8PzULDusJTjMOoboNKTOletnscgm7m7+7yarej
   zmPa6oVTPHraUAVSjUMMB6ls8vTKmAcjbU2mXZbRM36y/tRNqLvDVTYLr
   ux+627ANWPvv5Ehe3doACg7UCak1qKzROCa+vtaPU5QB5FkxrX1ie1HBX
   1GcUi6nJNLiFPCShVuJ4p9EGdgdPfHOuT7CFIVlCUIqjCuZAsJ3Id0l50
   JhqNXXow0LiygtduVa5vQ1fGhnNrrVHAsZQv1K3zPc+MicjkTYOj1dNDl
   hsrIsV+uEiGVXur+2XOomdMujygExUg/QlJ4qb8Exz/FG/0NMf9hKgw+K
   Q==;
X-CSE-ConnectionGUID: TeD71KA3TN6TbLey0In64w==
X-CSE-MsgGUID: SNXUt2QnSpSIViXIBiVxKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="37927431"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="37927431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 00:01:52 -0700
X-CSE-ConnectionGUID: JUSrwSrtTw+ipg0Dty6fmA==
X-CSE-MsgGUID: 8byTLRz/TgSi0ho78CE9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142540989"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 00:01:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 64D9E120297;
	Tue, 27 May 2025 10:01:47 +0300 (EEST)
Date: Tue, 27 May 2025 07:01:47 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: rcar-vin: Prepare for unifying all
 v4l-async notifiers
Message-ID: <aDVjW_k_keyFQbPT@kekkonen.localdomain>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>

Hej Niklas,

On Wed, May 21, 2025 at 03:20:35PM +0200, Niklas Söderlund wrote:
> The R-Car VIN driver is needless complex and uses more then one

s/needless\K/ly/

> v4l-async notifier to attach to all its subdevices. Prepare for unifying
> them by moving rvin_parallel_parse_of() to where it needs to be when
> they are unified.
> 
> The function is moved verbatim and there is no change in behavior.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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

If you use v4l2_async_nf_add_fwnode_remote() here, you can omit
fwnode_graph_get_remote_endpoint() call above. Also the error handling
becomes more simple.

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
> -- 
> 2.49.0
> 

-- 
Sakari Ailus

