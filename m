Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01A3457D00E
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 17:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiGUPnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 11:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbiGUPnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 11:43:24 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C9788E36
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 08:39:25 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bp15so3842070ejb.6
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 08:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cPDpOMGYakK7cZ6t6rrOYvvbn68AEaxrviWTN5Qn6sI=;
        b=so2R/ZLZAaES7jjHvOtSZn/XP76ZDJ4duOEFrpYNmA+Fut8BuoxWJF84UaBfmwHcMp
         eclM7T/IRei37sLIP+1488uwtZFrRAUYii22Sccip697TCzNPe9YyrRnk8Gdz+vh3OVY
         yRISt204ecE+YRPh4ft6DyKdezDOVcXJjb+qvpxlH/VLf7e8y0htXaBqgQODRtIq3Yut
         xJxS13k+2K75GkptrOISK+1JWiVSXmvm4tGqzH+Lb9tvRVFXWe9MzDrZzCaAGhVJBtz8
         8e3Iz56/ZDuu2mxQpr7xOLx5PlMWnwWM+iPEw+ZDRYlBJofIKHC3chxay3Tkgzt35G/J
         HLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cPDpOMGYakK7cZ6t6rrOYvvbn68AEaxrviWTN5Qn6sI=;
        b=Yua8Rm/eQ+JciqI9U1Q1x4mRrnL4c7usqUW5bY2ucW0daSk9XIL4Op1sAi8Uv5p7Ub
         H4ZMghewYmlZsppN2jVs5c6YrU5/zujxYRWuqUZaKNgl4OsVzmAXjmmafifNT5eugkW6
         5KVXGD4OOlhs1nNEKg3A4IxcgVAOHMQo9KeaX496gAtiAIGpvNsGQlte/8KUHzd/xzfe
         61Cy+N+4W6SR2HFLwcYjCMcwb0VH2YoAfkZATg3h+ZzOTQ3d/tztm1qWp78nQwBzD3nT
         jDuRN+NzAXHJhwDVsmQkcZOPp3L/CGWFlniYEZ8n33vBgZmnXqQrxod2MRdarBWquP/Q
         TUcw==
X-Gm-Message-State: AJIora/5KuBf6uM7vN0clbpTpWKBYclC+TYqqT82Q4TiwU7DDpmiCTIh
        a4maHHdNddjM+pw4bv1ryavMiS3ra0wMi0WftgYtul5R/yA=
X-Google-Smtp-Source: AGRyM1ui/8JtAs7cum2HQwFfAhOQNWu0wGrfYkY2Lui/AbJC8WbopkkWaY5hy/PsrTJy4B8+UvDAwDUEBxKkACq3nWw=
X-Received: by 2002:a17:907:2718:b0:72b:6b65:37dc with SMTP id
 w24-20020a170907271800b0072b6b6537dcmr40934222ejk.425.1658417964435; Thu, 21
 Jul 2022 08:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-19-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220721083540.1525-19-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 21 Jul 2022 16:39:08 +0100
