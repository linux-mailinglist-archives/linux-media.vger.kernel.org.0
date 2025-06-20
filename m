Return-Path: <linux-media+bounces-35474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BEAE16BF
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 10:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 960021899CCF
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8FA25DD1C;
	Fri, 20 Jun 2025 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="phLneXhx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FD92550B4
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409599; cv=none; b=iYEmnarPezWOAYUeGCTFFgz6lhc8YwokNe20SIWgjMlAvbLHknKzVuHxJVa6zTDE6cpDNQ3094+rwOzMp4yC5dQcMYnEQi8oS6tB3KvqTEYVucQTHj56Ina/yZliXCeIDJy9n7c9KnDqWvcZm9En45RfSvFSUTcQVkNV7R+zRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409599; c=relaxed/simple;
	bh=d/t+sPp4k0c3txhaiD0GzDYxZsYhfVo8T2QbEESF46o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vn37fVo6dSSvRQ405fkmqlYuBWwT8PsDQD2utXYGpXahzHfjwcHn+a4vs3O/mHd3PCYlQfBs44LYiNDXsXHO4r6rE2Bu4rW1mW87fjJQhCeUWW8nb9ZuyGxCQqfGjqULTDjEUgsMAyefHam8PYpvlFRGgBP3DP7u5sh8hZwCcHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=phLneXhx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F85F7FA;
	Fri, 20 Jun 2025 10:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750409581;
	bh=d/t+sPp4k0c3txhaiD0GzDYxZsYhfVo8T2QbEESF46o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phLneXhxOXZDweyAo+W6GO+07WfQjxYMZqlBeX2ApQJ+yhCoxASnbVGPgEveN8Td7
	 GTmpxW7adtOXNmbMOizxiD7XjHmmtAtnvGBCoHKPvXLzTE11zGMg/0X28tx4vlRw3c
	 AmJZ34pIhaX0jfgJAl4xTEn0wUTVs30JzwYYsu2s=
Date: Fri, 20 Jun 2025 10:53:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com, 
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com, tomi.valkeinen@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <zubhgen5vcjeadujrufagjd3h6rp5va7d7n27fqisc23kr35sn@sg4mwenwnbmc>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 11:15:45AM +0300, Sakari Ailus wrote:
> v4l2_mc_pipeline_enabled() helps solving a problem known for long but
> lacked any sort of general solution: with multiple streams, when streaming
> is started on video nodes one by one, when should streaming be started in
> the source?

I tried quite some time to understand this, but if I'm not mistaken,
a stream-aware subdev, which links to vdev, will always "demux"
streams to different pads and will connect to the vdev from there


     Source
     subdev
 +-----------------+
 |                (1/0) ------> vdev0
 |                 |
