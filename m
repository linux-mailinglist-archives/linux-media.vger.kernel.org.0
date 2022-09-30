Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5405F0A03
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 13:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiI3LXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 07:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbiI3LXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 07:23:17 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E91E0DB
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664536489; x=1696072489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nJcENkmCzofWWVlsXXYfizAjf719CPWc12RpaTYzCm8=;
  b=g67q90Nlf/m2j9B/OaqJP8l7iAuzJDR3Pq5WbsTkBdKh4BcIXjVQtfoR
   LlcBKKlvKRouK16ysDLoRv6JyWxpNBr6wAsNDxZTR9cmoNZMDm2Vomv0L
   7ho/zSAlFpxp1YbwWL1H3BGqndF5XTXuv10RcBKTmXTYNrw+bc8JxBB+f
   4VUtDJOqHrYAHqwaWH70D+V8fCT2zts/Ibp6ASa7KdgZU9jya1BWDe2Fb
   n6PQVfQ5Pot2lRwOkuAMfBdkwrpDACC6/oQMpjBXwNBI0YjctYvcHsYYY
   OOwS353+RP1QtXI3rSx6VDwN1w03Q1sRc+eO5CXqzs2frTjJAst879Quf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="364009517"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="364009517"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 04:14:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="691214723"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="691214723"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 04:14:46 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D36E4200F1;
        Fri, 30 Sep 2022 14:05:51 +0300 (EEST)
