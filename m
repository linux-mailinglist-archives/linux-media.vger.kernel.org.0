Return-Path: <linux-media+bounces-9078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CBD8A09A5
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 09:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4E391F25094
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 07:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1279613E05F;
	Thu, 11 Apr 2024 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2coNwqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4813DDC3
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820312; cv=none; b=KU9G8PL7E03gXJNoZlle+ghG+uQlc9+WevVC+tTsEsbM0npmOp47m4BYVvsZWOV1eDYZGm140zgKlcxCO3J4r4BTNoTGh6qAfaK3tmZZinRIievLg8LXDYuc8PS3MVr5FXSj2Shkw9AycrOi3wamtjNdH07fv75hdFtL2xXsuZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820312; c=relaxed/simple;
	bh=OyQ+6ej43obcv58+ySx0ELIIBN8lx8NtupLNMj2AF9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucrWzChJsvYPMkIKZPA6d/pGdGs+rMyJyxnuVZdIVrGqXvlsSzlC7mH99ojSkK4Kl13z1uq5aWuWokY4JVaunhOIA2/Qm8xkWHTH6GsHBJwx/Zy7QK8cGQD7MmhlpSM8SVbycaOkSJyot2YSiQHWHfuPoNYNqLV+WnOByVoP+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2coNwqK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712820310; x=1744356310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OyQ+6ej43obcv58+ySx0ELIIBN8lx8NtupLNMj2AF9o=;
  b=Q2coNwqK3/O2Cqh5hRjVvITygLPas3SR+R6Mr3ec91SgIWijaFeMwsh8
   ch7DTA/ThMtRPrdaZP8eFMr+dFxLT2sJjPvp1eBevxc10bhvan+vqHnm8
   Dvc1U0hourw7rHLmbV4gsdBNbR6WBOlSeWVcZ+5yfmPR7xg8+hyaYg5p5
   GVEFyzOFFG5F5++jSfc3JCC9xKv0s4fonxzN+NRe9n5WemgjFHp8cwall
   uFDTMbMHikWWvj9Bjp2g2wL9FF4ohTi3JRWLbRwhIfww2vOBxH6MmsXQj
   4UPXcmKqHjc/UmYzQ4vSdOsMPJwOOd0+DvEbUpojntJMyLcJgT1tvnx3I
   g==;
X-CSE-ConnectionGUID: p8cZDVs2QlOx1UT2t5tTrA==
X-CSE-MsgGUID: 7WEEYUm7Rdq4Oq4QEC4o/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11994715"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="11994715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:25:09 -0700
X-CSE-ConnectionGUID: HT/kMXVCQbuyLjJGPGqkfA==
X-CSE-MsgGUID: lAIvYfH5TxuuYu6duqOQEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20872875"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:25:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6C21712035C;
	Thu, 11 Apr 2024 10:25:04 +0300 (EEST)
Date: Thu, 11 Apr 2024 07:25:04 +0000
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
Message-ID: <ZheQUH0XKgle4te2@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-2-sakari.ailus@linux.intel.com>
 <86a51397-d0a9-4875-a3e8-fb4526b340f4@ideasonboard.com>
 <20240319221707.GD8501@pendragon.ideasonboard.com>
 <ZfqVB3dagHQXcoRx@kekkonen.localdomain>
 <20240321172032.GM9582@pendragon.ideasonboard.com>
 <ZgU8rsKcSGNPS7Dx@kekkonen.localdomain>
 <20240328152526.GE16097@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328152526.GE16097@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Mar 28, 2024 at 05:25:26PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Mar 28, 2024 at 09:47:26AM +0000, Sakari Ailus wrote:
