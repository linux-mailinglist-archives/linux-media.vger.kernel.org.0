Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524924B9332
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 22:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbiBPVbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 16:31:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235512AbiBPVbS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 16:31:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D341F28198F
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 13:31:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90A9825B;
        Wed, 16 Feb 2022 22:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645047059;
        bh=RxPGZ7k/JHCDnXFoR6ZVXUlNoGJrBmo3Z02C1MKJFHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P3KjqSU0gb27yi3izDGsCt+kadXOdGWmVz3N4NNxOGdss/trv2b34ShuJSX7X7jIb
         Z6xr6PMjET4ae8927giNDa/oMuxgHKi2MClWN8OXhLL6UFV0uTCTHVU30lbf9POUxY
         t5j4f/rz5zxe/BKjM5ky3B8FF3sc9bJrV3sl9O/8=
Date:   Wed, 16 Feb 2022 23:30:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v4 6/7] media: subdev: add v4l2_subdev_call_state_active()
Message-ID: <Yg1tC0dLieuZLbXy@pendragon.ideasonboard.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Feb 16, 2022 at 03:00:48PM +0200, Tomi Valkeinen wrote:
> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
> that take a subdev state as a parameter.

We should not encourage subdev drivers to call into each other. There
may be some valid use cases for such a helper at this point, namely in
the .start_streaming() implementation in a vb2 queue, but even then, I
think it would be best to rework the pipeline start API to lock the
states of all subdevs in the pipeline (I've already improved pipeline
start on top of your streams series, the locking isn't there yet, but I
could give it a try).

On the other hand, this macro could help identifying drivers that handle
locking manually, helping reworking them once the pipeline start API
handles locking too.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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

-- 
Regards,

Laurent Pinchart
