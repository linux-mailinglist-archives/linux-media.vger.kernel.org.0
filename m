Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84528427FD7
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 09:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJJHip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Oct 2021 03:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhJJHio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Oct 2021 03:38:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDA0C061570
        for <linux-media@vger.kernel.org>; Sun, 10 Oct 2021 00:36:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E9262A8;
        Sun, 10 Oct 2021 09:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633851401;
        bh=6Uhub4ETZ7WKlYqw9r/gAbaAb5lOsMcidBFTvLjkm1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wDPoLkUYpgwtmrbUBVEB88eGArB8xRtFDS/nTlwz9jpfnkrZEIvQwAK/dMTNfb4kw
         7gv06Z88y8KyxQ6MZzGOOHu2A9QKTXATTaM9tgJ9r8AUu3H1704gPqR1TJPCHqcvL5
         P+8GUatr3iQCv1xn2Fngkgd3QbrSSkO4mmPiqK8w=
Date:   Sun, 10 Oct 2021 10:36:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <YWKX/f09BoqVAPSu@pendragon.ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Oct 05, 2021 at 11:57:41AM +0300, Tomi Valkeinen wrote:
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
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 25 ++++++++-
>  drivers/media/v4l2-core/v4l2-subdev.c | 75 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 22 ++++++++
>  include/uapi/linux/v4l2-subdev.h      | 57 ++++++++++++++++++++
>  4 files changed, 178 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 05d5db3d85e5..8e9315ffcb99 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -16,6 +16,7 @@
>  #include <linux/kernel.h>
>  #include <linux/version.h>
>  
> +#include <linux/v4l2-subdev.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/v4l2-common.h>
> @@ -3065,6 +3066,21 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
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
> @@ -3328,8 +3344,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
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
> index 52309a299b03..b4e1f8772d96 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -394,6 +394,12 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  		which = ((struct v4l2_subdev_selection *)arg)->which;
>  		break;
>  	}
> +
> +	case VIDIOC_SUBDEV_G_ROUTING:
> +	case VIDIOC_SUBDEV_S_ROUTING: {
> +		which = ((struct v4l2_subdev_routing *)arg)->which;
> +		break;
> +	}
>  	}
>  
>  	return which == V4L2_SUBDEV_FORMAT_TRY ?
> @@ -710,6 +716,74 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_QUERYSTD:
>  		return v4l2_subdev_call(sd, video, querystd, arg);
>  
> +	case VIDIOC_SUBDEV_G_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_krouting *krouting;
> +
> +		if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
> +			return -ENOIOCTLCMD;

Do we really want to condition the routing API to multiplexed streams
support ? Internal subdev routing is useful for devices that don't
support multiplexed streams, and forcing a switch to the multiplexed
streams API for those concerns me. In particular, with the multiplexed
streams API, pad formats only exist once routes are created. This is a
major change compared to the existing API (and it led to the creation of
the V4L2_SUBDEV_ROUTE_FL_SOURCE flag, which I'm still not entirely sure
I like) and I don't have a good enough view of all its side effects yet.

This being said, if conditioning formats availability on pads to the
existence of routes causes issues for such devices, maybe they would be
better solved globally, as they could affect devices supporting
multiplexed streams too.

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
> +		if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
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
> @@ -970,6 +1044,7 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>  
>  	mutex_destroy(&state->lock);
>  
> +	kvfree(state->routing.routes);
>  	kvfree(state->pads);
>  	kfree(state);
>  }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 7f9c83fac020..f318670a49c8 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -694,11 +694,25 @@ struct v4l2_subdev_pad_config {
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
>   * @lock: mutex for the state
>   * @pads: &struct v4l2_subdev_pad_config array
> + * @routing: routing table for the subdev
>   *
>   * This structure only needs to be passed to the pad op if the 'which' field
>   * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
> @@ -707,6 +721,7 @@ struct v4l2_subdev_pad_config {
>  struct v4l2_subdev_state {
>  	struct mutex lock;
>  	struct v4l2_subdev_pad_config *pads;
> +	struct v4l2_subdev_krouting routing;
>  };
>  
>  /**
> @@ -770,6 +785,9 @@ struct v4l2_subdev_state {
>   *		     applied to the hardware. The operation shall fail if the
>   *		     pad index it has been called on is not valid or in case of
>   *		     unrecoverable failures.
> + *
> + * @set_routing: enable or disable data connection routes described in the
> + *		 subdevice routing table.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -814,6 +832,10 @@ struct v4l2_subdev_pad_ops {
>  			       struct v4l2_mbus_config *config);
>  	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
>  			       struct v4l2_mbus_config *config);
> +	int (*set_routing)(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state,
> +			   enum v4l2_subdev_format_whence which,
> +			   struct v4l2_subdev_krouting *route);
>  };
>  
>  /**
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 658106f5b5dc..5ba409db47ff 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -188,6 +188,61 @@ struct v4l2_subdev_capability {
>  /* The v4l2 sub-device video device node is registered in read-only mode. */
>  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>  
> +/*
> + * Is the route active? An active route will start when streaming is enabled
> + * on a video node.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1 << 0)
> +
> +/*
> + * Is the route immutable, i.e. can it be activated and inactivated?
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1 << 1)
> +
> +/*
> + * Is the route a source endpoint? A source endpoint route refers to a stream
> + * generated internally by the subdevice (usually a sensor), and thus there
> + * is no sink-side endpoint for the route. The sink_pad and sink_stream
> + * fields are unused.
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		(1 << 2)
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
> + * @routes: pointer to the routes array
> + * @num_routes: the total number of routes in the routes array
> + * @reserved: drivers and applications must zero this array
> + */
> +struct v4l2_subdev_routing {
> +	__u32 which;
> +	__u64 routes;
> +	__u32 num_routes;
> +	__u32 reserved[5];
> +};
> +
>  /* Backwards compatibility define --- to be removed */
>  #define v4l2_subdev_edid v4l2_edid
>  
> @@ -203,6 +258,8 @@ struct v4l2_subdev_capability {
>  #define VIDIOC_SUBDEV_S_CROP			_IOWR('V', 60, struct v4l2_subdev_crop)
>  #define VIDIOC_SUBDEV_G_SELECTION		_IOWR('V', 61, struct v4l2_subdev_selection)
>  #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
> +#define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
> +#define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
>  /* The following ioctls are identical to the ioctls in videodev2.h */
>  #define VIDIOC_SUBDEV_G_STD			_IOR('V', 23, v4l2_std_id)
>  #define VIDIOC_SUBDEV_S_STD			_IOW('V', 24, v4l2_std_id)

-- 
Regards,

Laurent Pinchart
