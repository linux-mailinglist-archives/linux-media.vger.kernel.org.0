Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2B4784956
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 20:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjHVSSl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 14:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjHVSSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 14:18:38 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B02F11F
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 11:18:36 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-48d11f47ee6so863756e0c.3
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692728316; x=1693333116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ic4Gc0MYh+vvd7NJp4Y/lHyZETDs0zvwg0Uo0/Qhx3Q=;
        b=iPuLK0sswYuR4k692buJBoYUc7LOPDpl2WGAFLx8UdRiWbv1pZOZL1GYeRM0iIUDtQ
         70isjq4ZHq1SUgIycJiLoiM5+ygwpKgzJtQSxhluDujrtqrgKSxRhaB4EclszQ1AoQ/U
         JehAvgJMi7/HF+8Ad1K3qhOR2l/tL8AgVbvImRGCV6WVgHLN52dyy82AqOF41V2cy9J7
         A+Pqpx0eoWjrQ3dMuugEgUCkse83gt/qa+iOy4hXEEoqImfyMggDSOaDQk0u0Um2alUH
         wx0vQH4Lp7xLxxohRNsW2xKdQ0ArGXN1rOJ8yR2ES3LrvtFLGHnHt26muBdYSpm635QA
         Sc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692728316; x=1693333116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ic4Gc0MYh+vvd7NJp4Y/lHyZETDs0zvwg0Uo0/Qhx3Q=;
        b=LUDc3f4EQS7a/c3KNPzdx2iUeoS0tL/uWA8fXKuj3QC1D/qEfzeGL5Njm5hRO6Sk21
         Zr1/Ix2Ul/462QA8lnQ/ysxZylnqn5cEZOS0jOZWmZ32btODBIJKWptvCU2gmrX8LLzr
         ZhKE7R+iXoK0s75st0k0i75JUHCw/VN8V4K+S3fd/ajeLCC35OU62SNUwCBGiBd9LFzn
         a1floZy3s9iSge7Goeqod61NR02+wZZolqFExoD+WVVR7v4jrRpD+/wCIqrnnpn5N7vM
         lBk05Kv2Vjl4412phYeXkitlTsvOhklJO4vWD7OkZWP9b8XgTsroEiPKM+yFgskrRoUC
         xNvg==
X-Gm-Message-State: AOJu0Yz/hyp/MPETgrLqOP2en2YtskIhThznAhoyAUMILK3dFeyxPeNv
        F1pkgdQSIOVIGdQs8MwrCzcdugYAj0EA2cAz9grUYw==
X-Google-Smtp-Source: AGHT+IE6d5fL4u+c0k36ROe+kb22q5m1oj5oAO3Vsfb2P6/wvfXaStjBqmuBjGpwNB+X2iWQtPqsWh7qHGJEFAmHX8A=
X-Received: by 2002:a1f:c7c7:0:b0:48d:5be:2869 with SMTP id
 x190-20020a1fc7c7000000b0048d05be2869mr8519008vkf.7.1692728315743; Tue, 22
 Aug 2023 11:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-18-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-18-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 19:18:19 +0100
Message-ID: <CAPY8ntAKexsboYurSeT=jjxOg56_PXt9CuWgiPHbjhQbBWqu9g@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] media: i2c: imx219: Name all subdev state
 variables 'state'
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

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Subdev state variables are named with a mix of 'state' and 'sd_state'
> through the driver. To improve consistency, name them all 'state'.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 4140d9b78e4c..e2f0d3782e7c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -760,7 +760,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
>  }
>
>  static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
> -                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_state *state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
>  {
>         struct imx219 *imx219 = to_imx219(sd);
> @@ -774,7 +774,7 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  }
>
>  static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> -                                 struct v4l2_subdev_state *sd_state,
> +                                 struct v4l2_subdev_state *state,
>                                   struct v4l2_subdev_frame_size_enum *fse)
>  {
>         struct imx219 *imx219 = to_imx219(sd);
> @@ -796,7 +796,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>  }
>
>  static int imx219_set_pad_format(struct v4l2_subdev *sd,
> -                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_state *state,
>                                  struct v4l2_subdev_format *fmt)
>  {
>         struct imx219 *imx219 = to_imx219(sd);
> @@ -813,7 +813,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>
>         imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
>
> -       format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> +       format = v4l2_subdev_get_pad_format(sd, state, 0);
>         *format = fmt->format;
>
>         /*
> @@ -823,7 +823,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         bin = min3(IMX219_PIXEL_ARRAY_WIDTH / format->width,
>                    IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
>
> -       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> +       crop = v4l2_subdev_get_pad_crop(sd, state, 0);
>         crop->width = format->width * bin;
>         crop->height = format->height * bin;
>         crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
> @@ -858,12 +858,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  }
>
>  static int imx219_get_selection(struct v4l2_subdev *sd,
> -                               struct v4l2_subdev_state *sd_state,
> +                               struct v4l2_subdev_state *state,
>                                 struct v4l2_subdev_selection *sel)
>  {
>         switch (sel->target) {
>         case V4L2_SEL_TGT_CROP: {
> -               sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> +               sel->r = *v4l2_subdev_get_pad_crop(sd, state, 0);
>                 return 0;
>         }
>
> --
> Regards,
>
> Laurent Pinchart
>
