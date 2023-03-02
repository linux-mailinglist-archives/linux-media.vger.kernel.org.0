Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD0F6A8012
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 11:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjCBKlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 05:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjCBKlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 05:41:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DDD3524C
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 02:41:20 -0800 (PST)
Received: from ideasonboard.com (host-87-18-61-24.retail.telecomitalia.it [87.18.61.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92BFE56A;
        Thu,  2 Mar 2023 11:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677753679;
        bh=V7Gw3+UX4UgVQsudZqNfsrGcz9Z8uN0X9EZLC/LOP68=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L11KOXy1F0Sse+rk9LZ89wJv9+1QZiiDDEwqLIQjyRmH5o6kDuOE1VDJN2n1PNDbt
         Q3oDjKz0eax7GB9gjbTuZDNS0n6HIqLHVFzrgwoTZ+lOSoe55Q2QFtHBgHMyYj6hGQ
         y+WqL9lOAUhDIHmpfH103/7ZPGdE6KfrxmlD3l4Y=
Date:   Thu, 2 Mar 2023 11:41:15 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] media: subdev: Use 'shall' instead of 'may' in
 route validation
Message-ID: <20230302104115.npffi5av4g7v25l3@uno.localdomain>
References: <20230302095748.100898-1-tomi.valkeinen@ideasonboard.com>
 <20230302095748.100898-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230302095748.100898-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,
   thanks!

On Thu, Mar 02, 2023 at 11:57:46AM +0200, Tomi Valkeinen wrote:
> Route validation docs use the word 'may'. Change that to 'shall' for
> emphasis.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
>  include/media/v4l2-subdev.h           | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index dff1d9be7841..8308d20f1bd1 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1694,7 +1694,7 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>
>  		/*
>  		 * V4L2_SUBDEV_ROUTING_NO_STREAM_MIX: Streams on the same pad
> -		 * may not be routed to streams on different pads.
> +		 * shall not be routed to streams on different pads.
>  		 */
>  		if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
>  			if (remote_pads[route->sink_pad] != U32_MAX &&
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 17773be4a4ee..3649f11a4c35 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1638,13 +1638,13 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
>   * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
>   *
>   * @V4L2_SUBDEV_ROUTING_NO_1_TO_N:
> - *	an input stream may not be routed to multiple output streams (stream
> + *	an input stream shall not be routed to multiple output streams (stream
>   *	duplication)
>   * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
> - *	multiple input streams may not be routed to the same output stream
> + *	multiple input streams shall not be routed to the same output stream
>   *	(stream merging)
>   * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
> - *	streams on the same pad may not be routed to streams on different pads
> + *	streams on the same pad shall not be routed to streams on different pads
>   * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
>   *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
>   *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
> --
> 2.34.1
>
