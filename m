Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61AE1E2670
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 18:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgEZQFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 12:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729169AbgEZQFu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 12:05:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077C9C03E96F
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 09:05:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l11so20992422wru.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7cPMOzmzrq5LcaA6afOlcnUvTlySbm2Zz5cRjRBFUB8=;
        b=hHB73bWGgQwTTVf8pYNmpNnooECAKXvA6l40jbW1uF1ZgSFspa4p5HEpzKOEmq5d20
         MbKb6r6mfL/O1NX8CgiiI9OI5qA9kXXUDrCA5TEtqQxuTV72NYqO6Z+iZYc/LUaJ2guQ
         v2/vgZVeEE5aloi0hzrlkeL0Mtu4rXHaBHDfm+P9FDl4IaBu1UlfIYP3ZH9KphTe2l0I
         l9f+H/yPg5k4Vhe9e0O5WU60ouZHRKLTzP3DmRQX7+vEVJI9CODui4DnmyDQGWvgRv/z
         BcWuO1KOXDQVFhhLDcTzU6ENEm3Bm3mo5s/exOQOZ/Qh68+Ka+fCJDgekxM4EdjrADko
         IIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7cPMOzmzrq5LcaA6afOlcnUvTlySbm2Zz5cRjRBFUB8=;
        b=V91DsIwaBc8HCEB+IPps7hN88tLDVO3ci2lz/Cjmbii0TFTXn3jEMUfDoBOkkwEXU7
         YHONeCGF9S0aElJqFGQDRAEh6LftaUg62Q8r0E4jf4X6GKXavImBZfB3yYkPdIq7fvp0
         jx1sJ7LtVrD7RHfFEMEs4DGdScZYtYHkCIDsXrTzl9JIHwoRcVvRawAavwDWOvKmMPXx
         BTCnbwkjuIF17FHprYb/SkxnMwt9xaYLYsGlV5dezuLljvob4cmWDIOl2iJBbhJXhd/p
         eDtjYxKnudbjVWiCaPOBuQs6UohGEeekzE8LmHKo9ynvaZTI8T1Ln7fk1JRBzQoeB8zw
         R5rg==
X-Gm-Message-State: AOAM530G7mM8tAn+0f++5nMkboISK423EI0FY4OmmKdMswTLSqE4KRpu
        PXEOayENg5+H1nUcljKpUKn//yGYuAcxmDwRg6UH4Q==
X-Google-Smtp-Source: ABdhPJzbNZzcmv/E+mCoy9/ugd+2hWuRWbmHIetsobYOKHTzpGICK6/mhGNbuGycrtPlxefT05gv7k8iaVD6IUq7zHc=
X-Received: by 2002:a5d:500d:: with SMTP id e13mr12590422wrt.150.1590509148646;
 Tue, 26 May 2020 09:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200524192505.20682-1-andrey.konovalov@linaro.org> <20200524192505.20682-8-andrey.konovalov@linaro.org>
In-Reply-To: <20200524192505.20682-8-andrey.konovalov@linaro.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 26 May 2020 17:05:31 +0100
Message-ID: <CAPY8ntAW+yfxw0NTDi3yEwoZ+AqUuXD__pqB977bXgJr=jnNXg@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] media: i2c: imx290: Add RAW12 mode support
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        manivannan.sadhasivam@linaro.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey

Thanks for the patch.

On Sun, 24 May 2020 at 20:26, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> IMX290 is capable of outputting frames in both Raw Bayer (packed) 10 and
> 12 bit formats. Since the driver already supports RAW10 mode, let's add
> the missing RAW12 mode as well.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/i2c/imx290.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 162c345fffac..6e70ff22bc5f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -71,6 +71,7 @@ struct imx290 {
>         struct clk *xclk;
>         struct regmap *regmap;
>         u8 nlanes;
> +       u8 bpp;
>
>         struct v4l2_subdev sd;
>         struct v4l2_fwnode_endpoint ep;
> @@ -90,10 +91,12 @@ struct imx290 {
>
>  struct imx290_pixfmt {
>         u32 code;
> +       u8 bpp;
>  };
>
>  static const struct imx290_pixfmt imx290_formats[] = {
> -       { MEDIA_BUS_FMT_SRGGB10_1X10 },
> +       { MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> +       { MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
>  };
>
>  static const struct regmap_config imx290_regmap_config = {
> @@ -261,6 +264,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
>         { 0x300b, 0x00},
>  };
>
> +static const struct imx290_regval imx290_12bit_settings[] = {
> +       { 0x3005, 0x01 },
> +       { 0x3046, 0x01 },
> +       { 0x3129, 0x00 },
> +       { 0x317c, 0x00 },
> +       { 0x31ec, 0x0e },
> +       { 0x3441, 0x0c },
> +       { 0x3442, 0x0c },
> +       { 0x300a, 0xf0 },
> +       { 0x300b, 0x00 },
> +};
> +
>  /* supported link frequencies */
>  static const s64 imx290_link_freq_2lanes[] = {
>         891000000, /* 1920x1080 -  2 lane */
> @@ -421,7 +436,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>                 } else {
>                         imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
>                         msleep(10);
> -                       imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
> +                       if (imx290->bpp == 10)
> +                               imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
> +                                                0x3c);
> +                       else /* 12 bits per pixel */
> +                               imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
> +                                                0xf0);
>                         imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
>                 }
>                 break;
> @@ -496,7 +516,7 @@ static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
>         u8 nlanes = imx290->nlanes;
>
>         /* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> -       return (link_freq * 2 * nlanes / 10);
> +       return (link_freq * 2 * nlanes / imx290->bpp);

This doesn't link on a 32bit system as it's a 64bit divide:
ERROR: "__aeabi_ldivmod" [drivers/media/i2c/imx290.ko] undefined!
It ought to be using do_div().

Admittedly it didn't compile before as you still had a s64 divide by
10, but I hadn't tried that :-)

  Dave

>  }
>
>  static int imx290_set_fmt(struct v4l2_subdev *sd,
> @@ -533,6 +553,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>         } else {
>                 format = &imx290->current_format;
>                 imx290->current_mode = mode;
> +               imx290->bpp = imx290_formats[i].bpp;
>
>                 if (imx290->link_freq)
>                         __v4l2_ctrl_s_ctrl(imx290->link_freq,
> @@ -577,6 +598,15 @@ static int imx290_write_current_format(struct imx290 *imx290)
>                         return ret;
>                 }
>                 break;
> +       case MEDIA_BUS_FMT_SRGGB12_1X12:
> +               ret = imx290_set_register_array(imx290, imx290_12bit_settings,
> +                                               ARRAY_SIZE(
> +                                                       imx290_12bit_settings));
> +               if (ret < 0) {
> +                       dev_err(imx290->dev, "Could not set format registers\n");
> +                       return ret;
> +               }
> +               break;
>         default:
>                 dev_err(imx290->dev, "Unknown pixel format\n");
>                 return -EINVAL;
> --
> 2.17.1
>
