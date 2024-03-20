Return-Path: <linux-media+bounces-7387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7344880C5F
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 08:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CC861F217D0
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 07:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2DF24B33;
	Wed, 20 Mar 2024 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoLsBL9t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D7136AE7
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710920976; cv=none; b=dwGxzAXnhcGFxy/2Kn951a1YIQD8ZAh1xO0DhTWwcclf83CDCE3YD6ScOx3Y1k4W6sYRGXlR4c7WRkgkofU7hkrxyy989lwn5Jyvc5Jk0iwSIOEA/2KejTLDyQRplM3/1WYP25LJI0EBIxayQfgcMLwCbF3Oz+g+xGhOg6A6JI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710920976; c=relaxed/simple;
	bh=v7XnBOoTZjRQsMXaAc3qgvfHmSnS+uVZQ4//fuOgWMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtHsJFjjD3X3LFBrKvUwqAXlukfA034UiD6Hf6lY0U3hDeAaiDNCEZ26JHj/whVsAmeculsAQ4k0nzvn63Vw+yLQRxIcHCe7sydbu+++fO/wr9IWVsHy4OApriLyBwESRbwyJSs5HUsuAOYOGIQwaV6K5PORyQ8964clbhewsDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoLsBL9t; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710920974; x=1742456974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v7XnBOoTZjRQsMXaAc3qgvfHmSnS+uVZQ4//fuOgWMQ=;
  b=MoLsBL9tTT0OkEsIf9LcWytMFZO9+0Fb26uWS8GXW69APVq8IRamX86m
   cPjlL3+WAIwRg40cs+DZc2O6Z4b4seuL+Pvh1cVHIszSfxprcHkl3jCAX
   eF80l54YDz5O+syNexO5wSbZf13krofbRmir8udITyo4yAkZoyFWBC7QM
   mWOyG6tbp+hzYN826gyFTNXW59vH24ImNmIj31XtuhT+vQHtEnNk777gu
   SqPDcKhcKDsw+Vh01olKKprN2TlOSUr3y+PQ7YgiXuSWWqt9Vy3Vm2YvM
   Qq13eXLjzvxtq6o32RJuqJdtHeEb4YiI55Y7RykXiW5fnlrC/SK4hpYoI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6037761"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="6037761"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 00:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="13976901"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 00:49:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C0A8511F853;
	Wed, 20 Mar 2024 09:49:27 +0200 (EET)
Date: Wed, 20 Mar 2024 07:49:27 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 01/38] media: mc: Add INTERNAL pad flag
Message-ID: <ZfqVB3dagHQXcoRx@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-2-sakari.ailus@linux.intel.com>
 <86a51397-d0a9-4875-a3e8-fb4526b340f4@ideasonboard.com>
 <20240319221707.GD8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319221707.GD8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 12:17:07AM +0200, Laurent Pinchart wrote:
> On Thu, Mar 14, 2024 at 09:17:08AM +0200, Tomi Valkeinen wrote:
> > On 13/03/2024 09:24, Sakari Ailus wrote:
> > > Internal source pads will be used as routing endpoints in V4L2
> > > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > > Internal source pads are pads that have both SINK and INTERNAL flags set.
> > > 
> > > Also prevent creating links to pads that have been flagged as internal and
> > > initialising SOURCE pads with INTERNAL flag set.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >   .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
> > >   drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> > >   include/uapi/linux/media.h                             |  1 +
> > >   3 files changed, 17 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > index 6332e8395263..f55ef055bcf8 100644
> > > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > >   .. _MEDIA-PAD-FL-SINK:
> > >   .. _MEDIA-PAD-FL-SOURCE:
> > >   .. _MEDIA-PAD-FL-MUST-CONNECT:
> > > +.. _MEDIA-PAD-FL-INTERNAL:
> > >   
> > >   .. flat-table:: Media pad flags
> > >       :header-rows:  0
> > > @@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
> > >   	  enabled links even when this flag isn't set; the absence of the flag
> > >   	  doesn't imply there is none.
> > >   
> > > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > > +       -  The internal flag indicates an internal pad that has no external
> > > +	  connections. Such a pad shall not be connected with a link.
> 
> I would expand this slightly, as it's the only source of documentation
> regarding internal pads.

