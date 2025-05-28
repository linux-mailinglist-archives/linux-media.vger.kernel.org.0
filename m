Return-Path: <linux-media+bounces-33514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE127AC66EE
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 12:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 977D31BA2EAC
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 10:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B184027874A;
	Wed, 28 May 2025 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKHDQo4n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4A3398A;
	Wed, 28 May 2025 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428042; cv=none; b=GLY1rVnX9TWsraCHKXHPcEWy6WD6FufQwwp2tLtyiKomjmGSpxhntz9p0cPtcSk/FVqSjgB8jn5ym9HZKGDRQRJgw7yHejabOxnUidM0Q6qJJOG1fUh6onBmF73WJ8zYBP5BE+U6OMdc4pd9DeEJauihcF0vYWeZKp7pbPcaMb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428042; c=relaxed/simple;
	bh=qXX3RBy7FaLfsbPVhYF8K2BxUXDasKCG7xQakUwEPIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eM27oLyu9mwKPMS5LbimrMARUS6YzUN9suuovKS63mff0jhNGDMm8T4kKCUuPji8AsSzVRXwprWTzYOQhXGd/R+W3yUyNDlRDGU94PZIe4OfuVsak54I74lTQsgBOJCBvZdLXBhGdxJv7Kb07UOq1IkljsbjD7kBnik1+xkqBz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKHDQo4n; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748428041; x=1779964041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qXX3RBy7FaLfsbPVhYF8K2BxUXDasKCG7xQakUwEPIs=;
  b=YKHDQo4nT+PQD+pIGOTll6+9ZwtBPRzPi6gIh9RTrwPDwYeTMC/i4dd2
   4YlTKsscnkSuH8IcoA3o5ebBsbxIDQ0AQNQ9+0HE74+hAIjIpYBRUUQCa
   cgjK1EUqmKbku15VhivTd6blUob3kI0BX+TNk1l0ABuLiDo/1oK9g97bl
   /6/h1E+2wNFs0/gWDK2QLwrMqp5lUTU4BtH1YtYN6gCTvGQTkFXN63FbP
   O1y4Dx//8AaLMAJDt8vi4AetwVBoyHTWyL6Vrj+Kl53Mge+dGCh9dpg1n
   tei2VOYBFFrJ4UWb3U5f7Auhj9ZKXZHwH4Gcj6kO79fGAKtdJphV8vKL4
   w==;
X-CSE-ConnectionGUID: Y/z+Y1d+Tw2UsoFT3QaFLA==
X-CSE-MsgGUID: KldjUmjZRqOUfECy6ZdfaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="53073284"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="53073284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:27:18 -0700
X-CSE-ConnectionGUID: M7BN0y+pTPCQS0eGzp5CHw==
X-CSE-MsgGUID: Wu9/qOBSS9C+sbGibUPusA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="144179791"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.50])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:27:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AED5D11F741;
	Wed, 28 May 2025 13:27:12 +0300 (EEST)
Date: Wed, 28 May 2025 10:27:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: rcar-vin: Prepare for unifying all
 v4l-async notifiers
Message-ID: <aDblAEnmaunbaZeg@kekkonen.localdomain>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>
 <aDVjW_k_keyFQbPT@kekkonen.localdomain>
 <20250527110647.GG12492@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527110647.GG12492@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, May 27, 2025 at 01:06:47PM +0200, Laurent Pinchart wrote:
