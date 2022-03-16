Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54DEA4DAE9F
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 12:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355220AbiCPLGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 07:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbiCPLGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 07:06:07 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75F63DA4C
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 04:04:52 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 60F831C0010;
        Wed, 16 Mar 2022 11:04:49 +0000 (UTC)
Date:   Wed, 16 Mar 2022 12:04:47 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 31/36] media: subdev: add
 v4l2_subdev_set_routing_with_fmt() helper
Message-ID: <20220316110447.qv4zt7vsdmkgip2v@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-32-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-32-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Tue, Mar 01, 2022 at 06:11:51PM +0200, Tomi Valkeinen wrote:
> v4l2_subdev_set_routing_with_fmt() is the same as
> v4l2_subdev_set_routing(), but additionally initializes all the streams
> with the given format.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 ++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7f50871054cd..1ceee8313246 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1438,6 +1438,28 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
>
> +int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     struct v4l2_subdev_krouting *routing,
> +				     const struct v4l2_mbus_framefmt *fmt)
> +{
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_set_routing(sd, state, routing);
> +	if (ret)
> +		return ret;
> +
> +	stream_configs = &state->stream_configs;
> +
> +	for (i = 0; i < stream_configs->num_configs; ++i)
> +		stream_configs->configs[i].fmt = *fmt;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
> +
>  struct v4l2_mbus_framefmt *
>  v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>  				    unsigned int pad, u32 stream)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a80830801a7f..97db6dfc0b7a 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1430,6 +1430,22 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *state,
>  			    struct v4l2_subdev_krouting *routing);
>
> +/**
> + * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
> + *					state
> + * @sd: The subdevice
> + * @state: The subdevice state
> + * @routing: Routing that will be copied to subdev state
> + * @fmt: Format used to initialize all the streams
> + *
> + * This is the same as v4l2_subdev_set_routing, but additionally initializes
> + * all the streams using the given format.
> + */
> +int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     struct v4l2_subdev_krouting *routing,
> +				     const struct v4l2_mbus_framefmt *fmt);
> +
>  /**
>   * v4l2_subdev_state_get_stream_format() - Get pointer to a stream format
>   * @state: subdevice state
> --
> 2.25.1
>
