Return-Path: <linux-media+bounces-52848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SExUNQ3hkmknzgEAu9opvQ
	(envelope-from <linux-media+bounces-52848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:19:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEC141E8F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AB793010157
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37E62BE026;
	Mon, 16 Feb 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/JYtRHa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3C23EA92
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233469; cv=none; b=NzA0lr+uzffFzV/APFqZZ4M5M3YJ5y3/PF+6mxvweEXKBBPxQidHtlAW66s8z6Se7Dd5kEXWtWouL+GyFJa9KiqNXYgh33X44DsayvR/Lc+wlOhW63FuwqcNaDOJDtPJomGD3up7Facwi5aRC+i2E394o2X3SXCfI97F6amrGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233469; c=relaxed/simple;
	bh=hgJp5+MRJtnM3ew+M9uD+HI7SFwGAEgof09untfMAQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIeMu0a5G9Xx2D1a385WLXkE2Ofy6R+voF4unVNN4OfQDsi8DmDvpgMt6yACa2hbismPTuE3El5+aGiyvLj7zhAnPWqDyJbrzLAuAlrzAhdFETH0aCecuiDZwhC5c2iZOnPlF5TwTEJBNVn19H1RDMmh3uVzLYZlsiYeVfTmi7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/JYtRHa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771233468; x=1802769468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hgJp5+MRJtnM3ew+M9uD+HI7SFwGAEgof09untfMAQw=;
  b=h/JYtRHaQAdXQnnUXzF1z3StilqgGr/73topkTTChoCLbLBSFo3ImzAI
   /FOi2a5i7BdwSkgzOVkxMCzYmb+JBHT2KnrtAF9kVq90pBsWmeqFzVtGW
   qiaCF4Kzetipxq+HBR49+jg40q2cJW6u7c8RYQXMqYe33e6kIQ/iH22uM
   s3cZD+R33h2IP0N3QfVWL6sUgKZjZm/wmxGFFGmVGVkk1lF52KZgvy6T0
   jrc9s8nvoo8Sa+SFBpYS/X2Gaq43oQIinoka8E7AW7QnEQPvBcB4UlJ4y
   gZYrf9jtVUJibxx+sO3i54NccYqnToG+OaJXlyTPt9U2agfbJiAy8hAJi
   Q==;
X-CSE-ConnectionGUID: LRjP7BDRRUO1XKKS8tLzgw==
X-CSE-MsgGUID: 690iCVUhQm6IkmgwQhUM/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72209062"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72209062"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:17:47 -0800
X-CSE-ConnectionGUID: Y7p20lNlTtKvYZDs6LVv/Q==
X-CSE-MsgGUID: cr9wOw3ISzmKEYF8KjjiOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="211923070"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.203])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:17:41 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E6BFE121D2E;
	Mon, 16 Feb 2026 11:18:01 +0200 (EET)
Date: Mon, 16 Feb 2026 11:18:01 +0200
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
Subject: Re: [PATCH v2 06/14] media: mc: Separate single link validation into
 a new function
Message-ID: <aZLgychGYaCk_F73@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-7-sakari.ailus@linux.intel.com>
 <08933385-5162-43ae-99fb-9aa5f6265724@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08933385-5162-43ae-99fb-9aa5f6265724@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52848-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31DEC141E8F
X-Rspamd-Action: no action

Hi Mirela,

On Sun, Feb 15, 2026 at 04:42:27PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > Add a new function __media_pipeline_validate_one() to validate a single
> > link in a pipeline. This will soon be used for performing validation in
> > multiple phases.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/mc/mc-entity.c | 80 +++++++++++++++++++++---------------
> >   1 file changed, 47 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 9519a537bfa2..ef959e9bb313 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -768,6 +768,49 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
> >          return ret;
> >   }
> > 
> > +static int
> > +__media_pipeline_validate_one(struct media_pad *origin,
> > +                             struct media_pipeline *pipe,
> pipe parameter is not used

I'll remove it for v3.

> > +                             struct media_pad *pad, struct media_link *link,
> > +                             bool *has_enabled_link)
> > +{
> > +       struct media_device *mdev = origin->graph_obj.mdev;
> > +       struct media_entity *entity = pad->entity;
> > +       int ret;
> > +
> > +       /* Record if the pad has links and enabled links. */
> > +       if (link->flags & MEDIA_LNK_FL_ENABLED && has_enabled_link)
> > +               *has_enabled_link = true;
> > +
> > +       /*
> > +        * Validate the link if it's enabled and has the
> > +        * current pad as its sink.
> > +        */
> > +       if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> > +               return 0;
> > +
> > +       if (link->sink != pad)
> > +               return 0;
> > +
> > +       if (!entity->ops || !entity->ops->link_validate)
> > +               return 0;
> > +
> > +       ret = entity->ops->link_validate(link);
> > +       if (ret) {
> > +               dev_dbg(mdev->dev,
> > +                       "Link '%s':%u -> '%s':%u failed validation: %d\n",
> > +                       link->source->entity->name, link->source->index,
> > +                       link->sink->entity->name, link->sink->index, ret);
> > +               return ret;
> > +       }
> > +
> > +       dev_dbg(mdev->dev, "Link '%s':%u -> '%s':%u is valid\n",
> > +               link->source->entity->name, link->source->index,
> > +               link->sink->entity->name, link->sink->index);
> > +
> > +       return 0;
> > +}
> > +
> >   __must_check int __media_pipeline_start(struct media_pad *origin,
> >                                          struct media_pipeline *pipe)
> >   {
> > @@ -838,40 +881,11 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> >                          if (link->sink != pad && link->source != pad)
> >                                  continue;
> > 
> > -                       /* Record if the pad has links and enabled links. */
> > -                       if (link->flags & MEDIA_LNK_FL_ENABLED)
> > -                               has_enabled_link = true;
> > -
> > -                       /*
> > -                        * Validate the link if it's enabled and has the
> > -                        * current pad as its sink.
> > -                        */
> > -                       if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> > -                               continue;
> > -
> > -                       if (link->sink != pad)
> > -                               continue;
> > -
> > -                       if (!entity->ops || !entity->ops->link_validate)
> > -                               continue;
> > -
> > -                       ret = entity->ops->link_validate(link);
> > -                       if (ret) {
> > -                               dev_dbg(mdev->dev,
> > -                                       "Link '%s':%u -> '%s':%u failed validation: %d\n",
> > -                                       link->source->entity->name,
> > -                                       link->source->index,
> > -                                       link->sink->entity->name,
> > -                                       link->sink->index, ret);
> > +                       ret = __media_pipeline_validate_one(origin, pipe,
> > +                                                           origin, link,
> > +                                                           &has_enabled_link);
> 
> Shouldn't this be __media_pipeline_validate_one(origin, pipe, pad, link,
> &has_enabled_link) ?

Yes, good find! This would have been bitten us later...

> 
> Also, before refactoring, there were 2 checks, I think the first one was
> unnecessary:
> 
>                         if (link->sink != pad && link->source != pad)
>                                 continue;
> The second one was more complete, it is the check that should remain in the
> end, either before calling the new function, or inside the function, but
> please adjust also the comments according to the actual code:
>                        if (link->sink != pad)
>                                continue;

There are two checks in order to collect information on enabled links to
the pad (first check) and perform validation on sink pads only (second
check). Both should remain.

There's additional cleanup that can be done on the conditions here; I'll
prepend a new patch for that.

-- 
Kind regards,

Sakari Ailus

