Return-Path: <linux-media+bounces-2888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A566681BE35
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 19:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48F3FB25AD2
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 18:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA0964A8E;
	Thu, 21 Dec 2023 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpUZZztS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3278D5990A
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703183265; x=1734719265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M8e327gRjXrSZlhUElIsBz7WE6L/P52dig2pxwK9zFk=;
  b=PpUZZztSYKeVKO2L0EEHWS4w3eHo5O6VT+C16BF7GGr0eeM+g8fx8EiX
   V8QCCMhEgIXf84+b4B32VsFIcrV2HlvFLTDVbFuPU04Ef7l7Mn/0xKC4/
   bWat7TNQBij7S4aZy8BvIl0h1ZJUafiCuijsa7jjer6J1WzarJyZJ/7ll
   E7+TjF1UYEOJ1SCsZxwsMqodIvqUNbbEvcEC0uymdBdxhp/Q/jvD/mZp2
   zN0xlcvQmsmO1mPV/mfrG7zt2xFbLQ/Nb2KMYa5bOCs+U0LWZpIjGuppb
   rh+zy7WZamg3VeycW11+2h302vN3LO2Mx3mi7MOAoUev0MgmVqe16BuJA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="395745092"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="395745092"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 10:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="11212408"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 10:27:43 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 27EC211FAAC;
	Thu, 21 Dec 2023 20:27:40 +0200 (EET)
Date: Thu, 21 Dec 2023 18:27:40 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/3] media: v4l2-mc: Add debug prints for
 v4l2_fwnode_create_links_for_pad()
Message-ID: <ZYSDnKkRsmmXrx9o@kekkonen.localdomain>
References: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
 <20231221135822.152448-3-sakari.ailus@linux.intel.com>
 <20231221164534.GD13598@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221164534.GD13598@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Thu, Dec 21, 2023 at 06:45:34PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Dec 21, 2023 at 03:58:21PM +0200, Sakari Ailus wrote:
> > Add relevant debug prints for v4l2_fwnode_create_links_for_pad(). This
> > should help debugging when things go wrong.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
> > ---
> >  drivers/media/v4l2-core/v4l2-mc.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> > index 52d349e72b8c..b1a6246580ec 100644
> > --- a/drivers/media/v4l2-core/v4l2-mc.c
> > +++ b/drivers/media/v4l2-core/v4l2-mc.c
> > @@ -337,12 +337,18 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
> >  		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
> >  						      endpoint,
> >  						      MEDIA_PAD_FL_SOURCE);
> > -		if (src_idx < 0)
> > +		if (src_idx < 0) {
> > +			dev_dbg(src_sd->dev, "no pad found for %pfw\n",
> > +				endpoint);
> >  			continue;
> > +		}
> >  
> >  		remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
> > -		if (!remote_ep)
> > +		if (!remote_ep) {
> > +			dev_dbg(src_sd->dev, "no remote ep found for %pfw\n",
> > +				endpoint);
> >  			continue;
> > +		}
> >  
> >  		/*
> >  		 * ask the sink to verify it owns the remote endpoint,
> > @@ -353,8 +359,12 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
> >  						       MEDIA_PAD_FL_SINK);
> >  		fwnode_handle_put(remote_ep);
> >  
> > -		if (sink_idx < 0 || sink_idx != sink->index)
> > +		if (sink_idx < 0 || sink_idx != sink->index) {
> > +			dev_dbg(src_sd->dev,
> > +				"sink pad index mismatch or error (was %d, expected %u)\n",
> 
> s/was/is/
> 
> > +				sink_idx, sink->index);
> >  			continue;
> > +		}
> >  
> >  		/*
> >  		 * the source endpoint corresponds to one of its source pads,
> > @@ -367,8 +377,11 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
> >  		src = &src_sd->entity.pads[src_idx];
> >  
> >  		/* skip if link already exists */
> > -		if (media_entity_find_link(src, sink))
> > +		if (media_entity_find_link(src, sink)) {
> > +			dev_dbg(src_sd->dev, "link from %pfw to %pfw exists\n",
> > +				endpoint, remote_ep);
> 
> Should this be printed using the entity names and pad numbers instead,
> as done below ?

I'll address these in v2.

> 
> >  			continue;
> > +		}
> >  
> >  		dev_dbg(src_sd->dev, "creating link %s:%d -> %s:%d\n",
> >  			src_sd->entity.name, src_idx,

-- 
Regards,

Sakari Ailus

