Return-Path: <linux-media+bounces-38835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9560B1A098
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 13:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E288A178C33
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 11:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F23215793;
	Mon,  4 Aug 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtYyf3vs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739CA55
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754307144; cv=none; b=QPhM8ABv/pCA653kqZ/hgN7Pr+EXyFyRvpVEhhH/ae2/9Pv3sgQoIdQ+xmbgJ74R7wXXo5Bj/3ApAoRdY30EGs+wJ+kOOfVYtkpb9D8qgRKO1Vlj4gOWid7Z4s1hBQtoIeaqj9PYmnuRqqyuodfSGkym208P8S7sCqD07P1Qtgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754307144; c=relaxed/simple;
	bh=k9vaRdmgakLjbhTHId0QYaprQYwMCsMY+WsJ8JgtCMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNdY8ttRI7j4Tud2RUhZfs9CyaYcFlq7BrAE+D4BmXBUNro+vQCjg5nv9MPEJZ9kuigDJZ9ZMTww0A/SvSi1S1xJF5qkgjTz5l8pcC9mI/W2PUoKfMgD/cKKNSTZFn3pxP24FoDRf/7gFPN3knqFr9mA/cEwiN30t1o09dUUtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtYyf3vs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754307142; x=1785843142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k9vaRdmgakLjbhTHId0QYaprQYwMCsMY+WsJ8JgtCMY=;
  b=YtYyf3vs5S4orgjWF8fo5gxUCU1RH9BHLRvLmtcRoKAj65LBBLb6yepb
   oAEUR1b7m4Nt1ipGVbvU2vfB9pA5dLpb2/oFEk/hAWMlSYX1CAtA5XzTV
   bJ3JKy7vXbcimIr3ETclSL3l32yqSjISa467VskklvRJxa+ue/6Ifsnnl
   5WE4ktfZSqM4smZ2bmutjd/F6wXPs5WRdQifUCerrqlGltpWm10wE9qbK
   Mq/n2zfq7aD9chzgmxs0Fo4NmQ/VW9Ub2PYWYLvNZQnAq8vGqihVj3osY
   YKOjh6wEyeDKF4oxr0M86GqtFxmGRDvGb0Xh/0PjKmsbzs7fxU9ZSmhgM
   A==;
X-CSE-ConnectionGUID: 31mDNpE5SDWVrNUTt32Q1w==
X-CSE-MsgGUID: 55kW59ytQ4aBoF5bcLL7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="68020454"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="68020454"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 04:32:22 -0700
X-CSE-ConnectionGUID: t6HJ/pmvQBa+J409IbEcLA==
X-CSE-MsgGUID: BgKKg3U6S3SCjsxs95/YZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168587462"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.80])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 04:32:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4142D11F9C8;
	Mon,  4 Aug 2025 14:32:17 +0300 (EEST)
Date: Mon, 4 Aug 2025 11:32:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <aJCaQdmv6wv6cSwY@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
 <20250626230710.GA31209@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626230710.GA31209@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Fri, Jun 27, 2025 at 02:07:10AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 19, 2025 at 11:15:45AM +0300, Sakari Ailus wrote:
