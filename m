Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283196A6AE7
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 11:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjCAKiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 05:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjCAKiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 05:38:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C3A2703
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 02:38:02 -0800 (PST)
Received: from ideasonboard.com (host-87-18-61-24.retail.telecomitalia.it [87.18.61.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FE7C890;
        Wed,  1 Mar 2023 11:38:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677667080;
        bh=rwOYfYf4EzjQvTvfQRHjf1kGkAmSYXs0KX9VHJq1l84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FXWmCIP93wSiRzhdX1K7M0/DasymQdbYvOX3W/TOx1fJmreZ01WJQmS4trKugTTi9
         xWw4F8tmDzV7x9OX8sHQLZNbAAFoECRs5WO+wiuAFOByTKFUqkyI6519XPGr0m/lX6
         sZ1pgB38WHIl3t8kcqTm5L6e24s6Q5FYNNUb8VR4=
Date:   Wed, 1 Mar 2023 11:37:56 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] media: subdev: Split
 V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
Message-ID: <20230301103756.ynkivjauuqgpnanl@uno.localdomain>
References: <20230228092346.101105-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230228092346.101105-1-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Tue, Feb 28, 2023 at 11:23:45AM +0200, Tomi Valkeinen wrote:
> V4L2_SUBDEV_ROUTING_NO_STREAM_MIX routing validation flag means that all
> routes from a sink pad must go to the same source pad and all routes
> going to the same source pad must originate from the same sink pad.
>
> This does not cover all use cases. For example, if a device routes
> all streams from a single sink pad to any of the source pads, but
> streams from multiple sink pads can go to the same source pad, the
> current flag is too restrictive.
>
> Split the flag into two parts, V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX
> and V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX, which add the restriction
> only on one side of the device. Together they mean the same as
> V4L2_SUBDEV_ROUTING_NO_STREAM_MIX.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 17 +++++++++++++----
>  include/media/v4l2-subdev.h           | 16 +++++++++++++---
>  2 files changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index dff1d9be7841..bc3678337048 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1693,10 +1693,11 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>  		}
>
>  		/*
> -		 * V4L2_SUBDEV_ROUTING_NO_STREAM_MIX: Streams on the same pad
> -		 * may not be routed to streams on different pads.
> +		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: Streams on the same
> +		 * sink pad may not be routed to streams on different source

nit: it was already like this, but as the flag checks for a condition
that is forbidden I would use "Streams on the same sink pad -shall-
not be routed to streams on -a- different source pad"

> +		 * pads.
>  		 */
> -		if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
> +		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
>  			if (remote_pads[route->sink_pad] != U32_MAX &&
>  			    remote_pads[route->sink_pad] != route->source_pad) {
>  				dev_dbg(sd->dev,
> @@ -1705,6 +1706,15 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>  				goto out;
>  			}
>
> +			remote_pads[route->sink_pad] = route->source_pad;
> +		}
> +
> +		/*
> +		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: Streams on the same
> +		 * source pad may not be routed to streams on different sink
> +		 * pads.
> +		 */
> +		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
>  			if (remote_pads[route->source_pad] != U32_MAX &&
>  			    remote_pads[route->source_pad] != route->sink_pad) {
>  				dev_dbg(sd->dev,
> @@ -1713,7 +1723,6 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>  				goto out;
>  			}
>
> -			remote_pads[route->sink_pad] = route->source_pad;
>  			remote_pads[route->source_pad] = route->sink_pad;
>  		}
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 17773be4a4ee..a4331e0a5aeb 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1643,19 +1643,29 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
>   * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
>   *	multiple input streams may not be routed to the same output stream
>   *	(stream merging)
> - * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
> - *	streams on the same pad may not be routed to streams on different pads
> + * @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX:
> + *	streams on the same sink pad may not be routed to streams on different
> + *	source pads

Same comment on s/may not/shall not/
Up to you, really

> + * @V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX:
> + *	streams on the same source pad may not be routed to streams on different
> + *	sink pads

I would prefer the way it is described in the commit message:

        streams on the same source pad must originate from the same
        sink pad


>   * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
>   *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
>   *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
> + * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
> + *	streams on the same pad may not be routed to streams on different pads

        streams on a pad shall all be routed to the same opposite pad

All suggestions, take whatever you like the most

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>   */
>  enum v4l2_subdev_routing_restriction {
>  	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
>  	V4L2_SUBDEV_ROUTING_NO_N_TO_1 = BIT(1),
> -	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX = BIT(2),
> +	V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX = BIT(2),
> +	V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX = BIT(3),
>  	V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 =
>  		V4L2_SUBDEV_ROUTING_NO_1_TO_N |
>  		V4L2_SUBDEV_ROUTING_NO_N_TO_1,
> +	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX =
> +		V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX |
> +		V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX,
>  };
>
>  /**
> --
> 2.34.1
>
