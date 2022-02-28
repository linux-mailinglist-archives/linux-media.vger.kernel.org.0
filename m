Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E378F4C6524
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 09:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbiB1JAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 04:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbiB1JAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 04:00:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B208D3D1CC
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 00:59:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4FE7D61196
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 08:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545BEC340E7;
        Mon, 28 Feb 2022 08:59:27 +0000 (UTC)
Message-ID: <71751dde-a0f6-898e-a7d3-e509afb67fed@xs4all.nl>
Date:   Mon, 28 Feb 2022 09:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 6/7] media: subdev: add v4l2_subdev_call_state_active()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/16/22 14:00, Tomi Valkeinen wrote:
> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
> that take a subdev state as a parameter.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 84c02488d53f..0db61203c8d9 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1359,6 +1359,37 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  		__result;						\
>  	})
>  
> +/**
> + * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
> + *				   takes state as a parameter, passing the
> + *				   subdev its active state.
> + *
> + * @sd: pointer to the &struct v4l2_subdev
> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> + *     Each element there groups a set of callbacks functions.
> + * @f: callback function to be called.
> + *     The callback functions are defined in groups, according to
> + *     each element at &struct v4l2_subdev_ops.
> + * @args: arguments for @f.
> + *
> + * This is similar to v4l2_subdev_call(), except that this version can only be
> + * used for ops that take a subdev state as a parameter. The macro will get the
> + * active state and lock it before calling the op, and unlock it after the
> + * call.
> + */
> +#define v4l2_subdev_call_state_active(sd, o, f, args...)		\
> +	({								\
> +		int __result;						\
> +		struct v4l2_subdev_state *state;			\
> +		state = v4l2_subdev_get_active_state(sd);		\
> +		if (state)						\
> +			v4l2_subdev_lock_state(state);			\
> +		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
> +		if (state)						\
> +			v4l2_subdev_unlock_state(state);		\
> +		__result;						\
> +	})
> +
>  /**
>   * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
>   *
