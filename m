Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2605342B90A
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 09:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238409AbhJMHaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 03:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238423AbhJMHaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 03:30:04 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A159C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 00:28:01 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aYg7mFPmzk3b0aYgBmTJPG; Wed, 13 Oct 2021 09:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634110079; bh=EB0eHuWziBDK7//WTCpjOMurkKolO4VqdQMWHNMJdYY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZnFFwVwGJ/TyQf0keHUmquiaIOxUZyI03xQJVmC8Lx8+EkaF6ey2G2zKTFcThw05I
         hHA9/i3gGK8+fZWlLf7vFIer03R2CWthkouRZ6Yx5vmFtnZABVoJrN0mALTsoHum7q
         DdovnVrhBempWvhD/1iHZyQKBIP10VXIg2xw+Z4juibMRb7hOyLBTEV273W8nT3MDG
         /1JPDUaP5R1IaK0jnxlUqFfnAVg0B9/6IyvWXelG8q4apF/lxEYLcQj627/PBCw8Np
         ybt7oXa81CPdbkSZt4R/AfcStrDSE+HkmU97iyqJefiNgpSgpU7nZq7OP5Vx/tb0qk
         MxIQ5c2bZRhbQ==
Subject: Re: [PATCH v9 32/36] media: subdev: use streams in
 v4l2_subdev_link_validate()
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-33-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <556df80a-4120-aa2f-5f49-db3c075ccf03@xs4all.nl>
Date:   Wed, 13 Oct 2021 09:27:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-33-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO8B76dSWGMtar/p5YoktIo8CBpN4yJvdGzhwVvO9WGtmlrWlFya/5wGSWYSSKQPnzfuwV+OarIK2lM3xYm+vEtzuOwIG+VrXQbz9NHfeStkLqGZRjd5
 fG//TrxDX9re44JJEXptryAM8iK/cqWTY+ShCitm3GmnFwDqEHDfj/11LpOSwNmojG7Wdp4EWLhsdqJ3n96mC4kJVN6Qn3iNpFIkxH8LjRHxy917o2cwt2OF
 Hc0LPUQzHsS4bkcBF9N7/XlVlRh7mJOsXlK9E0SeozF2sPdExF1n2TxRVjE/05EWwn6Z3IwQVsMgq3qmMiW42PojPpYPdR/glYvsc3s1A+97raeBWehdVgwF
 W9oZRuso7in6ZySZWCVY82pODOwkTdVukQ6fpgbZKmgABW5mFpMR8uze5n4q/uShQuvXXHcCnxqzaatQWcs5riOkqW+ys7lhuvT3hMsKjan2aznMqxda1VDI
 01SAMtDV2568xUJA1kTd6uctcd9QhEZupC3QzQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
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
>  drivers/media/v4l2-core/v4l2-subdev.c | 217 +++++++++++++++++++++++---
>  1 file changed, 199 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index f63826755057..37e2e1f907fc 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -16,6 +16,7 @@
>  #include <linux/videodev2.h>
>  #include <linux/export.h>
>  #include <linux/version.h>
> +#include <linux/sort.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -1050,6 +1051,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>  
>  static int
>  v4l2_subdev_link_validate_get_format(struct media_pad *pad,
> +				     u32 stream,
>  				     struct v4l2_subdev_format *fmt)
>  {
>  	if (is_media_entity_v4l2_subdev(pad->entity)) {
> @@ -1061,6 +1063,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>  
>  		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  		fmt->pad = pad->index;
> +		fmt->stream = stream;
>  		return v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
>  	}
>  
> @@ -1071,31 +1074,209 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
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

Hmm, I'd just write 'static const u32 default_stream = 0;'

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

and here write = &default_stream;

That feels more natural.

> +		*allocated = false;
>  		return 0;
> +	}
>  
> -	sink = media_entity_to_v4l2_subdev(link->sink->entity);
> +	state = v4l2_subdev_lock_active_state(subdev);
>  
> -	rval = v4l2_subdev_call(sink, pad, link_validate, link,
> -				&source_fmt, &sink_fmt);
> -	if (rval != -ENOIOCTLCMD)
> -		return rval;
> +	routing = &state->routing;
> +
> +	streams = kmalloc_array(routing->num_routes, sizeof(u32), GFP_KERNEL);
> +
> +	if (!streams) {
> +		v4l2_subdev_unlock_state(state);
> +		return -ENOMEM;
> +	}
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
> +
> +		streams[num_streams++] = route_stream;
> +	}
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	sort(streams, num_streams, sizeof(u32), &cmp_u32, NULL);
> +
> +	*out_num_streams = num_streams;
> +	*out_streams = streams;
> +	*allocated = true;
>  
> -	return v4l2_subdev_link_validate_default(
> -		sink, link, &source_fmt, &sink_fmt);
> +	return 0;
> +}
> +
> +int v4l2_subdev_link_validate(struct media_link *link)
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
> +	/* It is ok to have more source streams than sink streams */

Why? Because that means that those extra streams are just ignored on the sink side
of the link?

In any case, state the reason why it is ok.

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
> +	if (sink_allocated)
> +		kfree(sink_streams);
> +
> +free_source:
> +	if (source_allocated)
> +		kfree(source_streams);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
> 

Regards,

	Hans
