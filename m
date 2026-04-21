Return-Path: <linux-media+bounces-59223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAOhG7yO52ni9wEAu9opvQ
	(envelope-from <linux-media+bounces-59223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 16:50:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BFC43C517
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 16:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FBDE3013857
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 14:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE1C3D8122;
	Tue, 21 Apr 2026 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vx/OP7A0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7EB3AA187
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783023; cv=none; b=DQSklurONOfUCdvCx/P4CAW6A576nXGE6x2g/plF8cOyeH7H/JoFTNcUZtIAuP7GzUV3kR6PvRnCKBqBTs7Mb61xMRACWnUdAF+wEdyiP7UQNUrFl+0nzxUkkQFTQDDCvx6HmiUd9fq2d8ukqePaxP4hG8C+Dcp2S03VTU16nPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783023; c=relaxed/simple;
	bh=zHMtVEWmzfWt+ESiyYk4KoVxAXrCbkggHd7FiejTja0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piWBbtyN9DWe6d04Eb5BOiJjj3lEbJ7ddK1QCVb3qV3BtbS2QfcvwhPHclhOfL4kaRR3WvULTFmUi9rcfQH3R+hwBVKZutJUX4xw99ZAHm8P4malmOq8PfxxHAJM7eQwuVqtmu49ya34P4TPHyGXgckfCqTzwGYRbGfh7Tx1qPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vx/OP7A0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776783023; x=1808319023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zHMtVEWmzfWt+ESiyYk4KoVxAXrCbkggHd7FiejTja0=;
  b=Vx/OP7A0d5yYkjKEjfLVUSr3WaBOEK9hE7aVO5gB6sYGn+FC/1xH5xvC
   ANjIp2fhGjgbBqWa4e86ZTtTW/cIRPJY/2YrolQcLxAb8Ud2fApACG2Bd
   za1nV4T23sTJIQu6cwQGzi+gUmAlfRyuNKilXptQn4rfhmGHLGKUsMu60
   Bfh7L2fXX1iAPOh9FiDy/mWeXnzpYyWZsODVPir8Xi1U9cEgXS21oZxd7
   qmfGDAbqu5W2v+ueLy+PZRc4kS13aRTFKzfQ02x66BRrvdX+pNnhYEATH
   Vq6qd+Ps8mNXPGtBwkv8zohKMYzNz+Ybh2bomUUQapuRoIRKhd5bY7Acx
   Q==;
X-CSE-ConnectionGUID: X9L7JVIpRCyjn5a9n5lA2g==
X-CSE-MsgGUID: V0cNWc1eQBOIC7ld7grejQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89186906"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="89186906"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 07:50:22 -0700
X-CSE-ConnectionGUID: q/zfwE7sSiu7mbZqejH0dQ==
X-CSE-MsgGUID: nVc11YrcTbq7nYEMPPcLFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="262445456"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 07:50:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6C0C3120D05;
	Tue, 21 Apr 2026 17:50:13 +0300 (EEST)
Date: Tue, 21 Apr 2026 17:50:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 16/29] media: v4l2-subdev: Refactor returning routes
Message-ID: <aeeOpavj90yVuZfB@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-17-sakari.ailus@linux.intel.com>
 <20260416162415.GE1823068@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416162415.GE1823068@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59223-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[30];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D8BFC43C517
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Thu, Apr 16, 2026 at 07:24:15PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Apr 08, 2026 at 06:39:25PM +0300, Sakari Ailus wrote:
> > Refactor returning the routes by adding a new function that essentially
> > does a memcopy and sets the number of the routes in the routing table.
> 
> I'd write "factor out" instead of "refactor", here and in the subject
> line. Then you can add
> 
> This avoids code duplication.
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 34 +++++++++++++--------------
> >  1 file changed, 16 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 831c69c958b8..f8fde395a53a 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -629,6 +629,19 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> >  			     v4l2_subdev_get_unlocked_active_state(sd);
> >  }
> >  
> > +static void copy_routes_state_to_routing(struct v4l2_subdev_routing *routing,
> > +					 const struct v4l2_subdev_state *state)
> 
> v4l2_subdev_ prefix.

I'll call it v4l2_subdev_copy_routes().

> 
> > +{
> > +	struct v4l2_subdev_route *routes =
> > +		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> > +	u32 copy_routes = min(routing->len_routes, state->routing.num_routes);
> > +
> > +	for (u32 i = 0; i < copy_routes; i++)
> > +		routes[i] = state->routing.routes[i];
> 
> Any reason you use a loop instead of memcpy() ? If so, please document
> it in the commit message.

I'll switch to memcpy().

> 
> With all that addressed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you.

-- 
Kind regards,

Sakari Ailus

