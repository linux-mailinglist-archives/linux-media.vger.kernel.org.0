Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B95C6892C7
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 09:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjBCIyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 03:54:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjBCIyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 03:54:51 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB542CC70
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 00:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675414489; x=1706950489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HJ5nToB38NOPi54vj+UKu4114FZFFyazFWHuwYY85Y8=;
  b=YaQfdG3DeB3IouuMPBjnOw1UQwlgGudDS4xEzFBqAXm4dUnQF4yskFPk
   ZKncuziEB+Zon67P5IyjgWvSHyPg5tZuUwLYHpL3wAQTjsVJfevTyMZAQ
   ow+tgxoK2T0RnLUKaYxc7G+jE5i4FLnZz626LtCI+4PnLaXNGIHV0ckVX
   GvnGApsbHyGuf65iazRfbSpuGyk8LWh+IxanhTzaXXq3bkMU1NuDv0YWu
   69p1oBsahtGOgRa/r/dR80Ex8OLDetCiUj4mxeF6NwKjpnRZwt4xduwPo
   h6/Qdg7zT+fl0BypwiRXKsexPyQxzdIT7ksI4AydUGcFPv6yEEc4zaWE+
   g==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28848310"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 09:54:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 09:54:47 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 09:54:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675414487; x=1706950487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HJ5nToB38NOPi54vj+UKu4114FZFFyazFWHuwYY85Y8=;
  b=oee2Qo2MuEHwDHIwjJoPLbDye9fGguORrjjqU4Yqz+XE8DFE8x1xWk2V
   88LLWMdmTjEPnazxTxcEJp3tj+EPkQnhrgRr8SEjkK3p/UIc41ERFM/yF
   GCrFcvVof1FhBuxcN2qu4LqkurCbSZLRQhG5CBxaehIgDomz8a/jX2+8v
   STCBbhf0tEi0yxBvQnskGqQaksdNMTWIOraXEpAIUsb28ocim9BQ4GcEg
   H/kI5JOBN7UCintvI0AsJ4neUgj7uFGoh9HyLFSqcK+4FTA43tJpnKYPr
   q8h5MMw6k4zsdMhacy6Q0JCUF5aekKtHzBW+HnkSrS1NUTciqUvySSbPK
   g==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28848308"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 09:54:46 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B7689280056;
        Fri,  3 Feb 2023 09:54:46 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 03/11] media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
Date:   Fri, 03 Feb 2023 09:54:46 +0100
Message-ID: <38083473.10thIPus4b@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230131192016.3476937-4-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com> <20230131192016.3476937-4-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

thanks for the patch.

Am Dienstag, 31. Januar 2023, 20:20:08 CET schrieb Dave Stevenson:
> Any V4L2 subdevice that implements controls and declares
> V4L2_SUBDEV_FL_HAS_DEVNODE should also declare V4L2_SUBDEV_FL_HAS_EVENTS
> and implement subscribe_event and unsubscribe_event hooks.
> 
> This driver didn't and would therefore fail v4l2-compliance
> testing.
> 
> Add the relevant hooks.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/i2c/imx290.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index bf96fd914303..12946ca9d8d2 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -20,6 +20,7 @@
>  #include <media/media-entity.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
> 
> @@ -977,6 +978,11 @@ static int imx290_entity_init_cfg(struct v4l2_subdev
> *subdev, return 0;
>  }
> 
> +static const struct v4l2_subdev_core_ops imx290_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_video_ops imx290_video_ops = {
>  	.s_stream = imx290_set_stream,
>  };
> @@ -991,6 +997,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops =
> { };
> 
>  static const struct v4l2_subdev_ops imx290_subdev_ops = {
> +	.core = &imx290_core_ops,
>  	.video = &imx290_video_ops,
>  	.pad = &imx290_pad_ops,
>  };
> @@ -1009,7 +1016,8 @@ static int imx290_subdev_init(struct imx290 *imx290)
>  	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> 
>  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> -	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	imx290->sd.dev = imx290->dev;
>  	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
>  	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;




