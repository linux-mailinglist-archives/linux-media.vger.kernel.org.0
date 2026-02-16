Return-Path: <linux-media+bounces-52934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E/BOLWIk2kI6QEAu9opvQ
	(envelope-from <linux-media+bounces-52934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 22:14:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2D147ACA
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 22:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D2313031EB8
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 21:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149D5331A41;
	Mon, 16 Feb 2026 21:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F32CNMqM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D112F6573
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771276463; cv=none; b=DxlS/ILPAiboAjkrrVxK5inNcc+FcwLpXdP6ouOnd2a8A315tmDorAtsGHjYvQF1qpGYCtUL9xkY2x/SYELZvrjWG3Go3S60jWgFKGAz62mfAI7YqEy/w4B1dFzqP0AatgJW9szaYbRtbxBQku5bmQesiDi+35XBUcA3pF9Fe1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771276463; c=relaxed/simple;
	bh=rFATaXovnCANT9zP8vL748dkGECcw/GX0kSikqtLKI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6ZSEdmFfFU1AZeCLn62JYAsXlo51ufW0pWaaNNPiW2bmFTG/mWNl/j5On12dG3NjrdlchiNgSRreq9JKEaAHo1dMdEVu4WQzVW0Y0fO+/zIgjEJCVupYwR3pg7Rx6NOW9mVCBGH0+uuoocJldqeekrgo2neadyv2+4vBcGg8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F32CNMqM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771276461; x=1802812461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rFATaXovnCANT9zP8vL748dkGECcw/GX0kSikqtLKI4=;
  b=F32CNMqMLhUzBp4pT140Ec6IbPv3z+MFw8QaCQwUgLhZpOejtBwz1uVt
   01Q4CCdU0g4WMb2YtrWjqUXcMxW21BScqzrlyWznAIql4JS37mdCeAEgQ
   7nF7UUcH5i2JkIDN84rQi9CruO/4AVKRFn2L7w2NP0NjfdMyQUspisSRB
   plpPDFPyfb0i9bfe3cW096PJBADxwUbVb1/o+3Cm1KDA5o/2ft2ADqgN+
   c7dLt7wIPidyK60zZB5xsVyVh4eeoN1r63C0QzSqnAz9210v3svgLHsuT
   W9vRawZbRqm1xFrxNp+7/yF/ZAE/qlfdxQfLrm0eQ58eEnqzXiODh9C7o
   Q==;
X-CSE-ConnectionGUID: E83X9EhGStmfdtD3utqjeQ==
X-CSE-MsgGUID: HM2+YnwLRESNupZDn+eHTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72450167"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72450167"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 13:14:20 -0800
X-CSE-ConnectionGUID: K+GKMKTuQ9GbzHC3kNp8Og==
X-CSE-MsgGUID: UoB95YQnRxGT9W/lrYXbrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212004129"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 13:14:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 443D6121D2E;
	Mon, 16 Feb 2026 23:14:36 +0200 (EET)
Date: Mon, 16 Feb 2026 23:14:36 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 07/14] media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
Message-ID: <aZOIvJE08ZdfBqdP@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-8-sakari.ailus@linux.intel.com>
 <c0a52d14-7b62-40ef-ba59-ee715d635274@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0a52d14-7b62-40ef-ba59-ee715d635274@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52934-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 16F2D147ACA
X-Rspamd-Action: no action

Hi Mirela,

