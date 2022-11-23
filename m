Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59CD26359BF
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237375AbiKWKXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237501AbiKWKWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:22:10 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6282638B0
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:08:37 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id h2so7618576ile.11
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WyhlgSD0Qi5eYBn+SBJQEiELArCoAWM3aJmJZehxrVs=;
        b=k9Xabmh506G2xZbAIQx1rAZmaDKe8mnOQtDnjqIAbIs0JKStvSwsdThsVyM55e0DDG
         GvSY3/HUEK9MozCSvRmRoPsyzXz/uhkIoVexln86g2Lu4Z6R+gcZYcB8yhKJ8bST8sUJ
         on5UlXLmcvCQh+4j5a7ih+0Wodhr1Hn+GIWdppRsClx7xDPf1gQzzq3sEjI9rrE2DCjm
         OGa3eUr/7Fh6vk+0KLqptffAxf3S36r+JgQpoMVGTtVKGAV0y8qT14Q/Rz/VnFItRU7e
         fk2lBPVp+/8nxDYodp+VI6mb2KWyGJYzrtjyMvelrSdT4hzmBnSQZl8j9dFcqNfuSfxb
         8zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyhlgSD0Qi5eYBn+SBJQEiELArCoAWM3aJmJZehxrVs=;
        b=EN9kRUBJV8YcgeGTnWrTfAQ4/Tx3FZ7dE2Rv+R6X7R8CDzgHh2XO+ejj2VSFZl/YwL
         7RiuQzZU/m/ZIgLocMKluiuzrCjIxL6QAot1rpzTrIRgyZyeFJVT/KrzseSEEDUPjPpX
         hVwuv19EKH+esTB0Lp+ac28G6SDY4K++UpDiglSF7d+4DsI/Pfc5x4SBvEr1Yt6oQ2A5
         M8zzHYsu7sb+038GY6kV13Sba/NGvjnbFb+RG9ysv36HQ2LScR34BHQA4CJKcPRFZRis
         TNAcmyAPu8fuBzEPjW9AsiymfzrCw4y43OGyjJpei9CAMlmNRPpRFZPfP4eZwgxb8LDh
         rBiw==
X-Gm-Message-State: ANoB5pl55gFiCb2ZLFZticxl0y+wre/C9PB+JgIUPjx/xqIQxNpOLBiA
        bHs3+01ijdwoqROOsJ92Ef0THjFz9aL+wpARD/VhXNGw0eW74A==
X-Google-Smtp-Source: AA0mqf773rHMEQeFmFAa2Quvl/g573Z+5EOEyBx87ZfMTeaeEYn/5ym7M/F7sgmdNVwqXub2qheliJek+qXmOxLKA+Q=
X-Received: by 2002:a92:cd0d:0:b0:302:467a:4eb2 with SMTP id
 z13-20020a92cd0d000000b00302467a4eb2mr3515439iln.165.1669198116525; Wed, 23
 Nov 2022 02:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-8-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20221122223250.21233-8-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 23 Nov 2022 10:08:19 +0000
Message-ID: <CAPY8ntAqXK3efWB+J_KG==1yuewmon1abea8enk0CL8p9pkS9A@mail.gmail.com>
Subject: Re: [PATCH v1 07/15] media: i2c: imx290: Factor out black level
 setting to a function
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The black level programmed in the BLKLEVEL register depends on the
> output format. The black level value computation is currently performed
> in imx290_set_ctrl(), in addition to having different black level values
> in the output-specific register value tables. Move it to a separate
> function to simplify the imx290_set_ctrl() code.

Does this actually help?
The sensor only supports 10 and 12 bpp readout, so making it generic
for any bpp is rather redundant.
If you are looking at having different on-sensor black level values
kicking around, then tuning data goes out the window.

