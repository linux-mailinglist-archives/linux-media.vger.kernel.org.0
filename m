Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3254CA0EF
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 10:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240556AbiCBJhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 04:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiCBJhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 04:37:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF12B7C61
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 01:36:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D10D79FF;
        Wed,  2 Mar 2022 10:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646213797;
        bh=Me/8+EThT/795OfYno/yIdwOmBvunY6WQ6sjr9iS0lQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J4EtT4gifohzC2jl05E3FI+17/FiF5djhJhIJf1IlUgZjKsNv5RVO4U8qEQft06PP
         zeobwpLdQn2lq2jymI81lQorpkRDbXEiDQh4MywDpbJPE+jPShjV7HDju/9Ls8vwH0
         cdIDv7TFh3JUiLs1FObydRHoACUPFac35/0Kh+ks=
Date:   Wed, 2 Mar 2022 11:36:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v5 5/6] media: subdev: add v4l2_subdev_call_state_active()
Message-ID: <Yh86mXXTqumlzlS6@pendragon.ideasonboard.com>
References: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
 <20220301105548.305191-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301105548.305191-6-tomi.valkeinen@ideasonboard.com>
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

On Tue, Mar 01, 2022 at 12:55:47PM +0200, Tomi Valkeinen wrote:
> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
> that take a subdev state as a parameter. Normally the v4l2 framework
> will lock and pass the correct subdev state to the subdev ops, but there
> are legacy situations where this is not the case (e.g. non-MC video
> device driver calling set_fmt in a source subdev).
> 
> As this macro is only needed for legacy use cases, the macro is added in
> a new header file, v4l2-subdev-legacy.h.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev-legacy.h | 42 ++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 include/media/v4l2-subdev-legacy.h
> 
> diff --git a/include/media/v4l2-subdev-legacy.h b/include/media/v4l2-subdev-legacy.h
> new file mode 100644
> index 000000000000..6a61e579b629
> --- /dev/null
> +++ b/include/media/v4l2-subdev-legacy.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  V4L2 sub-device legacy support header.
> + *
> + *  Copyright (C) 2022  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> + */
> +
> +#ifndef _V4L2_SUBDEV_LEGACY_H
> +#define _V4L2_SUBDEV_LEGACY_H
> +
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

s/active state and/active state,/

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
> +#endif

I think

#endif /* _V4L2_SUBDEV_LEGACY_H */

is the usual pattern. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