> > v4l2_mc_pipeline_enabled() helps solving a problem known for long but
> > lacked any sort of general solution: with multiple streams, when streaming
> > is started on video nodes one by one, when should streaming be started in
> > the source?
> > 
> > v4l2_mc_pipeline_enabled() traverses the pipeline towards the source,
> > queries the streams generated by the source and traces them back to the
> > video nodes.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-mc.c | 243 ++++++++++++++++++++++++++++++
> >  include/media/v4l2-mc.h           |  44 ++++++
> >  2 files changed, 287 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> > index 937d358697e1..1731088ad436 100644
> > --- a/drivers/media/v4l2-core/v4l2-mc.c
> > +++ b/drivers/media/v4l2-core/v4l2-mc.c
> > @@ -612,3 +612,246 @@ int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_pipeline_link_notify);
> > +
> > +static int
> > +__v4l2_mc_pipeline_enabled(struct v4l2_subdev_state *state,
> > +			   struct media_pad *src_pad, u64 __src_streams,
> > +			   struct media_pad **__sink_pad, u64 *__sink_streams)
> > +{
> > +	struct v4l2_subdev_route *route;
> > +	u64 src_streams = 0, sink_streams = 0;
> > +	bool has_sink_pad = false;
> > +	unsigned int sink_pad;
> > +
> > +	dev_dbg(state->sd->dev, "%s: source enabled, pad/streams %u/%#llx\n",
> > +		state->sd->entity.name, src_pad->index, __src_streams);
> > +	for_each_active_route(&state->routing, route) {
> > +		dev_dbg(state->sd->dev, "%s: %u/%u -> %u/%u, flags %x\n",
> > +			state->sd->entity.name,
> > +			route->sink_pad, route->sink_stream, route->source_pad,
> > +			route->source_stream, route->flags);
> > +		if (route->source_pad != src_pad->index)
> > +			continue;
> > +
> > +		if (!(BIT_ULL(route->source_stream) & __src_streams))
> > +			continue;
> > +
> > +		if (!has_sink_pad) {
> > +			has_sink_pad = true;
> > +			sink_pad = route->sink_pad;
> > +		}
> > +
> > +		if (route->sink_pad != sink_pad) {
> > +			dev_dbg(state->sd->dev,
> > +				"sink pads (%u vs. %u) differ\n",
> > +				route->sink_pad, sink_pad);
> > +			return -EMLINK;
> > +		}
> > +
> > +		sink_streams |= BIT_ULL(route->sink_stream);
> > +		src_streams |= BIT_ULL(route->source_stream);
> > +	}
> > +
> > +	*__sink_pad = has_sink_pad ? &state->sd->entity.pads[sink_pad] : NULL;
> > +	*__sink_streams = sink_streams;
> > +
> > +	return 0;
> > +}
> > +
> > +static int v4l2_mc_downpath_enabled(struct media_pad *sink_pad,
> > +				    unsigned int sink_stream,
> > +				    bool (*func)(struct video_device *vdev),
> > +				    struct media_pad **__sink_pad,
> > +				    u64 *__sink_streams)
> > +{
> > +	struct v4l2_subdev_state *state;
> > +	struct v4l2_subdev_route *route;
> > +	struct v4l2_subdev *sd;
> > +	struct media_pad *source_pad, *tmp_pad;
> > +	u32 source_stream;
> > +
> > +	if (!is_media_entity_v4l2_subdev(sink_pad->entity))
> > +		return -ENXIO;
> > +
> > +	sd = media_entity_to_v4l2_subdev(sink_pad->entity);
> > +	dev_dbg(sd->dev, "path_enabled: found sub-device %s\n",
> > +		sd->entity.name);
> > +
> > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > +	route = v4l2_subdev_find_route(&state->routing, sink_pad->index,
> > +				       sink_stream, true, 0);
> > +	if (IS_ERR(route)) {
> > +		v4l2_subdev_unlock_state(state);
> > +		dev_dbg(sd->dev,
> > +			"path_enabled: can't find opposite route for %s:%u/%u",
> > +			sd->entity.name, sink_pad->index, sink_stream);
> > +		return 2;
> > +	}
> > +
> > +	source_pad = &sd->entity.pads[route->source_pad];
> > +	v4l2_subdev_unlock_state(state);
> > +
> > +	tmp_pad = sink_pad;
> > +	sink_pad = media_pad_remote_pad_unique(source_pad);
> > +	if (IS_ERR(sink_pad)) {
> > +		dev_dbg(sd->dev,
> > +			"path_enabled: can't find remote source for %s:%u\n",
> > +			source_pad->entity->name, source_pad->index);
> > +		return PTR_ERR(sink_pad);
> > +	}
> > +
> > +	if (is_media_entity_v4l2_video_device(sink_pad->entity)) {
> > +		struct video_device *vdev;
> > +
> > +		vdev = media_entity_to_video_device(sink_pad->entity);
> > +		if (!vdev)
> > +			return -ENXIO;
> > +
> > +		dev_dbg(vdev->dev_parent,
> > +			"path_enabled: found video device %s\n",
> > +			vdev->name);
> > +
> > +		if (!*__sink_pad) {
> > +			*__sink_pad = tmp_pad;
> > +			dev_dbg(sd->dev, "path_enabled: sink %u/%u\n",
> > +				tmp_pad->index, sink_stream);
> > +		} else if (tmp_pad != *__sink_pad) {
> > +			dev_dbg(sd->dev,
> > +				"path_enabled: pads %s/%u and %s/%u differ\n",
> > +				tmp_pad->entity->name, tmp_pad->index,
> > +				(*__sink_pad)->entity->name,
> > +				(*__sink_pad)->index);
> > +			return -EXDEV;
> > +		}
> > +
> > +		*__sink_streams |= BIT_ULL(sink_stream);
> > +
> > +		return func(vdev);
> > +	}
> > +
> > +	return v4l2_mc_downpath_enabled(sink_pad, source_stream, func,
> > +					__sink_pad, __sink_streams);
> > +}
> > +
> > +static int v4l2_mc_source_get_streams(struct v4l2_subdev *sd, unsigned int pad,
> > +				      u64 *__streams)
> > +{
> > +	struct v4l2_mbus_frame_desc desc;
> > +	u64 streams = 0;
> > +	int ret;
> > +
> > +	if (!__streams)
> > +		return -EINVAL;
> > +
> > +	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &desc);
> > +	if (ret == -ENOIOCTLCMD) {
> > +		*__streams = 1ULL;
> > +		return 0;
> > +	}
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (unsigned int i = 0; i < desc.num_entries; i++) {
> > +		if (streams & BIT_ULL(desc.entry[i].stream))
> > +			return -EINVAL;
> > +
> > +		streams |= BIT_ULL(desc.entry[i].stream);
> > +	}
> > +
> > +	dev_dbg(sd->dev, "found streams %#llx based on streams %#llx\n",
> > +		*__streams, streams);
> > +	if (*__streams & ~streams)
> > +		return -EINVAL;
> > +
> > +	*__streams = streams;
> > +
> > +	return 0;
> > +}
> > +
> > +int v4l2_mc_pipeline_enabled(struct video_device *vdev,
> > +			     bool (*func)(struct video_device *vdev),
> > +			     struct media_pad **__sink_pad, u64 *__sink_streams)
> > +{
> > +	u64 sink_streams = 1U;
> > +	struct media_pad *src_pad;
> > +	u64 src_streams;
> > +	struct v4l2_subdev_state *state;
> > +	struct media_pad *sink_pad = vdev->entity.pads;
> > +	struct v4l2_subdev *sd = NULL;
> > +	bool streaming = true;
> > +	struct media_pad *tmp_pad;
> > +	u64 tmp_streams;
> > +	int ret;
> > +
> > +	if (!__sink_pad)
> > +		__sink_pad = &tmp_pad;
> > +	if (!__sink_streams)
> > +		__sink_streams = &tmp_streams;
> > +	*__sink_pad = NULL;
> > +	*__sink_streams = 0;
> > +
> > +	do {
> > +		src_pad = media_pad_remote_pad_unique(sink_pad);
> > +		if (IS_ERR(src_pad)) {
> > +			dev_dbg(sd ? sd->dev : vdev->dev_parent,
> > +				"no unique remote pad found from %s:%u\n",
> > +				sink_pad->entity->name, sink_pad->index);
> > +			return PTR_ERR(src_pad);
> > +		}
> > +
> > +		sd = media_entity_to_v4l2_subdev(src_pad->entity);
> > +		if (!sd) {
> > +			dev_dbg(sd->dev,
> > +				"media entity %s is not a V4L2 sub-device\n",
> > +				src_pad->entity->name);
> > +			return -ENXIO;
> > +		}
> > +
> > +		/* Source streams match sink. */
> > +		src_streams = sink_streams;
> > +
> > +		state = v4l2_subdev_lock_and_get_active_state(sd);
> > +		ret = __v4l2_mc_pipeline_enabled(state, src_pad,
> > +						 src_streams, &sink_pad,
> > +						 &sink_streams);
> > +		v4l2_subdev_unlock_state(state);
> > +		if (ret)
> > +			return ret;
> > +	} while (sink_pad);
> > +
> > +	ret = v4l2_mc_source_get_streams(sd, src_pad->index, &src_streams);
> > +	if (ret)
> > +		return ret;
> > +
> > +	sd = media_entity_to_v4l2_subdev(src_pad->entity);
> > +
> > +	dev_dbg(sd->dev, "following %s:%u/%#llx\n", sd->entity.name,
> > +		src_pad->index, src_streams);
> > +
> > +	for (unsigned int i = __ffs(src_streams); src_streams;
> > +	     src_streams &= ~BIT_ULL(i), i = __ffs(src_streams)) {
> > +		sink_pad = media_pad_remote_pad_unique(src_pad);
> > +		if (IS_ERR(src_pad)) {
> > +			dev_dbg(sd->dev,
> > +				"no unique remote pad found from %s:%u\n",
> > +				sink_pad->entity->name, sink_pad->index);
> > +			return PTR_ERR(src_pad);
> > +		}
> > +
> > +		ret = v4l2_mc_downpath_enabled(sink_pad, i, func, __sink_pad,
> > +					       __sink_streams);
> > +		if (ret == 2)
> > +			continue;
> > +		if (ret < 0)
> > +			return ret;
> > +		if (!ret)
> > +			streaming = false;
> > +	}
> > +
> > +	dev_dbg(media_entity_to_v4l2_subdev((*__sink_pad)->entity)->dev,
> > +		"sink pad %s:%u/%#llx\n", (*__sink_pad)->entity->name,
> > +		(*__sink_pad)->index, *__sink_streams);
> > +
> > +	return streaming;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_mc_pipeline_enabled);
> > diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> > index 1837c9fd78cf..e72c0f62fa34 100644
> > --- a/include/media/v4l2-mc.h
> > +++ b/include/media/v4l2-mc.h
> > @@ -193,6 +193,50 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
> >  int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
> >  			      unsigned int notification);
> >  
> > +/**
> > + * v4l2_mc_pipeline_enabled - Tell when to start streaming
> > + * @vdev: The video device
> > + * @func: Caller-provided function to tell a video device's streaming state
> > + * @__sink_pad: sink pad at the root of the local pipeline
> > + * @__sink_streams: streams to start
> 
> Any reason for the double underscore ?

The function used internally a variable without the underscores for a
different purpose.

> 
> > + *
> > + * Use to tell whether streaming should start on a video node. @func returns
> > + * true if streaming has been started on a given video node. @__sink_pad and
> > + * @__sink_streams are filled with pad and streams on the sub-device closest to
> > + * the video nodes, to be used for calling v4l2_subdev_enable_streams() and
> > + * v4l2_subdev_disable_streams().
> > + *
> > + * Using v4l2_mc_pipeline_enabled() has a few limitations currently (consider it
> > + * a to-do list):
> > + * * only unbranched streams can be supported albeit adding support for
> > + *   downstream branches would be fairly trivial,
> 
> I can't tell from the documentation here what you mean exactly by
> "unbranched streams".

These may have been referred to as "linear" streams elsewhere. I'll address
this in the next version.

> 
> > + * * streams within a single source sub-device are considered to start at the
> > + *   same time, more control could be added in two ways: 1) for sources to
> > + *   determine stream starting, a control could be added to UAPI and 2) sources
> > + *   could tell which streams start at the same time using a sub-device
> > + *   operation,
> > + * * CSI-2 VC framing is ignored currently, but VC-based stream starting could
> > + *   be implemented by letting the caller to provide a function to determine
> > + *   which streams are of interest and
> > + * * routes leading to nowhere are ignored, on some hardware this is a problem,
> > + *   but this can also be rather trivially addressed.
> 
> I'm afraid this function looks like a hack, to solve a problem that is
> not even explicitly described. You don't explain the issue in the cover
> letter or in Documentation/, the cover letter merely states that this is
> a "partial solution". The documentation of the function doesn't explain
> what criteria the decision is based on. We need a proper explanation of
> the problem in Documentation/, with a description of the behaviour (or
> behaviours) drivers are expected to implement.

I believe this is discussed in the cover letter, not in detail though. I'm
fine with adding more documentation, there isn't much as I also wanted to
get feedback on the approach itself. No alternatives have been proposed so
far either.

> 
> Furthermore, on the implementation side, things are fairly inefficient.
> We already traverse the whole pipeline in media_pipeline_start(), based
> on links and routes, and populate the media_pipeline structure. We
> shouldn't do the same here, but instead inspect media_pipeline to
> extract the information we need. If you're missing information there,
> let's add it.

The media pipeline is created and traversed, yes, but the media pipeline
does not include streams which are strictly a V4L2 concept. I agree there
is some overlap between the two but as long as MC remains separate from
V4L2, we can't reasonably access streams from the pipeline traversal.

> 
> > + *
> > + * Return:
> > + * * 0: Success, but don't start streaming yet
> > + * * 1: Success, now it's time to start streaming
> > + * * -ENXIO: Route traversal encountered a non-video device/sub-device entity
> > + * * -ENOTUNIQ: No unique remote pad
> > + * * -ENOLINK: No remote pad found
> > + * * -ENOENT: Enabled upstream route not found
> > + * * -EMLINK: No unique downstream route found
> > + * * -EINVAL: Stream could not be followed to source or was not produced by
> > + *            the source
> > + */
> > +int v4l2_mc_pipeline_enabled(struct video_device *vdev,
> > +			     bool (*func)(struct video_device *vdev),
> > +			     struct media_pad **__sink_pad,
> > +			     u64 *__sink_streams);
> > +
> >  #else /* CONFIG_MEDIA_CONTROLLER */
> >  
> >  static inline int v4l2_mc_create_media_graph(struct media_device *mdev)

-- 
Kind regards,

Sakari Ailus

