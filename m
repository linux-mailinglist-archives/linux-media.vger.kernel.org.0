Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D47B4DAE78
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 11:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355206AbiCPKsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 06:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353463AbiCPKsg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 06:48:36 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A60E6353A
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 03:47:22 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 83CF61C0006;
        Wed, 16 Mar 2022 10:47:17 +0000 (UTC)
Date:   Wed, 16 Mar 2022 11:47:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 27/36] media: subdev: use streams in
 v4l2_subdev_link_validate()
Message-ID: <20220316104715.k6f2lurckxispxog@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-28-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-28-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Tue, Mar 01, 2022 at 06:11:47PM +0200, Tomi Valkeinen wrote:
> Update v4l2_subdev_link_validate() to use routing and streams for
> validation.
>
> Instead of just looking at the format on the pad on both ends of the
> link, the routing tables are used to collect all the streams going from
> the source to the sink over the link, and the streams' formats on both
> ends of the link are verified.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 245 ++++++++++++++++++++++++--
>  1 file changed, 227 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 339d7b15e26c..091b854e00d0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -16,6 +16,7 @@
>  #include <linux/videodev2.h>
>  #include <linux/export.h>
>  #include <linux/version.h>
> +#include <linux/sort.h>

Not sorted, but it was already like this
>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -1035,6 +1036,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>
>  static int
>  v4l2_subdev_link_validate_get_format(struct media_pad *pad,
> +				     u32 stream,

fits on the previous line

>  				     struct v4l2_subdev_format *fmt)
>  {
>  	if (is_media_entity_v4l2_subdev(pad->entity)) {
> @@ -1046,6 +1048,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>
>  		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  		fmt->pad = pad->index;
> +		fmt->stream = stream;
>  		return v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
>  	}
>
> @@ -1056,31 +1059,237 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>  	return -EINVAL;
>  }
>
> -int v4l2_subdev_link_validate(struct media_link *link)
> +static int cmp_u32(const void *a, const void *b)
>  {
> -	struct v4l2_subdev *sink;
> -	struct v4l2_subdev_format sink_fmt, source_fmt;
> -	int rval;
> +	u32 a32 = *(u32 *)a;
> +	u32 b32 = *(u32 *)b;
>
> -	rval = v4l2_subdev_link_validate_get_format(
> -		link->source, &source_fmt);
> -	if (rval < 0)
> -		return 0;
> +	return a32 > b32 ? 1 : (a32 < b32 ? -1 : 0);
> +}
> +
> +static int v4l2_link_validate_get_streams(struct media_link *link,
> +					  bool is_source, u32 *out_num_streams,
> +					  const u32 **out_streams,
> +					  bool *allocated)
> +{
> +	static const u32 default_streams[] = { 0 };
> +	struct v4l2_subdev_krouting *routing;
> +	struct v4l2_subdev *subdev;
> +	u32 num_streams;
> +	u32 *streams;
> +	unsigned int i;
> +	struct v4l2_subdev_state *state;
> +
> +	if (is_source)
> +		subdev = media_entity_to_v4l2_subdev(link->source->entity);
> +	else
> +		subdev = media_entity_to_v4l2_subdev(link->sink->entity);
>
> -	rval = v4l2_subdev_link_validate_get_format(
> -		link->sink, &sink_fmt);
> -	if (rval < 0)
> +	if (!(subdev->flags & V4L2_SUBDEV_FL_MULTIPLEXED)) {
> +		*out_num_streams = 1;
> +		*out_streams = default_streams;
> +		*allocated = false;
>  		return 0;
> +	}
>
> -	sink = media_entity_to_v4l2_subdev(link->sink->entity);
> +	state = v4l2_subdev_get_locked_active_state(subdev);
>
> -	rval = v4l2_subdev_call(sink, pad, link_validate, link,
> -				&source_fmt, &sink_fmt);
> -	if (rval != -ENOIOCTLCMD)
> -		return rval;
> +	routing = &state->routing;
> +
> +	streams = kmalloc_array(routing->num_routes, sizeof(u32), GFP_KERNEL);
> +	if (!streams)
> +		return -ENOMEM;
> +
> +	num_streams = 0;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +		int j;
> +		u32 route_pad;
> +		u32 route_stream;
> +		u32 link_pad;
> +
> +		if (is_source) {
> +			route_pad = route->source_pad;
> +			route_stream = route->source_stream;
> +			link_pad = link->source->index;
> +		} else {
> +			route_pad = route->sink_pad;
> +			route_stream = route->sink_stream;
> +			link_pad = link->sink->index;
> +		}
> +
> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;

Should this check be done before the previous if/else block ?
> +
> +		if (route_pad != link_pad)
> +			continue;
> +
> +		/* look for duplicates... */
> +		for (j = 0; j < num_streams; ++j) {
> +			if (streams[j] == route_stream)
> +				break;
> +		}
> +
> +		/* ...and drop the stream if we already have it */
> +		if (j != num_streams)
> +			continue;

Is this an error ? can the same stream be routed to multiple ones on a
media link ?

> +
> +		streams[num_streams++] = route_stream;
> +	}
> +
> +	sort(streams, num_streams, sizeof(u32), &cmp_u32, NULL);
>
> -	return v4l2_subdev_link_validate_default(
> -		sink, link, &source_fmt, &sink_fmt);
> +	*out_num_streams = num_streams;
> +	*out_streams = streams;
> +	*allocated = true;
> +
> +	return 0;
> +}
> +
> +static int v4l2_subdev_link_validate_locked(struct media_link *link)
> +{
> +	struct v4l2_subdev *sink_subdev =
> +		media_entity_to_v4l2_subdev(link->sink->entity);
> +	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
> +	u32 num_source_streams;
> +	const u32 *source_streams;
> +	bool source_allocated;
> +	u32 num_sink_streams;
> +	const u32 *sink_streams;
> +	bool sink_allocated;
> +	unsigned int sink_idx;
> +	unsigned int source_idx;
> +	int ret;
> +
> +	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
> +		link->source->entity->name, link->source->index,
> +		link->sink->entity->name, link->sink->index);
> +
> +	ret = v4l2_link_validate_get_streams(link, true, &num_source_streams,
> +					     &source_streams,
> +					     &source_allocated);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_link_validate_get_streams(link, false, &num_sink_streams,
> +					     &sink_streams, &sink_allocated);
> +	if (ret)
> +		goto free_source;
> +
> +	/*
> +	 * It is ok to have more source streams than sink streams as extra
> +	 * source streams can just be ignored (i.e. they go nowhere), but extra

Nit on the "(i.e. they go nowhere)" bit:

If it's ok to have more source streams than sinks, the extra sources
will not be connected. So I would drop or change the above phrase as
to me it sounds like sink streams go somewhere, while source stream
are rather not connected (or not active).

> +	 * sink streams is an error.
> +	 */
> +	if (num_source_streams < num_sink_streams) {
> +		dev_err(dev,
> +			"Not enough source streams: %d < %d\n",
> +			num_source_streams, num_sink_streams);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Validate source and sink stream formats */
> +
> +	source_idx = 0;
> +
> +	for (sink_idx = 0; sink_idx < num_sink_streams; ++sink_idx) {
> +		struct v4l2_subdev_format sink_fmt, source_fmt;
> +		u32 stream;
> +
> +		stream = sink_streams[sink_idx];
> +
> +		for (; source_idx < num_source_streams; ++source_idx) {
> +			if (source_streams[source_idx] == stream)
> +				break;
> +		}
> +
> +		if (source_idx == num_source_streams) {
> +			dev_err(dev, "No source stream for sink stream %u\n",
> +				stream);
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		dev_dbg(dev, "validating stream \"%s\":%u:%u -> \"%s\":%u:%u\n",
> +			link->source->entity->name, link->source->index, stream,
> +			link->sink->entity->name, link->sink->index, stream);
> +
> +		ret = v4l2_subdev_link_validate_get_format(link->source, stream,
> +							   &source_fmt);
> +		if (ret < 0) {
> +			dev_dbg(dev, "Failed to get format for \"%s\":%u:%u (but that's ok)\n",

For my education: why is it ok not to have a format for the stream ?
Don't we risk to pass a non-initialized source/sink_fmt to
link_validate() in that case ?

> +				link->source->entity->name, link->source->index,
> +				stream);
> +			ret = 0;
> +			continue;
> +		}
> +
> +		ret = v4l2_subdev_link_validate_get_format(link->sink, stream,
> +							   &sink_fmt);
> +		if (ret < 0) {
> +			dev_dbg(dev, "Failed to get format for \"%s\":%u:%u (but that's ok)\n",
> +				link->sink->entity->name, link->sink->index,
> +				stream);
> +			ret = 0;
> +			continue;
> +		}
> +
> +		/* TODO: add stream number to link_validate() */
> +		ret = v4l2_subdev_call(sink_subdev, pad, link_validate, link,
> +				       &source_fmt, &sink_fmt);
> +		if (!ret)
> +			continue;
> +
> +		if (ret != -ENOIOCTLCMD)
> +			goto out;
> +
> +		ret = v4l2_subdev_link_validate_default(sink_subdev, link,
> +							&source_fmt, &sink_fmt);
> +
> +		if (ret)
> +			goto out;
> +	}
> +
> +out:

I would call it free_sinks:

Thanks
   j

> +	if (sink_allocated)
> +		kfree(sink_streams);
> +
> +free_source:
> +	if (source_allocated)
> +		kfree(source_streams);
> +
> +	return ret;
> +}
> +
> +int v4l2_subdev_link_validate(struct media_link *link)
> +{
> +	struct v4l2_subdev *source_sd, *sink_sd;
> +	struct v4l2_subdev_state *source_state, *sink_state;
> +	int ret;
> +
> +	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
> +	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
> +
> +	sink_state = v4l2_subdev_get_active_state(sink_sd);
> +	source_state = v4l2_subdev_get_active_state(source_sd);
> +
> +	if (sink_state)
> +		v4l2_subdev_lock_state(sink_state);
> +
> +	if (source_state)
> +		v4l2_subdev_lock_state(source_state);
> +
> +	ret = v4l2_subdev_link_validate_locked(link);
> +
> +	if (sink_state)
> +		v4l2_subdev_unlock_state(sink_state);
> +
> +	if (source_state)
> +		v4l2_subdev_unlock_state(source_state);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>
> --
> 2.25.1
>
