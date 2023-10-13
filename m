Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3C97C840C
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjJMLHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJMLHh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:07:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D446891
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:07:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E715A480;
        Fri, 13 Oct 2023 13:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697195251;
        bh=tBSEof6BqCMzpD5mmSWP2qE4Mzg7rNmOtoxGt0SEjx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BNVyAEAUz20poydSV2PG2NxrOm71dxFGjPyOIUyz0nxtV+TDR5B0pGYmqfFMBSBED
         TCJeuuwSoS+b+zOU5H5A+1sfkw/+q4DWFV3EXuIeFgaLt5lqduFchaSkoeW7GU/1T2
         8c471N19KnaSYutUTAztLkqXnPjJP7dsNe1aV93s=
Date:   Fri, 13 Oct 2023 14:07:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 2/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <20231013110741.GD11101@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231013104424.404768-3-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Oct 13, 2023 at 01:44:20PM +0300, Sakari Ailus wrote:
> There are two sets of functions that return information from sub-device
> state, one for stream-unaware users and another for stream-aware users.
> Add support for stream-aware functions to return format, crop and compose
> information from pad-based array that are functionally equivalent to the
> old, stream-unaware ones.
> 
> Also check state is non-NULL, in order to guard against old drivers
> potentially calling this with NULL state for active formats or selection
> rectangles.

I'm not too keen on this I'm afraid :-( I think it gets confusing for
drivers that are not stream-aware to have to call a function that takes
a stream number. I don't see a problem with keeping two different sets
of functions, one for stream-aware drivers, and one for other drivers.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 52a8043ab556..7d0ce8c8aab4 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1684,6 +1684,19 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
>  
> +	if (WARN_ON(!state))
> +		return NULL;
> +
> +	if (state->pads) {
> +		if (stream)
> +			return NULL;
> +
> +		if (WARN_ON(pad >= state->num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].try_fmt;
> +	}
> +
>  	lockdep_assert_held(state->lock);
>  
>  	stream_configs = &state->stream_configs;
> @@ -1705,6 +1718,19 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
>  
> +	if (WARN_ON(!state))
> +		return NULL;
> +
> +	if (state->pads) {
> +		if (stream)
> +			return NULL;
> +
> +		if (WARN_ON(pad >= state->num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].try_crop;
> +	}
> +
>  	lockdep_assert_held(state->lock);
>  
>  	stream_configs = &state->stream_configs;
> @@ -1726,6 +1752,19 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
>  
> +	if (WARN_ON(!state))
> +		return NULL;
> +
> +	if (state->pads) {
> +		if (stream)
> +			return NULL;
> +
> +		if (WARN_ON(pad >= state->num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].try_compose;
> +	}
> +
>  	lockdep_assert_held(state->lock);
>  
>  	stream_configs = &state->stream_configs;

-- 
Regards,

Laurent Pinchart
