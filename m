Return-Path: <linux-media+bounces-7530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28869885F96
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13AC283ACF
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71828592D;
	Thu, 21 Mar 2024 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cwLrzB3g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F58BE7
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711041639; cv=none; b=sM1j5uFi4ZnC8c5c3kXjuvKRyKPwAnbGb9hhBL+UpuIh4jqX9LfSkMTtgEPcn5QLecLgCGBtR8d39GxfuLruteg3koGwrkzVF4zBZ3E4sRs5F5vY+xzJZXzLJQQCruz8poRrG2pebvoS8md1RIUp0B0GUKxEljRx8vdZvFswzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711041639; c=relaxed/simple;
	bh=FoLiPLs9lB+1ikhSZC2UIyAkMOIYjXvb7NSyBawBCnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDDYyhMS5J0WoaBSGi1nldzwILYshtbxl44bWVwgi7Egl8LPkWdQv3EVt1oFJUGbigSKMsHmnjFkZ7kqIoho55B17ey5iDmzMqf1JXt9ikNMexTh/bP4Tdmle77fvBfCPt29zn1GqaBv0tj2NofvwiAOe7+vZzSnvmErtgQHtuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cwLrzB3g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 652AC2B3;
	Thu, 21 Mar 2024 18:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711041607;
	bh=FoLiPLs9lB+1ikhSZC2UIyAkMOIYjXvb7NSyBawBCnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwLrzB3gCruZx8TLmDrCpLx94hz10o1z7mFWkc240IKWF3TtK2gTEOniUHYLuo2Jb
	 m5WbJSaCOB3zXBjuuaT9DryVUpwBVhhqfaF3Y7v2o0gAqkoRIVIKyGMAVvlmzc0/1N
	 pp3heu2ZrcLCYPYYzGewLl2PNJgeO8enMI7rP5cU=
Date: Thu, 21 Mar 2024 19:20:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 01/38] media: mc: Add INTERNAL pad flag
Message-ID: <20240321172032.GM9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-2-sakari.ailus@linux.intel.com>
 <86a51397-d0a9-4875-a3e8-fb4526b340f4@ideasonboard.com>
 <20240319221707.GD8501@pendragon.ideasonboard.com>
 <ZfqVB3dagHQXcoRx@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZfqVB3dagHQXcoRx@kekkonen.localdomain>

On Wed, Mar 20, 2024 at 07:49:27AM +0000, Sakari Ailus wrote:
> On Wed, Mar 20, 2024 at 12:17:07AM +0200, Laurent Pinchart wrote:
> > On Thu, Mar 14, 2024 at 09:17:08AM +0200, Tomi Valkeinen wrote:
> > > On 13/03/2024 09:24, Sakari Ailus wrote:
> > > > Internal source pads will be used as routing endpoints in V4L2
> > > > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > > > Internal source pads are pads that have both SINK and INTERNAL flags set.
> > > > 
> > > > Also prevent creating links to pads that have been flagged as internal and
> > > > initialising SOURCE pads with INTERNAL flag set.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >   .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
> > > >   drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> > > >   include/uapi/linux/media.h                             |  1 +
> > > >   3 files changed, 17 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > index 6332e8395263..f55ef055bcf8 100644
> > > > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > > >   .. _MEDIA-PAD-FL-SINK:
> > > >   .. _MEDIA-PAD-FL-SOURCE:
> > > >   .. _MEDIA-PAD-FL-MUST-CONNECT:
> > > > +.. _MEDIA-PAD-FL-INTERNAL:
> > > >   
> > > >   .. flat-table:: Media pad flags
> > > >       :header-rows:  0
> > > > @@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
> > > >   	  enabled links even when this flag isn't set; the absence of the flag
> > > >   	  doesn't imply there is none.
> > > >   
> > > > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > > > +       -  The internal flag indicates an internal pad that has no external
> > > > +	  connections. Such a pad shall not be connected with a link.
> > 
> > I would expand this slightly, as it's the only source of documentation
> > regarding internal pads.
> 
> Patch 9 adds more documentation, this patch is for MC only.

That's my point, it's the only source of documentation for internal
pads from an MC point of view, so expanding the documentation would be
good :-)