> > On Thu, Mar 21, 2024 at 07:20:32PM +0200, Laurent Pinchart wrote:
> > > On Wed, Mar 20, 2024 at 07:49:27AM +0000, Sakari Ailus wrote:
> > > > On Wed, Mar 20, 2024 at 12:17:07AM +0200, Laurent Pinchart wrote:
> > > > > On Thu, Mar 14, 2024 at 09:17:08AM +0200, Tomi Valkeinen wrote:
> > > > > > On 13/03/2024 09:24, Sakari Ailus wrote:
> > > > > > > Internal source pads will be used as routing endpoints in V4L2
> > > > > > > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > > > > > > Internal source pads are pads that have both SINK and INTERNAL flags set.
> > > > > > > 
> > > > > > > Also prevent creating links to pads that have been flagged as internal and
> > > > > > > initialising SOURCE pads with INTERNAL flag set.
> > > > > > > 
> > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > ---
> > > > > > >   .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
> > > > > > >   drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> > > > > > >   include/uapi/linux/media.h                             |  1 +
> > > > > > >   3 files changed, 17 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > > > > index 6332e8395263..f55ef055bcf8 100644
> > > > > > > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > > > > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > > > > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > > > > > >   .. _MEDIA-PAD-FL-SINK:
> > > > > > >   .. _MEDIA-PAD-FL-SOURCE:
> > > > > > >   .. _MEDIA-PAD-FL-MUST-CONNECT:
> > > > > > > +.. _MEDIA-PAD-FL-INTERNAL:
> > > > > > >   
> > > > > > >   .. flat-table:: Media pad flags
> > > > > > >       :header-rows:  0
> > > > > > > @@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
> > > > > > >   	  enabled links even when this flag isn't set; the absence of the flag
> > > > > > >   	  doesn't imply there is none.
> > > > > > >   
> > > > > > > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > > > > > > +       -  The internal flag indicates an internal pad that has no external
> > > > > > > +	  connections. Such a pad shall not be connected with a link.
> > > > > 
> > > > > I would expand this slightly, as it's the only source of documentation
> > > > > regarding internal pads.
> > > > 
> > > > Patch 9 adds more documentation, this patch is for MC only.
> > > 
> > > That's my point, it's the only source of documentation for internal
> > > pads from an MC point of view, so expanding the documentation would be
> > > good :-)
> > 
> > This is MC documentation, camera sensors aren't relevant in this context.
> 
> They are only relevant in the same that they are one of the many
> possible users of the MC API.

Cameras are mentioned in MC documentation only in generic sense, outside
the context of V4L2. The patch is currently in line with existing practices
with it comes to MC documentation.

If some V4L2 documentation would be added under MC documentation, it should
be discussed (and implemented if so decided) separately from this patch.

There is more documentation later in the series, also relating to internal
pads.

