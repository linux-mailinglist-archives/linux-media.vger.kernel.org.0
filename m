Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 047BD7D543E
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 16:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbjJXOpg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 10:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234482AbjJXOpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 10:45:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A374DC
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 07:45:32 -0700 (PDT)
Received: from [192.168.88.20] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BDDA9CC;
        Tue, 24 Oct 2023 16:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698158719;
        bh=f46+E6Iv1ttoGsVWNePYtxU087HNQngaqXpqAmQEiII=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=I696VDGrctvm91rVdFALWcLZgUEtnAIOlY+59LyWsR+8rZkqdJV7SAqP9jaAQG0zt
         BZVjKgqkR5IdOXr10CVN0/pboJUxPzv04DlHYlIKOb94EoqPbzLEpYPVKULZOAiWL8
         c3FBZSOAZwi0t3V2UBdxyyEKFqCh59M+i0EZvmxk=
Message-ID: <f5af7581-8128-4848-b932-5997e4cdb475@ideasonboard.com>
Date:   Tue, 24 Oct 2023 17:45:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: v4l: subdev: Also return pads array
 information on stream functions
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-3-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20231023174408.803874-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/10/2023 20:44, Sakari Ailus wrote:
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
>   drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++++++++
>   include/media/v4l2-subdev.h           |  9 ++++---
>   2 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index ee4fe8f33a41..955ee9a6c91f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1684,6 +1684,19 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>   	struct v4l2_subdev_stream_configs *stream_configs;
>   	unsigned int i;
>   
> +	if (WARN_ON(!state))
> +		return NULL;
> +
> +	if (state->pads) {
> +		if (stream)
> +			return NULL;

If this happens, is it a driver error? WARN_ON()?

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> +
> +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].try_fmt;
> +	}
> +
>   	lockdep_assert_held(state->lock);
>   
>   	stream_configs = &state->stream_configs;
> @@ -1705,6 +1718,19 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
>   	struct v4l2_subdev_stream_configs *stream_configs;
>   	unsigned int i;
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
>   	lockdep_assert_held(state->lock);
>   
>   	stream_configs = &state->stream_configs;
> @@ -1726,6 +1752,19 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
>   	struct v4l2_subdev_stream_configs *stream_configs;
>   	unsigned int i;
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
>   	lockdep_assert_held(state->lock);
>   
>   	stream_configs = &state->stream_configs;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 6a02a565035c..0ba1cd8c3ac7 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1550,7 +1550,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>    * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
>    * stream in the subdev state.
>    *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the format for the corresponding pad is returned.
> + * If the pad does not exist, NULL is returned.
>    */
>   struct v4l2_mbus_framefmt *
>   v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> @@ -1565,7 +1566,8 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>    * This returns a pointer to crop rectangle for the given pad + stream in the
>    * subdev state.
>    *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the crop rectangle for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
>    */
>   struct v4l2_rect *
>   v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
> @@ -1581,7 +1583,8 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
>    * This returns a pointer to compose rectangle for the given pad + stream in the
>    * subdev state.
>    *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the compose rectangle for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
>    */
>   struct v4l2_rect *
>   v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,

