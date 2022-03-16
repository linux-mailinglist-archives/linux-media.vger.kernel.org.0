Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4D54DAE96
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 12:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355227AbiCPLCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 07:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355226AbiCPLCF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 07:02:05 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871AD6007A
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 04:00:51 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C40F71C000E;
        Wed, 16 Mar 2022 11:00:47 +0000 (UTC)
Date:   Wed, 16 Mar 2022 12:00:46 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 29/36] media: subdev: add v4l2_subdev_get_fmt()
 helper function
Message-ID: <20220316110046.sl54xnhahedpq3el@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-30-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-30-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Tue, Mar 01, 2022 at 06:11:49PM +0200, Tomi Valkeinen wrote:
> Add v4l2_subdev_get_fmt() helper function which implements
> v4l2_subdev_pad_ops.get_fmt using streams. Subdev drivers that do not
> need to do anything special in their get_fmt op can use this helper
> directly for v4l2_subdev_pad_ops.get_fmt.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++++++++
>  include/media/v4l2-subdev.h           | 17 +++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e65f802fe2aa..c1cc9b91dba7 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1507,6 +1507,22 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
>
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +			struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> +						  format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	format->format = *fmt;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index ed3fe21637e6..a80830801a7f 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1481,6 +1481,23 @@ struct v4l2_mbus_framefmt *
>  v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  					     u32 pad, u32 stream);
>
> +/**
> + * v4l2_subdev_get_fmt() - Fill format based on state
> + * @sd: subdevice
> + * @state: subdevice state
> + * @format: pointer to &struct v4l2_subdev_format
> + *
> + * Fill @format based on the pad and stream given in the @format struct.
> + *
> + * This function can be used by the subdev drivers to implement
> + * v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to do
> + * anything special in their get_fmt op.
> + *
> + * Returns 0 on success, error value otherwise.
> + */
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +			struct v4l2_subdev_format *format);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /**
> --
> 2.25.1
>
