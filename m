Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEC294F64F9
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 18:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbiDFQU5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 12:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237330AbiDFQUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 12:20:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04E1456E23
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 06:44:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60C28616EC
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 13:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C6AC385A3;
        Wed,  6 Apr 2022 13:44:36 +0000 (UTC)
Message-ID: <056d6a4a-8d56-b799-d984-70bd3a2ec8d8@xs4all.nl>
Date:   Wed, 6 Apr 2022 15:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 6/8] media: subdev: add locking wrappers to subdev op
 wrappers
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
 <20220324080030.216716-7-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220324080030.216716-7-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 24/03/2022 09:00, Tomi Valkeinen wrote:
> It is common that media drivers call subdev ops in source subdevs, and
> pass NULL as the state. This was the way to indicate that the callee
> should use the callee's private active state.
> 
> E.g.:
> 
> v4l2_subdev_call(priv->source_sd, pad, get_fmt, NULL, &sd_fmt);
> 
> Now that we have a real subdev active state in the v4l2_subdev struct,
> we want the caller to pass a proper state (when available). And
> furthermore, the state should be locked.
> 
> This would mean changing all the callers, which is the long term goal.
> 
> To fix this issue in the short term, let's add an extra wrapper layer to
> all v4l2_subdev_call_pad_wrappers which deal with states. These wrappers
> handle the state == NULL case by using the locked active state instead
> (when available).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 42 ++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 824424f0a741..d8d1c9ef4dc4 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -319,14 +319,42 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
>  	       sd->ops->pad->get_mbus_config(sd, pad, config);
>  }
>  
> +/*
> + * Create state-management wrapper for pad ops dealing with subdev state. The
> + * wrapper handles the case where the caller does not provide the called
> + * subdev's state. This should be removed when all the callers are fixed.
> + */
> +#define DEFINE_STATE_WRAPPER(f, arg_type)                                  \
> +	static int call_##f##_state(struct v4l2_subdev *sd,                \
> +				    struct v4l2_subdev_state *_state,      \
> +				    arg_type *format)                      \
> +	{                                                                  \
> +		struct v4l2_subdev_state *state = _state;                  \
> +		int ret;                                                   \
> +		if (!_state)                                               \
> +			state = v4l2_subdev_lock_and_get_active_state(sd); \
> +		ret = call_##f(sd, state, format);                         \
> +		if (!_state && state)                                      \
> +			v4l2_subdev_unlock_state(state);                   \
> +		return ret;                                                \
> +	}
> +
> +DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
> +DEFINE_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
> +DEFINE_STATE_WRAPPER(enum_mbus_code, struct v4l2_subdev_mbus_code_enum);
> +DEFINE_STATE_WRAPPER(enum_frame_size, struct v4l2_subdev_frame_size_enum);
> +DEFINE_STATE_WRAPPER(enum_frame_interval, struct v4l2_subdev_frame_interval_enum);
> +DEFINE_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
> +DEFINE_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
> +
>  static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
> -	.get_fmt		= call_get_fmt,
> -	.set_fmt		= call_set_fmt,
> -	.enum_mbus_code		= call_enum_mbus_code,
> -	.enum_frame_size	= call_enum_frame_size,
> -	.enum_frame_interval	= call_enum_frame_interval,
> -	.get_selection		= call_get_selection,
> -	.set_selection		= call_set_selection,
> +	.get_fmt		= call_get_fmt_state,
> +	.set_fmt		= call_set_fmt_state,
> +	.enum_mbus_code		= call_enum_mbus_code_state,
> +	.enum_frame_size	= call_enum_frame_size_state,
> +	.enum_frame_interval	= call_enum_frame_interval_state,
> +	.get_selection		= call_get_selection_state,
> +	.set_selection		= call_set_selection_state,
>  	.get_edid		= call_get_edid,
>  	.set_edid		= call_set_edid,
>  	.dv_timings_cap		= call_dv_timings_cap,
