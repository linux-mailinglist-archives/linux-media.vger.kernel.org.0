Return-Path: <linux-media+bounces-1695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CEE8062B3
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 00:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF97D1F216F2
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 23:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB2D405E6;
	Tue,  5 Dec 2023 23:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9JcWRAp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99B510C7
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 15:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701817553; x=1733353553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yR7NUyBqt7Ke7G0uAE/dZbZmtcrJeYch1Dyxhk5tFrg=;
  b=L9JcWRApS9InzZrLa83ej5XHJrU2JoAFOQXsQFbaQ+35cr5VKhGKukWZ
   r9NNQmAxDij5JAErjwPUTxyJ3IYAV2eMYtO9Ku6JfD6/oP37qG/Cv6AVH
   NblEbw7czh/khMIzpWUSn1pBS6FdVkuEABcV9I7/Q864ndmN4jNpshXE3
   hgi6Bn4YpvuUy++UtSk07ZkTu/yFvys5eHQlRBRkfEZ8OfA+HOOZW81vz
   7VuD5jXXHhwz8ICa3aKJ0CTp3OZfQDYQZuxk23neEqbIxCFXQi0YABW/v
   xvml7wiLLv4XuZ2AbcRNryE9u4Rxg7crfM48pv6g0oWRnM05/qlwJKRJj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396765698"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="396765698"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720880285"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="720880285"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:05:50 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E082C1203A0;
	Wed,  6 Dec 2023 01:05:46 +0200 (EET)
Date: Tue, 5 Dec 2023 23:05:46 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/1] media: v4l: Make sub-device state information
 available to non-MC users
Message-ID: <ZW-syug6iYJNQ7Ue@kekkonen.localdomain>
References: <20231205130001.875327-1-sakari.ailus@linux.intel.com>
 <20231205131054.GA29506@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205131054.GA29506@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Dec 05, 2023 at 03:10:54PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Dec 05, 2023 at 03:00:01PM +0200, Sakari Ailus wrote:
> > The sub-device state information access function were only available if
> > CONFIG_MEDIA_CONTROLLER was defined whereas the functions themselves were
> > used by non-MC-enabled drivers, too. Fix this by moving the definitions
> > out of CONFIG_MEDIA_CONTROLLER dependent parts. Also make the MC dependent
> > features conditional to CONFIG_MEDIA_CONTROLLER.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202312051913.e5iif8Qz-lkp@intel.com/
> > Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Thanks to Laurent for review.
> > 
> > since v1:
> > 
> > - I thought the c file had already this fixed. Also fixed that now and
> >   changed the commit message accordingly.
> > 
> >  drivers/media/v4l2-core/v4l2-subdev.c | 216 ++++++++++++++------------
> >  include/media/v4l2-subdev.h           | 158 +++++++++----------
> >  2 files changed, 193 insertions(+), 181 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 4fbefe4cd714..30746a7df259 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1533,108 +1533,6 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
> >  
> > -struct v4l2_mbus_framefmt *
> > -__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > -			       unsigned int pad, u32 stream)
> > -{
> > -	struct v4l2_subdev_stream_configs *stream_configs;
> > -	unsigned int i;
> > -
> > -	if (WARN_ON_ONCE(!state))
> > -		return NULL;
> > -
> > -	if (state->pads) {
> > -		if (stream)
> > -			return NULL;
> > -
> > -		if (pad >= state->sd->entity.num_pads)
> > -			return NULL;
> > -
> > -		return &state->pads[pad].format;
> > -	}
> > -
> > -	lockdep_assert_held(state->lock);
> > -
> > -	stream_configs = &state->stream_configs;
> > -
> > -	for (i = 0; i < stream_configs->num_configs; ++i) {
> > -		if (stream_configs->configs[i].pad == pad &&
> > -		    stream_configs->configs[i].stream == stream)
> > -			return &stream_configs->configs[i].fmt;
> > -	}
> > -
> > -	return NULL;
> > -}
> > -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
> > -
> > -struct v4l2_rect *
> > -__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > -			     u32 stream)
> > -{
> > -	struct v4l2_subdev_stream_configs *stream_configs;
> > -	unsigned int i;
> > -
> > -	if (WARN_ON_ONCE(!state))
> > -		return NULL;
> > -
> > -	if (state->pads) {
> > -		if (stream)
> > -			return NULL;
> > -
> > -		if (pad >= state->sd->entity.num_pads)
> > -			return NULL;
> > -
> > -		return &state->pads[pad].crop;
> > -	}
> > -
> > -	lockdep_assert_held(state->lock);
> > -
> > -	stream_configs = &state->stream_configs;
> > -
> > -	for (i = 0; i < stream_configs->num_configs; ++i) {
> > -		if (stream_configs->configs[i].pad == pad &&
> > -		    stream_configs->configs[i].stream == stream)
> > -			return &stream_configs->configs[i].crop;
> > -	}
> > -
> > -	return NULL;
> > -}
> > -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
> > -
> > -struct v4l2_rect *
> > -__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> > -				unsigned int pad, u32 stream)
> > -{
> > -	struct v4l2_subdev_stream_configs *stream_configs;
> > -	unsigned int i;
> > -
> > -	if (WARN_ON_ONCE(!state))
> > -		return NULL;
> > -
> > -	if (state->pads) {
> > -		if (stream)
> > -			return NULL;
> > -
> > -		if (pad >= state->sd->entity.num_pads)
> > -			return NULL;
> > -
> > -		return &state->pads[pad].compose;
> > -	}
> > -
> > -	lockdep_assert_held(state->lock);
> > -
> > -	stream_configs = &state->stream_configs;
> > -
> > -	for (i = 0; i < stream_configs->num_configs; ++i) {
> > -		if (stream_configs->configs[i].pad == pad &&
> > -		    stream_configs->configs[i].stream == stream)
> > -			return &stream_configs->configs[i].compose;
> > -	}
> > -
> > -	return NULL;
> > -}
> > -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
> > -
> >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  
> >  static int
> > @@ -2272,6 +2170,120 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
> >  
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> >  
> > +struct v4l2_mbus_framefmt *
> > +__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > +			       unsigned int pad, u32 stream)
> > +{
> > +	struct v4l2_subdev_stream_configs *stream_configs;
> > +	unsigned int i;
> > +
> > +	if (WARN_ON_ONCE(!state))
> > +		return NULL;
> > +
> > +	if (state->pads) {
> > +		if (stream)
> > +			return NULL;
> > +
> > +		if (pad >= state->sd->entity.num_pads)
> 
> This won't work, v4l2_subdev has no entity field when
> CONFIG_MEDIA_CONTROLLER is not defined. Please compile-test further
> versions of this patch.
> 
> Now, for an attempt to review v3 before you post it: dropping the
> 
> #if defined(CONFIG_MEDIA_CONTROLLER)
> 
> around the entity field of v4l2_subdev won't work either, as the
> saa6752hs driver doesn't initialize the entity, so num_fields will be at
> best memset to 0, at worst random. This check will then always fail.

I'll prepare v3, as discussed, to address the issues in the drivers
instead. I expect to post patches for that later this week.

-- 
Regards,

Sakari Ailus

