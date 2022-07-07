Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4056D569E6A
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 11:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234118AbiGGJPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 05:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235144AbiGGJPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 05:15:30 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1DF2C112
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 02:15:28 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id w185so14444820pfb.4
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 02:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UofbwK+m/YgdKFiEEUzyPCzpFSWuf/MawiqpfH5qoOI=;
        b=ZcE6ZTPhLV5a0MsMklwqEJKCjXD67/CM02d9odnNJBc4H0EUM4MwpLvVcmNOm8SlBw
         jQy5SJlzsg3o1dkN7bBKUt7emIRMKPQXq6FEH30hcZSSAjcCf+/6oyRPRiDmQvFyD1vC
         kqL3K6VCGYhgMjdm6l62tSUwD9G7Pu3KZy2Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UofbwK+m/YgdKFiEEUzyPCzpFSWuf/MawiqpfH5qoOI=;
        b=P8i4qyFvdtwIyIF2E3qQDUnKDgIxoLqFoTpWhBCwl2YWirTiu3LUS5w4+YlEAv+BsV
         +Hj6drDZMJH1Mf6PRo15u5yEp2HTtqAf6tfNIGbKXqm8oz0lciNiBGB5V3UwJruO+IKF
         6A+2kpn6M3X40gg3MFI3Eup7c0Lw5N0DaSnt0/80kwQ5zg3dpFLm7jf82Fwi5IcW/TqV
         9jmLGRTF805mbPbLfqs1xA2EFEUFa60X6G8+0+eeArLGAqER7bznd0ZE5q94lOOOlL0y
         F3QgP9mut8OBUhgSE2ow7iETVmH/Q74Hf0lJf0cQ/gp3coXTH8Pg0diFbNg7+UY+7BJc
         4u2Q==
X-Gm-Message-State: AJIora8SMmPecUU1NDQ8O6AJX/vNbW+GmMCe8I2XlY/9p7dB48l5nbN5
        FTW580+C1IG3a/Tbpx9cIDFrfQ==
X-Google-Smtp-Source: AGRyM1sN39mnHOL0mo3EAxzcS6TnC8snY07TfcTb0h0y5D7BRpvjmI/fo9dHQBF7WRZ6bEuUNB/7EA==
X-Received: by 2002:a63:ee14:0:b0:414:1a88:3b96 with SMTP id e20-20020a63ee14000000b004141a883b96mr1361045pgi.364.1657185328273;
        Thu, 07 Jul 2022 02:15:28 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:e189:4251:f442:cb5b])
        by smtp.gmail.com with ESMTPSA id c128-20020a624e86000000b005286a4ca9c8sm7221648pfb.211.2022.07.07.02.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:15:27 -0700 (PDT)
Date:   Thu, 7 Jul 2022 18:15:24 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v11 22/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <YsakLCHbfKF3R7vd@chromium.org>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-23-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-23-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi, Laurent,

On Tue, Mar 01, 2022 at 06:11:42PM +0200, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Add support for subdev internal routing. A route is defined as a single
> stream from a sink pad to a source pad.
> 
> The userspace can configure the routing via two new ioctls,
> VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
> implement the functionality with v4l2_subdev_pad_ops.set_routing().

Thanks for the patch! Please check my comment inline.

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
>  drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 22 ++++++++
>  include/uapi/linux/v4l2-subdev.h      | 57 +++++++++++++++++++++
>  4 files changed, 176 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 642cb90f457c..add3b28d446e 100644
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
> @@ -3093,6 +3094,21 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>  		ret = 1;
>  		break;
>  	}
> +
> +	case VIDIOC_SUBDEV_G_ROUTING:
> +	case VIDIOC_SUBDEV_S_ROUTING: {
> +		struct v4l2_subdev_routing *routing = parg;
> +
> +		if (routing->num_routes > 256)

Should we define and document this constant?

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
> @@ -3356,8 +3372,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
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
> index 3ad24093abe9..89c97bde4575 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -377,6 +377,10 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
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
> @@ -692,6 +696,74 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_QUERYSTD:
>  		return v4l2_subdev_call(sd, video, querystd, arg);
>  
> +	case VIDIOC_SUBDEV_G_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_krouting *krouting;
> +
> +		if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
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
> @@ -979,6 +1051,7 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>  
>  	mutex_destroy(&state->_lock);
>  
> +	kfree(state->routing.routes);

Do we have any guarantee that this array was allocated with kmalloc()?
Maybe kvfree() could be more appropriate here?

Best regards,
Tomasz

