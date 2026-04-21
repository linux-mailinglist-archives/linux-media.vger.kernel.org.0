Return-Path: <linux-media+bounces-59219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Lf+MsZv52ke8AEAu9opvQ
	(envelope-from <linux-media+bounces-59219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 14:38:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948843AB8C
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 14:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C29E301E00A
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A9333122A;
	Tue, 21 Apr 2026 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4wm+6U5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CFF38D
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776775052; cv=none; b=bR6HWs1q14L+gkqDmsmvAJa+IcKcKvamrbzC8vlHbC2/V0wDmty+6p4suTlEZa0waX02uxXPufsDKlduGts2uRrinBBqTIu+Cv03y8+u0lQHSBGFpxmxl0AzwAP8sg+uFN2nNVHAG9QndtYcVOpFpNTUj5bdsbgAwXNnWKuv4vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776775052; c=relaxed/simple;
	bh=Ik8xJB3MNQTmRyd6NpoFBhr6PG9BNNvvcEqduTCMoJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtXPaKiHpEoJ+GgMe8wV3B67ds9CMs5wxjZigB6sEZgmc/idnPTW7nMkLWnjctePeuJ98ywP7mlroeAcR7KMOus+FVUNRJ7nUDzM+Iw5swnk9ux4WObmoXfCrL9QkdiX4BAP9fK4ALp/oABV9ugKnMFmhVOwmhdN0XRI1a0tCNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4wm+6U5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776775048; x=1808311048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ik8xJB3MNQTmRyd6NpoFBhr6PG9BNNvvcEqduTCMoJE=;
  b=h4wm+6U5swgrJvBSPBdDq3v7CSr0U1hBxlrQOwvciDyr14PWHuQ/DLtk
   wsSeQc8lKmexOIOSuoKQwRTUd/VbBzQ3Ni2t9rWNc3pMNCndwgfXEU2aT
   wbOKuvpM3cYlbEAxEbpiMEnOfbO6gtWhLExHMbXIIUSm90nIO/W+cQ/RH
   bwK3OHQdcIRH/oDGyh0fsS87hz2c1mOlnDum+Tl92xO36biYZ/kWWabnJ
   QrkjjQYG7DInkmiP89ThhnTNHjbtx1qFHaVIwsN9L1n4sEo+NT2ivQf18
   pXhXdG6KzAnZRYhhsZGIi5EJwXybaxW+2JpUdOZiEJRxpYPrIlKYAh5kX
   w==;
X-CSE-ConnectionGUID: mB+ZGrAiRjWKAEqyUw6zwg==
X-CSE-MsgGUID: 8QajVG9WSzu58/ZzI6rpFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95263769"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="95263769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 05:37:27 -0700
X-CSE-ConnectionGUID: UyrG+0cFTFyHTARPwcXFcQ==
X-CSE-MsgGUID: DH6lKUNoSLe5tzA1SPgRJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="236037338"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.56])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 05:37:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A600D120D05;
	Tue, 21 Apr 2026 15:37:18 +0300 (EEST)
Date: Tue, 21 Apr 2026 15:37:18 +0300
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
Subject: Re: [PATCH v4 18/29] media: mc: Simplify link processing in
 __media_pipeline_start()
Message-ID: <aedvfm39Hu6bJh_x@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-19-sakari.ailus@linux.intel.com>
 <20260416143524.GM1775831@killaraus.ideasonboard.com>
 <aedQUDOJtN72k7Pi@kekkonen.localdomain>
 <20260421111825.GB2315844@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421111825.GB2315844@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59219-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 1948843AB8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Tue, Apr 21, 2026 at 02:18:25PM +0300, Laurent Pinchart wrote:
> On Tue, Apr 21, 2026 at 01:24:16PM +0300, Sakari Ailus wrote:
> > On Thu, Apr 16, 2026 at 05:35:24PM +0300, Laurent Pinchart wrote:
> > > On Wed, Apr 08, 2026 at 06:39:27PM +0300, Sakari Ailus wrote:
> > > > There are two conditions checking the ENABLED link flag in the loop
> > > > going through the links related to an entity. Drop the other one and
> > > > simplify the remaining code.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> > > > ---
> > > >  drivers/media/mc/mc-entity.c | 11 +++++------
> > > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > > index 3fa0bc687851..6bf4730b89d2 100644
> > > > --- a/drivers/media/mc/mc-entity.c
> > > > +++ b/drivers/media/mc/mc-entity.c
> > > > @@ -838,17 +838,16 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> > > >  			if (link->sink != pad && link->source != pad)
> > > >  				continue;
> > > >  
> > > > -			/* Record if the pad has links and enabled links. */
> > > > -			if (link->flags & MEDIA_LNK_FL_ENABLED)
> > > > -				has_enabled_link = true;
> > > > -
> > > >  			/*
> > > > -			 * Validate the link if it's enabled and has the
> > > > -			 * current pad as its sink.
> > > > +			 * Ensure the link is enabled and if so, record
> > > > +			 * it. Proceed to the next link if the current pad isn't
> > > > +			 * the sink pad of the link.
> > > 
> > > You can reflow this;
> > > 
> > > 			 * Ensure the link is enabled and if so, record it.
> > > 			 * Proceed to the next link if the current pad isn't the
> > > 			 * sink pad of the link.
> > > 
> > > but I find the new comment confusing.
> > > 
> > > I would keep the code as-is, I think it's more readable, and the
> > > compiler will deal with optimization.
> > 
> > There's only one flag to test and I can't see how it'd be more readable to
> > do that twice in the same location. I can keep the comment as-is if you
> > prefer that.
> 
> The flag is tested twice for two different purposes, with two separate
> comments. A subsequent patch in the series further modifies this code,

I believe the code wouldn't have looked like this if it wasn't written over
several iterations. In other words, it was in a need of a cleanup this
patch does. :-)

I.e. first see if a link isn't enabled and if so, bail out. Otherwise the
rest will proceed from there, the link being enabled being a condition for
that, including marking that there was an enabled link.

> and makes things less readable as it inserts code in the middle while
> still keeping a single comment to explain the multiple operations. I'm

If you look at the resulting media_pipeline_validate_one(), the flow is
entirely reasonable and would not benefit from testing the enabled flag
twice. I can add better comments on why what is being done is done.

> sure we could expand the comment to explain things in more details (and
> bikeshed how to do so), but I think it will still be less readable than
> keeping those two steps separate with one comment each.
> 
> > > >  			 */
> > > >  			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> > > >  				continue;
> > > >  
> > > > +			has_enabled_link = true;
> > > > +
> > > >  			if (link->sink != pad)
> > > >  				continue;
> > > >  
> 

-- 
Regards,

Sakari Ailus

