Return-Path: <linux-media+bounces-59248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGxhHcP252kVDgIAu9opvQ
	(envelope-from <linux-media+bounces-59248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:14:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C284400BB
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1959230418E3
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE8F3A4F30;
	Tue, 21 Apr 2026 22:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IdS2tv+M"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7999282F04
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 22:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809457; cv=none; b=Jv/fiV5bgWXKruQQKPylznUtrmdqAgZHL8QrnlNNqm6B0jDRb0YE7vOFrg6FFyl/mXQ4O03SwM6HBkR99pKjCTCrA+qwOnzrbamBbcTjMk68E4w+XK+HRoQc6hI7TqzbqLEej0pdUyaFFxW6QEtIc6gz80i9irPxNkGj2acaPTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809457; c=relaxed/simple;
	bh=JWMJXqewKPeDmMMLxZ2I8vlPtue9V1N9FjGlklokhHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wovge2MKftTTQSsPYbAAl6Y5L7fa9SdcftPjl0VJNv/CGhkrucdZ+1d0rt97kC5XhdRdPc98qDVO6LQJiyy4EN0mdqbHGNMOyCyvUe7mRm2tOoZe1B9ixQejKA+Obg7XS8jAXbLR7QFK7R8DkeX1i6m3palbnzTRDgah+DNrSvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IdS2tv+M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE6962D7;
	Wed, 22 Apr 2026 00:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776809349;
	bh=JWMJXqewKPeDmMMLxZ2I8vlPtue9V1N9FjGlklokhHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdS2tv+MnxJnKE/hq9C9wtJx4Oi8KqP8edbL/3f1GUpE3NGGnIgYYTQKravL+ZHzs
	 0v5Uo3ZwjuA2GTCU6ZD6X8KtDg+Wo4oVTQuQnTHjL2pNYTOiUpXh18uLvk66qViiKq
	 r87ykVRCewRSyb9k87ubhjHumw2q61RYWOXsWaH0=
Date: Wed, 22 Apr 2026 01:10:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
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
Message-ID: <20260421221045.GE2315844@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-19-sakari.ailus@linux.intel.com>
 <20260416143524.GM1775831@killaraus.ideasonboard.com>
 <aedQUDOJtN72k7Pi@kekkonen.localdomain>
 <20260421111825.GB2315844@killaraus.ideasonboard.com>
 <aedvfm39Hu6bJh_x@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aedvfm39Hu6bJh_x@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59248-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,collabora.com:email,intel.com:email]
X-Rspamd-Queue-Id: 18C284400BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 03:37:18PM +0300, Sakari Ailus wrote:
> On Tue, Apr 21, 2026 at 02:18:25PM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 21, 2026 at 01:24:16PM +0300, Sakari Ailus wrote:
> > > On Thu, Apr 16, 2026 at 05:35:24PM +0300, Laurent Pinchart wrote:
> > > > On Wed, Apr 08, 2026 at 06:39:27PM +0300, Sakari Ailus wrote:
> > > > > There are two conditions checking the ENABLED link flag in the loop
> > > > > going through the links related to an entity. Drop the other one and
> > > > > simplify the remaining code.
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> > > > > ---
> > > > >  drivers/media/mc/mc-entity.c | 11 +++++------
> > > > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > > > index 3fa0bc687851..6bf4730b89d2 100644
> > > > > --- a/drivers/media/mc/mc-entity.c
> > > > > +++ b/drivers/media/mc/mc-entity.c
> > > > > @@ -838,17 +838,16 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> > > > >  			if (link->sink != pad && link->source != pad)
> > > > >  				continue;
> > > > >  
> > > > > -			/* Record if the pad has links and enabled links. */
> > > > > -			if (link->flags & MEDIA_LNK_FL_ENABLED)
> > > > > -				has_enabled_link = true;
> > > > > -
> > > > >  			/*
> > > > > -			 * Validate the link if it's enabled and has the
> > > > > -			 * current pad as its sink.
> > > > > +			 * Ensure the link is enabled and if so, record
> > > > > +			 * it. Proceed to the next link if the current pad isn't
> > > > > +			 * the sink pad of the link.
> > > > 
> > > > You can reflow this;
> > > > 
> > > > 			 * Ensure the link is enabled and if so, record it.
> > > > 			 * Proceed to the next link if the current pad isn't the
> > > > 			 * sink pad of the link.
> > > > 
> > > > but I find the new comment confusing.
> > > > 
> > > > I would keep the code as-is, I think it's more readable, and the
> > > > compiler will deal with optimization.
> > > 
> > > There's only one flag to test and I can't see how it'd be more readable to
> > > do that twice in the same location. I can keep the comment as-is if you
> > > prefer that.
> > 
> > The flag is tested twice for two different purposes, with two separate
> > comments. A subsequent patch in the series further modifies this code,
> 
> I believe the code wouldn't have looked like this if it wasn't written over
> several iterations. In other words, it was in a need of a cleanup this
> patch does. :-)
> 
> I.e. first see if a link isn't enabled and if so, bail out. Otherwise the
> rest will proceed from there, the link being enabled being a condition for
> that, including marking that there was an enabled link.

First the code records if it has found an enabled link for the pad, and
then it skips validating links that don't need to be validated, that is
links that are disabled or links the originate from the current pad (as
links are validated in the context of their sink, not their source).

Those are two separate and unrelated operations (recording if there are
enabled links, and skipping links that don't need to be validated), and
each of them has its own comment block. This patch moves the first
operation in the middle of the second (between the link->flags and the
link->sink checks), which makes things harder to read, and harder to
document.

> > and makes things less readable as it inserts code in the middle while
> > still keeping a single comment to explain the multiple operations. I'm
> 
> If you look at the resulting media_pipeline_validate_one(), the flow is
> entirely reasonable and would not benefit from testing the enabled flag
> twice. I can add better comments on why what is being done is done.

I looked at the function found the comment very confusing compared to
the current code. I tried to write a better one and wasn't happy with
the result. That's why I realized this patch should be dropped.

You can try writing a better comment, but I want things to be absolutely
crystal clear. That won't be easy with this modification of the code
flow.

As the current code is more readable, and the proposed change does not
improve anything, I strongly think the best option is to drop this
patch.

> > sure we could expand the comment to explain things in more details (and
> > bikeshed how to do so), but I think it will still be less readable than
> > keeping those two steps separate with one comment each.
> > 
> > > > >  			 */
> > > > >  			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> > > > >  				continue;
> > > > >  
> > > > > +			has_enabled_link = true;
> > > > > +
> > > > >  			if (link->sink != pad)
> > > > >  				continue;
> > > > >  

-- 
Regards,

Laurent Pinchart

