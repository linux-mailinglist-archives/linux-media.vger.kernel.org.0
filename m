Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89C37D428F
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbjJWWH1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjJWWHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:07:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B5310C1
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:07:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D2B0AE;
        Tue, 24 Oct 2023 00:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698098831;
        bh=cJXz6OIQqQRqsKWW92U2oUPVvq7xL1JuWZQZybzRl8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y4sxaw2+BV51MLn0rqoCgaNsUb5MQJU298og4MCqW6raQsHyCY3jj5FGVOm248W/Q
         fxkrzm4qcqCls/Xcnq86f4D5sA6ZgyEN4IVUUSs5wZWeYJFlualee6rcJwYCv63cGH
         eq7M1AhD977CQ2PjOaITQIcPk2edhk26goG5thIg=
Date:   Tue, 24 Oct 2023 01:07:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 2/8] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <20231023220729.GD18687@pendragon.ideasonboard.com>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023174408.803874-3-sakari.ailus@linux.intel.com>
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

On Mon, Oct 23, 2023 at 08:44:02PM +0300, Sakari Ailus wrote:
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
>  include/media/v4l2-subdev.h           |  9 ++++---
>  2 files changed, 45 insertions(+), 3 deletions(-)
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

Do we want to carry this forward from the existing pad config accessors,
can't we return NULL instead ?

Either way,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 6a02a565035c..0ba1cd8c3ac7 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1550,7 +1550,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>   * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
>   * stream in the subdev state.
>   *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the format for the corresponding pad is returned.
> + * If the pad does not exist, NULL is returned.
>   */
>  struct v4l2_mbus_framefmt *
>  v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> @@ -1565,7 +1566,8 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>   * This returns a pointer to crop rectangle for the given pad + stream in the
>   * subdev state.
>   *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the crop rectangle for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
>   */
>  struct v4l2_rect *
>  v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
> @@ -1581,7 +1583,8 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
>   * This returns a pointer to compose rectangle for the given pad + stream in the
>   * subdev state.
>   *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the compose rectangle for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
>   */
>  struct v4l2_rect *
>  v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,

-- 
Regards,

Laurent Pinchart
