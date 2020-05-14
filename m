Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2911D310E
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 15:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgENNSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 09:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728003AbgENNSJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 09:18:09 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C18C061A0C
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 06:18:09 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id i15so3994948wrx.10
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VNhTCGFNZgYzLU384lttJYhdwPlyjw1IOnxRCY63KJ0=;
        b=BQl6Qe1v7k6AXRihXW3r13D+qfjTLmmjqCJFygRK3MD4tyXCkchKdbagxEwhPpgbuv
         7DBlGIXR+yMg479Flypi2kf0N6kUWguzQ8It8r2vi/svv+XszavU/u+wCBDUbW1FRr5z
         A8IYM4P2bIPaUlXDnmyYyeJ+1n2h9cexw0YoYIzqRnVDQ7WgSJfyJFM5VMcd6tVHh6C7
         JSscEzVFCpAKOhSX4Wdx8wucRwY+4itAZC0DLxmWIzqBmRrwMX/fPhGzzMMpuJSDeBpq
         ldSUSbNWOH/GiNzobP0JL68iJ5XCtkFe4ovcOgKA6fwWd/GqRPDjcF4Enl0diVDaSDvF
         4Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VNhTCGFNZgYzLU384lttJYhdwPlyjw1IOnxRCY63KJ0=;
        b=VCcq18MiHNI3//VDz/8BCfo4/OX4Asdj+Q+kVMu/JzOEhB7okJmCDGxjESxBBYjWFy
         Lq/1XCySeqaOMmq0JfONKKub+OcmxcMFNjLJoy/jW7PaJtdSWBSvnf/k4oym9gscoa5V
         B1X1tI1l+ExSVQa5VcPYZ3rU3otsfXsYSC+35d+wa2oqz+9e9ost+EG9FjSqMT4pQkkK
         scymoN3S8UwTjAuMkISU3c8K+/vNk1yfl2r/1xgiJ798aYMvxz5lc9vY7amqPixQSGiF
         1N2PgdMTiJ1gWsh346no6ABts1BfLpiipM7MfRsrbM6OWC19buxp79AK4QawD9r0BWA8
         qVQg==
X-Gm-Message-State: AOAM532c30Jo6dtntzNpVyorhoQVurB4D8VpQIWTJDFOavp1t9eP1iMJ
        6EjhSTAiEjBgCPhlQlox0vrlGKVWQQ5hxN4Nt5S43A==
X-Google-Smtp-Source: ABdhPJw1X5D3G6yX6odxrcXIIoql20rVabVXrTH3MJdqoOXwhoJkrqk6nZTD1Rq7232qsvt3KRD/+sUgICN2E7fQvu4=
X-Received: by 2002:a5d:4006:: with SMTP id n6mr5558353wrp.27.1589462287749;
 Thu, 14 May 2020 06:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200429095038.431430-1-jacopo@jmondi.org>
In-Reply-To: <20200429095038.431430-1-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 14 May 2020 14:17:50 +0100
Message-ID: <CAPY8ntAcBm7Zt88MxKDzOhRW0_FwK4ix91OTUB2UKq7htac0BA@mail.gmail.com>
Subject: Re: [PATCH v4] media: i2c: imx219: Implement get_selection
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

Thanks for the patch

