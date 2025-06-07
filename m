Return-Path: <linux-media+bounces-34291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFCAD0D0A
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 13:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C07261892CCB
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 11:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2485921D00A;
	Sat,  7 Jun 2025 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grC1gL+X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF02192F9;
	Sat,  7 Jun 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749294843; cv=none; b=WOodbzMT0qPJ/rvY+1nQeq+DMHVyzer5TbWA13EcmhB261pt6Be3JMJIpkWS/H8BzCuWATX9nptkDqE7L0IRbokLjy0kiwi6BA7uoxsxxti9XpwhW2g5r7Bga4PnYHcRnzNv0VLyRpjVoxH9bFmmwFc6suKJBSRdNv8GXoKjUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749294843; c=relaxed/simple;
	bh=x3x/biF46iUXyEJnCZpZBXK3ktHostPqR+V5jHD92s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kM/jMpSvKTIUrnImv/8M1xTkMrPPnG14hMz2BaN8qC15UPxoII9pZbHvOu81bqESH2r+348b3eNCDElVhbcFvrc12HSk8EdwF7IGgIDCge4jU4K+R9QJAeTWmyEme5lZ7JN7RkVteZ3ASZlStU5R2511vmjZ02vBEtH/i9hJaSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grC1gL+X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749294842; x=1780830842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x3x/biF46iUXyEJnCZpZBXK3ktHostPqR+V5jHD92s4=;
  b=grC1gL+XGxj0wd2f5QzOLEXv7l8muVlRD09+BvuS3IgiNyWoCMd+GfVi
   5ZNFiFsQEb8K1bvVW3AYQb4+oN0phIZTfTYp27aaJMaJz52LMGJJ/qPQV
   9qtAFp89xhvVXSgeWbr7k2uhkPnY/6PEAktNasFuHjbjBeQmeWXA5bfPq
   ldC7Ml8vfMBL3GL1pruMinVm7/qzAdY3iGgFNvQ8L18ezHd8fxUa55cps
   4tEI+wktNRdSQlKqEgVrGvJihwzxV2utLpwxoaZOIPNjuMMdjFVMpwjyP
   Kk1Ek1lG7c6KGxSKtwj20TU4l3fRs7QmxMJ5FovIXVK3P3QWrxX3Rm8iX
   w==;
X-CSE-ConnectionGUID: zaQd7Py4RVGYcCs9eSoblw==
X-CSE-MsgGUID: KMHWdUXrSCa7nPOYkzowyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51313652"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="51313652"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:14:01 -0700
X-CSE-ConnectionGUID: LFtvjvxdRbaYH/DkWIxBGQ==
X-CSE-MsgGUID: qvtdIVxSTmmbbtbs0/ORJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="151058717"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.176])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:13:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8370711F83C;
	Sat,  7 Jun 2025 14:13:55 +0300 (EEST)
Date: Sat, 7 Jun 2025 11:13:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: rcar-vin: Prepare for unifying all
 v4l-async notifiers
Message-ID: <aEQe89vlZ667jb0T@kekkonen.localdomain>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>
 <aDVjW_k_keyFQbPT@kekkonen.localdomain>
 <20250606135000.GA2780410@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606135000.GA2780410@ragnatech.se>

Hejssan!

On Fri, Jun 06, 2025 at 03:50:00PM +0200, Niklas Söderlund wrote:
> Hej Sakari,
> 
> Thanks for your feedback.

Var så god!

> 
> On 2025-05-27 07:01:47 +0000, Sakari Ailus wrote:
> > Hej Niklas,
> > 
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
> Indeed it would, but I do use fwnode in the debug print at the end of 
> the function. And I do find that print out use-full when debugging, so I 
> would like to keep it.

The drivers really shouldn't have a need for this. How about adding that
debug print to the V4L2 async framework instead? I think it might be useful
for other drivers as well even though the information is available via
debugfs (or sysfs?) already.

> 
> Laurent's suggestion of using __free(fwnode_handle) can instead be used 
> to make error handling easier, and since it would be needed for the ep 
> variable anyhow I think I will try that.

Sounds good to me.

> 
> > 
> > > +	if (IS_ERR(asc)) {
> > > +		ret = PTR_ERR(asc);
> > > +		goto out;
> > > +	}
> > > +
> > > +	vin->parallel.asc = asc;
> > > +
> > > +	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));

Please use %pfw instead for the fwnode (at least for the possible V4L2
async patch).

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
Med vänliga hälsningar,

Sakari Ailus

