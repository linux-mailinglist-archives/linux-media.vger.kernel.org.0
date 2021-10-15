Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519CA42F4AE
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 16:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239940AbhJOOGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 10:06:52 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:36597 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239879AbhJOOGt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 10:06:49 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5F8DE40011;
        Fri, 15 Oct 2021 14:04:39 +0000 (UTC)
Date:   Fri, 15 Oct 2021 16:05:27 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <20211015140527.sjgtljfymhqzzflr@uno.localdomain>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
 <20211015121320.c7ctjcvyvwx4mhy4@uno.localdomain>
 <465623f3-c022-7ed3-29c3-d82a0cf8c952@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="thcigvypmsds3pxc"
Content-Disposition: inline
In-Reply-To: <465623f3-c022-7ed3-29c3-d82a0cf8c952@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--thcigvypmsds3pxc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Tomi,

On Fri, Oct 15, 2021 at 03:36:58PM +0300, Tomi Valkeinen wrote:
> Hi,
>
> On 15/10/2021 15:13, Jacopo Mondi wrote:
>
> > > +/**
> > > + * struct v4l2_subdev_krouting - subdev routing table
> > > + *
> > > + * @num_routes: number of routes
> > > + * @routes: &struct v4l2_subdev_route
> > > + *
> > > + * This structure contains the routing table for a subdev.
> > > + */
> > > +struct v4l2_subdev_krouting {
> > > +	unsigned int num_routes;
> > > +	struct v4l2_subdev_route *routes;
> > > +};
> >
> > Re-reading v8
> > https://patchwork.linuxtv.org/project/linux-media/patch/20210830110116.488338-3-tomi.valkeinen@ideasonboard.com/#131630
> >
> > my understanding was that your intention was to pass to the
> > set_routing() op the num_routes, *routes and which and drop
> > v4l2_subdev_krouting
>
> No, that was not what I meant. But I did write it a bit unclearly, I
> admit...
>
> I think I meant "drop v4l2_subdev_krouting, and pass
> v4l2_subdev_routing_table to the ops".
>
> > > +
> > >   /**
> > >    * struct v4l2_subdev_state - Used for storing subdev state information.
> > >    *
> > >    * @lock: mutex for the state
> > >    * @pads: &struct v4l2_subdev_pad_config array
> > > + * @routing: routing table for the subdev
> > >    *
> > >    * This structure only needs to be passed to the pad op if the 'which' field
> > >    * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
> > > @@ -707,6 +721,7 @@ struct v4l2_subdev_pad_config {
> > >   struct v4l2_subdev_state {
> > >   	struct mutex lock;
> > >   	struct v4l2_subdev_pad_config *pads;
> > > +	struct v4l2_subdev_krouting routing;
> > >   };
> > >
> > >   /**
> > > @@ -770,6 +785,9 @@ struct v4l2_subdev_state {
> > >    *		     applied to the hardware. The operation shall fail if the
> > >    *		     pad index it has been called on is not valid or in case of
> > >    *		     unrecoverable failures.
> > > + *
> > > + * @set_routing: enable or disable data connection routes described in the
> > > + *		 subdevice routing table.
> > >    */
> > >   struct v4l2_subdev_pad_ops {
> > >   	int (*init_cfg)(struct v4l2_subdev *sd,
> > > @@ -814,6 +832,10 @@ struct v4l2_subdev_pad_ops {
> > >   			       struct v4l2_mbus_config *config);
> > >   	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > >   			       struct v4l2_mbus_config *config);
> > > +	int (*set_routing)(struct v4l2_subdev *sd,
> > > +			   struct v4l2_subdev_state *state,
> > > +			   enum v4l2_subdev_format_whence which,
> > > +			   struct v4l2_subdev_krouting *route);
> >
> > But it seems you've instead coalesced v4l2_subdev_routing_table into
> > v4l2_subdev_krouting (which I like!)
> >
> > But why keep 'which' as a standalone parameter instead of adding it to
> > v4l2_subdev_krouting ? This operation signature is a bit of an
> > outliner as other ops have 'which' embedded in op-specific
> > structures.
>
> The whole point here was to remove 'which'. Otherwise the routing table
> contains 'which', and the drivers somehow need to come up with a correct
> 'which' value, which was causing trouble.
>
> E.g. in init_cfg, you want to set up routing. But init_cfg is supposed to be
> 'which-less', the init should be the same for both active and try states.
>
> The only use of 'which' in the routing table is when calling set_routing().
> It's never needed after that. So it's pointless to store the 'which' value
> in the state.
>
> The other ops have a struct as a parameter that comes directly from the
> userspace, and thus contains the 'which'. But any data they store to the
> state does not contain 'which'.
>
> So, we could do the same, have the structs as they are in the mail you
> linked. But then we have the struct v4l2_subdev_krouting, which is only used
> when calling set_routing, and the only purpose of that struct would be to
> avoid passing 'which' as a parameter to set_routing...

Ok, I understand this allow you to

        int _set_routing(sd, state, krouting)
        {
                v4l2_subdev_set_routing(krouting);

        }

        int set_routing(sd, state, which, krouting)
        {
                _set_routing(sd, state, krouting);
                if (which == ACTIVE)
                        apply_to_hw();
        }

        pad_ops ops = {
                .set_routing = set_routing,
        };

        int init_cfg(sd, state)
        {
                routes = {
                        ...
                };

                krouting routing {
                        .routes = routes,
                        .num_routes = 1,
                };

                _set_routing(sd, state, &routing);
        }

We're moving the issue with init_cfg() not being aware of the
active/try to the set_routing() operation signature (and in cascade to
all operation that operate on krouting from where 'which' had been
removed to comply with init_cfg).

I was actually advocating instead for adding back which to
krouting and have all the other v4l2_subdev functions that operates on
routing and do not care about 'which' to use the raw routes and their
number


        --- v4l2-subdev.h/c ---

        struct krouting {
                which;
                num_routes;
                routes;
        };

        int v4l2_subdev_set_routing(sd, state, routes, num_routes)
        {

                /* Copy routes into state */

        }

        ---- subdevice driver ----

        int _set_routing(sd, state, routes, num_routes)
        {
                return v4l2_subdev_set_routing(sd, state, routes,
                                               num_routes);

        }

        int set_routing(sd, state, krouting)
        {
                _set_routing(sd, state, krouting->routes, krouting->num_routes)

                if (krouting->which == ACTIVE)
                        apply_to_hw();
        }

        pad_ops ops = {
                .set_routing = set_routing,
        };

        int init_cfg(sd, state)
        {
                routes routing[] = {
                        ...
                };

                _set_routing(sd, state, routing, ARRAY_SIZE(routing));
        }

So that
- krouting contains 'which' but is only used in the set_routing
  operation
- init_cfg doesn't have to initialize a krouting just for the purpose
  of pleasing the v4l2_subdev function signatures

It requires to remove krouting from all the v4l2_subdev_*route*()
functions in v4l2_subdev.c and have them work on the raw routes
('routes' and 'num_routes' could as well be grouped in one structure
like you had in v8).

As you asked for opinions and I failed to provide one in v8 it
wouldn't be fair to ask you to backtrack just to see how it looks
like, so here you have a patch to be applied on top of your branch for
you to take into consideration (test on my gmsl work on top of your
v9).

Thanks
   j


>
>  Tomi

--thcigvypmsds3pxc
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="tomi_v9_krouting-which.patch"

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index d675faa2c571..e6c7ca7941d5 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -267,7 +267,8 @@ static const struct v4l2_subdev_video_ops ub913_video_ops = {
 
 static int _ub913_set_routing(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
-			     struct v4l2_subdev_krouting *routing)
+			     struct v4l2_subdev_route *routes,
+			     unsigned int num_routes)
 {
 	const struct v4l2_mbus_framefmt format = {
 		.width = 640,
@@ -286,16 +287,17 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 	 * frame desc is made dynamically allocated.
 	 */
 
-	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+	if (num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
 		return -EINVAL;
 
-	ret = v4l2_routing_simple_verify(routing);
+	ret = v4l2_routing_simple_verify(routes, num_routes);
 	if (ret)
 		return ret;
 
 	v4l2_subdev_lock_state(state);
 
-	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routes, num_routes,
+					       &format);
 
 	v4l2_subdev_unlock_state(state);
 
@@ -307,15 +309,14 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 
 static int ub913_set_routing(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
-			     enum v4l2_subdev_format_whence which,
 			     struct v4l2_subdev_krouting *routing)
 {
 	struct ub913_data *priv = sd_to_ub913(sd);
 
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
+	if (routing->which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
 		return -EBUSY;
 
-	return _ub913_set_routing(sd, state, routing);
+	return _ub913_set_routing(sd, state, routing->routes, routing->num_routes);
 }
 
 static int ub913_get_source_frame_desc(struct ub913_data *priv,
@@ -454,12 +455,7 @@ static int ub913_init_cfg(struct v4l2_subdev *sd,
 		},
 	};
 
-	struct v4l2_subdev_krouting routing = {
-		.num_routes = ARRAY_SIZE(routes),
-		.routes = routes,
-	};
-
-	return _ub913_set_routing(sd, state, &routing);
+	return _ub913_set_routing(sd, state, routes, 1);
 }
 
 static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index c655cb3e1ad6..1a3020e6c171 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1443,7 +1443,8 @@ static const struct v4l2_subdev_video_ops ub960_video_ops = {
 
 static int _ub960_set_routing(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
-			     struct v4l2_subdev_krouting *routing)
+			     struct v4l2_subdev_route *routes,
+			     unsigned int num_routes)
 {
 	const struct v4l2_mbus_framefmt format = {
 		.width = 640,
@@ -1462,16 +1463,17 @@ static int _ub960_set_routing(struct v4l2_subdev *sd,
 	 * frame desc is made dynamically allocated.
 	 */
 
-	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+	if (num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
 		return -EINVAL;
 
-	ret = v4l2_routing_simple_verify(routing);
+	ret = v4l2_routing_simple_verify(routes, num_routes);
 	if (ret)
 		return ret;
 
 	v4l2_subdev_lock_state(state);
 
-	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routes, num_routes,
+					       &format);
 
 	v4l2_subdev_unlock_state(state);
 
@@ -1483,15 +1485,15 @@ static int _ub960_set_routing(struct v4l2_subdev *sd,
 
 static int ub960_set_routing(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
-			     enum v4l2_subdev_format_whence which,
 			     struct v4l2_subdev_krouting *routing)
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
 
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
+	if (routing->which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
 		return -EBUSY;
 
-	return _ub960_set_routing(sd, state, routing);
+	return _ub960_set_routing(sd, state, routing->routes,
+				  routing->num_routes);
 }
 
 static int ub960_get_source_frame_desc(struct ub960_data *priv,
@@ -1676,12 +1678,7 @@ static int ub960_init_cfg(struct v4l2_subdev *sd,
 		},
 	};
 
-	struct v4l2_subdev_krouting routing = {
-		.num_routes = ARRAY_SIZE(routes),
-		.routes = routes,
-	};
-
-	return _ub960_set_routing(sd, state, &routing);
+	return _ub960_set_routing(sd, state, routes, 1);
 }
 
 static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
diff --git a/drivers/media/i2c/ov1063x.c b/drivers/media/i2c/ov1063x.c
index 2f1d0c2c7cd5..fb76a67f9f55 100644
--- a/drivers/media/i2c/ov1063x.c
+++ b/drivers/media/i2c/ov1063x.c
@@ -1205,18 +1205,12 @@ static int _ov10635_set_routing(struct v4l2_subdev *sd,
 				 V4L2_SUBDEV_ROUTE_FL_SOURCE,
 		}
 	};
-
-	struct v4l2_subdev_krouting routing = {
-		.num_routes = ARRAY_SIZE(routes),
-		.routes = routes,
-	};
-
 	int ret;
 
 	if (enable_embedded_data)
 		routes[1].flags |= V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 
-	ret = v4l2_subdev_set_routing(sd, state, &routing);
+	ret = v4l2_subdev_set_routing(sd, state, routes, ARRAY_SIZE(routes));
 	if (ret)
 		return ret;
 
@@ -1467,7 +1461,6 @@ static int ov1063x_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 static int ov1063x_set_routing(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
-			       enum v4l2_subdev_format_whence which,
 			       struct v4l2_subdev_krouting *routing)
 {
 	bool enable_embedded;
diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 3ccd06d37924..682fea8110da 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -836,8 +836,8 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int _cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
-				       struct v4l2_subdev_state *state,
-				       struct v4l2_subdev_krouting *routing)
+					struct v4l2_subdev_route *routes,
+					unsigned int num_routes)
 {
 	static const struct v4l2_mbus_framefmt format = {
 		.width = 640,
@@ -849,9 +849,10 @@ static int _cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
 		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
 		.xfer_func = V4L2_XFER_FUNC_SRGB,
 	};
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	ret = v4l2_routing_simple_verify(routing);
+	ret = v4l2_routing_simple_verify(routes, num_routes);
 	if (ret)
 		return ret;
 
@@ -859,7 +860,7 @@ static int _cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
 
 	v4l2_subdev_lock_state(state);
 
-	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routes, num_routes, &format);
 
 	v4l2_subdev_unlock_state(state);
 
@@ -871,10 +872,10 @@ static int _cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
 
 static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
 				       struct v4l2_subdev_state *state,
-				       enum v4l2_subdev_format_whence which,
 				       struct v4l2_subdev_krouting *routing)
 {
-	return _cal_camerarx_sd_set_routing(sd, state, routing);
+	return _cal_camerarx_sd_set_routing(sd, state, routing->routes,
+					    routing->num_routes);
 }
 
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
@@ -888,13 +889,8 @@ static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
 		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
 	} };
 
-	struct v4l2_subdev_krouting routing = {
-		.num_routes = 1,
-		.routes = routes,
-	};
-
 	/* Initialize routing to single route to the fist source pad */
-	return _cal_camerarx_sd_set_routing(sd, state, &routing);
+	return _cal_camerarx_sd_set_routing(sd, state, routes, 1);
 }
 
 static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a325257590a1..4be91cbd72d5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -817,11 +817,11 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 				return -EINVAL;
 		}
 