On Wed, 29 Apr 2020 at 10:47, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Implement the get_selection pad operation for the IMX219 sensor driver.
> The supported targets report the sensor's native size, the crop default
> rectangle and the crop rectangle.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> v3->v4:
> - Re-work get selection:
>   - Remove unused variables
>   - Declare struct imx219 pointer inside the only case that needs it
>
> v2->v3:
> - Guard with critical section only the V4L2_SEL_TGT_CROP case
>
> v1->v2:
> - Add crop rectangle fro 640x480 mode
> - Re-order rectangle fields
> ---
>  drivers/media/i2c/imx219.c | 94 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index cb03bdec1f9c..9b5bb0bbf0fd 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -112,6 +112,14 @@
>  #define IMX219_TESTP_BLUE_DEFAULT      0
>  #define IMX219_TESTP_GREENB_DEFAULT    0
>
> +/* IMX219 native and active pixel array size. */
> +#define IMX219_NATIVE_WIDTH            3296U
> +#define IMX219_NATIVE_HEIGHT           2480U
> +#define IMX219_PIXEL_ARRAY_LEFT                8U
> +#define IMX219_PIXEL_ARRAY_TOP         8U
> +#define IMX219_PIXEL_ARRAY_WIDTH       3280U
> +#define IMX219_PIXEL_ARRAY_HEIGHT      2464U
> +
>  struct imx219_reg {
>         u16 address;
>         u8 val;
> @@ -129,6 +137,9 @@ struct imx219_mode {
>         /* Frame height */
>         unsigned int height;
>
> +       /* Analog crop rectangle. */
> +       struct v4l2_rect crop;
> +
>         /* V-timing */
>         unsigned int vts_def;
>
> @@ -463,6 +474,12 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 8MPix 15fps mode */
>                 .width = 3280,
>                 .height = 2464,
> +               .crop = {
> +                       .left = 0,
> +                       .top = 0,
> +                       .width = 3280,
> +                       .height = 2464
> +               },
>                 .vts_def = IMX219_VTS_15FPS,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> @@ -473,6 +490,12 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 1080P 30fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> +               .crop = {
> +                       .left = 680,
> +                       .top = 692,
> +                       .width = 1920,
> +                       .height = 1080
> +               },
>                 .vts_def = IMX219_VTS_30FPS_1080P,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> @@ -483,6 +506,12 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 2x2 binned 30fps mode */
>                 .width = 1640,
>                 .height = 1232,
> +               .crop = {
> +                       .left = 0,
> +                       .top = 0,
> +                       .width = 3280,
> +                       .height = 2464
> +               },
>                 .vts_def = IMX219_VTS_30FPS_BINNED,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> @@ -493,6 +522,12 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 640x480 30fps mode */
>                 .width = 640,
>                 .height = 480,
> +               .crop = {
> +                       .left = 1000,
> +                       .top = 752,
> +                       .width = 1280,
> +                       .height = 960
> +               },
>                 .vts_def = IMX219_VTS_30FPS_640x480,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(mode_640_480_regs),
> @@ -654,6 +689,7 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>         struct imx219 *imx219 = to_imx219(sd);
>         struct v4l2_mbus_framefmt *try_fmt =
>                 v4l2_subdev_get_try_format(sd, fh->pad, 0);
> +       struct v4l2_rect *try_crop;
>
>         mutex_lock(&imx219->mutex);
>
> @@ -664,6 +700,13 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>                                                MEDIA_BUS_FMT_SRGGB10_1X10);
>         try_fmt->field = V4L2_FIELD_NONE;
>
> +       /* Initialize try_crop rectangle. */
> +       try_crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
> +       try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> +       try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> +       try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> +       try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> +
>         mutex_unlock(&imx219->mutex);
>
>         return 0;
> @@ -928,6 +971,56 @@ static int imx219_set_framefmt(struct imx219 *imx219)
>         return -EINVAL;
>  }
>
> +static const struct v4l2_rect *
> +__imx219_get_pad_crop(struct imx219 *imx219, struct v4l2_subdev_pad_config *cfg,
> +                     unsigned int pad, enum v4l2_subdev_format_whence which)
> +{
> +       switch (which) {
> +       case V4L2_SUBDEV_FORMAT_TRY:
> +               return v4l2_subdev_get_try_crop(&imx219->sd, cfg, pad);
> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
> +               return &imx219->mode->crop;
> +       }
> +
> +       return NULL;
> +}
> +
> +static int imx219_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_pad_config *cfg,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP: {
> +               struct imx219 *imx219 = to_imx219(sd);
> +
> +               mutex_lock(&imx219->mutex);
> +               sel->r = *__imx219_get_pad_crop(imx219, cfg, sel->pad,
> +                                               sel->which);
> +               mutex_unlock(&imx219->mutex);
> +
> +               return 0;
> +       }
> +
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r.top = 0;
> +               sel->r.left = 0;
> +               sel->r.width = IMX219_NATIVE_WIDTH;
> +               sel->r.height = IMX219_NATIVE_HEIGHT;
> +
> +               return 0;
> +
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +               sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> +               sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> +               sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> +               sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> +
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  static int imx219_start_streaming(struct imx219 *imx219)
>  {
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> @@ -1152,6 +1245,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>         .enum_mbus_code = imx219_enum_mbus_code,
>         .get_fmt = imx219_get_pad_format,
>         .set_fmt = imx219_set_pad_format,
> +       .get_selection = imx219_get_selection,
>         .enum_frame_size = imx219_enum_frame_size,
>  };
>
> --
> 2.26.1
>
