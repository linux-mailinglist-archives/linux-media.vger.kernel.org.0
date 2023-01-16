Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 454EE66C415
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 16:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjAPPiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 10:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjAPPhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 10:37:52 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24A324100
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 07:36:30 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id k12so8588182plk.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 07:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wGfjRsyHVB76myMWbk5QlTTbsQRS7NTA03gF+sfNaz0=;
        b=Bb7pdnDv3XHy85kr5jc5ZHdjl+hrzJQz1d+g99/AeEOyT1fsgQaeaHoNlINxnZeI74
         zsmpZdj9XmOZ3UEVNPuV2nYOOJQHuDMjg9UxEv8FHmI8GIUGNhMYpxF0VDvftzfXnFoG
         pBGc9tuA/jKhvkgptNR4lWSr3BXPBFOIliWwfi2x+6u/MU1gfx1GtMzjFfqy1z4FzE/5
         bC/vOGoMi9M90gFQFUnk7jm6D0nZNUZLc5NZdL5hlCjEVtRI+wnD9F2H9Albq0aGEh4V
         hzMxUr6AihGng9IlhMyD65UOv7N2K2E6OUJKDtBeR3U1KgTztaxBDMopFJsw7MVPYpEc
         /P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGfjRsyHVB76myMWbk5QlTTbsQRS7NTA03gF+sfNaz0=;
        b=BIRXkNb2Mxca0jpcdyh/td9pZdvJJAaam8berGGbE0kymL6jbxNtD3JoeGqmT1qG0Z
         NXrNbi9XUkAGtTe16FRMSMZzdssNv5MUVO+bHYkozpltTRHLPR2p3i3EdpP8XcMiOkuX
         wXt2E8d8uZLykWiwqvLdoXTUgW1UEb4cdeJ28vlQk105x7Edbr4UrBQUZLb7hWBQ9HSY
         hiLMB7cSZAw9gQYzrAQxEOGZvsGoYWPg8auGWccTzY0onc9YVB/SwoOf2/zoLzHgATbD
         ZMoSDAfGEkysXlqv9Lg3uK4faTBjBOriyNjpKt9yO/PS4m74B9T6uzWMhq/RPK0oLI4S
         Zxxw==
X-Gm-Message-State: AFqh2kqqMCfnzuiak0UMk4kdtA98hoSkkOCT4ap04r/LkGc45ocVkpW3
        D21P17CEMBwfnY0v+njKh/DZnUAs8z3a8u1GS4jVT/5s5Tygmo9p
X-Google-Smtp-Source: AMrXdXsuFJVYisTDf7TBEFURaqPORUVopoHkHtxQfVYO5bs+GM+2pIB6vHlwP03IaZw+s1FhnSebugo2IgDe5ZLFRVQ=
X-Received: by 2002:a17:90a:c41:b0:229:4120:630c with SMTP id
 u1-20020a17090a0c4100b002294120630cmr861330pje.153.1673883390081; Mon, 16 Jan
 2023 07:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20221228111457.25516-1-j-luthra@ti.com>
In-Reply-To: <20221228111457.25516-1-j-luthra@ti.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 16 Jan 2023 15:36:13 +0000
Message-ID: <CAPY8ntCuHnGyx+PLnfYu4drOp3PJ9ZvAQmpmER_V6mBftec8mw@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: imx219: Fix binning for RAW8 capture
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        David Plowman <david.plowman@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai

Thanks for the patch.

On Wed, 28 Dec 2022 at 11:15, Jai Luthra <j-luthra@ti.com> wrote:
>
> 2x2 binning works fine for RAW10 capture, but for RAW8 1232p mode it
> leads to corrupted frames [1][2].
>
> Using the special 2x2 analog binning mode fixes the issue, but causes
> artefacts for RAW10 1232p capture. So here we choose the binning mode
> depending upon the frame format selected.
>
> As both binning modes work fine for 480p RAW8 and RAW10 capture, it can
> share the same code path as 1232p for selecting binning mode.
>
> [1] https://forums.raspberrypi.com/viewtopic.php?t=332103
> [2] https://github.com/raspberrypi/libcamera-apps/issues/281
>
> Fixes: 22da1d56e982 ("media: i2c: imx219: Add support for RAW8 bit bayer format")
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

I've checked with David Plowman who did the investigation on [2]. He
doesn't recall the issue, but your patch does appear to fix the
described issue.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

There are minor conflicts against
https://patchwork.linuxtv.org/project/linux-media/list/?series=9503
that I've just added a R-B to. I'll leave it to Sakari as to whether
he wants you to resubmit or not.

  Dave

