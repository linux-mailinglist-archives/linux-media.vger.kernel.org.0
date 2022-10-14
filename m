Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2895FECC6
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 12:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiJNKzB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 06:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJNKzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 06:55:00 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62ECC29C94
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 03:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665744898; x=1697280898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4dMZjnQrEj6wYlq8LHrYgHaRlehcWvl/T17jo1cXk04=;
  b=nM4qxsuB1x4ONe5u+QiCBoCI5RC1v2V9SCkEwWsxQywIymzdORA/yNm2
   3wTcC0sDt137wpa2Ad7sz9tHo2PP6fyHr5nQMgXwjsQA+Gssl4IkNFcjt
   zY6+okm5QJ4VYnLNwp522/yEL5N6zP/+zdhK+qQ4/5RFv7kwLY8l9pEiA
   P9PJbt08IAn5yPYKhaKplPfzGC0jic+xI8K76pYHPl3m1ZAEHpge0Q5uh
   PDYqRzkn6IQyR8Y3eKMuSv7QLZkaqpT4Ok3JJHRgIqufjRqsxmJJ+5Xdv
   TFWY05Wn3gLTQWxi1j2KUBkQJQUSrkx7DjWyK2mBGrQ7bigkyC20zRFo/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="391654308"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="391654308"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2022 03:54:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="872700203"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="872700203"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2022 03:54:54 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 84D7620146;
        Fri, 14 Oct 2022 13:54:52 +0300 (EEST)
