Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4C69784681
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 18:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237488AbjHVQE7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 12:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237484AbjHVQE6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 12:04:58 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E642185
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:04:56 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-56e16e4aba7so2924781eaf.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692720296; x=1693325096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ncyc60d4mQuGuJ3pU4IZLvtzuG39b2PKvQrGxAK5u4=;
        b=KQQIvNY8iQ8w1jygHAWE/mN1EF696ncexxKKwkU7BPWcFdyRE3QIx0DZlXZDmVQp1G
         KbHLzS6WdvFTofBGLWy4qtXJwkBYLkT3bK71vRzVyZsJZRGx+FOJDQ9GsM/WXnRX1U+r
         Surj1Gh1/sPCrOGdrWS0LMsfOOKZHmuMUWd7mnnllDd8tZN3ejEX/ISxOU9BTmZvvAfh
         YcAaRlbScngxypmoHq4Z0KPwUxCkcW0c2kmwTqCIeu7V8WtcmRXAfpfe96YgFkaaPqHA
         WhqzmyrQ6pNKqAXHfq2ZSuqbiruTk9hVcALY/M0yj5FQ/0ktJedSC4OskNHTzEVsp3oq
         VjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692720296; x=1693325096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ncyc60d4mQuGuJ3pU4IZLvtzuG39b2PKvQrGxAK5u4=;
        b=ec6QkELp005Lq3X+B9RcbCROjj8NJWv2c96qb8kMU1lmX5/TaWr/fjIk+F2cAmLNSK
         ZYQSahAT0jUA0mdDgRUC4Sw7DUSXA9CP8aVX7ttoUwTS/oDdwZv4dsRMSB8gyEq8N7fs
         iy5dgVt5XIOAUbygYijQQ4kAKlYSCIdt0whgmJd3ISV9xYche5PJq/eKUlelgmbULCHV
         /SjC+Uj0qexaNCG/rCgfD7rqIcEArpH1mIojgDQXmSEVU52Gy8ZKyYTgAhykKPR1dg5l
         Wg243/UMqUgJD2Mq2GbB1PNV+vO4/KK0GxS7Hlv5AEXrSLiTWqcBhm+klesH96RHk/h0
         sQRA==
X-Gm-Message-State: AOJu0YywOrto9CF4p/UFl5UTJd32semV9Lh7YVKsgTDRPxixTNVsstgI
        TeoA4QV8r1uKEyDkfKsHnNj48wifxsGovEKDMfesRA==
X-Google-Smtp-Source: AGHT+IHrzlfqBSUzKmP7fmYdKpaDTkvvsIaXtFTHAQYriCtOmEIbHt6Ug9M0NbAx4/S4yUaCz3kRMhZl7XFWhCp7/Jw=
X-Received: by 2002:a05:6358:419f:b0:13a:4f34:8063 with SMTP id
 w31-20020a056358419f00b0013a4f348063mr8725946rwc.32.1692720295397; Tue, 22
 Aug 2023 09:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-4-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 17:04:39 +0100
Message-ID: <CAPY8ntD9WPEFOeUXN48OCAgOGJuqGV_z584z2MENzavcvBcapA@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] media: i2c: imx219: Replace register addresses
 with macros
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

