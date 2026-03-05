Return-Path: <linux-media+bounces-54673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDopDgPiqWnDGwEAu9opvQ
	(envelope-from <linux-media+bounces-54673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 21:05:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8865217F51
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 21:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBA85300AB16
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 20:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AFF2D2390;
	Thu,  5 Mar 2026 20:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e29XFJVO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3212F1C8604
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 20:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741117; cv=none; b=l+IsK1rrKJtzYG4KjxupFpq+frNP99SiUdhE4EOxWBBvY4vVIy6ArdawmnR2pNxXkpln93SrJ4YjMgkLeixgC3EC+5RLDr/bzu54UKigz/uFywNyttNDVnB1GGHws3Fq+Cn0GA9Ws003fn8fV2n805Izw0XIBsWNKr45xaeejGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741117; c=relaxed/simple;
	bh=0qEHdrMwb1twwoUelVF0G3u/hsOlWlSKjp2LroxMPRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYY7gIrZwtNuHsnZbCCzKkAWO4KfNxX4TojI+mvNiJxPfUiaGqCnlPmgWXLFv1M14dAr2wqtGsN2NvIsmyEFtXPE/dEWeTdDikLNc8qUFFN08Fbiiq0cnx62GQquOMs3LStz8Kgp3cEPVs0beNzGXoyDA3AyO9oP2hclSlFZ1SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e29XFJVO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772741116; x=1804277116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0qEHdrMwb1twwoUelVF0G3u/hsOlWlSKjp2LroxMPRU=;
  b=e29XFJVOLnTRnVMmDoTwnI75Dy+cYQM84B4jpq6vL22c7bHOflVB4FqG
   aQ0jfTWhqdZRYmOgijZvN5udh6WgIuauBEFMMVK8hR2iObFOm0kLSeSYw
   3k0T1LoiAdYXw/MKLFRRHiM1q7nhr7z0YWYFUysQs1fTFtN/0LV6GztiQ
   y+oCBcbo0z/YbPWpDySPchCTtNYtlnKHRKTmRyyoNbVdc+fRNWrlFYFTg
   avUDu/Ys6EaOW034Hij9Bl+rDESyjE6xOhBy+DXzvc4gfxHW0ow6Mwrvb
   DpkpIJRCuEvggzRvIqXm9Hoe5MDTZY2zAS6HyjXeQrtpwRSo+Sdxt5MfZ
   w==;
X-CSE-ConnectionGUID: qBXDz5trQnaS35Se3l2BkA==
X-CSE-MsgGUID: 6D62KuNvSKG+SzeHl388FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84555921"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="84555921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 12:05:15 -0800
X-CSE-ConnectionGUID: rGFhxXPkQdC6S/8aRFr2cw==
X-CSE-MsgGUID: PhK5AGfYT+ijjHoVInjb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218740003"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.148])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 12:05:14 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DF429121D1E;
	Thu, 05 Mar 2026 22:05:42 +0200 (EET)
Date: Thu, 5 Mar 2026 22:05:42 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se, antti.laakso@linux.intel.com
Subject: Re: [PATCH v2 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on
 parsing NULL endpoints
Message-ID: <aaniFlbS4bxZnwBy@kekkonen.localdomain>
References: <20260305173558.3907731-1-sakari.ailus@linux.intel.com>
 <aanaOQgQbpzSmooa@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aanaOQgQbpzSmooa@lizhi-Precision-Tower-5810>
X-Rspamd-Queue-Id: B8865217F51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54673-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

Hi Frank,

Thanks for the review.

On Thu, Mar 05, 2026 at 02:32:09PM -0500, Frank Li wrote:
> On Thu, Mar 05, 2026 at 07:35:58PM +0200, Sakari Ailus wrote:
> > In general drivers get their firmware graph endpoints from system
> > firmware, but on some systems this information is conveyed to drivers via
> > software nodes. The software nodes may be instantiated only after the
> > drivers are first probed, requiring drivers to explicitly issue
> > -EPROBE_DEFER when endpoints aren't found.
> >
> > Instead of doing this in all (or at least most) drivers, make v4l2-fwnode
> > endpoint parsing functions v4l2_fwnode_endpoint_parse() and
> > v4l2_fwnode_endpoint_alloc_parse() return -EPROBE_DEFER when an endpoint
> > is NULL.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> >
> > - Only check for NULL.
> >
> > - Fix the condition.
> >
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
> >  include/media/v4l2-fwnode.h           | 6 ++++--
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 03daa8c4ff7a..36b0495351cb 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -466,7 +466,7 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
> >  	int rval;
> >
> >  	if (!fwnode)
> > -		return -EINVAL;
> > +		return -EPROBE_DEFER;
> >
> >  	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
> >
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index cd82e70ccbaa..44c985a12286 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -218,8 +218,9 @@ enum v4l2_fwnode_bus_type {
> >   *
> >   * Return: %0 on success or a negative error code on failure:
> >   *	   %-ENOMEM on memory allocation failure
> > - *	   %-EINVAL on parsing failure, including @fwnode == NULL
> > + *	   %-EINVAL on parsing failure
> >   *	   %-ENXIO on mismatching bus types
> > + *	   %-EPROBE_DEFER on NULL or error @fwnode
> 
> code only check fwnode is NULL.

Ah, yes. I'll fix this, too, for v3.

> 
> Frank
> 
> >   */
> >  int v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
> >  			       struct v4l2_fwnode_endpoint *vep);
> > @@ -276,8 +277,9 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
> >   *
> >   * Return: %0 on success or a negative error code on failure:
> >   *	   %-ENOMEM on memory allocation failure
> > - *	   %-EINVAL on parsing failure, including @fwnode == NULL
> > + *	   %-EINVAL on parsing failure
> >   *	   %-ENXIO on mismatching bus types
> > + *	   %-EPROBE_DEFER on NULL or error @fwnode
> >   */
> >  int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
> >  				     struct v4l2_fwnode_endpoint *vep);

-- 
Kind regards,

Sakari Ailus

