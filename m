Return-Path: <linux-media+bounces-59207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HjrOIJQ52lW6QEAu9opvQ
	(envelope-from <linux-media+bounces-59207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:25:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C62439763
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88F873011C5B
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 10:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC2937AA82;
	Tue, 21 Apr 2026 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgVrHSXA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD052F6596
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767067; cv=none; b=aEu2wV53Fdxy6snmsBDFThzYJ4BhO6I+jLm9YcF09eloTvjKHGuIjG6QiLLlbtrrJkXIeBoGod7vPur84f3TTTCnZqbwZPPGyHYF7G8pRCjJo5ROTsSGsNTzlEYQJMz7Uq1wDY6c704Og0hu4DgdloY3qHnau5bBoglKOSG/o5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767067; c=relaxed/simple;
	bh=4QymMmx02aG9MGDshOjNEyyJOJ43ghIh2WdHxHaGE5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chU52COoLVRA3ssLPO77/lKy+HB9sjGdA/ZJH7g7bLV0YUbxqGDP0SSVClznWFiOiLB+JcgaTr6DviiskfBBYxqYhjnTKGURE/yf5YVVBnTxPbeOPbBy0ngMfR+XnZ+YZYn6xM83vhjoQOJ8O13fudu8USitXHwh9f0r6+6yvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgVrHSXA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776767065; x=1808303065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4QymMmx02aG9MGDshOjNEyyJOJ43ghIh2WdHxHaGE5s=;
  b=PgVrHSXACq9yn4ZnE1h9x7M8PyevWqqJ3CrLNguanKWqmvsCo6hLS24s
   iyZbgLq8fUWpUONEeMvaqX14bqzbsGymAmLBwbV+V+HD7GNMe9SEelp6Z
   WO/qp2cRRiN2bbQEuPnzAbKWi+1eu01WdNjQjsTcU5t+wbaQVyJDiQcLU
   qCd55Uig2F8Y7wcRgi3B1Swg8Rejrk+FcXolBLaitOs9AW0JpJAjZgz7X
   XFZyqNKglb1URcdsiXAu43aSGKBHItU+wu8kHT9y+z7GIkJyjDuQsWsqf
   iWabu5vRVTZcvakYMft2oUkXYew2E3WH8vdczyAKKPh7KSjtR4w8h3zmo
   w==;
X-CSE-ConnectionGUID: gspLfYpbSVCNC9QAMdKAHQ==
X-CSE-MsgGUID: +A8lwb8tQQOnEACNqdAvlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77570046"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77570046"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 03:24:24 -0700
X-CSE-ConnectionGUID: Rh1UYkAbRu+i5SxhonKB0Q==
X-CSE-MsgGUID: 4FydJmxeQg6qdcdMhxORDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="233769591"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.56])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 03:24:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 03A4F120D05;
	Tue, 21 Apr 2026 13:24:17 +0300 (EEST)
Date: Tue, 21 Apr 2026 13:24:16 +0300
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
Message-ID: <aedQUDOJtN72k7Pi@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-19-sakari.ailus@linux.intel.com>
 <20260416143524.GM1775831@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416143524.GM1775831@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59207-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 41C62439763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Thank you for the review.

On Thu, Apr 16, 2026 at 05:35:24PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Apr 08, 2026 at 06:39:27PM +0300, Sakari Ailus wrote:
> > There are two conditions checking the ENABLED link flag in the loop
> > going through the links related to an entity. Drop the other one and
> > simplify the remaining code.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 3fa0bc687851..6bf4730b89d2 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -838,17 +838,16 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> >  			if (link->sink != pad && link->source != pad)
> >  				continue;
> >  
> > -			/* Record if the pad has links and enabled links. */
> > -			if (link->flags & MEDIA_LNK_FL_ENABLED)
> > -				has_enabled_link = true;
> > -
> >  			/*
> > -			 * Validate the link if it's enabled and has the
> > -			 * current pad as its sink.
> > +			 * Ensure the link is enabled and if so, record
> > +			 * it. Proceed to the next link if the current pad isn't
> > +			 * the sink pad of the link.
> 
> You can reflow this;
> 
> 			 * Ensure the link is enabled and if so, record it.
> 			 * Proceed to the next link if the current pad isn't the
> 			 * sink pad of the link.
> 
> but I find the new comment confusing.
> 
> I would keep the code as-is, I think it's more readable, and the
> compiler will deal with optimization.

There's only one flag to test and I can't see how it'd be more readable to
do that twice in the same location. I can keep the comment as-is if you
prefer that.

> 
> >  			 */
> >  			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> >  				continue;
> >  
> > +			has_enabled_link = true;
> > +
> >  			if (link->sink != pad)
> >  				continue;
> >  
> 

-- 
Kind regards,

Sakari Ailus

