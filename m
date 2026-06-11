Return-Path: <linux-media+bounces-64611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Y0pMDsDK2r61AMAu9opvQ
	(envelope-from <linux-media+bounces-64611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:49:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DD567490F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:49:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=e7GP2gsA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64611-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64611-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C20663100F09
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 18:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B675F4D90B4;
	Thu, 11 Jun 2026 18:49:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655634C956C;
	Thu, 11 Jun 2026 18:49:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203763; cv=none; b=XkWtwPeNhBmV0HbXQ86agOohwWFal9PNbPAU6k6FhaMoU+VPyq1hbndvsyz+P6RVH4We+imj3bHA9LR8inGrVKrDL6h6Xf6DBwWeSM6nyvYQVI1YCAHgR+YVwMeTyuwbbfiw1VW9qR9HVM2R5MmUinRiOnEXU6+q/Q8RuIN7z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203763; c=relaxed/simple;
	bh=QfiWlYQwVk5ub2iu59ZFRTkzKmzQdE5xDJCML8i+I90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvYzGoRYFOmqMcHa4fwVGdUHOXtA1jOmmrKjQZJVKjHc8KKOmkt3tqYHJLaOUgumK4YaP3nrxqHOAgMaI60OOom7xQcqO4EbnbG7sJoe/JPM8Uy+RSKvnDDdBJc/X+ShK4D/IXGjKkGsjwl1miEuFYNIkQOnB+75DTPMGlDyhTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7GP2gsA; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781203762; x=1812739762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QfiWlYQwVk5ub2iu59ZFRTkzKmzQdE5xDJCML8i+I90=;
  b=e7GP2gsA2Z+sij3WfPMJ8M9GkXx2zuoFkr4eZ0PmnqHYPCG7gWNMaNRe
   UzaJDUl9mrL9jdDZdyklXhKUCslaN0iQBra+jQXg1/aNjCxTAwgxeEg+A
   RX0NeCjS6KrR82w9o3z4z5d8m48UGWcWlk161rbMlyU4Egz+VtBNzoCm8
   bSW8e/uPCc1GkFOVbNuRSo2Vhl6A0orkr9T4BZ2tV3UWHIN/ZRARcW9X5
   79MiypFfXf13M2f0gmBKAXMoXFK3mGxA78DS3jtkz+3U5gZGfMGiiSo56
   lAtMOX6WkzoLp9FT7V/de4ENi4WPd+UYUsh70t4+rSi+Ed10uQGTEc5GB
   A==;
X-CSE-ConnectionGUID: SGtpVRP5SDeBZnQ1PlVaOg==
X-CSE-MsgGUID: S6r3RgJgSd+GsY0cjtJjeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85657622"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85657622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:49:20 -0700
X-CSE-ConnectionGUID: aLZh3RZZRPOyAjT16T432Q==
X-CSE-MsgGUID: jnIjwhAPRSu4C9arkp2mOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="242445486"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.13])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:49:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7177C120F33;
	Thu, 11 Jun 2026 21:49:14 +0300 (EEST)
Date: Thu, 11 Jun 2026 21:49:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx219: Report streams using frame descriptors
Message-ID: <aisDKkiSZgH3ju-v@kekkonen.localdomain>
References: <20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com>
 <aip-xwYlKT1d3N0S@kekkonen.localdomain>
 <b39bc319-8ae0-4715-8e3f-b822cdb535dc@ideasonboard.com>
 <20260611131058.GA1795343@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611131058.GA1795343@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64611-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33DD567490F

Hi Laurent,

On Thu, Jun 11, 2026 at 04:10:58PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 11, 2026 at 04:06:38PM +0300, Tomi Valkeinen wrote:
> > On 11/06/2026 12:24, Sakari Ailus wrote:
> > > On Thu, Jun 11, 2026 at 12:13:02PM +0300, Tomi Valkeinen wrote:
> > >> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>
> > >> Implement the .get_frame_desc() subdev operation to report information
> > >> about streams to the connected CSI-2 receiver. This is required to let
> > >> the CSI-2 receiver driver know about virtual channels and data types for
> > >> each stream.
> > >>
> > >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >> [tomi.valkeinen: picked from "Generic line based metadata support, internal pads" series]
> > >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > >> ---
> > >> This patch that adds .get_frame_desc() support to imx219 driver has been
> > >> circulating for a few years, and is currently posted in "[PATCH v12
> > >> 00/86] Generic line based metadata support, internal pads" series.
> > >>
> > >> However, as some bridge drivers require modern drivers that support
> > >> .get_frame_desc, specifically ds90ub960.c, let's pick the patch and
> > >> queue it separately from the huge metadata series.
> > > 
> > > I've been recently working on
> > > <URL:https://lore.kernel.org/linux-media/20260518164318.3367888-1-sakari.ailus@linux.intel.com/>.
> > > In other words, drivers that have a single stream don't need this. We could
> > 
> > Thanks, I had missed that. I like the idea of a helper that does the 
> > fallback mechanism. But I wonder about the need for dynamic alloc, which 
> > complicates the series. In any case, we can drop this series and 
> > continue the discussion on your series.
> 
> Maybe we can merge the fallback implementation separately from the
> dynamic allocation if the latter requires more work ? I'm also not a fan
> of the dynamic allocation, at least in the way it's implemented in the
> proposed series. I'm wondering if we could build the frame descriptors
> at stream enable time and store it in state structures instead.

I've changed the allocation to take place in the get_frame_desc() callback,
I'll post the next version soonish.

I think in the long run indeed this should be stored in the state. Without
this series we'll have all receiver drivers implement a fallback or
implement get_frame_desc() callback in all sub-device drivers which is
something I'd like to avoid.

-- 
Kind regards,

Sakari Ailus

