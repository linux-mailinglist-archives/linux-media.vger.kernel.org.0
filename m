Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC17047C51B
	for <lists+linux-media@lfdr.de>; Tue, 21 Dec 2021 18:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240445AbhLURiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 12:38:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234411AbhLURiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 12:38:11 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE31EC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 09:38:10 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q16so28449456wrg.7
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 09:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nn5WfsCpUU5MkeUHPxOv0u0+RqvCR0jEMDaile2VPmA=;
        b=VHRmtA+fKQcUDJGSPhFYM5FfFeGR8o0YMe07kY8XpByzkVkrBLXpN10BKUskr0QMk6
         TYeC/Jzihek5eeco0DsyUZChOwaAJxk/E27aquQh2KwH+Dw3RNnxX5Xu3kX5tH2OHpy4
         MayYMuaDEr/kHiX5qZFntsQNHl933BWy5RjwRqyOdYHrwHPxJIrlwOVozrUVk88iHk5W
         45MHNvzQLVTNIeRYBFrk0IlTt4mF8SXSZwdp5a25hxmMxmkSs/eAsWmDUpBBIgBolmtp
         5E/7yLGv6iVNY02cjPz5qF1ark2MbLgmCvD4kHed2ZEi8lQxU7EklLbW8E1RuP4BcYQ1
         k6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nn5WfsCpUU5MkeUHPxOv0u0+RqvCR0jEMDaile2VPmA=;
        b=OSHor4q2sTXexKjIkhM4DXS2YrKNNvbYwbTGJN2yuV96tkfEgJjwWUOCqJHwqXRfgQ
         oJ3oLpKTfjeMayVQKzzHkS846JAvqA42xrLF5qyIDp8x1mrn0ruyKn2Fj5QyWTVzIMjN
         wZ4+YFWIrWgG/p/Ej8Ao6Yb2KRfpeZi90qywkrVQkT95rhNaf9/bXdj3tIuZepTwC5Ya
         sGVcdKGkv3bvKr3jmANTpZHxyF7RLqze/syJz3adtb+e6iH0Hd1xiaYwh1l5B7wKTNbO
         6nwE08Xq+6p3vW/H0gRHVKQ6csa5T6K8yANYhZVJr95VNV+3UgXS5w32Yr5QaNW81HRA
         oBrA==
X-Gm-Message-State: AOAM533Y6GMmpAsWvWBcMh1mi2HIMyeQA+phq57A/khik2rKQgFc9dkJ
        jMrGvOlQcTgMyg7oJWa4Cg2yIRuJJ8qh+apPfo53ZA==
X-Google-Smtp-Source: ABdhPJwDkgtZJS2FSe6Uj1Sur0gan/td6zfbK+HqvDdlbLorDjk8Hyvh37zJiRuqG6nFPK0t+W1jGQq1N8JqzMKeatg=
X-Received: by 2002:a05:6000:156b:: with SMTP id 11mr1575858wrz.261.1640108289440;
 Tue, 21 Dec 2021 09:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com> <20211130141536.891878-29-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20211130141536.891878-29-tomi.valkeinen@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 21 Dec 2021 17:37:53 +0000
Message-ID: <CAPY8ntA-d5dub4E=rqFyQRTMcSNF4AV3zGG2Xg5mGW-guRDR+A@mail.gmail.com>
Subject: Re: [PATCH v10 28/38] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Tue, 30 Nov 2021 at 14:17, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Add support for subdev internal routing. A route is defined as a single
> stream from a sink pad to a source pad.
>
> The userspace can configure the routing via two new ioctls,
> VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
> implement the functionality with v4l2_subdev_pad_ops.set_routing().

