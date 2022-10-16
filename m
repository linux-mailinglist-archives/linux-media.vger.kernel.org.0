Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97792600401
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 00:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJPWx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 18:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiJPWxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 18:53:55 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7D72F02A
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 15:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665960834; x=1697496834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h3pwOTiTqSZ5/x49xkX4HnR7XYgwJBwviD1Gqjl0LLE=;
  b=bgMQfJ/b92gm2dpksm8hpwWo5t5ZsR0+c18WfKqq2LxYxJTh1jjwKKL0
   zm4iTzn9ny7SFa1tzVJGWi2Nk8u729WUb6WD0S1DyD//X/y2PTkxd++V1
   fdfNL/NUadLVr/JZCzyorzlUQpZYydBmzabsyXspg8f+Gibb/YsoKQUvE
   6QV8WH5ypuHh4AX9wkm7uVZL7L6QfrQhhelmdVO6dKD5CPgsRM0htm+3J
   ALpVNETy9XdZgqda0K4tpFnb5+QF+muIS0HEb7AcAbYuFHLjlFXccpe+D
   /5BfpeAv5qQHVeOVTgMjQ51M48K5OnZ76fLiEQbzwDHSC+BClTMbeLqLF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="306748478"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; 
   d="scan'208";a="306748478"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2022 15:53:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="691142505"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; 
   d="scan'208";a="691142505"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2022 15:53:50 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 904F720244;
        Mon, 17 Oct 2022 01:37:39 +0300 (EEST)
Date:   Sun, 16 Oct 2022 22:37:39 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v15 11/19] media: subdev: use streams in
 v4l2_subdev_link_validate()
Message-ID: <Y0yHs5tOz/MyMcF3@paasikivi.fi.intel.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-12-tomi.valkeinen@ideasonboard.com>
 <Y0k//ATM3oDFdn+a@paasikivi.fi.intel.com>
 <7007e416-e9ee-008a-bd63-3a01b8a02af3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7007e416-e9ee-008a-bd63-3a01b8a02af3@ideasonboard.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Fri, Oct 14, 2022 at 02:10:35PM +0300, Tomi Valkeinen wrote:
> On 14/10/2022 13:54, Sakari Ailus wrote:
> > Moi,
> > 
> > On Mon, Oct 03, 2022 at 03:18:44PM +0300, Tomi Valkeinen wrote:
> > > Update v4l2_subdev_link_validate() to use routing and streams for
> > > validation.
> > > 
> > > Instead of just looking at the format on the pad on both ends of the
> > > link, the routing tables are used to collect all the streams going from
> > > the source to the sink over the link, and the streams' formats on both
> > > ends of the link are verified.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-subdev.c | 182 +++++++++++++++++++++++---
> > >   1 file changed, 162 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index be778e619694..1cea6ec750c0 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -1014,7 +1014,7 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
> > >   EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
> > >   static int
> > > -v4l2_subdev_link_validate_get_format(struct media_pad *pad,
> > > +v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
> > >   				     struct v4l2_subdev_format *fmt)
> > >   {
> > >   	if (is_media_entity_v4l2_subdev(pad->entity)) {
> > > @@ -1023,7 +1023,11 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
> > >   		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > >   		fmt->pad = pad->index;
> > > -		return v4l2_subdev_call_state_active(sd, pad, get_fmt, fmt);
> > > +		fmt->stream = stream;
> > > +
> > > +		return v4l2_subdev_call(sd, pad, get_fmt,
> > > +					v4l2_subdev_get_locked_active_state(sd),
> > > +					fmt);
> > >   	}
> > >   	WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
> > > @@ -1033,31 +1037,169 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
> > >   	return -EINVAL;
> > >   }
> > > +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > > +
> > > +static void __v4l2_link_validate_get_streams(struct media_pad *pad,
> > > +					     u64 *streams_mask)
> > > +{
> > > +	struct v4l2_subdev_route *route;
> > > +	struct v4l2_subdev_state *state;
> > > +	struct v4l2_subdev *subdev;
> > > +
> > > +	subdev = media_entity_to_v4l2_subdev(pad->entity);
> > > +
> > > +	*streams_mask = 0;
> > > +
> > > +	state = v4l2_subdev_get_locked_active_state(subdev);
> > > +	if (WARN_ON(!state))
> > > +		return;
> > > +
> > > +	for_each_active_route(&state->routing, route) {
> > > +		u32 route_pad;
> > > +		u32 route_stream;
> > > +
> > > +		if (pad->flags & MEDIA_PAD_FL_SOURCE) {
> > > +			route_pad = route->source_pad;
> > > +			route_stream = route->source_stream;
> > > +		} else {
> > > +			route_pad = route->sink_pad;
> > > +			route_stream = route->sink_stream;
> > > +		}
> > > +
> > > +		if (route_pad != pad->index)
> > > +			continue;
> > > +
> > > +		*streams_mask |= BIT_ULL(route_stream);
> > > +	}
> > > +}
> > > +
> > > +#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> > > +
> > > +static void v4l2_link_validate_get_streams(struct media_pad *pad,
> > > +					   u64 *streams_mask)
> > > +{
> > > +	struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(pad->entity);
> > > +
> > > +	if (!(subdev->flags & V4L2_SUBDEV_FL_STREAMS)) {
> > > +		/* Non-streams subdevs have an implicit stream 0 */
> > > +		*streams_mask = BIT_ULL(0);
> > > +		return;
> > > +	}
> > > +
> > > +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > > +	__v4l2_link_validate_get_streams(pad, streams_mask);
> > > +#else
> > > +	/* This shouldn't happen */
> > > +	*streams_mask = 0;
> > > +#endif
> > > +}
> > > +
> > > +static int v4l2_subdev_link_validate_locked(struct media_link *link)
> > > +{
> > > +	struct v4l2_subdev *sink_subdev =
> > > +		media_entity_to_v4l2_subdev(link->sink->entity);
> > > +	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
> > > +	u64 source_streams_mask;
> > > +	u64 sink_streams_mask;
> > > +	u64 dangling_sink_streams;
> > > +	u32 stream;
> > > +	int ret;
> > > +
> > > +	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
> > > +		link->source->entity->name, link->source->index,
> > > +		link->sink->entity->name, link->sink->index);
> > > +
> > > +	v4l2_link_validate_get_streams(link->source, &source_streams_mask);
> > > +	v4l2_link_validate_get_streams(link->sink, &sink_streams_mask);
> > > +
> > > +	/*
> > > +	 * It is ok to have more source streams than sink streams as extra
> > > +	 * source streams can just be ignored by the receiver, but having extra
> > > +	 * sink streams is an error as streams must have a source.
> > > +	 */
> > > +	dangling_sink_streams = (source_streams_mask ^ sink_streams_mask) &
> > > +				sink_streams_mask;
> > > +	if (dangling_sink_streams) {
> > > +		dev_err(dev, "Dangling sink streams: mask %#llx\n",
> > > +			dangling_sink_streams);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Validate source and sink stream formats */
> > > +
> > > +	for_each_set_bit(stream, (void *)&sink_streams_mask, 64) {
> > 
> > Does this work as expected? The second argument is expected to be unsigned
> > long (or an array of two of them) whereas you have a u64.
> 
> Where do you see that? I thought find_next_bit (used by for_each_set_bit) is
> given a start address and arbitrarily large bit-size number.

sink_streams_mask is a u64 while for_each_set_bit() expects an array of
unsigned longs. Endianness matters.

-- 
Terveisin,

Sakari Ailus
