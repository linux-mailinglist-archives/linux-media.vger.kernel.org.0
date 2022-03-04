Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C7E4CD53C
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 14:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238428AbiCDNft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 08:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237132AbiCDNfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 08:35:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153B21B762B
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 05:34:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BF32AB827FF
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 13:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A60FC340E9;
        Fri,  4 Mar 2022 13:34:52 +0000 (UTC)
Message-ID: <0653fa02-10d5-99cb-5adb-7c5ae262bf8c@xs4all.nl>
Date:   Fri, 4 Mar 2022 14:34:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v5 5/6] media: subdev: add v4l2_subdev_call_state_active()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
 <20220301105548.305191-6-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220301105548.305191-6-tomi.valkeinen@ideasonboard.com>
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

Hi Tomi,

On 3/1/22 11:55, Tomi Valkeinen wrote:
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
> + * call.
> + */

You should explain why this is a legacy macro and, ideally, what would need to
be done to get rid of it. The first is in the commit log, but nobody reads that :-)

But if just using it in a non-MC video device driver constitutes 'legacy' use,
then I disagree with that. There are many non-MC video device drivers, nothing
legacy about that.

Regards,

	Hans

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
