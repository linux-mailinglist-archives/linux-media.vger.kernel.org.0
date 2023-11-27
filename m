Return-Path: <linux-media+bounces-1079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B97F9DC2
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 11:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6571C20D71
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 10:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD4F18C01;
	Mon, 27 Nov 2023 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UnvX09/7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFC310E7
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 02:38:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD04029B;
	Mon, 27 Nov 2023 11:38:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701081502;
	bh=m3shtSanIsnvaQNYYZLGGEOJXq0aO5eaOusoVvyJl6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnvX09/7DsoPVfFeHbGiCi2GaEY9JEw55CIhtTy4dh1UJek+UvxwCraUnm1JAeZYn
	 NBD6n5qmuoHCZjju/pDfTh25zSJdQSSsWK8E5bp7yo8RRP7PsnX1bxhum6GW6T1BtQ
	 fwVZWYsF8iyyo4ag46F+ZKiSaVYu67lXu1im7enE=
Date: Mon, 27 Nov 2023 12:39:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [RFC PATCH v1 3/4] media: v4l2-subdev: Store frame interval in
 subdev state
Message-ID: <20231127103902.GA12457@pendragon.ideasonboard.com>
References: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
 <20231024005130.28026-4-laurent.pinchart@ideasonboard.com>
 <ae1af16e-eb25-4c37-8d6e-16a910a4fa9a@ideasonboard.com>
 <20231024073808.GA5121@pendragon.ideasonboard.com>
 <34f89236-4be5-4228-9a2f-3a6a2ef36b59@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34f89236-4be5-4228-9a2f-3a6a2ef36b59@ideasonboard.com>

Hi Tomi,