Date:   Fri, 30 Sep 2022 11:05:51 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v14 20/34] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <YzbNjzENgJ9PZsiJ@paasikivi.fi.intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-21-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831141357.1396081-21-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Aug 31, 2022 at 05:13:43PM +0300, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Add support for subdev internal routing. A route is defined as a single
> stream from a sink pad to a source pad.
> 
> The userspace can configure the routing via two new ioctls,
> VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
> implement the functionality with v4l2_subdev_pad_ops.set_routing().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> 
> - Add sink and source streams for multiplexed links
> - Copy the argument back in case of an error. This is needed to let the
>   caller know the number of routes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> - Expand and refine documentation.
> - Make the 'routes' pointer a __u64 __user pointer so that a compat32
>   version of the ioctl is not required.
> - Add struct v4l2_subdev_krouting to be used for subdevice operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> - Fix typecasing warnings
> - Check sink & source pad types
> - Add 'which' field
> - Add V4L2_SUBDEV_ROUTE_FL_SOURCE
> - Routing to subdev state
> - Dropped get_routing subdev op
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 25 +++++++-
>  drivers/media/v4l2-core/v4l2-subdev.c | 87 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 22 +++++++
>  include/uapi/linux/v4l2-subdev.h      | 52 ++++++++++++++++
>  4 files changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index c314025d977e..1c02f935cc6c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -16,6 +16,7 @@
>  #include <linux/kernel.h>
>  #include <linux/version.h>
>  
> +#include <linux/v4l2-subdev.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/media-device.h> /* for media_set_bus_info() */
> @@ -3151,6 +3152,21 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>  		ret = 1;
>  		break;
>  	}
> +
> +	case VIDIOC_SUBDEV_G_ROUTING:
> +	case VIDIOC_SUBDEV_S_ROUTING: {
> +		struct v4l2_subdev_routing *routing = parg;
> +
> +		if (routing->num_routes > 256)
> +			return -EINVAL;
> +
> +		*user_ptr = u64_to_user_ptr(routing->routes);
> +		*kernel_ptr = (void **)&routing->routes;
> +		*array_size = sizeof(struct v4l2_subdev_route)
> +			    * routing->num_routes;
> +		ret = 1;
> +		break;
> +	}
>  	}
>  
>  	return ret;
> @@ -3414,8 +3430,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  	/*
>  	 * Some ioctls can return an error, but still have valid
>  	 * results that must be returned.
> +	 *
> +	 * FIXME: subdev IOCTLS are partially handled here and partially in
> +	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
> +	 * defined here as part of the 'v4l2_ioctls' array. As
> +	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
> +	 * in case of failure, but it is not defined here as part of the
> +	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
>  	 */
> -	if (err < 0 && !always_copy)
> +	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
>  		goto out;
>  
>  out_array_args:
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 90826b956693..af1f53d99507 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -23,6 +23,16 @@
>  #include <media/v4l2-fh.h>
>  #include <media/v4l2-event.h>
>  
> +/*
> + * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
> + * of streams.
> + *
> + * Note that V4L2_FRAME_DESC_ENTRY_MAX is related: V4L2_FRAME_DESC_ENTRY_MAX
> + * restricts the total number of streams in a pad, although the stream ID is
> + * not restricted.
> + */
> +#define V4L2_SUBDEV_MAX_STREAM_ID 63
> +
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  {
> @@ -417,6 +427,10 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  	case VIDIOC_SUBDEV_S_SELECTION:
>  		which = ((struct v4l2_subdev_selection *)arg)->which;
>  		break;
> +	case VIDIOC_SUBDEV_G_ROUTING:
> +	case VIDIOC_SUBDEV_S_ROUTING:
> +		which = ((struct v4l2_subdev_routing *)arg)->which;
> +		break;
>  	}
>  
>  	return which == V4L2_SUBDEV_FORMAT_TRY ?
> @@ -732,6 +746,78 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_QUERYSTD:
>  		return v4l2_subdev_call(sd, video, querystd, arg);
>  
> +	case VIDIOC_SUBDEV_G_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_krouting *krouting;
> +
> +		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +			return -ENOIOCTLCMD;
> +
> +		memset(routing->reserved, 0, sizeof(routing->reserved));
> +
> +		krouting = &state->routing;
> +
> +		if (routing->num_routes < krouting->num_routes) {
> +			routing->num_routes = krouting->num_routes;
> +			return -ENOSPC;
> +		}
> +
> +		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +		       krouting->routes,
> +		       krouting->num_routes * sizeof(*krouting->routes));
> +		routing->num_routes = krouting->num_routes;
> +
> +		return 0;
> +	}
> +
> +	case VIDIOC_SUBDEV_S_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_route *routes =
> +			(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> +		struct v4l2_subdev_krouting krouting = {};
> +		unsigned int i;
> +
> +		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +			return -ENOIOCTLCMD;
> +
> +		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> +			return -EPERM;
> +
> +		memset(routing->reserved, 0, sizeof(routing->reserved));
> +
> +		for (i = 0; i < routing->num_routes; ++i) {
> +			const struct v4l2_subdev_route *route = &routes[i];
> +			const struct media_pad *pads = sd->entity.pads;
> +
> +			if (route->sink_stream > V4L2_SUBDEV_MAX_STREAM_ID ||
> +			    route->source_stream > V4L2_SUBDEV_MAX_STREAM_ID)
> +				return -EINVAL;
> +
> +			/* Do not check sink pad for source routes */
> +			if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
> +				if (route->sink_pad >= sd->entity.num_pads)
> +					return -EINVAL;
> +
> +				if (!(pads[route->sink_pad].flags &
> +				      MEDIA_PAD_FL_SINK))
> +					return -EINVAL;
> +			}
> +
> +			if (route->source_pad >= sd->entity.num_pads)
> +				return -EINVAL;
> +
> +			if (!(pads[route->source_pad].flags &
> +			      MEDIA_PAD_FL_SOURCE))
> +				return -EINVAL;
> +		}
> +
> +		krouting.num_routes = routing->num_routes;
> +		krouting.routes = routes;
> +
> +		return v4l2_subdev_call(sd, pad, set_routing, state,
> +					routing->which, &krouting);
> +	}
> +
>  	default:
>  		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>  	}
> @@ -1015,6 +1101,7 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>  
>  	mutex_destroy(&state->_lock);
>  
> +	kfree(state->routing.routes);
>  	kvfree(state->pads);
>  	kfree(state);
>  }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index c38de23b7f22..f38943932cfe 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -695,12 +695,26 @@ struct v4l2_subdev_pad_config {
>  	struct v4l2_rect try_compose;
>  };
>  
> +/**
> + * struct v4l2_subdev_krouting - subdev routing table
> + *
> + * @num_routes: number of routes
> + * @routes: &struct v4l2_subdev_route
> + *
> + * This structure contains the routing table for a subdev.
> + */
> +struct v4l2_subdev_krouting {
> +	unsigned int num_routes;
> +	struct v4l2_subdev_route *routes;
> +};
> +
>  /**
>   * struct v4l2_subdev_state - Used for storing subdev state information.
>   *
>   * @_lock: default for 'lock'
>   * @lock: mutex for the state. May be replaced by the user.
>   * @pads: &struct v4l2_subdev_pad_config array
> + * @routing: routing table for the subdev
>   *
>   * This structure only needs to be passed to the pad op if the 'which' field
>   * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
> @@ -711,6 +725,7 @@ struct v4l2_subdev_state {
>  	struct mutex _lock;
>  	struct mutex *lock;
>  	struct v4l2_subdev_pad_config *pads;
> +	struct v4l2_subdev_krouting routing;
>  };
>  
>  /**
> @@ -763,6 +778,9 @@ struct v4l2_subdev_state {
>   *		     this operation as close as possible to stream on time. The
>   *		     operation shall fail if the pad index it has been called on
>   *		     is not valid or in case of unrecoverable failures.
> + *
> + * @set_routing: enable or disable data connection routes described in the
> + *		 subdevice routing table.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -805,6 +823,10 @@ struct v4l2_subdev_pad_ops {
>  			      struct v4l2_mbus_frame_desc *fd);
>  	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
>  			       struct v4l2_mbus_config *config);
> +	int (*set_routing)(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state,
> +			   enum v4l2_subdev_format_whence which,
> +			   struct v4l2_subdev_krouting *route);
>  };
>  
>  /**
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 89af27f50a41..b63b80576dd3 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -24,6 +24,7 @@
>  #ifndef __LINUX_V4L2_SUBDEV_H
>  #define __LINUX_V4L2_SUBDEV_H
>  
> +#include <linux/const.h>
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>  #include <linux/v4l2-common.h>
> @@ -191,6 +192,55 @@ struct v4l2_subdev_capability {
>  /* The v4l2 sub-device supports routing and multiplexed streams. */
>  #define V4L2_SUBDEV_CAP_STREAMS			0x00000002
>  
> +/*
> + * Is the route active? An active route will start when streaming is enabled
> + * on a video node.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		_BITUL(0)

_BITUL() will produce an unsigned long. This isn't necessary.

Please use (1U << 0) instead. Same below.

> +
> +/*
> + * Is the route a source endpoint? A source endpoint route refers to a stream
> + * generated by the subdevice (usually a sensor), and thus there is no
> + * sink-side endpoint for the route. The sink_pad and sink_stream fields are
> + * unused.
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		_BITUL(2)
> +
> +/**
> + * struct v4l2_subdev_route - A route inside a subdev
> + *
> + * @sink_pad: the sink pad index
> + * @sink_stream: the sink stream identifier
> + * @source_pad: the source pad index
> + * @source_stream: the source stream identifier
> + * @flags: route flags V4L2_SUBDEV_ROUTE_FL_*
> + * @reserved: drivers and applications must zero this array
> + */
> +struct v4l2_subdev_route {
> +	__u32 sink_pad;
> +	__u32 sink_stream;
> +	__u32 source_pad;
> +	__u32 source_stream;
> +	__u32 flags;
> +	__u32 reserved[5];
> +};
> +
> +/**
> + * struct v4l2_subdev_routing - Subdev routing information
> + *
> + * @which: configuration type (from enum v4l2_subdev_format_whence)
> + * @num_routes: the total number of routes in the routes array
> + * @routes: pointer to the routes array
> + * @reserved: drivers and applications must zero this array
> + */
> +struct v4l2_subdev_routing {
> +	__u32 which;
> +	__u32 num_routes;
> +	__u64 routes;
> +	__u32 reserved[6];
> +};
> +
>  /* Backwards compatibility define --- to be removed */
>  #define v4l2_subdev_edid v4l2_edid
>  
> @@ -206,6 +256,8 @@ struct v4l2_subdev_capability {
>  #define VIDIOC_SUBDEV_S_CROP			_IOWR('V', 60, struct v4l2_subdev_crop)
>  #define VIDIOC_SUBDEV_G_SELECTION		_IOWR('V', 61, struct v4l2_subdev_selection)
>  #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
> +#define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
> +#define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
>  /* The following ioctls are identical to the ioctls in videodev2.h */
>  #define VIDIOC_SUBDEV_G_STD			_IOR('V', 23, v4l2_std_id)
>  #define VIDIOC_SUBDEV_S_STD			_IOW('V', 24, v4l2_std_id)

-- 
Kind regards,

Sakari Ailus
