Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C048F7D48B4
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 09:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbjJXHiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 03:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjJXHiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 03:38:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A1790
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 00:38:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB5BCB53;
        Tue, 24 Oct 2023 09:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698133070;
        bh=4WDYboIm911RkuE2lGRreksiKK5TSTZG387kb8Xtu9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BZNdGPBPAcLZOr8DKsdTbl5awnxNGeXW9BbeXtqLHUsruTPqYpdnOneudw0fJsQvk
         2TCPaHQCUCoOV36TdLhsmq00Aij/1f/VsWSN4tMs2IQ3E+kLWCivEkTxZNnQykliJD
         R9ruTRZtieNj3ph62wWQet9bdK9pRML6eL/s3WYA=
Date:   Tue, 24 Oct 2023 10:38:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hansg@kernel.org>
Subject: Re: [RFC PATCH v1 3/4] media: v4l2-subdev: Store frame interval in
 subdev state
Message-ID: <20231024073808.GA5121@pendragon.ideasonboard.com>
References: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
 <20231024005130.28026-4-laurent.pinchart@ideasonboard.com>
 <ae1af16e-eb25-4c37-8d6e-16a910a4fa9a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae1af16e-eb25-4c37-8d6e-16a910a4fa9a@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Oct 24, 2023 at 10:21:18AM +0300, Tomi Valkeinen wrote:
> On 24/10/2023 03:51, Laurent Pinchart wrote:
> > Subdev states store all standard pad configuration data, except for
> > frame intervals. Fix it by adding interval fields in the
> > v4l2_subdev_pad_config and v4l2_subdev_stream_config structures, with
> > corresponding accessor functions and a helper function to implement the
> > .get_frame_interval() operation.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 44 +++++++++++++++++++++
> >   include/media/v4l2-subdev.h           | 57 +++++++++++++++++++++++++++
> >   2 files changed, 101 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index c45d60a87701..518f2f35c68d 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1618,6 +1618,29 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> >   }
> >   EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
> >   
> > +int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_state *state,
> > +				   struct v4l2_subdev_frame_interval *fi)
> > +{
> > +	struct v4l2_fract *interval;
> > +
> > +	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> > +		interval = v4l2_subdev_state_get_stream_interval(state, fi->pad,
> > +								 fi->stream);
> > +	else if (fi->pad < sd->entity.num_pads && fi->stream == 0)
> > +		interval = v4l2_subdev_get_pad_interval(sd, state, fi->pad);
> > +	else
> > +		interval = NULL;
> > +
> > +	if (!interval)
> > +		return -EINVAL;
> > +
> > +	fi->interval = *interval;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_interval);
> > +
> >   int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> >   			    struct v4l2_subdev_state *state,
> >   			    const struct v4l2_subdev_krouting *routing)
> > @@ -1761,6 +1784,27 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
> >   }
> >   EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
> >   
> > +struct v4l2_fract *
> > +v4l2_subdev_state_get_stream_interval(struct v4l2_subdev_state *state,
> > +				      unsigned int pad, u32 stream)
> > +{
> > +	struct v4l2_subdev_stream_configs *stream_configs;
> > +	unsigned int i;
> > +
> > +	lockdep_assert_held(state->lock);
> > +
> > +	stream_configs = &state->stream_configs;
> > +
> > +	for (i = 0; i < stream_configs->num_configs; ++i) {
> > +		if (stream_configs->configs[i].pad == pad &&
> > +		    stream_configs->configs[i].stream == stream)
> > +			return &stream_configs->configs[i].interval;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_interval);
> > +
> >   int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> >   					  u32 pad, u32 stream, u32 *other_pad,
> >   					  u32 *other_stream)
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 962b546d0e3b..363f9a8a084c 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -681,11 +681,13 @@ struct v4l2_subdev_ir_ops {
> >    * @format: &struct v4l2_mbus_framefmt
> >    * @crop: &struct v4l2_rect to be used for crop
> >    * @compose: &struct v4l2_rect to be used for compose
> > + * @interval: frame interval
> >    */
> >   struct v4l2_subdev_pad_config {
> >   	struct v4l2_mbus_framefmt format;
> >   	struct v4l2_rect crop;
> >   	struct v4l2_rect compose;
> > +	struct v4l2_fract interval;
> >   };
> >   
> >   /**
> > @@ -697,6 +699,7 @@ struct v4l2_subdev_pad_config {
> >    * @fmt: &struct v4l2_mbus_framefmt
> >    * @crop: &struct v4l2_rect to be used for crop
> >    * @compose: &struct v4l2_rect to be used for compose
> > + * @interval: frame interval
> >    *
> >    * This structure stores configuration for a stream.
> >    */
> > @@ -708,6 +711,7 @@ struct v4l2_subdev_stream_config {
> >   	struct v4l2_mbus_framefmt fmt;
> >   	struct v4l2_rect crop;
> >   	struct v4l2_rect compose;
> > +	struct v4l2_fract interval;
> >   };
> >   
> >   /**
> > @@ -1199,6 +1203,26 @@ v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
> >   	return &state->pads[pad].compose;
> >   }
> >   
> > +/**
> > + * v4l2_subdev_get_pad_interval - ancillary routine to get
> > + *	&struct v4l2_subdev_pad_config->interval
> > + *
> > + * @sd: pointer to &struct v4l2_subdev
> > + * @state: pointer to &struct v4l2_subdev_state.
> > + * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
> > + */
> > +static inline struct v4l2_fract *
> > +v4l2_subdev_get_pad_interval(struct v4l2_subdev *sd,
> > +			     struct v4l2_subdev_state *state,
> > +			     unsigned int pad)
> > +{
> > +	if (WARN_ON(!state))
> > +		return NULL;
> > +	if (WARN_ON(pad >= sd->entity.num_pads))
> > +		pad = 0;
> > +	return &state->pads[pad].interval;
> > +}
> > +
> >   /*
> >    * Temprary helpers until uses of v4l2_subdev_get_try_* functions have been
> >    * renamed
> > @@ -1489,6 +1513,24 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> >   int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> >   			struct v4l2_subdev_format *format);
> >   
> > +/**
> > + * v4l2_subdev_get_frame_interval() - Fill frame interval based on state
> > + * @sd: subdevice
> > + * @state: subdevice state
> > + * @fi: pointer to &struct v4l2_subdev_frame_interval
> > + *
> > + * Fill @fi->interval field based on the information in the @fi struct.
> > + *
> > + * This function can be used by the subdev drivers which support active state to
> > + * implement v4l2_subdev_pad_ops.get_frame_interval if the subdev driver does
> > + * not need to do anything special in their get_frame_interval op.
> 
> What would the "something special" be? Can we instead just say that the 
> framework will return the frame interval from the state for drivers that 
> support active state (similar to get-routing)? Or perhaps that's not a 
> wise thing to do for old operations...

I've copied that text from v4l2_subdev_get_fmt(). I'm fine changing it,
if both say the same. If you send a patch to improve the documentation
of v4l2_subdev_get_fmt(), I'll update this patch :-)

-- 
Regards,

Laurent Pinchart
