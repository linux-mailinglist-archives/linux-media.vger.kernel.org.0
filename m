Return-Path: <linux-media+bounces-7334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BE88072F
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 23:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C1D71C21EFF
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 22:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B49C5F87D;
	Tue, 19 Mar 2024 22:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mYWkVYip"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77357880
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710886636; cv=none; b=kiIFQLEo8c2ZUKfVjGh3JbiUd3tADrO75Jyu1ehC9BBYY9C2R9XBMWBhv80zV0HAHaSzRh+S0lSPa9ILiRTBekpdeE5wac6S5r959j7S5FTixO4tIXQWdXMZBw0j6HpZlLCf9G0Ch0+1uBhhzabPamJo4/7pi3X/TcsdqzlQBL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710886636; c=relaxed/simple;
	bh=2h7h6giOSaMnjXjzEsCzZoq88T0mC5pG09Ld47jFA9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWx9DE4J0Efc+pqzI5Tr1DBy3u9OY+7FjLbrfTYlht8pgC9ha7AtZEFD2PTPvRq2bBWUt9e8TqFa1m23WmihSjsCqD2uDMLNkrpjOcFOVBEO+0x6hiNI/EGJnfYfUazfayS8NbMgN4bikbBpObjUQWwsqi0bDJDk0eLw+qHX640=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mYWkVYip; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 729DA480;
	Tue, 19 Mar 2024 23:16:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710886603;
	bh=2h7h6giOSaMnjXjzEsCzZoq88T0mC5pG09Ld47jFA9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYWkVYiplKwH6f3n3nU82IcFjBwahODHdeYVgyFkWS/H4z6I8IhgaJpvKHTO3Sh4t
	 LHHoHAipMTKxjNYCfLxyX60KRoAGDpfJHL4Oxuoh699FF5jlV+k0jgL+KbzgGn8vPl
	 Xr0X8A8nDdPEOsR84g9wF9voe2Sd5cc1bysdLjZQ=
Date: Wed, 20 Mar 2024 00:17:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 01/38] media: mc: Add INTERNAL pad flag
Message-ID: <20240319221707.GD8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-2-sakari.ailus@linux.intel.com>
 <86a51397-d0a9-4875-a3e8-fb4526b340f4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86a51397-d0a9-4875-a3e8-fb4526b340f4@ideasonboard.com>

On Thu, Mar 14, 2024 at 09:17:08AM +0200, Tomi Valkeinen wrote:
> On 13/03/2024 09:24, Sakari Ailus wrote:
> > Internal source pads will be used as routing endpoints in V4L2
> > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > Internal source pads are pads that have both SINK and INTERNAL flags set.
> > 
> > Also prevent creating links to pads that have been flagged as internal and
> > initialising SOURCE pads with INTERNAL flag set.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
> >   drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> >   include/uapi/linux/media.h                             |  1 +
> >   3 files changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 6332e8395263..f55ef055bcf8 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> >   .. _MEDIA-PAD-FL-SINK:
> >   .. _MEDIA-PAD-FL-SOURCE:
> >   .. _MEDIA-PAD-FL-MUST-CONNECT:
> > +.. _MEDIA-PAD-FL-INTERNAL:
> >   
> >   .. flat-table:: Media pad flags
> >       :header-rows:  0
> > @@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
> >   	  enabled links even when this flag isn't set; the absence of the flag
> >   	  doesn't imply there is none.
> >   
> > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > +       -  The internal flag indicates an internal pad that has no external
> > +	  connections. Such a pad shall not be connected with a link.

I would expand this slightly, as it's the only source of documentation
regarding internal pads.

       -  The internal flag indicates an internal pad that has no external
	  connections. This can be used to model, for instance, the pixel array
	  internal to an image sensor. As they are internal to entities,
	  internal pads shall not be connected with links.

> > +
> > +	  The internal flag may currently be present only in a source pad where
> 
> s/source/sink/
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > +	  it indicates that the :ref:``stream <media-glossary-stream>``
> > +	  originates from within the entity.
> >   
> >   One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> >   must be set for every pad.
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 0e28b9a7936e..1973e9e1013e 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >   		iter->index = i++;
> >   
> >   		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > -					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > +					     MEDIA_PAD_FL_SOURCE)) != 1 ||
> > +		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
> > +		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
> >   			ret = -EINVAL;
> >   			break;
> >   		}

This may become more readable written as a switch statement:

		const u32 pad_flags_mask = MEDIA_PAD_FL_SINK |
					   MEDIA_PAD_FL_SOURCE |
					   MEDIA_PAD_FL_INTERNAL;

		switch (iter->flags & pad_flags_mask) {
		case MEDIA_PAD_FL_SINK:
		case MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL:
		case MEDIA_PAD_FL_SOURCE:
			break;

		default:
			ret = -EINVAL;
			break;
		}

		if (ret)
			break;

And now that I've written this, I'm not too sure anymore :-) Another
option would be


	const u32 pad_flags = iter->flags & (MEDIA_PAD_FL_SINK |
					     MEDIA_PAD_FL_SOURCE |
					     MEDIA_PAD_FL_INTERNAL);

	if (pad_flags != MEDIA_PAD_FL_SINK &&
	    pad_flags != MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL
	    pad_flags != MEDIA_PAD_FL_SOURCE) {
		ret = -EINVAL;
		break;
	}

Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > @@ -1112,7 +1114,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> >   
> >   	for (i = 0; i < entity->num_pads; i++) {
> >   		if ((entity->pads[i].flags &
> > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> >   			continue;
> >   
> >   		if (entity->pads[i].sig_type == sig_type)
> > @@ -1142,6 +1145,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> >   		return -EINVAL;
> >   	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> >   		return -EINVAL;
> > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> > +	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > +		return -EINVAL;
> >   
> >   	link = media_add_link(&source->links);
> >   	if (link == NULL)
> > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > index 1c80b1d6bbaf..80cfd12a43fc 100644
> > --- a/include/uapi/linux/media.h
> > +++ b/include/uapi/linux/media.h
> > @@ -208,6 +208,7 @@ struct media_entity_desc {
> >   #define MEDIA_PAD_FL_SINK			(1U << 0)
> >   #define MEDIA_PAD_FL_SOURCE			(1U << 1)
> >   #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> > +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> >   
> >   struct media_pad_desc {
> >   	__u32 entity;		/* entity ID */

-- 
Regards,

Laurent Pinchart