Minor point on naming. We already have an s_routing function in and
struct v4l2_subdev_audio_ops and struct v4l2_subdev_video_ops.
Having a new IOCTL that actually doesn't map onto the function of the
same name caused me a few minutes of head scratching, and I suspect it
will for others too.

  Dave

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
>                 ret = 1;
>                 break;
>         }
> +
> +       case VIDIOC_SUBDEV_G_ROUTING:
> +       case VIDIOC_SUBDEV_S_ROUTING: {
> +               struct v4l2_subdev_routing *routing = parg;
> +
> +               if (routing->num_routes > 256)
> +                       return -EINVAL;
> +
> +               *user_ptr = u64_to_user_ptr(routing->routes);
> +               *kernel_ptr = (void **)&routing->routes;
> +               *array_size = sizeof(struct v4l2_subdev_route)
> +                           * routing->num_routes;
> +               ret = 1;
> +               break;
> +       }
>         }
>
>         return ret;
> @@ -3328,8 +3344,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>         /*
>          * Some ioctls can return an error, but still have valid
>          * results that must be returned.
> +        *
> +        * FIXME: subdev IOCTLS are partially handled here and partially in
> +        * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
> +        * defined here as part of the 'v4l2_ioctls' array. As
> +        * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
> +        * in case of failure, but it is not defined here as part of the
> +        * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
>          */
> -       if (err < 0 && !always_copy)
> +       if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
>                 goto out;
>
>  out_array_args:
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 721148e35624..06e234e0aa98 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -394,6 +394,12 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>                 which = ((struct v4l2_subdev_selection *)arg)->which;
>                 break;
>         }
> +
> +       case VIDIOC_SUBDEV_G_ROUTING:
> +       case VIDIOC_SUBDEV_S_ROUTING: {
> +               which = ((struct v4l2_subdev_routing *)arg)->which;
> +               break;
> +       }
>         }
>
>         return which == V4L2_SUBDEV_FORMAT_TRY ?
> @@ -712,6 +718,74 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>         case VIDIOC_SUBDEV_QUERYSTD:
>                 return v4l2_subdev_call(sd, video, querystd, arg);
>
> +       case VIDIOC_SUBDEV_G_ROUTING: {
> +               struct v4l2_subdev_routing *routing = arg;
> +               struct v4l2_subdev_krouting *krouting;
> +
> +               if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
> +                       return -ENOIOCTLCMD;
> +
> +               memset(routing->reserved, 0, sizeof(routing->reserved));
> +
> +               krouting = &state->routing;
> +
> +               if (routing->num_routes < krouting->num_routes) {
> +                       routing->num_routes = krouting->num_routes;
> +                       return -ENOSPC;
> +               }
> +
> +               memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +                      krouting->routes,
> +                      krouting->num_routes * sizeof(*krouting->routes));
> +               routing->num_routes = krouting->num_routes;
> +
> +               return 0;
> +       }
> +
> +       case VIDIOC_SUBDEV_S_ROUTING: {
> +               struct v4l2_subdev_routing *routing = arg;
> +               struct v4l2_subdev_route *routes =
> +                       (struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> +               struct v4l2_subdev_krouting krouting = {};
> +               unsigned int i;
> +
> +               if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
> +                       return -ENOIOCTLCMD;
> +
> +               if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> +                       return -EPERM;
> +
> +               memset(routing->reserved, 0, sizeof(routing->reserved));
> +
> +               for (i = 0; i < routing->num_routes; ++i) {
> +                       const struct v4l2_subdev_route *route = &routes[i];
> +                       const struct media_pad *pads = sd->entity.pads;
> +
> +                       /* Do not check sink pad for source routes */
> +                       if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
> +                               if (route->sink_pad >= sd->entity.num_pads)
> +                                       return -EINVAL;
> +
> +                               if (!(pads[route->sink_pad].flags &
> +                                     MEDIA_PAD_FL_SINK))
> +                                       return -EINVAL;
> +                       }
> +
> +                       if (route->source_pad >= sd->entity.num_pads)
> +                               return -EINVAL;
> +
> +                       if (!(pads[route->source_pad].flags &
> +                             MEDIA_PAD_FL_SOURCE))
> +                               return -EINVAL;
> +               }
> +
> +               krouting.num_routes = routing->num_routes;
> +               krouting.routes = routes;
> +
> +               return v4l2_subdev_call(sd, pad, set_routing, state,
> +                                       routing->which, &krouting);
> +       }
> +
>         default:
>                 return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>         }
> @@ -972,6 +1046,7 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>
>         mutex_destroy(&state->lock);
>
> +       kfree(state->routing.routes);
>         kvfree(state->pads);
>         kfree(state);
>  }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 45861bcdccf5..946455cc1f01 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -697,11 +697,25 @@ struct v4l2_subdev_pad_config {
>         struct v4l2_rect try_compose;
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
> +       unsigned int num_routes;
> +       struct v4l2_subdev_route *routes;
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
> @@ -711,6 +725,7 @@ struct v4l2_subdev_state {
>         /* lock for the struct v4l2_subdev_state fields */
>         struct mutex lock;
>         struct v4l2_subdev_pad_config *pads;
> +       struct v4l2_subdev_krouting routing;
>  };
>
>  /**
> @@ -774,6 +789,9 @@ struct v4l2_subdev_state {
>   *                  applied to the hardware. The operation shall fail if the
>   *                  pad index it has been called on is not valid or in case of
>   *                  unrecoverable failures.
> + *
> + * @set_routing: enable or disable data connection routes described in the
> + *              subdevice routing table.
>   */
>  struct v4l2_subdev_pad_ops {
>         int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -818,6 +836,10 @@ struct v4l2_subdev_pad_ops {
>                                struct v4l2_mbus_config *config);
>         int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
>                                struct v4l2_mbus_config *config);
> +       int (*set_routing)(struct v4l2_subdev *sd,
> +                          struct v4l2_subdev_state *state,
> +                          enum v4l2_subdev_format_whence which,
> +                          struct v4l2_subdev_krouting *route);
>  };
>
>  /**
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index d91ab6f22fa7..1ec3141bf860 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -191,6 +191,61 @@ struct v4l2_subdev_capability {
>  /* The v4l2 sub-device supports multiplexed streams. */
>  #define V4L2_SUBDEV_CAP_MPLEXED                        0x00000002
>
> +/*
> + * Is the route active? An active route will start when streaming is enabled
> + * on a video node.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE            _BITUL(0)
> +
> +/*
> + * Is the route immutable, i.e. can it be activated and inactivated?
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE         _BITUL(1)
> +
> +/*
> + * Is the route a source endpoint? A source endpoint route refers to a stream
> + * generated internally by the subdevice (usually a sensor), and thus there
> + * is no sink-side endpoint for the route. The sink_pad and sink_stream
> + * fields are unused.
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE            _BITUL(2)
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
> +       __u32 sink_pad;
> +       __u32 sink_stream;
> +       __u32 source_pad;
> +       __u32 source_stream;
> +       __u32 flags;
> +       __u32 reserved[5];
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
> +       __u32 which;
> +       __u32 num_routes;
> +       __u64 routes;
> +       __u32 reserved[6];
> +};
> +
>  /* Backwards compatibility define --- to be removed */
>  #define v4l2_subdev_edid v4l2_edid
>
> @@ -206,6 +261,8 @@ struct v4l2_subdev_capability {
>  #define VIDIOC_SUBDEV_S_CROP                   _IOWR('V', 60, struct v4l2_subdev_crop)
>  #define VIDIOC_SUBDEV_G_SELECTION              _IOWR('V', 61, struct v4l2_subdev_selection)
>  #define VIDIOC_SUBDEV_S_SELECTION              _IOWR('V', 62, struct v4l2_subdev_selection)
> +#define VIDIOC_SUBDEV_G_ROUTING                        _IOWR('V', 38, struct v4l2_subdev_routing)
> +#define VIDIOC_SUBDEV_S_ROUTING                        _IOWR('V', 39, struct v4l2_subdev_routing)
>  /* The following ioctls are identical to the ioctls in videodev2.h */
>  #define VIDIOC_SUBDEV_G_STD                    _IOR('V', 23, v4l2_std_id)
>  #define VIDIOC_SUBDEV_S_STD                    _IOW('V', 24, v4l2_std_id)
> --
> 2.25.1
>
