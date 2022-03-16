Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D0F4DAE7D
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 11:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243130AbiCPKva (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 06:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbiCPKv3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 06:51:29 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67EF6543D
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 03:50:13 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 289ABE0010;
        Wed, 16 Mar 2022 10:50:09 +0000 (UTC)
Date:   Wed, 16 Mar 2022 11:50:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 28/36] media: subdev: add "opposite" stream helper
 funcs
Message-ID: <20220316105008.i4hz2bflnqrjdalb@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-29-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-29-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Mar 01, 2022 at 06:11:48PM +0200, Tomi Valkeinen wrote:
> Add two helper functions to make dealing with streams easier:
>
> v4l2_subdev_routing_find_opposite_end - given a routing table and a pad
> + stream, return the pad + stream on the opposite side of the subdev.
>
> v4l2_subdev_state_get_opposite_stream_format - return a pointer to the
> format on the pad + stream on the opposite side from the given pad +
> stream.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 48 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 36 ++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 091b854e00d0..e65f802fe2aa 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1459,6 +1459,54 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_format);
>
> +int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> +					  u32 pad, u32 stream, u32 *other_pad,
> +					  u32 *other_stream)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +

Is it intentional to include routes that might be active ?
If that's the case
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> +		if (route->source_pad == pad &&
> +		    route->source_stream == stream) {
> +			if (other_pad)
> +				*other_pad = route->sink_pad;
> +			if (other_stream)
> +				*other_stream = route->sink_stream;
> +			return 0;
> +		}
> +
> +		if (route->sink_pad == pad && route->sink_stream == stream) {
> +			if (other_pad)
> +				*other_pad = route->source_pad;
> +			if (other_stream)
> +				*other_stream = route->source_stream;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_routing_find_opposite_end);
> +
> +struct v4l2_mbus_framefmt *
> +v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
> +					     u32 pad, u32 stream)
> +{
> +	u32 other_pad, other_stream;
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, stream,
> +						    &other_pad, &other_stream);
> +	if (ret)
> +		return NULL;
> +
> +	return v4l2_subdev_state_get_stream_format(state, other_pad,
> +						   other_stream);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 2a40ad273cf8..ed3fe21637e6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1445,6 +1445,42 @@ struct v4l2_mbus_framefmt *
>  v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>  				    unsigned int pad, u32 stream);
>
> +/**
> + * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
> + * @routing: routing used to find the opposite side
> + * @pad: pad id
> + * @stream: stream id
> + * @other_pad: pointer used to return the opposite pad
> + * @other_stream: pointer used to return the opposite stream
> + *
> + * This function uses the routing table to find the pad + stream which is
> + * opposite the given pad + stream.
> + *
> + * @other_pad and/or @other_stream can be NULL if the caller does not need the
> + * value.
> + *
> + * Returns 0 on success, or -EINVAL if no matching route is found.
> + */
> +int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> +					  u32 pad, u32 stream, u32 *other_pad,
> +					  u32 *other_stream);
> +
> +/**
> + * v4l2_subdev_state_get_opposite_stream_format() - Get pointer to opposite
> + *                                                  stream format
> + * @state: subdevice state
> + * @pad: pad id
> + * @stream: stream id
> + *
> + * This returns a pointer to &struct v4l2_mbus_framefmt for the pad + stream
> + * that is opposite the given pad + stream in the subdev state.
> + *
> + * If the state does not contain the given pad + stream, NULL is returned.
> + */
> +struct v4l2_mbus_framefmt *
> +v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
> +					     u32 pad, u32 stream);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /**
> --
> 2.25.1
>