On Mon, Feb 16, 2026 at 03:19:26PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > Add MEDIA_LNK_FL_VALIDATE_LATE flag to support late validation of links.
> > This is serving the use case where video devices are configured and
> > started streaming indepenently of each other but this sequence may be run
> > in series, in such a way that a video device in a pipeline starts
> > streaming before another one is configured.
> > 
> > Before this flag, drivers have resorted to implementing the link
> > validation separately for the video nodes as part of streaming start
> > sequence.
> > 
> > media_pipeline_start() shall be called on each leaf entity connected to
> > the graph with a link where MEDIA_LNK_FL_VALIDATE_LATE is set before
> > uphardware operation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../media/mediactl/media-ioc-setup-link.rst   |  4 ++
> >   .../media/mediactl/media-types.rst            |  5 ++
> >   drivers/media/mc/mc-entity.c                  | 58 ++++++++++++++++++-
> >   include/uapi/linux/media.h                    |  1 +
> >   4 files changed, 66 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> > index 23208300cb61..7a9a43c71cde 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> > @@ -49,6 +49,10 @@ Only links marked with the ``DYNAMIC`` link flag can be enabled/disabled
> >   while streaming media data. Attempting to enable or disable a streaming
> >   non-dynamic link will return an ``EBUSY`` error code.
> > 
> > +The ``VALIDATE_LATE`` flag is used to signal that the validation of the link may
> > +be delayed until actual hardware operation even if the rest of the pipeline
> > +would be validated at an earlier point of time.
> > +
> >   If the specified link can't be found the driver returns with an ``EINVAL``
> >   error code.
> > 
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 6332e8395263..d6a690655a01 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -391,6 +391,7 @@ must be set for every pad.
> >   .. _MEDIA-LNK-FL-ENABLED:
> >   .. _MEDIA-LNK-FL-IMMUTABLE:
> >   .. _MEDIA-LNK-FL-DYNAMIC:
> > +.. _MEDIA-LNK-FL-VALIDATE-LATE:
> >   .. _MEDIA-LNK-FL-LINK-TYPE:
> > 
> >   .. flat-table:: Media link flags
> > @@ -410,6 +411,10 @@ must be set for every pad.
> >          -  The link enabled state can be modified during streaming. This flag
> >            is set by drivers and is read-only for applications.
> > 
> > +    *  -  ``MEDIA_LNK_FL_VALIDATE_LATE``
> > +       -  The validation of the link may be delayed up to until the start of
> > +         hardware operation.
> > +
> >       *  -  ``MEDIA_LNK_FL_LINK_TYPE``
> >          -  This is a bitmask that defines the type of the link. The following
> >            link types are currently supported:
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index ef959e9bb313..b29b519237d6 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -772,7 +772,7 @@ static int
> >   __media_pipeline_validate_one(struct media_pad *origin,
> >                                struct media_pipeline *pipe,
> >                                struct media_pad *pad, struct media_link *link,
> > -                             bool *has_enabled_link)
> > +                             bool *has_enabled_link, bool skip_validation)
> >   {
> >          struct media_device *mdev = origin->graph_obj.mdev;
> >          struct media_entity *entity = pad->entity;
> > @@ -782,6 +782,9 @@ __media_pipeline_validate_one(struct media_pad *origin,
> >          if (link->flags & MEDIA_LNK_FL_ENABLED && has_enabled_link)
> >                  *has_enabled_link = true;
> > 
> > +       if (skip_validation)
> > +               return 0;
> > +
> >          /*
> >           * Validate the link if it's enabled and has the
> >           * current pad as its sink.
> > @@ -833,7 +836,24 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> >           * valid, so just increase the start count.
> The above comment is no longer accurate.

I'll see how to reword this for v3.

> >           */
> >          if (pipe->start_count) {
> > +               struct media_link *link;
> > +
> > +               link = __media_entity_next_link(origin->entity, NULL,
> > +                                               MEDIA_LNK_FL_DATA_LINK);
> This __media_entity_next_link() will retrieve the first data link. Is this
> guaranteed to be connected to origin pad? Is this intended, or is a check
> for (link->source == origin || link->sink == origin) also necessary?

I'd say so, when it comes to video nodes, but theoretically the flag could
be set on other entities as well, albeit probably erroneously. I think we
could add a check there's exacly one pad in the entity and that pad has a
single link.

> > +               if (link && link->flags & MEDIA_LNK_FL_VALIDATE_LATE) {
> > +                       dev_dbg(mdev->dev,
> > +                               "Validating pad '%s':%u late\n",
> > +                               origin->entity->name, origin->index);
> > +
> > +                       ret = __media_pipeline_validate_one(link->sink, pipe,
> > +                                                           link->sink, link,
> > +                                                           NULL, false);
> > +                       if (ret)
> > +                               return ret;
> > +               }
> > +
> >                  pipe->start_count++;
> > +
> >                  return 0;
> >          }
> > 
> > @@ -881,9 +901,16 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> >                          if (link->sink != pad && link->source != pad)
> >                                  continue;
> > 
> > +                       /* Skip late-validated links not connected to origin. */
> > +                       bool skip_validation =
> 
> Move skip_validation declaration at beginning of the block.

I'd think it's fine to declare it here, too, but I can move it a few lines
up as well.

> 
> Regards,
> 
> Mirela
> 
> > +                               link->flags & MEDIA_LNK_FL_VALIDATE_LATE &&
> > +                               (link->sink == origin ||
> > +                                link->source == origin);
> > +
> >                          ret = __media_pipeline_validate_one(origin, pipe,
> >                                                              origin, link,
> > -                                                           &has_enabled_link);
> > +                                                           &has_enabled_link,
> > +                                                           skip_validation);
> >                          if (ret)
> >                                  goto error;
> >                  }

-- 
Regards,

Sakari Ailus