(0)[1,2,3]        (2/0  ------> vdev1
 |                 |
 |                (3/0) ------> vdev2
 +-----------------+

With

(0) multiplexed sink pad with 3 streams
(1) (2) and (3) source pad with a single stream

Can't we relay on the media-link state between the source pads and the
video devices with something like what Dan has proposed here ?
https://patchwork.linuxtv.org/project/linux-media/patch/20250519140403.443915-2-dan.scally@ideasonboard.com/

What am I missing ?

>
> v4l2_mc_pipeline_enabled() traverses the pipeline towards the source,
> queries the streams generated by the source and traces them back to the
> video nodes.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 243 ++++++++++++++++++++++++++++++
>  include/media/v4l2-mc.h           |  44 ++++++
>  2 files changed, 287 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index 937d358697e1..1731088ad436 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -612,3 +612,246 @@ int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_pipeline_link_notify);
> +
> +static int
> +__v4l2_mc_pipeline_enabled(struct v4l2_subdev_state *state,
> +			   struct media_pad *src_pad, u64 __src_streams,
> +			   struct media_pad **__sink_pad, u64 *__sink_streams)
> +{
> +	struct v4l2_subdev_route *route;
> +	u64 src_streams = 0, sink_streams = 0;
> +	bool has_sink_pad = false;
> +	unsigned int sink_pad;
> +
> +	dev_dbg(state->sd->dev, "%s: source enabled, pad/streams %u/%#llx\n",
> +		state->sd->entity.name, src_pad->index, __src_streams);
> +	for_each_active_route(&state->routing, route) {
> +		dev_dbg(state->sd->dev, "%s: %u/%u -> %u/%u, flags %x\n",
> +			state->sd->entity.name,
> +			route->sink_pad, route->sink_stream, route->source_pad,
> +			route->source_stream, route->flags);
> +		if (route->source_pad != src_pad->index)
> +			continue;
> +
> +		if (!(BIT_ULL(route->source_stream) & __src_streams))
> +			continue;
> +
> +		if (!has_sink_pad) {
> +			has_sink_pad = true;
> +			sink_pad = route->sink_pad;
> +		}
> +
> +		if (route->sink_pad != sink_pad) {
> +			dev_dbg(state->sd->dev,
> +				"sink pads (%u vs. %u) differ\n",
> +				route->sink_pad, sink_pad);
> +			return -EMLINK;
> +		}
> +
> +		sink_streams |= BIT_ULL(route->sink_stream);
> +		src_streams |= BIT_ULL(route->source_stream);
> +	}
> +
> +	*__sink_pad = has_sink_pad ? &state->sd->entity.pads[sink_pad] : NULL;
> +	*__sink_streams = sink_streams;
> +
> +	return 0;
> +}
> +
> +static int v4l2_mc_downpath_enabled(struct media_pad *sink_pad,
> +				    unsigned int sink_stream,
> +				    bool (*func)(struct video_device *vdev),
> +				    struct media_pad **__sink_pad,
> +				    u64 *__sink_streams)
> +{
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev *sd;
> +	struct media_pad *source_pad, *tmp_pad;
> +	u32 source_stream;
> +
> +	if (!is_media_entity_v4l2_subdev(sink_pad->entity))
> +		return -ENXIO;
> +
> +	sd = media_entity_to_v4l2_subdev(sink_pad->entity);
> +	dev_dbg(sd->dev, "path_enabled: found sub-device %s\n",
> +		sd->entity.name);
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	route = v4l2_subdev_find_route(&state->routing, sink_pad->index,
> +				       sink_stream, true, 0);
> +	if (IS_ERR(route)) {
> +		v4l2_subdev_unlock_state(state);
> +		dev_dbg(sd->dev,
> +			"path_enabled: can't find opposite route for %s:%u/%u",
> +			sd->entity.name, sink_pad->index, sink_stream);
> +		return 2;
> +	}
> +
> +	source_pad = &sd->entity.pads[route->source_pad];
> +	v4l2_subdev_unlock_state(state);
> +
> +	tmp_pad = sink_pad;
> +	sink_pad = media_pad_remote_pad_unique(source_pad);
> +	if (IS_ERR(sink_pad)) {
> +		dev_dbg(sd->dev,
> +			"path_enabled: can't find remote source for %s:%u\n",
> +			source_pad->entity->name, source_pad->index);
> +		return PTR_ERR(sink_pad);
> +	}
> +
> +	if (is_media_entity_v4l2_video_device(sink_pad->entity)) {
> +		struct video_device *vdev;
> +
> +		vdev = media_entity_to_video_device(sink_pad->entity);
> +		if (!vdev)
> +			return -ENXIO;
> +
> +		dev_dbg(vdev->dev_parent,
> +			"path_enabled: found video device %s\n",
> +			vdev->name);
> +
> +		if (!*__sink_pad) {
> +			*__sink_pad = tmp_pad;
> +			dev_dbg(sd->dev, "path_enabled: sink %u/%u\n",
> +				tmp_pad->index, sink_stream);
> +		} else if (tmp_pad != *__sink_pad) {
> +			dev_dbg(sd->dev,
> +				"path_enabled: pads %s/%u and %s/%u differ\n",
> +				tmp_pad->entity->name, tmp_pad->index,
> +				(*__sink_pad)->entity->name,
> +				(*__sink_pad)->index);
> +			return -EXDEV;
> +		}
> +
> +		*__sink_streams |= BIT_ULL(sink_stream);
> +
> +		return func(vdev);
> +	}
> +
> +	return v4l2_mc_downpath_enabled(sink_pad, source_stream, func,
> +					__sink_pad, __sink_streams);
> +}
> +
> +static int v4l2_mc_source_get_streams(struct v4l2_subdev *sd, unsigned int pad,
> +				      u64 *__streams)
> +{
> +	struct v4l2_mbus_frame_desc desc;
> +	u64 streams = 0;
> +	int ret;
> +
> +	if (!__streams)
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &desc);
> +	if (ret == -ENOIOCTLCMD) {
> +		*__streams = 1ULL;
> +		return 0;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	for (unsigned int i = 0; i < desc.num_entries; i++) {
> +		if (streams & BIT_ULL(desc.entry[i].stream))
> +			return -EINVAL;
> +
> +		streams |= BIT_ULL(desc.entry[i].stream);
> +	}
> +
> +	dev_dbg(sd->dev, "found streams %#llx based on streams %#llx\n",
> +		*__streams, streams);
> +	if (*__streams & ~streams)
> +		return -EINVAL;
> +
> +	*__streams = streams;
> +
> +	return 0;
> +}
> +
> +int v4l2_mc_pipeline_enabled(struct video_device *vdev,
> +			     bool (*func)(struct video_device *vdev),
> +			     struct media_pad **__sink_pad, u64 *__sink_streams)
> +{
> +	u64 sink_streams = 1U;
> +	struct media_pad *src_pad;
> +	u64 src_streams;
> +	struct v4l2_subdev_state *state;
> +	struct media_pad *sink_pad = vdev->entity.pads;
> +	struct v4l2_subdev *sd = NULL;
> +	bool streaming = true;
> +	struct media_pad *tmp_pad;
> +	u64 tmp_streams;
> +	int ret;
> +
> +	if (!__sink_pad)
> +		__sink_pad = &tmp_pad;
> +	if (!__sink_streams)
> +		__sink_streams = &tmp_streams;
> +	*__sink_pad = NULL;
> +	*__sink_streams = 0;
> +
> +	do {
> +		src_pad = media_pad_remote_pad_unique(sink_pad);
> +		if (IS_ERR(src_pad)) {
> +			dev_dbg(sd ? sd->dev : vdev->dev_parent,
> +				"no unique remote pad found from %s:%u\n",
> +				sink_pad->entity->name, sink_pad->index);
> +			return PTR_ERR(src_pad);
> +		}
> +
> +		sd = media_entity_to_v4l2_subdev(src_pad->entity);
> +		if (!sd) {
> +			dev_dbg(sd->dev,
> +				"media entity %s is not a V4L2 sub-device\n",
> +				src_pad->entity->name);
> +			return -ENXIO;
> +		}
> +
> +		/* Source streams match sink. */
> +		src_streams = sink_streams;
> +
> +		state = v4l2_subdev_lock_and_get_active_state(sd);
> +		ret = __v4l2_mc_pipeline_enabled(state, src_pad,
> +						 src_streams, &sink_pad,
> +						 &sink_streams);
> +		v4l2_subdev_unlock_state(state);
> +		if (ret)
> +			return ret;
> +	} while (sink_pad);
> +
> +	ret = v4l2_mc_source_get_streams(sd, src_pad->index, &src_streams);
> +	if (ret)
> +		return ret;
> +
> +	sd = media_entity_to_v4l2_subdev(src_pad->entity);
> +
> +	dev_dbg(sd->dev, "following %s:%u/%#llx\n", sd->entity.name,
> +		src_pad->index, src_streams);
> +
> +	for (unsigned int i = __ffs(src_streams); src_streams;
> +	     src_streams &= ~BIT_ULL(i), i = __ffs(src_streams)) {
> +		sink_pad = media_pad_remote_pad_unique(src_pad);
> +		if (IS_ERR(src_pad)) {
> +			dev_dbg(sd->dev,
> +				"no unique remote pad found from %s:%u\n",
> +				sink_pad->entity->name, sink_pad->index);
> +			return PTR_ERR(src_pad);
> +		}
> +
> +		ret = v4l2_mc_downpath_enabled(sink_pad, i, func, __sink_pad,
> +					       __sink_streams);
> +		if (ret == 2)
> +			continue;
> +		if (ret < 0)
> +			return ret;
> +		if (!ret)
> +			streaming = false;
> +	}
> +
> +	dev_dbg(media_entity_to_v4l2_subdev((*__sink_pad)->entity)->dev,
> +		"sink pad %s:%u/%#llx\n", (*__sink_pad)->entity->name,
> +		(*__sink_pad)->index, *__sink_streams);
> +
> +	return streaming;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_mc_pipeline_enabled);
> diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> index 1837c9fd78cf..e72c0f62fa34 100644
> --- a/include/media/v4l2-mc.h
> +++ b/include/media/v4l2-mc.h
> @@ -193,6 +193,50 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
>  int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
>  			      unsigned int notification);
>
> +/**
> + * v4l2_mc_pipeline_enabled - Tell when to start streaming
> + * @vdev: The video device
> + * @func: Caller-provided function to tell a video device's streaming state
> + * @__sink_pad: sink pad at the root of the local pipeline
> + * @__sink_streams: streams to start
> + *
> + * Use to tell whether streaming should start on a video node. @func returns
> + * true if streaming has been started on a given video node. @__sink_pad and
> + * @__sink_streams are filled with pad and streams on the sub-device closest to
> + * the video nodes, to be used for calling v4l2_subdev_enable_streams() and
> + * v4l2_subdev_disable_streams().
> + *
> + * Using v4l2_mc_pipeline_enabled() has a few limitations currently (consider it
> + * a to-do list):
> + * * only unbranched streams can be supported albeit adding support for
> + *   downstream branches would be fairly trivial,
> + * * streams within a single source sub-device are considered to start at the
> + *   same time, more control could be added in two ways: 1) for sources to
> + *   determine stream starting, a control could be added to UAPI and 2) sources
> + *   could tell which streams start at the same time using a sub-device
> + *   operation,
> + * * CSI-2 VC framing is ignored currently, but VC-based stream starting could
> + *   be implemented by letting the caller to provide a function to determine
> + *   which streams are of interest and
> + * * routes leading to nowhere are ignored, on some hardware this is a problem,
> + *   but this can also be rather trivially addressed.
> + *
> + * Return:
> + * * 0: Success, but don't start streaming yet
> + * * 1: Success, now it's time to start streaming
> + * * -ENXIO: Route traversal encountered a non-video device/sub-device entity
> + * * -ENOTUNIQ: No unique remote pad
> + * * -ENOLINK: No remote pad found
> + * * -ENOENT: Enabled upstream route not found
> + * * -EMLINK: No unique downstream route found
> + * * -EINVAL: Stream could not be followed to source or was not produced by
> + *            the source
> + */
> +int v4l2_mc_pipeline_enabled(struct video_device *vdev,
> +			     bool (*func)(struct video_device *vdev),
> +			     struct media_pad **__sink_pad,
> +			     u64 *__sink_streams);
> +
>  #else /* CONFIG_MEDIA_CONTROLLER */
>
>  static inline int v4l2_mc_create_media_graph(struct media_device *mdev)
> --
> 2.39.5
>
>

