Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568B44DAEDC
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 12:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355314AbiCPL1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 07:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345749AbiCPL1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 07:27:35 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4C9652DD
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 04:26:21 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6E9E41C000C;
        Wed, 16 Mar 2022 11:26:17 +0000 (UTC)
Date:   Wed, 16 Mar 2022 12:26:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 34/36] media: v4l2-subdev: Add
 v4l2_subdev_state_xlate_streams() helper
Message-ID: <20220316112615.yaib5gokpxjslkur@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-35-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-35-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Mar 01, 2022 at 06:11:54PM +0200, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Add a helper function to translate streams between two pads of a subdev,
> using the subdev's internal routing table.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 23 +++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e30338a53088..6a9fc62dacbf 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1529,6 +1529,31 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
>
> +u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
> +				    u32 pad0, u32 pad1, u64 *streams)
> +{
> +	const struct v4l2_subdev_krouting *routing = &state->routing;
> +	struct v4l2_subdev_route *route;
> +	u64 streams0 = 0;
> +	u64 streams1 = 0;
> +
> +	for_each_active_route(routing, route) {
> +		if (route->sink_pad == pad0 && route->source_pad == pad1 &&
> +		    (*streams & BIT(route->sink_stream))) {
> +			streams0 |= BIT(route->sink_stream);
> +			streams1 |= BIT(route->source_stream);
> +		}
> +		if (route->source_pad == pad0 && route->sink_pad == pad1 &&
> +		    (*streams & BIT(route->source_stream))) {
> +			streams0 |= BIT(route->source_stream);
> +			streams1 |= BIT(route->sink_stream);
> +		}
> +	}
> +
> +	*streams = streams0;
> +	return streams1;

I'll probably learn how this is used later, but I found it hard to
immagine how the returned mask should be used.

To a sink stream mask that contains multiple streams a source maks
with multiple entries will be associated

In example, the sink stream mask might look lik

        sink_stream_mask = {1, 0, 1, 0}

So we are interested in translating stream 0 and 2
Assume 0->4 and 2->1 in the routing tabe, the resulting source stream
mask will be

       source_stream_mask = {1, 0, 0, 1}

How should the caller know what stream goes where ?

> +}
> +
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1eced0f47296..992debe116ac 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1497,6 +1497,29 @@ struct v4l2_mbus_framefmt *
>  v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  					     u32 pad, u32 stream);
>
> +/**
> + * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another

Could we stress out that pads are on the same entity and this is not
meant to translate over media links ? Is this necessary ?

> + *
> + * @state: Subdevice state
> + * @pad0: The first pad
> + * @pad1: The second pad
> + * @streams: Streams bitmask on the first pad
> + *
> + * Streams on sink pads of a subdev are routed to source pads as expressed in
> + * the subdev state routing table. Stream numbers don't necessarily match on
> + * the sink and source side of a route. This function translates stream numbers
> + * on @pad0, expressed as a bitmask in @streams, to the corresponding streams
> + * on @pad1 using the routing table from the @state. It returns the stream mask
> + * on @pad1, and updates @streams with the streams that have been found in the
> + * routing table.
> + *
> + * @pad0 and @pad1 must be a sink and a source, in any order.
> + *
> + * Return: The bitmask of streams of @pad1 that are routed to @streams on @pad0.
> + */
> +u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
> +				    u32 pad0, u32 pad1, u64 *streams);
> +
>  /**
>   * v4l2_subdev_get_fmt() - Fill format based on state
>   * @sd: subdevice
> --
> 2.25.1
>