> > 
> >        -  The internal flag indicates an internal pad that has no external
> > 	  connections. This can be used to model, for instance, the pixel array
> > 	  internal to an image sensor. As they are internal to entities,
> > 	  internal pads shall not be connected with links.
> 
> I'd drop the sentence related to sensors.

I'm fine with another example, or a more generic explanation, but with
that sentence dropped, I think this will leave the reader wondering what
an internal pad is and what it's used for.

> > > > +
> > > > +	  The internal flag may currently be present only in a source pad where
> > > 
> > > s/source/sink/
> > > 
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > +	  it indicates that the :ref:``stream <media-glossary-stream>``
> > > > +	  originates from within the entity.
> > > >   
> > > >   One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > > >   must be set for every pad.
> > > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > > index 0e28b9a7936e..1973e9e1013e 100644
> > > > --- a/drivers/media/mc/mc-entity.c
> > > > +++ b/drivers/media/mc/mc-entity.c
> > > > @@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > > >   		iter->index = i++;
> > > >   
> > > >   		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > > > -					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > > > +					     MEDIA_PAD_FL_SOURCE)) != 1 ||
> > > > +		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
> > > > +		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
> > > >   			ret = -EINVAL;
> > > >   			break;
> > > >   		}
> > 
> > This may become more readable written as a switch statement:
> > 
> > 		const u32 pad_flags_mask = MEDIA_PAD_FL_SINK |
> > 					   MEDIA_PAD_FL_SOURCE |
> > 					   MEDIA_PAD_FL_INTERNAL;
> > 
> > 		switch (iter->flags & pad_flags_mask) {
> > 		case MEDIA_PAD_FL_SINK:
> > 		case MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL:
> > 		case MEDIA_PAD_FL_SOURCE:
> > 			break;
> > 
> > 		default:
> > 			ret = -EINVAL;
> > 			break;
> > 		}
> > 
> > 		if (ret)
> > 			break;
> > 
> > And now that I've written this, I'm not too sure anymore :-) Another
> > option would be
> > 
> > 
> > 	const u32 pad_flags = iter->flags & (MEDIA_PAD_FL_SINK |
> > 					     MEDIA_PAD_FL_SOURCE |
> > 					     MEDIA_PAD_FL_INTERNAL);
> > 
> > 	if (pad_flags != MEDIA_PAD_FL_SINK &&
> > 	    pad_flags != MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL
> > 	    pad_flags != MEDIA_PAD_FL_SOURCE) {
> > 		ret = -EINVAL;
> > 		break;
> > 	}
> > 
> > Up to you.
> 
> I'd prefer to keep it as-is since the original check is testing two
> independent things instead of merging them: that only either SINK or SOURCE
> is set, and then separately that if INTERNAL is set, then SINK is set, too.
> 
> Of the two options you suggested, I prefer the latter.

I prefer the latter too, and I think it's more readable than the current
code. If we later end up having to test for more rules, we can separate
the checks.

> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thank you!
> 
> > > > @@ -1112,7 +1114,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> > > >   
> > > >   	for (i = 0; i < entity->num_pads; i++) {
> > > >   		if ((entity->pads[i].flags &
> > > > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > > > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > > > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> > > >   			continue;
> > > >   
> > > >   		if (entity->pads[i].sig_type == sig_type)
> > > > @@ -1142,6 +1145,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> > > >   		return -EINVAL;
> > > >   	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> > > >   		return -EINVAL;
> > > > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> > > > +	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > > > +		return -EINVAL;
> > > >   
> > > >   	link = media_add_link(&source->links);
> > > >   	if (link == NULL)
> > > > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > > > index 1c80b1d6bbaf..80cfd12a43fc 100644
> > > > --- a/include/uapi/linux/media.h
> > > > +++ b/include/uapi/linux/media.h
> > > > @@ -208,6 +208,7 @@ struct media_entity_desc {
> > > >   #define MEDIA_PAD_FL_SINK			(1U << 0)
> > > >   #define MEDIA_PAD_FL_SOURCE			(1U << 1)
> > > >   #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> > > > +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> > > >   
> > > >   struct media_pad_desc {
> > > >   	__u32 entity;		/* entity ID */

-- 
Regards,

Laurent Pinchart