+		krouting.which = routing->which;
 		krouting.num_routes = routing->num_routes;
 		krouting.routes = routes;
 
-		return v4l2_subdev_call(sd, pad, set_routing, state,
-					routing->which, &krouting);
+		return v4l2_subdev_call(sd, pad, set_routing, state, &krouting);
 	}
 
 	default:
@@ -1441,10 +1441,10 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
 
 int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
-			    struct v4l2_subdev_krouting *routing)
+			    struct v4l2_subdev_route *routes,
+			    unsigned int num_routes)
 {
 	struct v4l2_subdev_krouting *dst = &state->routing;
-	const struct v4l2_subdev_krouting *src = routing;
 
 	lockdep_assert_held(&state->lock);
 
@@ -1452,15 +1452,14 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 	dst->routes = NULL;
 	dst->num_routes = 0;
 
-	if (src->num_routes > 0) {
-		dst->routes = kvmalloc_array(src->num_routes,
-					     sizeof(*src->routes), GFP_KERNEL);
+	if (num_routes > 0) {
+		dst->routes = kvmalloc_array(num_routes,
+					     sizeof(routes[0]), GFP_KERNEL);
 		if (!dst->routes)
 			return -ENOMEM;
 
-		memcpy(dst->routes, src->routes,
-		       src->num_routes * sizeof(*src->routes));
-		dst->num_routes = src->num_routes;
+		memcpy(dst->routes, routes, num_routes * sizeof(routes[0]));
+		dst->num_routes = num_routes;
 	}
 
 	return v4l2_init_stream_configs(&state->stream_configs, dst);
@@ -1469,14 +1468,15 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
 
 int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *state,
-				     struct v4l2_subdev_krouting *routing,
+				     struct v4l2_subdev_route *routes,
+				     unsigned int num_routes,
 				     const struct v4l2_mbus_framefmt *fmt)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 	int ret;
 
-	ret = v4l2_subdev_set_routing(sd, state, routing);
+	ret = v4l2_subdev_set_routing(sd, state, routes, num_routes);
 	if (ret)
 		return ret;
 
@@ -1573,15 +1573,16 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
 
-int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing)
+int v4l2_routing_simple_verify(const struct v4l2_subdev_route *routes,
+			       unsigned int num_routes)
 {
 	unsigned int i, j;
 
-	for (i = 0; i < routing->num_routes; ++i) {
-		const struct v4l2_subdev_route *route = &routing->routes[i];
+	for (i = 0; i < num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routes[i];
 
-		for (j = i + 1; j < routing->num_routes; ++j) {
-			const struct v4l2_subdev_route *r = &routing->routes[j];
+		for (j = i + 1; j < num_routes; ++j) {
+			const struct v4l2_subdev_route *r = &routes[j];
 
 			if (route->sink_pad == r->sink_pad &&
 			    route->sink_stream == r->sink_stream)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d0354e507970..9f1ad7eeb37a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -737,6 +737,7 @@ struct v4l2_subdev_stream_configs {
  * This structure contains the routing table for a subdev.
  */
 struct v4l2_subdev_krouting {
+	int which;
 	unsigned int num_routes;
 	struct v4l2_subdev_route *routes;
 };
@@ -870,7 +871,6 @@ struct v4l2_subdev_pad_ops {
 			       struct v4l2_mbus_config *config);
 	int (*set_routing)(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state,
-			   enum v4l2_subdev_format_whence which,
 			   struct v4l2_subdev_krouting *route);
 };
 
@@ -1487,7 +1487,8 @@ v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
  */
 int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
-			    struct v4l2_subdev_krouting *routing);
+			    struct v4l2_subdev_route *routes,
+			    unsigned int num_routes);
 
 /**
  * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
@@ -1502,7 +1503,8 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
  */
 int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *state,
-				     struct v4l2_subdev_krouting *routing,
+				     struct v4l2_subdev_route *routes,
+				     unsigned int num_routes,
 				     const struct v4l2_mbus_framefmt *fmt);
 
 /**
@@ -1580,6 +1582,7 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
  *
  * Returns 0 on success, error value otherwise.
  */
-int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing);
+int v4l2_routing_simple_verify(const struct v4l2_subdev_route *routes,
+			       unsigned int num_routes);
 
 #endif

--thcigvypmsds3pxc--
