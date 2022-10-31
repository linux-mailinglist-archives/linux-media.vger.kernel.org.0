Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A3D61340F
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 11:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbiJaKzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 06:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbiJaKzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 06:55:20 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE08E219F
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 03:55:19 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 59179E0002;
        Mon, 31 Oct 2022 10:55:16 +0000 (UTC)
Date:   Mon, 31 Oct 2022 11:55:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v2 16/16] media: i2c: ov9282: Support event handlers
Message-ID: <20221031105515.ugtg4dyhzem2p2ou@uno.localdomain>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-17-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028160902.2696973-17-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Oct 28, 2022 at 05:09:02PM +0100, Dave Stevenson wrote:
> As noted in the headers for V4L2_SUBDEV_FL_HAS_EVENTS,
> "controls can send events, thus drivers exposing controls
> should set this flag".
>
> This driver exposes controls, but didn't reflect that it
> could generate events. Correct this, and add the default
> event handler functions.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Sending a tag as I don't see anything worrying, but I'm just not sure
how this mechanism is intended to be used, so please wait for others
to comment!

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

> ---
>  drivers/media/i2c/ov9282.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index e2a98f480b58..f2ec92deb5ec 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -13,6 +13,7 @@
>  #include <linux/pm_runtime.h>
>
>  #include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>
> @@ -1161,6 +1162,11 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>  }
>
>  /* V4l2 subdevice ops */
> +static const struct v4l2_subdev_core_ops ov9282_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_video_ops ov9282_video_ops = {
>  	.s_stream = ov9282_set_stream,
>  };
> @@ -1175,6 +1181,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
>  };
>
>  static const struct v4l2_subdev_ops ov9282_subdev_ops = {
> +	.core = &ov9282_core_ops,
>  	.video = &ov9282_video_ops,
>  	.pad = &ov9282_pad_ops,
>  };
> @@ -1389,7 +1396,8 @@ static int ov9282_probe(struct i2c_client *client)
>  	}
>
>  	/* Initialize subdev */
> -	ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	ov9282->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>
>  	/* Initialize source pad */
> --
> 2.34.1
>