Message-ID: <CAPY8ntD=rk+dfA8_gjJ7-Q07qL0Fgz5y_ug+jXJh=CH1U=bjjQ@mail.gmail.com>
Subject: Re: [PATCH 18/19] media: i2c: imx290: Add crop selection targets support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 21 Jul 2022 at 09:36, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Implement read-only access to crop selection rectangles to expose the
> analogue crop rectangle. The public (leaked) IMX290 documentation is not
> very clear on how cropping is implemented and configured exactly, so
> the margins may not be entirely accurate.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 94 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index baf9941c5fbe..0cb11ec1cf0f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -105,6 +105,53 @@
>
>  #define IMX290_VMAX_DEFAULT                            1125
>
> +
> +/*
> + * The IMX290 pixel array is organized as follows:
> + *
> + *     +------------------------------------+
> + *     |           Optical Black            |     }  Vertical effective optical black (10)
> + * +---+------------------------------------+---+
> + * |   |                                    |   | }  Effective top margin (8)
> + * |   |   +----------------------------+   |   | \
> + * |   |   |                            |   |   |  |
> + * |   |   |                            |   |   |  |
> + * |   |   |                            |   |   |  |
> + * |   |   |    Recording Pixel Area    |   |   |  | Recommended height (1080)
> + * |   |   |                            |   |   |  |
> + * |   |   |                            |   |   |  |
> + * |   |   |                            |   |   |  |
> + * |   |   +----------------------------+   |   | /
> + * |   |                                    |   | }  Effective bottom margin (8)

I have an official datasheet from Sony. "Effective margin for colour
processing" at the bottom is stated to be 9 lines, not 8. That also
makes the numbers then tally of total height being 8 + 1080 + 9 =
1097.

Otherwise I agree with the numbers you quote here.

My datasheet does go into how window mode is configured, however
window mode is not being used.
The register sets present in the driver set the output image size to
1920x1080 or 1280x720 of the overall 1945x1097 pixels. They differ
slightly from the definitions given in the datasheet for the Full HD
1080p and HD720p modes which read out 1945x1097 and 1297x725 pixels
respectively (assuming I've read it correctly). Exactly how those
extra pixels are cropped off isn't defined, but I'd suspect it was the
top left portion of the full image.

If you want 100% defined cropping for each mode then that should be
achievable using window mode.

  Dave

> + * +---+------------------------------------+---+
> + *  <-> <-> <--------------------------> <-> <->
> + *                                            \----  Ignored right margin (4)
> + *                                        \--------  Effective right margin (9)
> + *                       \-------------------------  Recommended width (1920)
> + *       \-----------------------------------------  Effective left margin (8)
> + *   \---------------------------------------------  Ignored left margin (4)
> + *
> + * The optical black lines are output over CSI-2 with a separate data type.
> + *
> + * The pixel array is meant to have 1920x1080 usable pixels after image
> + * processing in an ISP. It has 8 (9) extra active pixels usable for color
> + * processing in the ISP on the top and left (bottom and right) sides of the
> + * image. In addition, 4 additional pixels are present on the left and right
> + * sides of the image, documented as "ignored area".
> + *
> + * As far as is understood, all pixels of the pixel array (ignored area, color
> + * processing margins and recording area) can be output by the sensor.
> + */
> +
> +#define IMX290_PIXEL_ARRAY_WIDTH                       1945
> +#define IMX290_PIXEL_ARRAY_HEIGHT                      1097
> +#define IMX920_PIXEL_ARRAY_MARGIN_LEFT                 12
> +#define IMX920_PIXEL_ARRAY_MARGIN_RIGHT                        13
> +#define IMX920_PIXEL_ARRAY_MARGIN_TOP                  8
> +#define IMX920_PIXEL_ARRAY_MARGIN_BOTTOM               9
> +#define IMX290_PIXEL_ARRAY_RECORDING_WIDTH             1920
> +#define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT            1080
> +
>  static const char * const imx290_supply_name[] = {
>         "vdda",
>         "vddd",
> @@ -671,6 +718,52 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>         return 0;
>  }
>
> +static int imx290_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *sd_state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       struct imx290 *imx290 = to_imx290(sd);
> +       struct v4l2_mbus_framefmt *format;
> +
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP: {
> +               format = imx290_get_pad_format(imx290, sd_state, sel->which);
> +
> +               mutex_lock(&imx290->lock);
> +
> +               sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> +                          + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
> +               sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> +                           + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2;
> +               sel->r.width = format->width;
> +               sel->r.height = format->height;
> +
> +               mutex_unlock(&imx290->lock);
> +               return 0;
> +       }
> +
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               sel->r.top = 0;
> +               sel->r.left = 0;
> +               sel->r.width = IMX290_PIXEL_ARRAY_WIDTH;
> +               sel->r.height = IMX290_PIXEL_ARRAY_HEIGHT;
> +
> +               return 0;
> +
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +               sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP;
> +               sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT;
> +               sel->r.width = IMX290_PIXEL_ARRAY_RECORDING_WIDTH;
> +               sel->r.height = IMX290_PIXEL_ARRAY_RECORDING_HEIGHT;
> +
> +               return 0;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
>  static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
>                                   struct v4l2_subdev_state *sd_state)
>  {
> @@ -887,6 +980,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
>         .enum_frame_size = imx290_enum_frame_size,
>         .get_fmt = imx290_get_fmt,
>         .set_fmt = imx290_set_fmt,
> +       .get_selection = imx290_get_selection,
>  };
>
>  static const struct v4l2_subdev_ops imx290_subdev_ops = {
> --
> Regards,
>
> Laurent Pinchart
>
