Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC5F5F6412
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 12:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbiJFKBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 06:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbiJFKA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 06:00:26 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7956E1B7AE
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 03:00:03 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D92A824000E;
        Thu,  6 Oct 2022 09:59:57 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:59:56 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 16/16] media: i2c: ov9282: Support event handlers
Message-ID: <20221006095956.dy5x3ie2gf635b3w@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-17-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-17-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:28:09PM +0100, Dave Stevenson wrote:
> As noted in the headers for V4L2_SUBDEV_FL_HAS_EVENTS,
> "controls can send events, thus drivers exposing controls
> should set this flag".
>

I was expecting this to only apply to drivers that actually generate
events...

Not sure I can give a tag here as my understanding of this part is
limited, let's wait for other opinions :)


> This driver exposes controls, but didn't reflect that it
> could generate events. Correct this, and add the default
> event handler functions.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index bc429455421e..416c9656e3ac 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -14,6 +14,7 @@
>  #include <linux/regulator/consumer.h>
>
>  #include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>
> @@ -1189,6 +1190,11 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
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
> @@ -1203,6 +1209,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
>  };
>
>  static const struct v4l2_subdev_ops ov9282_subdev_ops = {
> +	.core = &ov9282_core_ops,
>  	.video = &ov9282_video_ops,
>  	.pad = &ov9282_pad_ops,
>  };
> @@ -1419,7 +1426,8 @@ static int ov9282_probe(struct i2c_client *client)
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