> On Tue, May 27, 2025 at 07:01:47AM +0000, Sakari Ailus wrote:
> > On Wed, May 21, 2025 at 03:20:35PM +0200, Niklas Söderlund wrote:
> > > The R-Car VIN driver is needless complex and uses more then one
> > 
> > s/needless\K/ly/
> > 
> > > v4l-async notifier to attach to all its subdevices. Prepare for unifying
> > > them by moving rvin_parallel_parse_of() to where it needs to be when
> > > they are unified.
> > > 
> > > The function is moved verbatim and there is no change in behavior.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  .../platform/renesas/rcar-vin/rcar-core.c     | 106 +++++++++---------
> > >  1 file changed, 53 insertions(+), 53 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > > index d9ad56fb2aa9..60ec57d73a12 100644
> > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > > @@ -337,6 +337,59 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
> > >  	}
> > >  }
> > >  
> > > +static int rvin_parallel_parse_of(struct rvin_dev *vin)
> > > +{
> > > +	struct fwnode_handle *ep, *fwnode;
> > > +	struct v4l2_fwnode_endpoint vep = {
> > > +		.bus_type = V4L2_MBUS_UNKNOWN,
> > > +	};
> > > +	struct v4l2_async_connection *asc;
> > > +	int ret;
> > > +
> > > +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
> > > +	if (!ep)
> > > +		return 0;
> > > +
> > > +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > > +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > > +	fwnode_handle_put(ep);
> > > +	if (ret) {
> > > +		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> 
> I just noticed that this error message isn't correct. The endpoint
> before parsed is ep, not fwnode, so you should write
> 
> 		vin_err(vin, "Failed to parse %pOF\n", to_of_node(ep));
> 
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +
> > > +	switch (vep.bus_type) {
> > > +	case V4L2_MBUS_PARALLEL:
> > > +	case V4L2_MBUS_BT656:
> > > +		vin_dbg(vin, "Found %s media bus\n",
> > > +			vep.bus_type == V4L2_MBUS_PARALLEL ?
> > > +			"PARALLEL" : "BT656");
> > > +		vin->parallel.mbus_type = vep.bus_type;
> > > +		vin->parallel.bus = vep.bus.parallel;
> > > +		break;
> > > +	default:
> > > +		vin_err(vin, "Unknown media bus type\n");
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +
> > > +	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> > > +				       struct v4l2_async_connection);
> > 
> > If you use v4l2_async_nf_add_fwnode_remote() here, you can omit
> > fwnode_graph_get_remote_endpoint() call above. Also the error handling
> > becomes more simple.
> 
> That would contradict the commit message that indicates the function is
> moved without being modified. I'd rather keep the patch as-is, and then
> improve the function in a separate patch.

Sounds like a good idea.

> 
> Regarding improvements, declaring ep and fwnode as
> 
> 	struct fwnode_handle __free(fwnode_handle) *ep = NULL;
> 	struct fwnode_handle __free(fwnode_handle) *fwnode = NULL;
> 
> would also simplify error handling.
> 
> > > +	if (IS_ERR(asc)) {
> > > +		ret = PTR_ERR(asc);
> > > +		goto out;
> > > +	}
> > > +
> > > +	vin->parallel.asc = asc;
> > > +
> > > +	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> > > +out:
> > > +	fwnode_handle_put(fwnode);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
> > >  				    unsigned int max_id)
> > >  {
> > > @@ -635,59 +688,6 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
> > >  	.complete = rvin_parallel_notify_complete,
> > >  };
> > >  
> > > -static int rvin_parallel_parse_of(struct rvin_dev *vin)
> > > -{
> > > -	struct fwnode_handle *ep, *fwnode;
> > > -	struct v4l2_fwnode_endpoint vep = {
> > > -		.bus_type = V4L2_MBUS_UNKNOWN,
> > > -	};
> > > -	struct v4l2_async_connection *asc;
> > > -	int ret;
> > > -
> > > -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
> > > -	if (!ep)
> > > -		return 0;
> > > -
> > > -	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > > -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > > -	fwnode_handle_put(ep);
> > > -	if (ret) {
> > > -		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> > > -		ret = -EINVAL;
> > > -		goto out;
> > > -	}
> > > -
> > > -	switch (vep.bus_type) {
> > > -	case V4L2_MBUS_PARALLEL:
> > > -	case V4L2_MBUS_BT656:
> > > -		vin_dbg(vin, "Found %s media bus\n",
> > > -			vep.bus_type == V4L2_MBUS_PARALLEL ?
> > > -			"PARALLEL" : "BT656");
> > > -		vin->parallel.mbus_type = vep.bus_type;
> > > -		vin->parallel.bus = vep.bus.parallel;
> > > -		break;
> > > -	default:
> > > -		vin_err(vin, "Unknown media bus type\n");
> > > -		ret = -EINVAL;
> > > -		goto out;
> > > -	}
> > > -
> > > -	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> > > -				       struct v4l2_async_connection);
> > > -	if (IS_ERR(asc)) {
> > > -		ret = PTR_ERR(asc);
> > > -		goto out;
> > > -	}
> > > -
> > > -	vin->parallel.asc = asc;
> > > -
> > > -	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> > > -out:
> > > -	fwnode_handle_put(fwnode);
> > > -
> > > -	return ret;
> > > -}
> > > -
> > >  static void rvin_parallel_cleanup(struct rvin_dev *vin)
> > >  {
> > >  	v4l2_async_nf_unregister(&vin->notifier);

-- 
Regards,

Sakari Ailus

