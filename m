Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC027D66D6
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 11:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbjJYJcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 05:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbjJYJcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 05:32:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E8ADC
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 02:32:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E795C433C7;
        Wed, 25 Oct 2023 09:32:12 +0000 (UTC)
Message-ID: <3499574b-fe65-46b1-b69c-c966effafde7@xs4all.nl>
Date:   Wed, 25 Oct 2023 11:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: v4l: subdev: Also return pads array
 information on stream functions
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-3-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20231023174408.803874-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/10/2023 19:44, Sakari Ailus wrote:
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

I saw Laurent's comment on why we don't return NULL here, and I think
based on your reply to that this will need a comment why we don't
return NULL (yet). It's weird code, and it needs an explanation.

Ditto elsewhere, of course.

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

Regards,

	Hans
