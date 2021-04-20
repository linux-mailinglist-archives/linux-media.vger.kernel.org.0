Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861D6365D7E
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 18:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbhDTQgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 12:36:39 -0400
Received: from mga17.intel.com ([192.55.52.151]:64689 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233212AbhDTQgg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 12:36:36 -0400
IronPort-SDR: 3fjkEMvA168eq8afzqQSZP7JzKrVoqLhhzeBDL8VMGcUVEcJ35GML6MU8h0Kx7l0VmdmxD2dNw
 jBs352GeuuhA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="175646337"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="175646337"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 09:35:46 -0700
IronPort-SDR: H13IlwQ8P/tsqiCofq7l6Y/yc6rsRMzQQwy1tzWr/HOlHPK1bDkVMW5jtWnD+1zwUHXvKR3ZSw
 kzP3Ze+qTHuw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="423101765"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 09:35:44 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id B3B982051E;
        Tue, 20 Apr 2021 19:35:40 +0300 (EEST)
Date:   Tue, 20 Apr 2021 19:35:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v5 18/24] v4l: subdev: Add [GS]_ROUTING subdev ioctls and
 operations
Message-ID: <20210420163540.GU3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-19-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415130450.421168-19-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

Thanks for the update.

On Thu, Apr 15, 2021 at 04:04:44PM +0300, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
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
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 25 ++++++++++++++-
>  drivers/media/v4l2-core/v4l2-subdev.c | 45 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 24 ++++++++++++++
>  include/uapi/linux/v4l2-subdev.h      | 44 ++++++++++++++++++++++++++
>  4 files changed, 137 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 6a5d1c6d11d6..f5732962753f 100644
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
> +		struct v4l2_subdev_routing *route = parg;
> +
> +		if (route->num_routes > 256)
> +			return -EINVAL;
> +
> +		*user_ptr = u64_to_user_ptr(route->routes);
> +		*kernel_ptr = (void **)&route->routes;
> +		*array_size = sizeof(struct v4l2_subdev_route)
> +			    * route->num_routes;
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
> index 956dafab43d4..95a4c3091fa6 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -681,6 +681,51 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_QUERYSTD:
>  		return v4l2_subdev_call(sd, video, querystd, arg);
>  
> +	case VIDIOC_SUBDEV_G_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_krouting krouting = {
> +			.which = routing->which,
> +			.num_routes = routing->num_routes,
> +			.routes = (struct v4l2_subdev_route *)(uintptr_t)routing->routes,

Please wrap to stay under 80 characters per line. Same below.

> +		};
> +		int ret;
> +
> +		ret = v4l2_subdev_call(sd, pad, get_routing, &krouting);
> +		if (ret)
> +			return ret;
> +
> +		routing->num_routes = krouting.num_routes;
> +
> +		return 0;
> +	}
> +
> +	case VIDIOC_SUBDEV_S_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_route *route = (struct v4l2_subdev_route *)(uintptr_t)
> +						  routing->routes;
> +		struct v4l2_subdev_krouting krouting = {};
> +		unsigned int i;
> +
> +		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> +			return -EPERM;
> +
> +		for (i = 0; i < routing->num_routes; ++i) {
> +			if (route[i].sink_pad >= sd->entity.num_pads ||
> +			    route[i].source_pad >= sd->entity.num_pads)
> +				return -EINVAL;
> +
> +			if (!(sd->entity.pads[route[i].sink_pad].flags & MEDIA_PAD_FL_SINK) ||
> +			    !(sd->entity.pads[route[i].source_pad].flags & MEDIA_PAD_FL_SOURCE))
> +				return -EINVAL;
> +		}
> +
> +		krouting.which = routing->which;
> +		krouting.num_routes = routing->num_routes;
> +		krouting.routes = route;
> +
> +		return v4l2_subdev_call(sd, pad, set_routing, &krouting);
> +	}
> +
>  	default:
>  		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 436d0445aafd..3826ab918731 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -650,6 +650,22 @@ struct v4l2_subdev_pad_config {
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
> + * This structure is used to translate argument received from
> + * VIDIOC_SUBDEV_G/S_ROUTING() ioctl to sudev device drivers operations.
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
> @@ -711,6 +727,10 @@ struct v4l2_subdev_pad_config {
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
> @@ -755,6 +775,10 @@ struct v4l2_subdev_pad_ops {
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
> index 658106f5b5dc..f2a17cbd1e9a 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -188,6 +188,48 @@ struct v4l2_subdev_capability {
>  /* The v4l2 sub-device video device node is registered in read-only mode. */
>  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>  
> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		BIT(0)
> +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		BIT(1)
> +
> +/**
> + * struct v4l2_subdev_route - A route inside a subdev
> + *
> + * @sink_pad: the sink pad index
> + * @sink_stream: the sink stream identifier
> + * @source_pad: the source pad index
> + * @source_stream: the source stream identifier
> + * @flags: route flags:
> + *
> + *	V4L2_SUBDEV_ROUTE_FL_ACTIVE: Is the route active? An active
> + *	route will start when streaming is enabled on a video node.
> + *	Set by the user.
> + *
> + *	V4L2_SUBDEV_ROUTE_FL_IMMUTABLE: Is the route immutable, i.e.
> + *	can it be activated and inactivated? Set by the driver.
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
> + * @which: format type (from enum v4l2_subdev_format_whence)
> + * @routes: pointer to the routes array
> + * @num_routes: the total number of routes in the routes array
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
> @@ -215,5 +257,7 @@ struct v4l2_subdev_capability {
>  #define VIDIOC_SUBDEV_ENUM_DV_TIMINGS		_IOWR('V', 98, struct v4l2_enum_dv_timings)
>  #define VIDIOC_SUBDEV_QUERY_DV_TIMINGS		_IOR('V', 99, struct v4l2_dv_timings)
>  #define VIDIOC_SUBDEV_DV_TIMINGS_CAP		_IOWR('V', 100, struct v4l2_dv_timings_cap)
> +#define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
> +#define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
>  
>  #endif
> -- 
> 2.25.1
> 

-- 
Sakari Ailus
