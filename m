Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA8A17389E
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 14:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgB1No6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 08:44:58 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39885 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgB1No6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 08:44:58 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so3010033wrn.6
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 05:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aBmrl1KMZNAYJPJYiblwEdDKLEW24wzQKSiXMdI8FUk=;
        b=GIj6WEkqlceW7Ez0LVnHmq9ekJuJO3gVz8RLHA5ud3ZYx2DpnVYoqDejU5t4enOVHE
         ldRMeTA5uf46PxMhKG6wcmuNIZH8Lk/Rq/7rfG+mkT6++hdCyTF8VUGicN8arq/wuk/Q
         R3tphXQZRkAc70Jw2sAdEbpj0nhRAbnH+K2akQmBUdcNo025K9ghr1gwqY7Ncg6cb8bh
         kaelh8o+lkjEqKbcmwf49MUbv1hLO3Du6WEM/lYW4gHuz5ZxZUqKis/IyabQMPzqnbZK
         nCpCleVuXzG1+tgnk6hz1VPhDGDOFtobk+TkmDknVFQKi1sYHcd5xDwNwGkqTlaJwfEP
         mulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBmrl1KMZNAYJPJYiblwEdDKLEW24wzQKSiXMdI8FUk=;
        b=RaTuqMJZieVqxO2rBwjTPIBGzTVSSxaN28y9Yr8gH1vYvwbE2y9TI54EDWnpe1NMu4
         vgs82UvFx+sbsDFKV0ltPWgISkXtZtXr0yfbg9aWBv0N3TIt2b4EqYC6BJHIQto2S8xY
         LcyiVYu2/lZ2a954Wm3sMX/D38AlKSH7Oq1L/CRAk3/gwwoH6CNgUFZXkaBgcx/15gI9
         EDSIODxQfkgyGdzXWe/6uGjdAwuO/JstEXQOLhK0lXrqBtbqBEE9TCI1KW+Rg5CDNgS0
         zvI6v0X191+PGLfYKv4DhwYtFR2xSwmisyPEXGZRLk7JUplKXKeqNFEEe/03IuHHc6KA
         BCLQ==
X-Gm-Message-State: APjAAAVpBwWYtKeEjjjBTBmIV1GsfGuz4jbTrJ8nF6c+VBHc4RfwoGqN
        kdYs3gyMWhT2HJp4KPKz1gm4XwHm10t5330o9sRQOxr7
X-Google-Smtp-Source: APXvYqxYe61m6gjSynnSaKs/Z4p3IA8+qVFYPLBBGUyxb2Bmz+nx9ERJLwWuBg1MD1UbBW1Tngan4sL1Y1w/AGmvPJQ=
X-Received: by 2002:adf:a48f:: with SMTP id g15mr4994529wrb.42.1582897494424;
 Fri, 28 Feb 2020 05:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20200227151752.21985-1-eugen.hristev@microchip.com>
In-Reply-To: <20200227151752.21985-1-eugen.hristev@microchip.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 28 Feb 2020 13:44:37 +0000
Message-ID: <CAPY8ntB17QjCSyefwTrMhudwkiFYT_5x3i1=KjzFv+p6tbrQEA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: add support for enum frame interval
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen.

On Thu, 27 Feb 2020 at 15:19, Eugen Hristev <eugen.hristev@microchip.com> wrote:
>
> Add support for enum frame intervals IOCTL.
> The current supported framerates are only available as comments inside
> the code.
> Add support for VIDIOC_ENUM_FRAMEINTERVALS as the enum_frame_interval
> callback as pad ops.
>
>  # v4l2-ctl --list-frameintervals width=1920,height=1080,pixelformat=RG10
>  ioctl: VIDIOC_ENUM_FRAMEINTERVALS
>         Interval: Discrete 0.067s (15.000 fps)
>         Interval: Discrete 0.033s (30.000 fps)
>         Interval: Discrete 0.033s (30.000 fps)

But the frame rates are not discrete. You have frame rate control via
V4L2_CID_VBLANK, which can be used in conjunction with V4L2_CID_HBLANK
and V4L2_CID_PIXEL_RATE to determine actual frame period.

See https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/ext-ctrls-image-source.html?highlight=v4l2_cid_vblank
I believe this is the preferred route to doing frame rate control on
image sensors. I assume someone will correct me if I'm wrong on that.

  Dave

> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>
> Hello,
>
> This is on top of Sakari's tree in linuxtv.org
>
> Thanks
> Eugen
>
>  drivers/media/i2c/imx219.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f1effb5a5f66..17fcedd4edb6 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -127,6 +127,8 @@ struct imx219_mode {
>         unsigned int width;
>         /* Frame height */
>         unsigned int height;
> +       /* Frame rate */
> +       u8 fps;
>
>         /* V-timing */
>         unsigned int vts_def;
> @@ -381,6 +383,7 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 8MPix 15fps mode */
>                 .width = 3280,
>                 .height = 2464,
> +               .fps = 15,
>                 .vts_def = IMX219_VTS_15FPS,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> @@ -391,6 +394,7 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 1080P 30fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> +               .fps = 30,
>                 .vts_def = IMX219_VTS_30FPS_1080P,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> @@ -401,6 +405,7 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 2x2 binned 30fps mode */
>                 .width = 1640,
>                 .height = 1232,
> +               .fps = 30,
>                 .vts_def = IMX219_VTS_30FPS_BINNED,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> @@ -680,6 +685,27 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>         return 0;
>  }
>
> +static int imx219_enum_frame_interval(struct v4l2_subdev *sd,
> +                                     struct v4l2_subdev_pad_config *cfg,
> +                                     struct v4l2_subdev_frame_interval_enum *fie)
> +{
> +       struct imx219 *imx219 = to_imx219(sd);
> +
> +       if (fie->index >= ARRAY_SIZE(supported_modes))
> +               return -EINVAL;
> +
> +       if (fie->code != imx219_get_format_code(imx219))
> +               return -EINVAL;
> +
> +       if (fie->pad)
> +               return -EINVAL;
> +
> +       fie->interval.numerator = 1;
> +       fie->interval.denominator = supported_modes[fie->index].fps;
> +
> +       return 0;
> +}
> +
>  static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
>  {
>         fmt->colorspace = V4L2_COLORSPACE_SRGB;
> @@ -1004,6 +1030,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>         .get_fmt = imx219_get_pad_format,
>         .set_fmt = imx219_set_pad_format,
>         .enum_frame_size = imx219_enum_frame_size,
> +       .enum_frame_interval = imx219_enum_frame_interval,
>  };
>
>  static const struct v4l2_subdev_ops imx219_subdev_ops = {
> --
> 2.20.1
>