OK we do appear to have duplication between imx290_[10|12]bit_settings
and imx290_set_ctrl, but I don't get the need to compute it.

  Dave

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 53 +++++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 135ed55592a1..d9fc6c44b0f0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -152,6 +152,9 @@
>  #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH             1920
>  #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT            1080
>
> +/* Equivalent value for 16bpp */
> +#define IMX290_BLACK_LEVEL_DEFAULT                     3840
> +
>  #define IMX290_NUM_SUPPLIES                            3
>
>  struct imx290_regval {
> @@ -315,7 +318,6 @@ static const struct imx290_regval imx290_10bit_settings[] = {
>         { IMX290_ADBIT2, IMX290_ADBIT2_10BIT },
>         { IMX290_ADBIT3, IMX290_ADBIT3_10BIT },
>         { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW10 },
> -       { IMX290_BLKLEVEL, 60 },
>  };
>
>  static const struct imx290_regval imx290_12bit_settings[] = {
> @@ -325,7 +327,6 @@ static const struct imx290_regval imx290_12bit_settings[] = {
>         { IMX290_ADBIT2, IMX290_ADBIT2_12BIT },
>         { IMX290_ADBIT3, IMX290_ADBIT3_12BIT },
>         { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
> -       { IMX290_BLKLEVEL, 240 },
>  };
>
>  /* supported link frequencies */
> @@ -516,35 +517,43 @@ static int imx290_set_data_lanes(struct imx290 *imx290)
>         return ret;
>  }
>
> +static int imx290_set_black_level(struct imx290 *imx290,
> +                                 unsigned int black_level, int *err)
> +{
> +       return imx290_write(imx290, IMX290_BLKLEVEL,
> +                           black_level >> (16 - imx290->bpp), err);
> +}
> +
>  static int imx290_write_current_format(struct imx290 *imx290)
>  {
> +       const struct imx290_regval *regs;
> +       unsigned int num_regs;
> +       unsigned int bpp;
>         int ret;
>
>         switch (imx290->current_format.code) {
>         case MEDIA_BUS_FMT_SRGGB10_1X10:
> -               ret = imx290_set_register_array(imx290, imx290_10bit_settings,
> -                                               ARRAY_SIZE(
> -                                                       imx290_10bit_settings));
> -               if (ret < 0) {
> -                       dev_err(imx290->dev, "Could not set format registers\n");
> -                       return ret;
> -               }
> +               regs = imx290_10bit_settings;
> +               num_regs = ARRAY_SIZE(imx290_10bit_settings);
> +               bpp = 10;
>                 break;
>         case MEDIA_BUS_FMT_SRGGB12_1X12:
> -               ret = imx290_set_register_array(imx290, imx290_12bit_settings,
> -                                               ARRAY_SIZE(
> -                                                       imx290_12bit_settings));
> -               if (ret < 0) {
> -                       dev_err(imx290->dev, "Could not set format registers\n");
> -                       return ret;
> -               }
> +               regs = imx290_12bit_settings;
> +               num_regs = ARRAY_SIZE(imx290_12bit_settings);
> +               bpp = 12;
>                 break;
>         default:
>                 dev_err(imx290->dev, "Unknown pixel format\n");
>                 return -EINVAL;
>         }
>
> -       return 0;
> +       ret = imx290_set_register_array(imx290, regs, num_regs);
> +       if (ret < 0) {
> +               dev_err(imx290->dev, "Could not set format registers\n");
> +               return ret;
> +       }
> +
> +       return imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT, &ret);
>  }
>
>  /* ----------------------------------------------------------------------------
> @@ -573,7 +582,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>
>         case V4L2_CID_TEST_PATTERN:
>                 if (ctrl->val) {
> -                       imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
> +                       imx290_set_black_level(imx290, 0, &ret);
>                         usleep_range(10000, 11000);
>                         imx290_write(imx290, IMX290_PGCTRL,
>                                      (u8)(IMX290_PGCTRL_REGEN |
> @@ -582,12 +591,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>                 } else {
>                         imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
>                         usleep_range(10000, 11000);
> -                       if (imx290->bpp == 10)
> -                               imx290_write(imx290, IMX290_BLKLEVEL, 0x3c,
> -                                            &ret);
> -                       else /* 12 bits per pixel */
> -                               imx290_write(imx290, IMX290_BLKLEVEL, 0xf0,
> -                                            &ret);
> +                       imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT,
> +                                              &ret);
>                 }
>                 break;
>         default:
> --
> Regards,
>
> Laurent Pinchart
>