> ---
>
> v2:
> - Removed extra newline found by checkpatch.pl --strict
> - Add Fixes tag with the commit introducing RAW8 support
> - Reword the commit description
>
>  drivers/media/i2c/imx219.c | 57 ++++++++++++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 77bd79a5954e..4d358da25af2 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -89,6 +89,12 @@
>
>  #define IMX219_REG_ORIENTATION         0x0172
>
> +/* Binning  Mode */
> +#define IMX219_REG_BINNING_MODE                0x0174
> +#define IMX219_BINNING_NONE            0x0000
> +#define IMX219_BINNING_2X2             0x0101
> +#define IMX219_BINNING_2X2_ANALOG      0x0303
> +
>  /* Test Pattern Control */
>  #define IMX219_REG_TEST_PATTERN                0x0600
>  #define IMX219_TEST_PATTERN_DISABLE    0
> @@ -143,6 +149,9 @@ struct imx219_mode {
>
>         /* Default register values */
>         struct imx219_reg_list reg_list;
> +
> +       /* 2x2 binning is used */
> +       bool binning;
>  };
>
>  /*
> @@ -176,8 +185,6 @@ static const struct imx219_reg mode_3280x2464_regs[] = {
>         {0x016f, 0xa0},
>         {0x0170, 0x01},
>         {0x0171, 0x01},
> -       {0x0174, 0x00},
> -       {0x0175, 0x00},
>         {0x0301, 0x05},
>         {0x0303, 0x01},
>         {0x0304, 0x03},
> @@ -235,8 +242,6 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
>         {0x016f, 0x38},
>         {0x0170, 0x01},
>         {0x0171, 0x01},
> -       {0x0174, 0x00},
> -       {0x0175, 0x00},
>         {0x0301, 0x05},
>         {0x0303, 0x01},
>         {0x0304, 0x03},
> @@ -290,8 +295,6 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
>         {0x016f, 0xd0},
>         {0x0170, 0x01},
>         {0x0171, 0x01},
> -       {0x0174, 0x01},
> -       {0x0175, 0x01},
>         {0x0301, 0x05},
>         {0x0303, 0x01},
>         {0x0304, 0x03},
> @@ -349,8 +352,6 @@ static const struct imx219_reg mode_640_480_regs[] = {
>         {0x016f, 0xe0},
>         {0x0170, 0x01},
>         {0x0171, 0x01},
> -       {0x0174, 0x03},
> -       {0x0175, 0x03},
>         {0x0301, 0x05},
>         {0x0303, 0x01},
>         {0x0304, 0x03},
> @@ -485,6 +486,7 @@ static const struct imx219_mode supported_modes[] = {
>                         .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
>                         .regs = mode_3280x2464_regs,
>                 },
> +               .binning = false,
>         },
>         {
>                 /* 1080P 30fps cropped */
> @@ -501,6 +503,7 @@ static const struct imx219_mode supported_modes[] = {
>                         .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
>                         .regs = mode_1920_1080_regs,
>                 },
> +               .binning = false,
>         },
>         {
>                 /* 2x2 binned 30fps mode */
> @@ -517,6 +520,7 @@ static const struct imx219_mode supported_modes[] = {
>                         .num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
>                         .regs = mode_1640_1232_regs,
>                 },
> +               .binning = true,
>         },
>         {
>                 /* 640x480 30fps mode */
> @@ -533,6 +537,7 @@ static const struct imx219_mode supported_modes[] = {
>                         .num_of_regs = ARRAY_SIZE(mode_640_480_regs),
>                         .regs = mode_640_480_regs,
>                 },
> +               .binning = true,
>         },
>  };
>
> @@ -979,6 +984,35 @@ static int imx219_set_framefmt(struct imx219 *imx219)
>         return -EINVAL;
>  }
>
> +static int imx219_set_binning(struct imx219 *imx219)
> +{
> +       if (!imx219->mode->binning) {
> +               return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
> +                                       IMX219_REG_VALUE_16BIT,
> +                                       IMX219_BINNING_NONE);
> +       }
> +
> +       switch (imx219->fmt.code) {
> +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> +               return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
> +                                       IMX219_REG_VALUE_16BIT,
> +                                       IMX219_BINNING_2X2_ANALOG);
> +
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> +               return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
> +                                       IMX219_REG_VALUE_16BIT,
> +                                       IMX219_BINNING_2X2);
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  static const struct v4l2_rect *
>  __imx219_get_pad_crop(struct imx219 *imx219,
>                       struct v4l2_subdev_state *sd_state,
> @@ -1056,6 +1090,13 @@ static int imx219_start_streaming(struct imx219 *imx219)
>                 goto err_rpm_put;
>         }
>
> +       ret = imx219_set_binning(imx219);
> +       if (ret) {
> +               dev_err(&client->dev, "%s failed to set binning: %d\n",
> +                       __func__, ret);
> +               goto err_rpm_put;
> +       }
> +
>         /* Apply customized values from user */
>         ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
>         if (ret)
> --
> 2.17.1
>
