Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86FE236E33D
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 04:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbhD2C3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 22:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhD2C3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 22:29:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1765C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 19:28:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FC5DBC0;
        Thu, 29 Apr 2021 04:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619663291;
        bh=jx3nzgHYH3s8TW+UBptsbsT5sXfaxbHZpOaWPFBPEcI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rJRqzEi7gWr6wyAGqhyFUVCyiQcnm049Xth0b25PbY91dY+lpE2tDaw6Ua/HqECNA
         wzRyYwmkAw+5TQsVfOxTWBNGAg01+5crstaUhJe7ft+Xf8uci0ezAR33P4SsxZ5brl
         IzygTgceaE+BNxEuJlI3HO1PZUptl7NO+V+qC5ng=
Date:   Thu, 29 Apr 2021 05:28:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v6 18/24] v4l: subdev: Add [GS]_ROUTING subdev ioctls and
 operations
Message-ID: <YIoZteLxCX+A142n@pendragon.ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-19-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210427124523.990938-19-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

For some reason, it seems the original authorship got lost. It was fine
in v5. I haven't checked if other patches in the series are affected.

On Tue, Apr 27, 2021 at 03:45:17PM +0300, Tomi Valkeinen wrote:
> Add support for subdev internal routing. A route is defined as a single
> stream from a sink pad to a source pad.
> 
> The userspace can configure the routing via two new ioctls,
> VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
> implement the functionality with v4l2_subdev_pad_ops.get_routing() and
> v4l2_subdev_pad_ops.set_routing().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> 
> - Add sink and source streams for multiplexed links
> - Copy the argument back in case of an error. This is needed to let the
>   caller know the number of routes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 25 +++++++++++++-
>  drivers/media/v4l2-core/v4l2-subdev.c | 46 +++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 24 ++++++++++++++
>  include/uapi/linux/v4l2-subdev.h      | 48 +++++++++++++++++++++++++++
>  4 files changed, 142 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 6a5d1c6d11d6..7b1dabc23909 100644
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
> @@ -3108,6 +3109,21 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
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
> @@ -3369,8 +3385,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
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
> index 956dafab43d4..ad79ce121cee 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -681,6 +681,52 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_QUERYSTD:
>  		return v4l2_subdev_call(sd, video, querystd, arg);
>  
> +	case VIDIOC_SUBDEV_G_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_krouting krouting = {
> +			.which = routing->which,
> +			.num_routes = routing->num_routes,
> +			.routes = (struct v4l2_subdev_route *)(uintptr_t)
> +					  routing->routes,
> +		};
> +		int ret;
> +
> +		ret = v4l2_subdev_call(sd, pad, get_routing, &krouting);
> +
> +		routing->num_routes = krouting.num_routes;
> +
> +		return ret;
> +	}
> +
> +	case VIDIOC_SUBDEV_S_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_route *routes =
> +			(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> +		struct v4l2_subdev_krouting krouting = {};
> +		unsigned int i;
> +
> +		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> +			return -EPERM;
> +
> +		for (i = 0; i < routing->num_routes; ++i) {
> +			if (routes[i].sink_pad >= sd->entity.num_pads ||
> +			    routes[i].source_pad >= sd->entity.num_pads)
> +				return -EINVAL;
> +
> +			if (!(sd->entity.pads[routes[i].sink_pad].flags &
> +			      MEDIA_PAD_FL_SINK) ||
> +			    !(sd->entity.pads[routes[i].source_pad].flags &
> +			      MEDIA_PAD_FL_SOURCE))
> +				return -EINVAL;
> +		}
> +
> +		krouting.which = routing->which;
> +		krouting.num_routes = routing->num_routes;
> +		krouting.routes = routes;
> +
> +		return v4l2_subdev_call(sd, pad, set_routing, &krouting);
> +	}
> +
>  	default:
>  		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 70a21298020b..c45f5f0156c9 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -660,6 +660,22 @@ struct v4l2_subdev_pad_config {
>  	struct v4l2_rect try_compose;
>  };
>  
> +/**
> + * struct v4l2_subdev_krouting - subdev routing table
> + *
> + * @which: format type (from enum v4l2_subdev_format_whence)
> + * @routes: &struct v4l2_subdev_route
> + * @num_routes: number of routes
> + *
> + * This structure is used to translate arguments received from
> + * VIDIOC_SUBDEV_G/S_ROUTING() ioctl to subdev device drivers operations.
> + */
> +struct v4l2_subdev_krouting {
> +	u32 which;
> +	struct v4l2_subdev_route *routes;
> +	unsigned int num_routes;
> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -721,6 +737,10 @@ struct v4l2_subdev_pad_config {
>   *		     applied to the hardware. The operation shall fail if the
>   *		     pad index it has been called on is not valid or in case of
>   *		     unrecoverable failures.
> + *
> + * @get_routing: get the subdevice routing table.
> + * @set_routing: enable or disable data connection routes described in the
> + *		 subdevice routing table.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -765,6 +785,10 @@ struct v4l2_subdev_pad_ops {
>  			       struct v4l2_mbus_config *config);
>  	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
>  			       struct v4l2_mbus_config *config);
> +	int (*get_routing)(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_krouting *route);
> +	int (*set_routing)(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_krouting *route);
>  };
>  
>  /**
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 658106f5b5dc..3a360cdcacf4 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -188,6 +188,52 @@ struct v4l2_subdev_capability {
>  /* The v4l2 sub-device video device node is registered in read-only mode. */
>  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>  
> +/*

Shouldn't this be /** ?

> + * Is the route active? An active route will start when streaming is enabled
> + * on a video node.

Even with an a priori knowledge of the topic, I'm not sure to really
understand this, and I don't think it reflects the purpose of the flag.

> + */
> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		BIT(0)
> +
> +/*
> + * Is the route immutable, i.e. can it be activated and inactivated?

Maybe adding "An immutable route is always active".

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		BIT(1)
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
> @@ -203,6 +249,8 @@ struct v4l2_subdev_capability {
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
