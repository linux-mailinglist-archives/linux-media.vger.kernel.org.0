Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98832784798
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 18:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237786AbjHVQaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 12:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbjHVQaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 12:30:03 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715C6184
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:30:01 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-44d60bb6aa5so256328137.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692721800; x=1693326600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=llaxiWZUnv/cFHW+c1QDG9RxUvTUxrCVAubL4iCVN/Y=;
        b=TRhdJUj+zEvyO9j1IhZKypXmhq0wgSM4V+10trHCFqcuIIXiF1/Cyvq6KOSkC0I8ut
         ivgDnr1tjH4T+rVk68ZxivTgYR7nR5ry7n9f+m+YdKoSjYN1SmTPrQsQoZk8fj6XD3ps
         EacHOrOl/lLPj/zb9VL0VWHYLKvPnPcNBleN34ufxV2YWcrlK53OGDOn1nTRNZlK6TzD
         SyTjamCtCPo7czDClAMI2XbeN14qCx0RTd6iglXiAxmDDTFQ3DFn1Bbv+uKcLbmhM3BL
         w5jK29z+5fog3zfyDoBgA8v6HnkUU1E65bD1sRy2HWst8Hw2BMtu1WTcqplrW0W03yRQ
         5H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692721800; x=1693326600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llaxiWZUnv/cFHW+c1QDG9RxUvTUxrCVAubL4iCVN/Y=;
        b=QsS+howCrSHXahlwqjcXyjlHX4JZ4FkS1hlUxQxfJMF3iI2buHMbYazR4Nfc4+wVhk
         CAQHt9CU6nr2hJocz1sajd8P1csIfjwLDYCIAz2DZFFpo3Es/HsWWTRP4YvfBAn7LNdF
         2rGKChSsOELmjCXFOvnoTw5oxP/B+eocnoVd7JtUkjZ63tVk2qN6k1vYyPcYoYp7uff5
         7/SBjqEOfbUI2tlXxz4iPIVJBQMF4O2iGEJP1cHflx9b4E++qSnIbBeswiZzdRslib3g
         1TlNzvP9BKB27FedyCjFl2DKTWbfLsDMYjD6FiRoBkGzQ8svA1KMTQlG4qrW5aTNlpQV
         CggA==
X-Gm-Message-State: AOJu0YyKCJ23lFUDIUg9jXGF7AFFXZFSP/EynPF/kSaPb2ZMylUtziaX
        C1ks+uqejq+H9/PYcs3YA5oxTTXsUhSAeo9jyC9hvw==
X-Google-Smtp-Source: AGHT+IEAqeZyjVDDeSqJQFg8BqHILT1d++d8kiukvj71n6HgIp6xWMaTYjLZJk5kIEe3+URCBwMK56bsZmNVHBesBJI=
X-Received: by 2002:a05:6102:449:b0:44d:48bf:5918 with SMTP id
 e9-20020a056102044900b0044d48bf5918mr6479834vsq.18.1692721800556; Tue, 22 Aug
 2023 09:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-7-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-7-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 17:29:44 +0100
Message-ID: <CAPY8ntBiV4uBmVEnwkZwSny+PP6F-0ZQfQ_ZJzmv8WzHHQpH7g@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] media: i2c: imx219: Merge format and binning
 setting functions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The imx219_set_binning() function sets registers based on the bpp value,
> which is computed in imx219_set_framefmt(). As both functions are called
> from the same place consecutively, and set registers based on the
> selected mode, merge them together to simplify the code.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 43 +++++++++-----------------------------
>  1 file changed, 10 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 9490dcba42ab..3a0b082d9ee0 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -618,6 +618,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  {
>         const struct imx219_mode *mode = imx219->mode;
>         unsigned int bpp;
> +       u16 bin_mode;
>         int ret = 0;
>
>         switch (format->code) {
> @@ -648,6 +649,15 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>                   mode->crop.top - IMX219_PIXEL_ARRAY_TOP + mode->crop.height - 1,
>                   &ret);
>
> +       if (!imx219->mode->binning)
> +               bin_mode = IMX219_BINNING_NONE;
> +       else if (bpp == 8)
> +               bin_mode = IMX219_BINNING_2X2_ANALOG;
> +       else
> +               bin_mode = IMX219_BINNING_2X2;
> +
> +       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE, bin_mode, &ret);

It feels a little weird using u16 for bin_mode because you happen to
know that the underlying register is 16 bit, and then are relying on
the compiler to extend it to u64 for cci_write. Is it better to use
the native u64 for cci_write, or just use unsigned int?

Either way:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> +
>         cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
>                   format->width, &ret);
>         cci_write(imx219->regmap, IMX219_REG_Y_OUTPUT_SIZE,
> @@ -665,32 +675,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>         return ret;
>  }
>
> -static int imx219_set_binning(struct imx219 *imx219,
> -                             const struct v4l2_mbus_framefmt *format)
> -{
> -       if (!imx219->mode->binning)
> -               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> -                                IMX219_BINNING_NONE, NULL);
> -
> -       switch (format->code) {
> -       case MEDIA_BUS_FMT_SRGGB8_1X8:
> -       case MEDIA_BUS_FMT_SGRBG8_1X8:
> -       case MEDIA_BUS_FMT_SGBRG8_1X8:
> -       case MEDIA_BUS_FMT_SBGGR8_1X8:
> -               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> -                                IMX219_BINNING_2X2_ANALOG, NULL);
> -
> -       case MEDIA_BUS_FMT_SRGGB10_1X10:
> -       case MEDIA_BUS_FMT_SGRBG10_1X10:
> -       case MEDIA_BUS_FMT_SGBRG10_1X10:
> -       case MEDIA_BUS_FMT_SBGGR10_1X10:
> -               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> -                                IMX219_BINNING_2X2, NULL);
> -       }
> -
> -       return -EINVAL;
> -}
> -
>  static int imx219_get_selection(struct v4l2_subdev *sd,
>                                 struct v4l2_subdev_state *sd_state,
>                                 struct v4l2_subdev_selection *sel)
> @@ -764,13 +748,6 @@ static int imx219_start_streaming(struct imx219 *imx219,
>                 goto err_rpm_put;
>         }
>
> -       ret = imx219_set_binning(imx219, format);
> -       if (ret) {
> -               dev_err(&client->dev, "%s failed to set binning: %d\n",
> -                       __func__, ret);
> -               goto err_rpm_put;
> -       }
> -
>         /* Apply customized values from user */
>         ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
>         if (ret)
> --
> Regards,
>
> Laurent Pinchart
>
