Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507E27D380D
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 15:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbjJWN3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 09:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbjJWN26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 09:28:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9D3F9
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 06:28:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BA12D20;
        Mon, 23 Oct 2023 15:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698067724;
        bh=S4+zRwHaEfiUk1QYSgSfDttOL2w3imzwX0oy15h+fAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VHIO55jCRISAL1YXIUWTMZejbYWl+Vjk6MgGWW5KcD8d5fdUtT09X5dPMNLJkKxYt
         e5owCCP7VVuMjnUwNdB2aaQCWbczXcUzn99hBF7Bqv2mZhydErUt3eFvGiaDkdAfqb
         uIjkcCa9NLXEAJaw4J30iQIZmolRkpvvFbwLdnvs=
Date:   Mon, 23 Oct 2023 16:29:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 1/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <20231023132902.GQ3336@pendragon.ideasonboard.com>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023123308.782592-2-sakari.ailus@linux.intel.com>
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

On Mon, Oct 23, 2023 at 03:33:03PM +0300, Sakari Ailus wrote:
> There are two sets of functions that return information from sub-device
> state, one for stream-unaware users and another for stream-aware users.
> Add support for stream-aware functions to return format, crop and compose
> information from pad-based array that are functionally equivalent to the
> old, stream-unaware ones.
> 
> Also check state is non-NULL, in order to guard against old drivers
> potentially calling this with NULL state for active formats or selection
> rectangles.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index ee4fe8f33a41..955ee9a6c91f 100644
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
> +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].try_fmt;
> +	}
> +
>  	lockdep_assert_held(state->lock);

Can we move towards proper locking for all callers ?

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
> +		if (WARN_ON(pad >= state->sd->entity.num_pads))
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
> +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].try_compose;
> +	}
> +
>  	lockdep_assert_held(state->lock);
>  
>  	stream_configs = &state->stream_configs;
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
