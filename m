Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F984DAF5D
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 13:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355577AbiCPMLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 08:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355576AbiCPMLv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 08:11:51 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F163855208
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 05:10:36 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B5B61240002;
        Wed, 16 Mar 2022 12:10:32 +0000 (UTC)
Date:   Wed, 16 Mar 2022 13:10:30 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 36/36] media: v4l2-subdev: Add
 v4l2_subdev_s_stream_helper() function
Message-ID: <20220316121030.tc2srm7ajmuqhfdf@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-37-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-37-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Mar 01, 2022 at 06:11:56PM +0200, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> The v4l2_subdev_s_stream_helper() helper can be used by subdevs that
> implement the stream-aware .enable_streams() and .disable_streams()
> operations to implement .s_stream(). This is limited to subdevs that
> have a single source pad.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 17 ++++++++++++
>  2 files changed, 57 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index f75a1995a70b..270445821f06 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1914,6 +1914,46 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_disable_streams);
>
> +int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
> +{
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_subdev_route *route;
> +	struct media_pad *pad;
> +	u64 source_mask = 0;
> +	int pad_index = -1;
> +
> +	/*
> +	 * Find the source pad. This helper is meant for subdevs that have a
> +	 * single source pad, so failures shouldn't happen, but catch them
> +	 * loudly nonetheless as they indicate a driver bug.
> +	 */
> +	media_entity_for_each_pad(&sd->entity, pad) {
> +		if (pad->flags & MEDIA_PAD_FL_SOURCE) {
> +			pad_index = pad->index;
> +			break;
> +		}
> +	}
> +
> +	if (WARN_ON(pad_index == -1))
> +		return -EINVAL;
> +
> +	/*
> +	 * As there's a single source pad, just collect all the source streams.
> +	 */
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	for_each_active_route(&state->routing, route)
> +		source_mask |= BIT(route->source_stream);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (enable)
> +		return v4l2_subdev_enable_streams(sd, pad_index, source_mask);
> +	else
> +		return v4l2_subdev_disable_streams(sd, pad_index, source_mask);

Or
        return enable ? ...
                      : ... ;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index bb1713863973..817452ec30bb 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1674,6 +1674,23 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  				u64 streams_mask);
>
> +/**
> + * v4l2_subdev_s_stream_helper() - Helper to implement the subdev s_stream
> + *	operation using enable_streams and disable_streams
> + * @sd: The subdevice
> + * @enable: Enable to disable streaming

Enable or disable

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j


> + *
> + * Subdevice drivers that implement the streams-aware
> + * &v4l2_subdev_pad_ops.enable_streams and &v4l2_subdev_pad_ops.disable_streams
> + * operations can use this helper to implement the legacy
> + * &v4l2_subdev_video_ops.s_stream operation.
> + *
> + * This helper can only be used by subdevs that have a single source pad.
> + *
> + * Return: 0 on success, or a negative error code otherwise.
> + */
> +int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /**
> --
> 2.25.1
>
