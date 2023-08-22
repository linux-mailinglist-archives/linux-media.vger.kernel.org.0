Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7036E784951
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 20:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjHVSPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 14:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjHVSPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 14:15:40 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72BC133
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 11:15:38 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-79b191089a3so1541043241.3
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692728138; x=1693332938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vBlk0euG2zgpXXhJjyUuX4rA4rxI7pV3Yx0VvTsWKvY=;
        b=IPMCsUnHLaXl+MD4gySfHFYokpN5gwb29Tj/7M9CpUO9FrrAHWbZWGvpP6UfGwttOq
         8bJZd1AANT7l1wcJvqTTM6ikVbFLNtLrJwqsmx0KbF7dFE/t5nhzAwTbcRwDMdLoWf01
         lVi7eaQ7G1GCPSaDPYGZw+Be6AXql4EyLjb7Vc3cHA0/q5i8W+I4vM4rgEirqlbZRgY6
         csl8qFqfYXDePdfj2jmKqlMvKf/6lER5e465Di89SYbu/5dqkNX8flZMFb5RzK3dkRlW
         HZb38N3+Mv8P40OR2xciehAaKCkM5ByjbDiY9nRImVLZ+1cGtulfxTWvDhWqZjfOWSVB
         +Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692728138; x=1693332938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBlk0euG2zgpXXhJjyUuX4rA4rxI7pV3Yx0VvTsWKvY=;
        b=kXtlfYRbUQsY6zLT9FWNUzIgn/vDUNw1qO3S+lqEo3i7oYr6nUNkbUnnq/Uxkn4Bpk
         s1z7AGMHv5SFdN/XasRBVqvJUWxzjG6eCWz20Syv1ykcS0xqNB2P8YT27yxaYz7R1xrK
         fMWJF/RcFVaBbZgE9dy8JMAUct8Sxtn+RVl+jwbjAksQ1Rzw1Oa2T5reTPmATG1nKfCg
         XBQLB29Tcx3V9lLCAb10ngDkuGczOyA8+Yoo7twm8u9VREIRLwCOK0dS1wQQZsW1Ucz1
         i/lTQY/+JYserjtJ88q4zzq0DIxlPQfwWwzXb+Z3KJYGEUuIDBSTaZfUQSIYuW4Qui9b
         v/mw==
X-Gm-Message-State: AOJu0YzOtI0iTTvI8Ti5C72CUzmgG2akvHOeQLtLPhCKM+r+334OHLWW
        fw8Oie5NQqrq6Z4H+jVmej4JNWu2gbMbMMEMnWcRnQYggEYdZbnH
X-Google-Smtp-Source: AGHT+IERgjILHoXBXDJzj1mlGsCrUVx/iE21EUPIMAx+g8GLP5J/hBUgyBXLgEDtUcU7x9qqpURXc66Iz7r9BxxBhms=
X-Received: by 2002:a67:de08:0:b0:447:7cb1:3148 with SMTP id
 q8-20020a67de08000000b004477cb13148mr10012613vsk.33.1692728137909; Tue, 22
 Aug 2023 11:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-17-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-17-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 19:15:21 +0100
Message-ID: <CAPY8ntAmdkSKcGVdCURt-Zae-nQk9Ljwu0Gp28bx-Er6_Vq-AA@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] media: i2c: imx219: Calculate crop rectangle dynamically
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Calculate the crop rectangle size and location dynamically when setting
> the format, instead of storing it in the imx219_mode structure. This
> removes duplicated information from the mode, to guarantee consistency.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 45 +++++++++++++-------------------------
>  1 file changed, 15 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 646d73d1e6a3..4140d9b78e4c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -18,6 +18,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> @@ -152,9 +153,6 @@ struct imx219_mode {
>         /* Frame height */
>         unsigned int height;
>
> -       /* Analog crop rectangle. */
> -       struct v4l2_rect crop;
> -
>         /* V-timing */
>         unsigned int vts_def;
>  };
> @@ -292,48 +290,24 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 8MPix 15fps mode */
>                 .width = 3280,
>                 .height = 2464,
> -               .crop = {
> -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> -                       .top = IMX219_PIXEL_ARRAY_TOP,
> -                       .width = 3280,
> -                       .height = 2464
> -               },
>                 .vts_def = 3526,
>         },
>         {
>                 /* 1080P 30fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> -               .crop = {
> -                       .left = 688,
> -                       .top = 700,
> -                       .width = 1920,
> -                       .height = 1080
> -               },
>                 .vts_def = 1763,
>         },
>         {
>                 /* 2x2 binned 30fps mode */
>                 .width = 1640,
>                 .height = 1232,
> -               .crop = {
> -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> -                       .top = IMX219_PIXEL_ARRAY_TOP,
> -                       .width = 3280,
> -                       .height = 2464
> -               },
>                 .vts_def = 1763,
>         },
>         {
>                 /* 640x480 30fps mode */
>                 .width = 640,
>                 .height = 480,
> -               .crop = {
> -                       .left = 1008,
> -                       .top = 760,
> -                       .width = 1280,
> -                       .height = 960
> -               },
>                 .vts_def = 1763,
>         },
>  };
> @@ -830,6 +804,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         int exposure_max, exposure_def, hblank;
>         struct v4l2_mbus_framefmt *format;
>         struct v4l2_rect *crop;
> +       unsigned int bin;
>
>         mode = v4l2_find_nearest_size(supported_modes,
>                                       ARRAY_SIZE(supported_modes),
> @@ -839,10 +814,20 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
>
>         format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> -       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> -
>         *format = fmt->format;
> -       *crop = mode->crop;
> +
> +       /*
> +        * Use binning to maximize the crop rectangle size, and centre it in the
> +        * sensor. Bin by the same factor horizontally and vertically.
> +        */
> +       bin = min3(IMX219_PIXEL_ARRAY_WIDTH / format->width,
> +                  IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);

If you're insisting that binning is by the same factor horizontally
and vertically, why consider both in the min? Either only look at one,
or we start looking at making H & V binning independent.

  Dave

> +
> +       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> +       crop->width = format->width * bin;
> +       crop->height = format->height * bin;
> +       crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
> +       crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>                 /* Update limits and set FPS to default */
> --
> Regards,
>
> Laurent Pinchart
>
