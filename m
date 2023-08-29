Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C15078C1DA
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 11:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbjH2J4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 05:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbjH2J4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 05:56:37 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363591BF
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 02:56:09 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-48d0e332f4dso1293688e0c.2
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1693302968; x=1693907768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5IRJcJ6Kn6IrPrlciJpal4Z2erzVO0JSWl9XCaFGg6M=;
        b=hRS8yHa1TF5UnDGu8y6p1Z17pZom+zQLI+J8f/xCe/sND9orEflp369HXKsGHAy2bU
         1ez9tHebUjlz6IgPeEhrKv9tvJjYkB2fUa8gG5lsLf7rfQKkUdDXFE9DRLeUQMuRDjmy
         WAsCSO5E246GyQ33i4/WebYP+05NjprUDPGUL30BdkQv1akDawuGR1wyP/ruoHTZ1hBz
         BsZ6yOT7M0hsrHFB4t+FJyJLQmAdmxmJmY0I9pIXu/cncPp3xakxrAtWaZLg699+2yTi
         gH8Vln7DMadSBGidfZ7EB2HLYQVM0DKD2X+phPdUfRvfwh+cGSF/V7M4GzJ4lI+Di9RE
         7f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693302968; x=1693907768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IRJcJ6Kn6IrPrlciJpal4Z2erzVO0JSWl9XCaFGg6M=;
        b=dY9ZTOcZCa2vK4/ZuxbvYQ4UgkWjWp27Bpr1zSzujt0GmYm1ycVW+DQYzlKSigO1k1
         JESHJ66Jd8uYThgukreeBy3GW8YZYrOMIFKtaoDVo71+Nn4c0tTAII9VawlGk89IsFMW
         eTmaqEgcyUML0+xxHwpuTbxrwkxjbpuiBdt18geouStoT5MMuCfm7wTbX9DYaJmPdvXe
         m/RrV/cRYvbVfrHUc+hNc1tvVc83bSLua3x1CqGDjKTCVA5apvCpCiHtMt2ppykKfzpJ
         yoLQ5LNwABmD18yPLJNunC/uE6OPVUoq7gbW3HJWU5B9SD9wKEEzMv2uaWIChZFpVmce
         32EQ==
X-Gm-Message-State: AOJu0YzilPCEdXtb4tpI/YK4JymrWBNOVUy1mQtaR6xmmR/WgAKPcJg8
        pLpJtgTE/bSu5drK+Ldxs0LoCVNZ2fRjFYDXW490/g==
X-Google-Smtp-Source: AGHT+IEhrkSx0sXKUnegfKrxSyr2YC08Q2lJPNwHjqQs+BPZc8/+A+mYXKfPr/KM6krX6/5mddzh7Mfh9a3ntatLMx4=
X-Received: by 2002:a1f:dac4:0:b0:48f:9778:2ba2 with SMTP id
 r187-20020a1fdac4000000b0048f97782ba2mr18600673vkg.5.1693302968057; Tue, 29
 Aug 2023 02:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-10-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-10-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 29 Aug 2023 10:55:53 +0100
Message-ID: <CAPY8ntCaT5X5E5PKM4C-8uQumBbqr3FRG5aD+trcrF087jbNNQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] media: i2c: imx219: Infer binning settings from
 format and crop
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
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

Sorry for the delay in reviewing these ones - I got lost in the subdev
state stuff and the magic associated with "which" changing the state
passed in.

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Compare the format and crop rectangle dimensions to infer binning
> settings, instead of storing the binning mode in the imx219_mode
> structure. This removes duplicate information from the mode.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 1205986ce47e..0c26cbfe58f3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -161,9 +161,6 @@ struct imx219_mode {
>
>         /* V-timing */
>         unsigned int vts_def;
> -
> -       /* 2x2 binning is used */
> -       bool binning;
>  };
>
>  static const struct cci_reg_sequence imx219_common_regs[] = {
> @@ -306,7 +303,6 @@ static const struct imx219_mode supported_modes[] = {
>                         .height = 2464
>                 },
>                 .vts_def = IMX219_VTS_15FPS,
> -               .binning = false,
>         },
>         {
>                 /* 1080P 30fps cropped */
> @@ -319,7 +315,6 @@ static const struct imx219_mode supported_modes[] = {
>                         .height = 1080
>                 },
>                 .vts_def = IMX219_VTS_30FPS_1080P,
> -               .binning = false,
>         },
>         {
>                 /* 2x2 binned 30fps mode */
> @@ -332,7 +327,6 @@ static const struct imx219_mode supported_modes[] = {
>                         .height = 2464
>                 },
>                 .vts_def = IMX219_VTS_30FPS_BINNED,
> -               .binning = true,
>         },
>         {
>                 /* 640x480 30fps mode */
> @@ -345,7 +339,6 @@ static const struct imx219_mode supported_modes[] = {
>                         .height = 960
>                 },
>                 .vts_def = IMX219_VTS_30FPS_640x480,
> -               .binning = true,
>         },
>  };
>
> @@ -648,7 +641,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>         cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
>                   crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
>
> -       if (!imx219->mode->binning)
> +       if (format->width == crop->width && format->height == crop->height)
>                 bin_mode = IMX219_BINNING_NONE;
>         else if (bpp == 8)
>                 bin_mode = IMX219_BINNING_2X2_ANALOG;
> --
> Regards,
>
> Laurent Pinchart
>