> 
> > > > > 
> > > > >        -  The internal flag indicates an internal pad that has no external
> > > > > 	  connections. This can be used to model, for instance, the pixel array
> > > > > 	  internal to an image sensor. As they are internal to entities,
> > > > > 	  internal pads shall not be connected with links.
> > > > 
> > > > I'd drop the sentence related to sensors.
> > > 
> > > I'm fine with another example, or a more generic explanation, but with
> > > that sentence dropped, I think this will leave the reader wondering what
> > > an internal pad is and what it's used for.
> > 
> > What we could and probably have here is that the internal sink pad
> > indicates a source of data. That's what it really is, whether that data is
> > image data or something else.
> > 
> > So I'd change this to:
> > 
> > The internal flag indicates an internal pad that has no external
> > connections. Such a pad shall not be connected with a link. The internal
> > pad flag is allowed only in conjunction with the sink pad flag. Together
> > the two flags indicate the pad is a source of data inside the entity.
> 
> I think that's still difficult to understand. What's the issue with
> mentioning a particular example to make the concept easier to understand
> ?
> 
> > > > > > > +
> > > > > > > +	  The internal flag may currently be present only in a source pad where
> > > > > > 
> > > > > > s/source/sink/
> > > > > > 
> > > > > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > > > > +	  it indicates that the :ref:``stream <media-glossary-stream>``
> > > > > > > +	  originates from within the entity.
> > > > > > >   
> > > > > > >   One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > > > > > >   must be set for every pad.
> > > > > > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > > > > > index 0e28b9a7936e..1973e9e1013e 100644
> > > > > > > --- a/drivers/media/mc/mc-entity.c
> > > > > > > +++ b/drivers/media/mc/mc-entity.c
> > > > > > > @@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > > > > > >   		iter->index = i++;
> > > > > > >   
> > > > > > >   		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > > > > > > -					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > > > > > > +					     MEDIA_PAD_FL_SOURCE)) != 1 ||
> > > > > > > +		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
> > > > > > > +		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
> > > > > > >   			ret = -EINVAL;
> > > > > > >   			break;
> > > > > > >   		}
> > > > > 
> > > > > This may become more readable written as a switch statement:
> > > > > 
> > > > > 		const u32 pad_flags_mask = MEDIA_PAD_FL_SINK |
> > > > > 					   MEDIA_PAD_FL_SOURCE |
> > > > > 					   MEDIA_PAD_FL_INTERNAL;
> > > > > 
> > > > > 		switch (iter->flags & pad_flags_mask) {
> > > > > 		case MEDIA_PAD_FL_SINK:
> > > > > 		case MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL:
> > > > > 		case MEDIA_PAD_FL_SOURCE:
> > > > > 			break;
> > > > > 
> > > > > 		default:
> > > > > 			ret = -EINVAL;
> > > > > 			break;
> > > > > 		}
> > > > > 
> > > > > 		if (ret)
> > > > > 			break;
> > > > > 
> > > > > And now that I've written this, I'm not too sure anymore :-) Another
> > > > > option would be
> > > > > 
> > > > > 
> > > > > 	const u32 pad_flags = iter->flags & (MEDIA_PAD_FL_SINK |
> > > > > 					     MEDIA_PAD_FL_SOURCE |
> > > > > 					     MEDIA_PAD_FL_INTERNAL);
> > > > > 
> > > > > 	if (pad_flags != MEDIA_PAD_FL_SINK &&
> > > > > 	    pad_flags != MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL
> > > > > 	    pad_flags != MEDIA_PAD_FL_SOURCE) {
> > > > > 		ret = -EINVAL;
> > > > > 		break;
> > > > > 	}
> > > > > 
> > > > > Up to you.
> > > > 
> > > > I'd prefer to keep it as-is since the original check is testing two
> > > > independent things instead of merging them: that only either SINK or SOURCE
> > > > is set, and then separately that if INTERNAL is set, then SINK is set, too.
> > > > 
> > > > Of the two options you suggested, I prefer the latter.
> > > 
> > > I prefer the latter too, and I think it's more readable than the current
> > > code. If we later end up having to test for more rules, we can separate
> > > the checks.
> > 
> > I can switch to the latter.
> > 
> > > > > 
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > 
> > > > Thank you!
> > > > 
> > > > > > > @@ -1112,7 +1114,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> > > > > > >   
> > > > > > >   	for (i = 0; i < entity->num_pads; i++) {
> > > > > > >   		if ((entity->pads[i].flags &
> > > > > > > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > > > > > > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > > > > > > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> > > > > > >   			continue;
> > > > > > >   
> > > > > > >   		if (entity->pads[i].sig_type == sig_type)
> > > > > > > @@ -1142,6 +1145,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> > > > > > >   		return -EINVAL;
> > > > > > >   	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> > > > > > >   		return -EINVAL;
> > > > > > > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> > > > > > > +	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > > > > > > +		return -EINVAL;
> > > > > > >   
> > > > > > >   	link = media_add_link(&source->links);
> > > > > > >   	if (link == NULL)
> > > > > > > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > > > > > > index 1c80b1d6bbaf..80cfd12a43fc 100644
> > > > > > > --- a/include/uapi/linux/media.h
> > > > > > > +++ b/include/uapi/linux/media.h
> > > > > > > @@ -208,6 +208,7 @@ struct media_entity_desc {
> > > > > > >   #define MEDIA_PAD_FL_SINK			(1U << 0)
> > > > > > >   #define MEDIA_PAD_FL_SOURCE			(1U << 1)
> > > > > > >   #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> > > > > > > +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> > > > > > >   
> > > > > > >   struct media_pad_desc {
> > > > > > >   	__u32 entity;		/* entity ID */
> 

-- 
Regards,

Sakari Ailus

