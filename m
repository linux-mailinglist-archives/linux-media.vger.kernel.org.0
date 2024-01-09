Return-Path: <linux-media+bounces-3396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A76C68285F1
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5534328739B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0A1381B6;
	Tue,  9 Jan 2024 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctxSyZiJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9628374FE
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704802741; x=1736338741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yTvwH0BdFdVyKFmHswekxqrVrBrZpe1eTuBbL+dXTPI=;
  b=ctxSyZiJ/tLr2rq7uETqoDKW6PElLRbZn5tHcMBp1MBki0tt7IM7BG6D
   ME4Ygfvd7F6JNArgb8M/0ckz4xqumSMiZHDosGoGKh5o0vYGVDmWdnhYz
   uVoKokNyIYFr41HHJ6HZgdLRCAp1PpUa8yHHFAzzqKxLYaleig2tWkR8J
   OnzWDEMHw+jLo2Js63uH7S7OaVlJyKnkCiBaRmco1z84Iib7VhTg/l1su
   eI4fmwBOcPd1O5N1fcYAHXODxFhoTAgk3/Iy67wGNz84mFPmJBzZ3Zuax
   mEWx6p/9KdG6OsFoVt0drT4P79p129vIif9ToRe6IfxIzWUygtobIH5kd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="429367406"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="429367406"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113068668"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="1113068668"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:18:59 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E12E911F913;
	Tue,  9 Jan 2024 14:18:56 +0200 (EET)
Date: Tue, 9 Jan 2024 12:18:56 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 2/3] media: v4l2-mc: Add debug prints for
 v4l2_fwnode_create_links_for_pad()
Message-ID: <ZZ05sLwJnWhckT5i@kekkonen.localdomain>
References: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
 <20240105083757.197846-3-sakari.ailus@linux.intel.com>
 <20240109120950.GB11622@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109120950.GB11622@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Jan 09, 2024 at 02:09:50PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Jan 05, 2024 at 10:37:56AM +0200, Sakari Ailus wrote:
> > Add relevant debug prints for v4l2_fwnode_create_links_for_pad(). This
> > should help debugging when things go wrong.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> > ---
> >  drivers/media/v4l2-core/v4l2-mc.c | 23 +++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> > index 52d349e72b8c..e394f3e505d8 100644
> > --- a/drivers/media/v4l2-core/v4l2-mc.c
> > +++ b/drivers/media/v4l2-core/v4l2-mc.c
> > @@ -337,12 +337,18 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
> >  		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
> >  						      endpoint,
> >  						      MEDIA_PAD_FL_SOURCE);
> > -		if (src_idx < 0)
> > +		if (src_idx < 0) {
> > +			dev_dbg(src_sd->dev, "no pad found for %pfw\n",
> 
> Make is "no source pad found", as we're looking for source pads only and
> the message would be confusing if the entity has sink pads.

I'll add this.

> 
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
> > +				"sink pad index mismatch or error (is %d, expected %u)\n",
> > +				sink_idx, sink->index);
> >  			continue;
> > +		}
> >  
> >  		/*
> >  		 * the source endpoint corresponds to one of its source pads,
> > @@ -367,8 +377,13 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
> >  		src = &src_sd->entity.pads[src_idx];
> >  
> >  		/* skip if link already exists */
> > -		if (media_entity_find_link(src, sink))
> > +		if (media_entity_find_link(src, sink)) {
> > +			dev_dbg(src_sd->dev,
> > +				"link %s:%d -> %s:%d already exists\n",
> > +				src_sd->entity.name, src_idx,
> 
> Is this worth a debug message ? If the link already exists, do you
> expect this to cause any kind of issue that someone will want to debug ?
> 
> Overall, are the new debug messages in this patch helped debugging a
> real life problem ?

They would have helped debugging development time versions of the previous
patch. :-)

Multiple people have also had issues debugging drivers depending on
matching sub-devices and creating links between them due to the complexity
of the firmware interface and the in-kernel framework. Telling what is
taking happening here is one way to address that.

If a link already exists, something is probably wrong. I didn't want to
make this an error in this patch as I didn't want to introduce a functional
change here. I think it could be made later on.

> 
> > +				sink->entity->name, sink_idx);
> >  			continue;
> > +		}
> >  
> >  		dev_dbg(src_sd->dev, "creating link %s:%d -> %s:%d\n",
> >  			src_sd->entity.name, src_idx,
> 

-- 
Regards,

Sakari Ailus