Patch 9 adds more documentation, this patch is for MC only.

> 
>        -  The internal flag indicates an internal pad that has no external
> 	  connections. This can be used to model, for instance, the pixel array
> 	  internal to an image sensor. As they are internal to entities,
> 	  internal pads shall not be connected with links.

I'd drop the sentence related to sensors.

> 
> > > +
> > > +	  The internal flag may currently be present only in a source pad where
> > 
> > s/source/sink/
> > 
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > +	  it indicates that the :ref:``stream <media-glossary-stream>``
> > > +	  originates from within the entity.
> > >   
> > >   One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > >   must be set for every pad.
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 0e28b9a7936e..1973e9e1013e 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > >   		iter->index = i++;
> > >   
> > >   		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > > -					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > > +					     MEDIA_PAD_FL_SOURCE)) != 1 ||
> > > +		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
> > > +		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
> > >   			ret = -EINVAL;
> > >   			break;
> > >   		}
> 
> This may become more readable written as a switch statement:
> 
> 		const u32 pad_flags_mask = MEDIA_PAD_FL_SINK |
> 					   MEDIA_PAD_FL_SOURCE |
> 					   MEDIA_PAD_FL_INTERNAL;
> 
> 		switch (iter->flags & pad_flags_mask) {
> 		case MEDIA_PAD_FL_SINK:
> 		case MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL:
> 		case MEDIA_PAD_FL_SOURCE:
> 			break;
> 
> 		default:
> 			ret = -EINVAL;
> 			break;
> 		}
> 
> 		if (ret)
> 			break;
> 
> And now that I've written this, I'm not too sure anymore :-) Another
> option would be
> 
> 
> 	const u32 pad_flags = iter->flags & (MEDIA_PAD_FL_SINK |
> 					     MEDIA_PAD_FL_SOURCE |
> 					     MEDIA_PAD_FL_INTERNAL);
> 
> 	if (pad_flags != MEDIA_PAD_FL_SINK &&
> 	    pad_flags != MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL
> 	    pad_flags != MEDIA_PAD_FL_SOURCE) {
> 		ret = -EINVAL;
> 		break;
> 	}
> 
> Up to you.

I'd prefer to keep it as-is since the original check is testing two
independent things instead of merging them: that only either SINK or SOURCE
is set, and then separately that if INTERNAL is set, then SINK is set, too.

Of the two options you suggested, I prefer the latter.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

> 
> > > @@ -1112,7 +1114,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> > >   
> > >   	for (i = 0; i < entity->num_pads; i++) {
> > >   		if ((entity->pads[i].flags &
> > > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> > >   			continue;
> > >   
> > >   		if (entity->pads[i].sig_type == sig_type)
> > > @@ -1142,6 +1145,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> > >   		return -EINVAL;
> > >   	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> > >   		return -EINVAL;
> > > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> > > +	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > > +		return -EINVAL;
> > >   
> > >   	link = media_add_link(&source->links);
> > >   	if (link == NULL)
> > > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > > index 1c80b1d6bbaf..80cfd12a43fc 100644
> > > --- a/include/uapi/linux/media.h
> > > +++ b/include/uapi/linux/media.h
> > > @@ -208,6 +208,7 @@ struct media_entity_desc {
> > >   #define MEDIA_PAD_FL_SINK			(1U << 0)
> > >   #define MEDIA_PAD_FL_SOURCE			(1U << 1)
> > >   #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> > > +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> > >   
> > >   struct media_pad_desc {
> > >   	__u32 entity;		/* entity ID */
> 

-- 
Regards,

Sakari Ailus

