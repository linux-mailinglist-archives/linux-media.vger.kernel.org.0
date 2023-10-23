Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D82E17D38F9
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 16:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbjJWOIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 10:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjJWOIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 10:08:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00158100
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 07:08:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C42832B6;
        Mon, 23 Oct 2023 16:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698070107;
        bh=uw+h72zIwhR7hKQQ6Bh+QEIpN5uXnYSRErdgTgVY0mw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MQs20aosYdp4jQg9dkTzztE0/chqzKXOdONFw7gMwNNKw6F+Z16/USqmtOMqy6ZeD
         rTXdVpreEganZNSQnITor3Fn1uwd0fGuc9plZHHMVwbf5ffobfH5JX+uf3uDvTW/BT
         i0S218uNNeBenQpHslsNedZ79w590+cODCvyIj1U=
Date:   Mon, 23 Oct 2023 17:08:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 1/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <20231023140845.GC13234@pendragon.ideasonboard.com>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-2-sakari.ailus@linux.intel.com>
 <20231023132902.GQ3336@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023132902.GQ3336@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 23, 2023 at 04:29:04PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Oct 23, 2023 at 03:33:03PM +0300, Sakari Ailus wrote:
> > There are two sets of functions that return information from sub-device
> > state, one for stream-unaware users and another for stream-aware users.
> > Add support for stream-aware functions to return format, crop and compose
> > information from pad-based array that are functionally equivalent to the
> > old, stream-unaware ones.
> > 
> > Also check state is non-NULL, in order to guard against old drivers
> > potentially calling this with NULL state for active formats or selection
> > rectangles.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index ee4fe8f33a41..955ee9a6c91f 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1684,6 +1684,19 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> >  
> > +	if (WARN_ON(!state))
> > +		return NULL;
> > +
> > +	if (state->pads) {
> > +		if (stream)
> > +			return NULL;
> > +
> > +		if (WARN_ON(pad >= state->sd->entity.num_pads))

There's no sd field in struct v4l2_subdev_state in the linux media
master branch, no mention of dependencies in the cover letter, and no
specified base.

Please generate patch series with --base.

> > +			pad = 0;
> > +
> > +		return &state->pads[pad].try_fmt;
> > +	}
> > +
> >  	lockdep_assert_held(state->lock);
> 
> Can we move towards proper locking for all callers ?
> 
> >  
> >  	stream_configs = &state->stream_configs;
> > @@ -1705,6 +1718,19 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> >  
> > +	if (WARN_ON(!state))
> > +		return NULL;
> > +
> > +	if (state->pads) {
> > +		if (stream)
> > +			return NULL;
> > +
> > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > +			pad = 0;
> > +
> > +		return &state->pads[pad].try_crop;
> > +	}
> > +
> >  	lockdep_assert_held(state->lock);
> >  
> >  	stream_configs = &state->stream_configs;
> > @@ -1726,6 +1752,19 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> >  
> > +	if (WARN_ON(!state))
> > +		return NULL;
> > +
> > +	if (state->pads) {
> > +		if (stream)
> > +			return NULL;
> > +
> > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > +			pad = 0;
> > +
> > +		return &state->pads[pad].try_compose;
> > +	}
> > +
> >  	lockdep_assert_held(state->lock);
> >  
> >  	stream_configs = &state->stream_configs;

-- 
Regards,

Laurent Pinchart