On Mon, 21 Aug 2023 at 23:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Define macros for all the known registers used in the register arrays,
> and use them to replace the numerical addresses. This improves
> readability.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 169 ++++++++++++++++++-------------------
>  1 file changed, 81 insertions(+), 88 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 229dfe24304b..8cab0251bd6a 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -41,6 +41,13 @@
>  #define IMX219_CSI_2_LANE_MODE         0x01
>  #define IMX219_CSI_4_LANE_MODE         0x03
>
> +#define IMX219_REG_DPHY_CTRL           CCI_REG8(0x0128)
> +#define IMX219_DPHY_CTRL_TIMING_AUTO   0
> +#define IMX219_DPHY_CTRL_TIMING_MANUAL 1
> +
> +#define IMX219_REG_EXCK_FREQ           CCI_REG16(0x012a)
> +#define IMX219_EXCK_FREQ(n)            ((n) * 256)             /* n expressed in MHz */
> +
>  /* Analog gain control */
>  #define IMX219_REG_ANALOG_GAIN         CCI_REG8(0x0157)
>  #define IMX219_ANA_GAIN_MIN            0
> @@ -75,6 +82,15 @@
>  /* HBLANK control - read only */
>  #define IMX219_PPL_DEFAULT             3448
>
> +#define IMX219_REG_LINE_LENGTH_A       CCI_REG16(0x0162)
> +#define IMX219_REG_X_ADD_STA_A         CCI_REG16(0x0164)
> +#define IMX219_REG_X_ADD_END_A         CCI_REG16(0x0166)
> +#define IMX219_REG_Y_ADD_STA_A         CCI_REG16(0x0168)
> +#define IMX219_REG_Y_ADD_END_A         CCI_REG16(0x016a)
> +#define IMX219_REG_X_OUTPUT_SIZE       CCI_REG16(0x016c)
> +#define IMX219_REG_Y_OUTPUT_SIZE       CCI_REG16(0x016e)
> +#define IMX219_REG_X_ODD_INC_A         CCI_REG8(0x0170)
> +#define IMX219_REG_Y_ODD_INC_A         CCI_REG8(0x0171)
>  #define IMX219_REG_ORIENTATION         CCI_REG8(0x0172)
>
>  /* Binning  Mode */
> @@ -83,6 +99,18 @@
>  #define IMX219_BINNING_2X2             0x0101
>  #define IMX219_BINNING_2X2_ANALOG      0x0303
>
> +#define IMX219_REG_CSI_DATA_FORMAT_A   CCI_REG16(0x018c)
> +
> +/* PLL Settings */
> +#define IMX219_REG_VTPXCK_DIV          CCI_REG8(0x0301)
> +#define IMX219_REG_VTSYCK_DIV          CCI_REG8(0x0303)
> +#define IMX219_REG_PREPLLCK_VT_DIV     CCI_REG8(0x0304)
> +#define IMX219_REG_PREPLLCK_OP_DIV     CCI_REG8(0x0305)
> +#define IMX219_REG_PLL_VT_MPY          CCI_REG16(0x0306)
> +#define IMX219_REG_OPPXCK_DIV          CCI_REG8(0x0309)
> +#define IMX219_REG_OPSYCK_DIV          CCI_REG8(0x030b)
> +#define IMX219_REG_PLL_OP_MPY          CCI_REG16(0x030c)
> +
>  /* Test Pattern Control */
>  #define IMX219_REG_TEST_PATTERN                CCI_REG16(0x0600)
>  #define IMX219_TEST_PATTERN_DISABLE    0
> @@ -100,6 +128,9 @@
>  #define IMX219_TESTP_COLOUR_MAX                0x03ff
>  #define IMX219_TESTP_COLOUR_STEP       1
>
> +#define IMX219_REG_TP_WINDOW_WIDTH     CCI_REG16(0x0624)
> +#define IMX219_REG_TP_WINDOW_HEIGHT    CCI_REG16(0x0626)
> +
>  /* External clock frequency is 24.0M */
>  #define IMX219_XCLK_FREQ               24000000
>
> @@ -144,7 +175,7 @@ struct imx219_mode {
>  };
>
>  static const struct cci_reg_sequence imx219_common_regs[] = {
> -       { CCI_REG8(0x0100), 0x00 },     /* Mode Select */
> +       { IMX219_REG_MODE_SELECT, 0x00 },       /* Mode Select */
>
>         /* To Access Addresses 3000-5fff, send the following commands */
>         { CCI_REG8(0x30eb), 0x0c },
> @@ -155,15 +186,13 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>         { CCI_REG8(0x30eb), 0x09 },
>
>         /* PLL Clock Table */
> -       { CCI_REG8(0x0301), 0x05 },     /* VTPXCK_DIV */
> -       { CCI_REG8(0x0303), 0x01 },     /* VTSYSCK_DIV */
> -       { CCI_REG8(0x0304), 0x03 },     /* PREPLLCK_VT_DIV 0x03 = AUTO set */
> -       { CCI_REG8(0x0305), 0x03 },     /* PREPLLCK_OP_DIV 0x03 = AUTO set */
> -       { CCI_REG8(0x0306), 0x00 },     /* PLL_VT_MPY */
> -       { CCI_REG8(0x0307), 0x39 },
> -       { CCI_REG8(0x030b), 0x01 },     /* OP_SYS_CLK_DIV */
> -       { CCI_REG8(0x030c), 0x00 },     /* PLL_OP_MPY */
> -       { CCI_REG8(0x030d), 0x72 },
> +       { IMX219_REG_VTPXCK_DIV, 5 },
> +       { IMX219_REG_VTSYCK_DIV, 1 },
> +       { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> +       { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> +       { IMX219_REG_PLL_VT_MPY, 57 },
> +       { IMX219_REG_OPSYCK_DIV, 1 },
> +       { IMX219_REG_PLL_OP_MPY, 114 },
>
>         /* Undocumented registers */
>         { CCI_REG8(0x455e), 0x00 },
> @@ -180,16 +209,14 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>         { CCI_REG8(0x479b), 0x0e },
>
>         /* Frame Bank Register Group "A" */
> -       { CCI_REG8(0x0162), 0x0d },     /* Line_Length_A */
> -       { CCI_REG8(0x0163), 0x78 },
> -       { CCI_REG8(0x0170), 0x01 },     /* X_ODD_INC_A */
> -       { CCI_REG8(0x0171), 0x01 },     /* Y_ODD_INC_A */
> +       { IMX219_REG_LINE_LENGTH_A, 3448 },
> +       { IMX219_REG_X_ODD_INC_A, 1 },
> +       { IMX219_REG_Y_ODD_INC_A, 1 },
>
>         /* Output setup registers */
> -       { CCI_REG8(0x0114), 0x01 },     /* CSI 2-Lane Mode */
> -       { CCI_REG8(0x0128), 0x00 },     /* DPHY Auto Mode */
> -       { CCI_REG8(0x012a), 0x18 },     /* EXCK_Freq */
> -       { CCI_REG8(0x012b), 0x00 },
> +       { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },

This line is actually redundant as the setting is made from
imx219_configure_lanes.
That would be fixes ceddfd4493b3 ("media: i2c: imx219: Support
four-lane operation") if you wanted to pick it up as an extra patch.

> +       { IMX219_REG_DPHY_CTRL, IMX219_DPHY_CTRL_TIMING_AUTO },
> +       { IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(24) },

IMX219_XCLK_FREQ / 1000000?
If someone comes along later to add support for other XCLK values
hopefully they'd work out that this register needs to be updated, but
you could spell it out seeing as you've added the macro to produce the
register value.

I'm not that bothered over it though.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>  };
>
>  /*
> @@ -198,91 +225,57 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>   * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
>   */
>  static const struct cci_reg_sequence mode_3280x2464_regs[] = {
> -       { CCI_REG8(0x0164), 0x00 },
> -       { CCI_REG8(0x0165), 0x00 },
> -       { CCI_REG8(0x0166), 0x0c },
> -       { CCI_REG8(0x0167), 0xcf },
> -       { CCI_REG8(0x0168), 0x00 },
> -       { CCI_REG8(0x0169), 0x00 },
> -       { CCI_REG8(0x016a), 0x09 },
> -       { CCI_REG8(0x016b), 0x9f },
> -       { CCI_REG8(0x016c), 0x0c },
> -       { CCI_REG8(0x016d), 0xd0 },
> -       { CCI_REG8(0x016e), 0x09 },
> -       { CCI_REG8(0x016f), 0xa0 },
> -       { CCI_REG8(0x0624), 0x0c },
> -       { CCI_REG8(0x0625), 0xd0 },
> -       { CCI_REG8(0x0626), 0x09 },
> -       { CCI_REG8(0x0627), 0xa0 },
> +       { IMX219_REG_X_ADD_STA_A, 0 },
> +       { IMX219_REG_X_ADD_END_A, 3279 },
> +       { IMX219_REG_Y_ADD_STA_A, 0 },
> +       { IMX219_REG_Y_ADD_END_A, 2463 },
> +       { IMX219_REG_X_OUTPUT_SIZE, 3280 },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 2464 },
> +       { IMX219_REG_TP_WINDOW_WIDTH, 3280 },
> +       { IMX219_REG_TP_WINDOW_HEIGHT, 2464 },
>  };
>
>  static const struct cci_reg_sequence mode_1920_1080_regs[] = {
> -       { CCI_REG8(0x0164), 0x02 },
> -       { CCI_REG8(0x0165), 0xa8 },
> -       { CCI_REG8(0x0166), 0x0a },
> -       { CCI_REG8(0x0167), 0x27 },
> -       { CCI_REG8(0x0168), 0x02 },
> -       { CCI_REG8(0x0169), 0xb4 },
> -       { CCI_REG8(0x016a), 0x06 },
> -       { CCI_REG8(0x016b), 0xeb },
> -       { CCI_REG8(0x016c), 0x07 },
> -       { CCI_REG8(0x016d), 0x80 },
> -       { CCI_REG8(0x016e), 0x04 },
> -       { CCI_REG8(0x016f), 0x38 },
> -       { CCI_REG8(0x0624), 0x07 },
> -       { CCI_REG8(0x0625), 0x80 },
> -       { CCI_REG8(0x0626), 0x04 },
> -       { CCI_REG8(0x0627), 0x38 },
> +       { IMX219_REG_X_ADD_STA_A, 680 },
> +       { IMX219_REG_X_ADD_END_A, 2599 },
> +       { IMX219_REG_Y_ADD_STA_A, 692 },
> +       { IMX219_REG_Y_ADD_END_A, 1771 },
> +       { IMX219_REG_X_OUTPUT_SIZE, 1920 },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 1080 },
> +       { IMX219_REG_TP_WINDOW_WIDTH, 1920 },
> +       { IMX219_REG_TP_WINDOW_HEIGHT, 1080 },
>  };
>
>  static const struct cci_reg_sequence mode_1640_1232_regs[] = {
> -       { CCI_REG8(0x0164), 0x00 },
> -       { CCI_REG8(0x0165), 0x00 },
> -       { CCI_REG8(0x0166), 0x0c },
> -       { CCI_REG8(0x0167), 0xcf },
> -       { CCI_REG8(0x0168), 0x00 },
> -       { CCI_REG8(0x0169), 0x00 },
> -       { CCI_REG8(0x016a), 0x09 },
> -       { CCI_REG8(0x016b), 0x9f },
> -       { CCI_REG8(0x016c), 0x06 },
> -       { CCI_REG8(0x016d), 0x68 },
> -       { CCI_REG8(0x016e), 0x04 },
> -       { CCI_REG8(0x016f), 0xd0 },
> -       { CCI_REG8(0x0624), 0x06 },
> -       { CCI_REG8(0x0625), 0x68 },
> -       { CCI_REG8(0x0626), 0x04 },
> -       { CCI_REG8(0x0627), 0xd0 },
> +       { IMX219_REG_X_ADD_STA_A, 0 },
> +       { IMX219_REG_X_ADD_END_A, 3279 },
> +       { IMX219_REG_Y_ADD_STA_A, 0 },
> +       { IMX219_REG_Y_ADD_END_A, 2463 },
> +       { IMX219_REG_X_OUTPUT_SIZE, 1640 },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 1232 },
> +       { IMX219_REG_TP_WINDOW_WIDTH, 1640 },
> +       { IMX219_REG_TP_WINDOW_HEIGHT, 1232 },
>  };
>
>  static const struct cci_reg_sequence mode_640_480_regs[] = {
> -       { CCI_REG8(0x0164), 0x03 },
> -       { CCI_REG8(0x0165), 0xe8 },
> -       { CCI_REG8(0x0166), 0x08 },
> -       { CCI_REG8(0x0167), 0xe7 },
> -       { CCI_REG8(0x0168), 0x02 },
> -       { CCI_REG8(0x0169), 0xf0 },
> -       { CCI_REG8(0x016a), 0x06 },
> -       { CCI_REG8(0x016b), 0xaf },
> -       { CCI_REG8(0x016c), 0x02 },
> -       { CCI_REG8(0x016d), 0x80 },
> -       { CCI_REG8(0x016e), 0x01 },
> -       { CCI_REG8(0x016f), 0xe0 },
> -       { CCI_REG8(0x0624), 0x06 },
> -       { CCI_REG8(0x0625), 0x68 },
> -       { CCI_REG8(0x0626), 0x04 },
> -       { CCI_REG8(0x0627), 0xd0 },
> +       { IMX219_REG_X_ADD_STA_A, 1000 },
> +       { IMX219_REG_X_ADD_END_A, 2279 },
> +       { IMX219_REG_Y_ADD_STA_A, 752 },
> +       { IMX219_REG_Y_ADD_END_A, 1711 },
> +       { IMX219_REG_X_OUTPUT_SIZE, 640 },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 480 },
> +       { IMX219_REG_TP_WINDOW_WIDTH, 1640 },
> +       { IMX219_REG_TP_WINDOW_HEIGHT, 1232 },
>  };
>
>  static const struct cci_reg_sequence raw8_framefmt_regs[] = {
> -       { CCI_REG8(0x018c), 0x08 },
> -       { CCI_REG8(0x018d), 0x08 },
> -       { CCI_REG8(0x0309), 0x08 },
> +       { IMX219_REG_CSI_DATA_FORMAT_A, 0x0808 },
> +       { IMX219_REG_OPPXCK_DIV, 8 },
>  };
>
>  static const struct cci_reg_sequence raw10_framefmt_regs[] = {
> -       { CCI_REG8(0x018c), 0x0a },
> -       { CCI_REG8(0x018d), 0x0a },
> -       { CCI_REG8(0x0309), 0x0a },
> +       { IMX219_REG_CSI_DATA_FORMAT_A, 0x0a0a },
> +       { IMX219_REG_OPPXCK_DIV, 10 },
>  };
>
>  static const s64 imx219_link_freq_menu[] = {
> --
> Regards,
>
> Laurent Pinchart
>