On Tue, Oct 24, 2023 at 10:40:29AM +0300, Tomi Valkeinen wrote:
> On 24/10/2023 10:38, Laurent Pinchart wrote:
> > On Tue, Oct 24, 2023 at 10:21:18AM +0300, Tomi Valkeinen wrote:
> >> On 24/10/2023 03:51, Laurent Pinchart wrote:
> >>> Subdev states store all standard pad configuration data, except for
> >>> frame intervals. Fix it by adding interval fields in the
> >>> v4l2_subdev_pad_config and v4l2_subdev_stream_config structures, with
> >>> corresponding accessor functions and a helper function to implement the
> >>> .get_frame_interval() operation.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>    drivers/media/v4l2-core/v4l2-subdev.c | 44 +++++++++++++++++++++
> >>>    include/media/v4l2-subdev.h           | 57 +++++++++++++++++++++++++++
> >>>    2 files changed, 101 insertions(+)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> index c45d60a87701..518f2f35c68d 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> @@ -1618,6 +1618,29 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
> >>>    
> >>> +int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
> >>> +				   struct v4l2_subdev_state *state,
> >>> +				   struct v4l2_subdev_frame_interval *fi)
> >>> +{
> >>> +	struct v4l2_fract *interval;
> >>> +
> >>> +	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> >>> +		interval = v4l2_subdev_state_get_stream_interval(state, fi->pad,
> >>> +								 fi->stream);
> >>> +	else if (fi->pad < sd->entity.num_pads && fi->stream == 0)
> >>> +		interval = v4l2_subdev_get_pad_interval(sd, state, fi->pad);
> >>> +	else
> >>> +		interval = NULL;
> >>> +
> >>> +	if (!interval)
> >>> +		return -EINVAL;
> >>> +
> >>> +	fi->interval = *interval;
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_interval);
> >>> +
> >>>    int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> >>>    			    struct v4l2_subdev_state *state,
> >>>    			    const struct v4l2_subdev_krouting *routing)
> >>> @@ -1761,6 +1784,27 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
> >>>    
> >>> +struct v4l2_fract *
> >>> +v4l2_subdev_state_get_stream_interval(struct v4l2_subdev_state *state,
> >>> +				      unsigned int pad, u32 stream)
> >>> +{
> >>> +	struct v4l2_subdev_stream_configs *stream_configs;
> >>> +	unsigned int i;
> >>> +
> >>> +	lockdep_assert_held(state->lock);
> >>> +
> >>> +	stream_configs = &state->stream_configs;
> >>> +
> >>> +	for (i = 0; i < stream_configs->num_configs; ++i) {
> >>> +		if (stream_configs->configs[i].pad == pad &&
> >>> +		    stream_configs->configs[i].stream == stream)
> >>> +			return &stream_configs->configs[i].interval;
> >>> +	}
> >>> +
> >>> +	return NULL;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_interval);
> >>> +
> >>>    int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> >>>    					  u32 pad, u32 stream, u32 *other_pad,
> >>>    					  u32 *other_stream)
> >>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >>> index 962b546d0e3b..363f9a8a084c 100644
> >>> --- a/include/media/v4l2-subdev.h
> >>> +++ b/include/media/v4l2-subdev.h
> >>> @@ -681,11 +681,13 @@ struct v4l2_subdev_ir_ops {
> >>>     * @format: &struct v4l2_mbus_framefmt
> >>>     * @crop: &struct v4l2_rect to be used for crop
> >>>     * @compose: &struct v4l2_rect to be used for compose
> >>> + * @interval: frame interval
> >>>     */
> >>>    struct v4l2_subdev_pad_config {
> >>>    	struct v4l2_mbus_framefmt format;
> >>>    	struct v4l2_rect crop;
> >>>    	struct v4l2_rect compose;
> >>> +	struct v4l2_fract interval;
> >>>    };
> >>>    
> >>>    /**
> >>> @@ -697,6 +699,7 @@ struct v4l2_subdev_pad_config {
> >>>     * @fmt: &struct v4l2_mbus_framefmt
> >>>     * @crop: &struct v4l2_rect to be used for crop
> >>>     * @compose: &struct v4l2_rect to be used for compose
> >>> + * @interval: frame interval
> >>>     *
> >>>     * This structure stores configuration for a stream.
> >>>     */
> >>> @@ -708,6 +711,7 @@ struct v4l2_subdev_stream_config {
> >>>    	struct v4l2_mbus_framefmt fmt;
> >>>    	struct v4l2_rect crop;
> >>>    	struct v4l2_rect compose;
> >>> +	struct v4l2_fract interval;
> >>>    };
> >>>    
> >>>    /**
> >>> @@ -1199,6 +1203,26 @@ v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
> >>>    	return &state->pads[pad].compose;
> >>>    }
> >>>    
> >>> +/**
> >>> + * v4l2_subdev_get_pad_interval - ancillary routine to get
> >>> + *	&struct v4l2_subdev_pad_config->interval
> >>> + *
> >>> + * @sd: pointer to &struct v4l2_subdev
> >>> + * @state: pointer to &struct v4l2_subdev_state.
> >>> + * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
> >>> + */
> >>> +static inline struct v4l2_fract *
> >>> +v4l2_subdev_get_pad_interval(struct v4l2_subdev *sd,
> >>> +			     struct v4l2_subdev_state *state,
> >>> +			     unsigned int pad)
> >>> +{
> >>> +	if (WARN_ON(!state))
> >>> +		return NULL;
> >>> +	if (WARN_ON(pad >= sd->entity.num_pads))
> >>> +		pad = 0;
> >>> +	return &state->pads[pad].interval;
> >>> +}
> >>> +
> >>>    /*
> >>>     * Temprary helpers until uses of v4l2_subdev_get_try_* functions have been
> >>>     * renamed
> >>> @@ -1489,6 +1513,24 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> >>>    int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> >>>    			struct v4l2_subdev_format *format);
> >>>    
> >>> +/**
> >>> + * v4l2_subdev_get_frame_interval() - Fill frame interval based on state
> >>> + * @sd: subdevice
> >>> + * @state: subdevice state
> >>> + * @fi: pointer to &struct v4l2_subdev_frame_interval
> >>> + *
> >>> + * Fill @fi->interval field based on the information in the @fi struct.
> >>> + *
> >>> + * This function can be used by the subdev drivers which support active state to
> >>> + * implement v4l2_subdev_pad_ops.get_frame_interval if the subdev driver does
> >>> + * not need to do anything special in their get_frame_interval op.
> >>
> >> What would the "something special" be? Can we instead just say that the
> >> framework will return the frame interval from the state for drivers that
> >> support active state (similar to get-routing)? Or perhaps that's not a
> >> wise thing to do for old operations...
> > 
> > I've copied that text from v4l2_subdev_get_fmt(). I'm fine changing it,
> > if both say the same. If you send a patch to improve the documentation
> > of v4l2_subdev_get_fmt(), I'll update this patch :-)
> 
> My point wasn't the docs, but changing the framework to return the frame 
> interval directly from the state.

We don't do that for the .get_fmt() operation. I'm also fine considering
this, but I'd like to address both operations together, for consistency.

> Anyway, I was mostly just thinking out loud. Not part of this series anyway.

-- 
Regards,

Laurent Pinchart