Date:   Fri, 14 Oct 2022 10:54:52 +0000
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
Message-ID: <Y0k//ATM3oDFdn+a@paasikivi.fi.intel.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-12-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003121852.616745-12-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Mon, Oct 03, 2022 at 03:18:44PM +0300, Tomi Valkeinen wrote:
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
>  drivers/media/v4l2-core/v4l2-subdev.c | 182 +++++++++++++++++++++++---
>  1 file changed, 162 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index be778e619694..1cea6ec750c0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1014,7 +1014,7 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>  
>  static int
> -v4l2_subdev_link_validate_get_format(struct media_pad *pad,
> +v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
>  				     struct v4l2_subdev_format *fmt)
>  {
>  	if (is_media_entity_v4l2_subdev(pad->entity)) {
> @@ -1023,7 +1023,11 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>  
>  		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  		fmt->pad = pad->index;
> -		return v4l2_subdev_call_state_active(sd, pad, get_fmt, fmt);
> +		fmt->stream = stream;
> +
> +		return v4l2_subdev_call(sd, pad, get_fmt,
> +					v4l2_subdev_get_locked_active_state(sd),
> +					fmt);
>  	}
>  
>  	WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
> @@ -1033,31 +1037,169 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>  	return -EINVAL;
>  }
>  
> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +
> +static void __v4l2_link_validate_get_streams(struct media_pad *pad,
> +					     u64 *streams_mask)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_subdev *subdev;
> +
> +	subdev = media_entity_to_v4l2_subdev(pad->entity);
> +
> +	*streams_mask = 0;
> +
> +	state = v4l2_subdev_get_locked_active_state(subdev);
> +	if (WARN_ON(!state))
> +		return;
> +
> +	for_each_active_route(&state->routing, route) {
> +		u32 route_pad;
> +		u32 route_stream;
> +
> +		if (pad->flags & MEDIA_PAD_FL_SOURCE) {
> +			route_pad = route->source_pad;
> +			route_stream = route->source_stream;
> +		} else {
> +			route_pad = route->sink_pad;
> +			route_stream = route->sink_stream;
> +		}
> +
> +		if (route_pad != pad->index)
> +			continue;
> +
> +		*streams_mask |= BIT_ULL(route_stream);
> +	}
> +}
> +
> +#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> +
> +static void v4l2_link_validate_get_streams(struct media_pad *pad,
> +					   u64 *streams_mask)
> +{
> +	struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(pad->entity);
> +
> +	if (!(subdev->flags & V4L2_SUBDEV_FL_STREAMS)) {
> +		/* Non-streams subdevs have an implicit stream 0 */
> +		*streams_mask = BIT_ULL(0);
> +		return;
> +	}
> +
> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +	__v4l2_link_validate_get_streams(pad, streams_mask);
> +#else
> +	/* This shouldn't happen */
> +	*streams_mask = 0;
> +#endif
> +}
> +
> +static int v4l2_subdev_link_validate_locked(struct media_link *link)
> +{
> +	struct v4l2_subdev *sink_subdev =
> +		media_entity_to_v4l2_subdev(link->sink->entity);
> +	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
> +	u64 source_streams_mask;
> +	u64 sink_streams_mask;
> +	u64 dangling_sink_streams;
> +	u32 stream;
> +	int ret;
> +
> +	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
> +		link->source->entity->name, link->source->index,
> +		link->sink->entity->name, link->sink->index);
> +
> +	v4l2_link_validate_get_streams(link->source, &source_streams_mask);
> +	v4l2_link_validate_get_streams(link->sink, &sink_streams_mask);
> +
> +	/*
> +	 * It is ok to have more source streams than sink streams as extra
> +	 * source streams can just be ignored by the receiver, but having extra
> +	 * sink streams is an error as streams must have a source.
> +	 */
> +	dangling_sink_streams = (source_streams_mask ^ sink_streams_mask) &
> +				sink_streams_mask;
> +	if (dangling_sink_streams) {
> +		dev_err(dev, "Dangling sink streams: mask %#llx\n",
> +			dangling_sink_streams);
> +		return -EINVAL;
> +	}
> +
> +	/* Validate source and sink stream formats */
> +
> +	for_each_set_bit(stream, (void *)&sink_streams_mask, 64) {

Does this work as expected? The second argument is expected to be unsigned
long (or an array of two of them) whereas you have a u64.

> +		struct v4l2_subdev_format sink_fmt, source_fmt;
> +
> +		dev_dbg(dev, "validating stream \"%s\":%u:%u -> \"%s\":%u:%u\n",
> +			link->source->entity->name, link->source->index, stream,
> +			link->sink->entity->name, link->sink->index, stream);
> +
> +		ret = v4l2_subdev_link_validate_get_format(link->source, stream,
> +							   &source_fmt);
> +		if (ret < 0) {
> +			dev_dbg(dev,
> +				"Failed to get format for \"%s\":%u:%u (but that's ok)\n",
> +				link->source->entity->name, link->source->index,
> +				stream);
> +			continue;
> +		}
> +
> +		ret = v4l2_subdev_link_validate_get_format(link->sink, stream,
> +							   &sink_fmt);
> +		if (ret < 0) {
> +			dev_dbg(dev,
> +				"Failed to get format for \"%s\":%u:%u (but that's ok)\n",
> +				link->sink->entity->name, link->sink->index,
> +				stream);
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
> +			return ret;
> +
> +		ret = v4l2_subdev_link_validate_default(sink_subdev, link,
> +							&source_fmt, &sink_fmt);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  int v4l2_subdev_link_validate(struct media_link *link)
>  {
> -	struct v4l2_subdev *sink;
> -	struct v4l2_subdev_format sink_fmt, source_fmt;
> -	int rval;
> +	struct v4l2_subdev *source_sd, *sink_sd;
> +	struct v4l2_subdev_state *source_state, *sink_state;
> +	int ret;
>  
> -	rval = v4l2_subdev_link_validate_get_format(
> -		link->source, &source_fmt);
> -	if (rval < 0)
> -		return 0;
> +	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
> +	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
>  
> -	rval = v4l2_subdev_link_validate_get_format(
> -		link->sink, &sink_fmt);
> -	if (rval < 0)
> -		return 0;
> +	sink_state = v4l2_subdev_get_unlocked_active_state(sink_sd);
> +	source_state = v4l2_subdev_get_unlocked_active_state(source_sd);
>  
> -	sink = media_entity_to_v4l2_subdev(link->sink->entity);
> +	if (sink_state)
> +		v4l2_subdev_lock_state(sink_state);
>  
> -	rval = v4l2_subdev_call(sink, pad, link_validate, link,
> -				&source_fmt, &sink_fmt);
> -	if (rval != -ENOIOCTLCMD)
> -		return rval;
> +	if (source_state)
> +		v4l2_subdev_lock_state(source_state);
>  
> -	return v4l2_subdev_link_validate_default(
> -		sink, link, &source_fmt, &sink_fmt);
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

-- 
Terveisin,

Sakari Ailus
