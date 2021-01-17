Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B982F933D
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 16:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbhAQPHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 10:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbhAQPHM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 10:07:12 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AF5C061573
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 07:06:31 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id e15so5291169wme.0
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 07:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/QfyKG17ycUGRXZsPu4ozyvwY+5K60qdnvSZI+64zY=;
        b=gjkh6jlzlWzagsincrAzuQORuW41/hQEpOVD+d0MzeWsZtusPDOIJe24OlcJV7U7E6
         gNXrhqHSUFsXlDRoag1YwwP9oCPoVMLiyZMHmJ31ZzYM/RPXGudhJdvSbcb3m16njJB6
         n8HK0SyPxRtLPBA06Yp6OhWy7vwgDlbAcOg9iKENUtojRmc/JPLdM2Yw7K8v1uFMfiGW
         rSqGt0cU7Ed1KNbtAZDFJbWXM3AFCEIbOr3l7D4PLu7Hvi/q0Vmf7KCjgcPYwIRi3eBi
         PyD7pjVrMcUzWNnmIBUmAOD2i2YS6ODcDj78esde4yhvTkknqngf2ufBcr7YwCJcwK5S
         OydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/QfyKG17ycUGRXZsPu4ozyvwY+5K60qdnvSZI+64zY=;
        b=VwuyXimRToDdV8tr3kfnjmuz/l/gnrAxIU7NVk/zWvQtTgZwUvn9X+W+4aMi3acWbB
         R+hsIu0MlyR7juuuGhGtLQA7tYrRi9ydTJVWbrBXy1ftl+Itj22/gaRrTzY9CbLSg+06
         VWpuQHBwF583yMBRYzJcBQZYYaG5k9usfXL5Si/vpWYD0X3jCqA3f9Ug3ukC6/OYotIM
         zzBBKb5dxXuNtS9Dx/F3P9dQrPTgHMrTpsbZV0C87faz5zMx6peVLZsYom6x30ivTOLS
         jaJSSmHPXDj0jh4g4BiCiUMh9ulNZACP19xRQgIXvu35BVF1oCGQAxLHvbZ9Rs5DU8Bp
         QPEw==
X-Gm-Message-State: AOAM531zEA+d7TCSroYsniehWG7aYjiFjrOXVETyTc/5Fc/8eDtQSB+G
        axIUj7bgNMIDpagbiVTGp/Ry+9mFrF0w0RXlMIIIaw==
X-Google-Smtp-Source: ABdhPJwkxKNIP3Yp7/S7wDto0fTUcDD1qRbbuoQitfS5EGDV8IjZyNvuWvAPoDXDBKTZBETQpkrCjePGmQmjrOJ8EUg=
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr15410744wmg.183.1610895989948;
 Sun, 17 Jan 2021 07:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20210115185233.333407-1-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210115185233.333407-1-angelogioacchino.delregno@somainline.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Sun, 17 Jan 2021 15:06:14 +0000
Message-ID: <CAPY8ntDGSMZjqss3J76HzmHPZyiFFV0CAdRj2ajZxnzd4Troag@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Rewrite tables and implement more modes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ebiggers@google.com,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi AngeloGioacchino

Thanks for the patch.

On Fri, 15 Jan 2021 at 18:52, AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Enhance the feature set for this camera sensor by in rewriting the
> entire tables (as they were just meaningless magic register writes)
> in a similar form, but giving some names to the actual registers
> we write to, separating common sequences and reusing them for the
> various configuration variations that are now supported, hence
> implementing support for:
> - 8MHz XCLK, as used by (and not only) some Sony Xperia smartphones
> - 4-Lane Mode in both 24MHz and 8MHz XCLK configuration
> - High Frame Rate output modes support on 4-Lane operation, up to
>   1000FPS (also on 2-Lane but, being bandwidth-constrained, the
>   maximum achievable frame rate gets lower there)
> - Frame Bank Control Groups, in order to support a fast output
>   resolution switch, without resetting the entire sensor during
>   a streaming session: here the new mode gets configured on the
>   secondary (or primary, read: "the other") bank and the sensor
>   will be able to switch to it at the end of the "current frame".

This is at least 5 changes, each of which should be a separate patch:
- Add support for 8MHz XCLK
- Add support for 4 lane mode
- Add 1000fps mode
- Bank control
- Restructuring the register sequences (and ideally that should be
switching to defined register names, and then restructuring).

At the moment this is a huge single patch with several intertwined
changes. It needs to be split to be properly reviewable.

> Please note: an unknown register write sequence was found in both
> the Raspberry Pi and a Sony Xperia smartphone i2c dump, but this
> seems to do literally nothing, as the sensor seems to work
> in the exact same way when sending and when not sending this
> write sequence, which is undocumented in the datasheet.
>
> Both the authentication and magic sequences were left in the
> driver with a big comment explaining what's going on so that,
> in the event that someone discovers the meaning of it (or
> Sony distributes documentation for that), it'll be pretty
> straightforward to insert them when needed.
>
> All the modes that got implemented in this commit have been tested
> with all combinations of 24/8MHz, 2/4Lane, all resolutions, on the
> following smartphones:
> - Sony Xperia XA2 (SDM630)
> - Sony Xperia XA2 Ultra (SDM630)
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/media/i2c/imx219.c | 884 ++++++++++++++++++++++++-------------
>  1 file changed, 580 insertions(+), 304 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 92a8d52776b8..360730d5b81c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -12,6 +12,10 @@
>   * Flip handling taken from the Sony IMX319 driver.
>   * Copyright (C) 2018 Intel Corporation
>   *
> + * 8MHz, 4-Lane, High Frame Rate modes, Frame Bank Control groups,
> + * fast mode switching
> + * Copyright (C) 2020, AngeloGioacchino Del Regno
> + *                     <angelogioacchino.delregno@somainline.org>

It's now 2021.

>   */
>
>  #include <linux/clk.h>
> @@ -35,24 +39,93 @@
>  #define IMX219_MODE_STANDBY            0x00
>  #define IMX219_MODE_STREAMING          0x01
>
> +#define IMX219_REG_SW_RESET            0x0103
> +
> +/* Output Set-up */
> +#define IMX219_REG_CSI_LANE_MODE       0x0114
> +#define IMX219_CSI_LANE_MODE_2LANE     BIT(0)
> +#define IMX219_CSI_LANE_MODE_4LANE     (BIT(0) | BIT(1))
> +
> +#define IMX219_REG_DPHY_CTRL           0x0128
> +#define IMX219_DPHY_CTRL_AUTO          0
> +#define IMX219_DPHY_CTRL_MANUAL                1
> +
> +/* Use as 16-bits reg */
> +#define IMX219_REG_EXCK_FREQ_MHZ       0x012A
> +#define IMX219_EXCK_FREQ_MHZ_MIN       6
> +#define IMX219_EXCK_FREQ_MHZ_MAX       27
> +
> +/* Frame Bank Control Registers*/
> +#define IMX219_REG_FRAME_BANK_CTRL     0x0150
> +#define IMX219_FRAME_BANK_EN_SHIFT     BIT(0)
> +#define IMX219_FRAME_BANK_STAT_SHIFT   BIT(1)
> +
> +#define IMX219_REG_FRAME_COUNT         0x0151
> +#define IMX219_REG_FRAME_FAST_TRACKING 0x0152
> +
> +/* Frame Bank  0: Group "A" - 1: Group "B" */
> +#define IMX219_REG_FRAME_BANK_BASE(x)  ((0x100 * x) + 0x154)
> +#define IMX219_REG_ANALOG_GAIN         0x03
> +#define IMX219_REG_DIGITAL_GAIN                0x04
> +#define IMX219_REG_EXPOSURE            0x06
> +#define IMX219_REG_FRAME_LEN_LINES     0x0c
> +#define IMX219_REG_LINE_LEN_PCK                0x0e
> +#define IMX219_REG_X_ADDR_START                0x10
> +#define IMX219_REG_X_ADDR_END          0x12
> +#define IMX219_REG_Y_ADDR_START                0x14
> +#define IMX219_REG_Y_ADDR_END          0x16
> +#define IMX219_REG_X_OUTPUT_SIZE       0x18
> +#define IMX219_REG_Y_OUTPUT_SIZE       0x1a
> +#define IMX219_REG_X_ODD_INC           0x1c
> +#define IMX219_REG_Y_ODD_INC           0x1d
> +#define IMX219_REG_ORIENTATION         0x1e
> +#define IMX219_REG_BINNING_MODE_H      0x20
> +#define IMX219_REG_BINNING_MODE_V      0x21
> +#define IMX219_REG_BINNING_CAL_H       0x22
> +#define IMX219_REG_BINNING_CAL_V       0x23
> +#define IMX219_REG_CSI_DATA_FORMAT_HI  0x38
> +#define IMX219_REG_CSI_DATA_FORMAT_LO  0x39
> +#define IMX219_CSI_DATA_FMT_8BIT       8
> +#define IMX219_CSI_DATA_FMT_10BIT      10
> +
> +#define IMX219_REG_CLK_SETUP           0x300
> +#define IMX219_REG_VT_PIX_CLK_DIV      (IMX219_REG_CLK_SETUP + 0x01)
> +#define IMX219_REG_VT_SYS_CLK_DIV      (IMX219_REG_CLK_SETUP + 0x03)
> +#define IMX219_REG_PREPLLCK_VT_DIV     (IMX219_REG_CLK_SETUP + 0x04)
> +#define IMX219_REG_PREPLLCK_OP_DIV     (IMX219_REG_CLK_SETUP + 0x05)
> +#define IMX219_REG_PLL_VT_MULTIPLIER   (IMX219_REG_CLK_SETUP + 0x06)
> +#define IMX219_REG_OP_PIX_CLK_DIV      (IMX219_REG_CLK_SETUP + 0x09)
> +#define IMX219_REG_OP_SYS_CLK_DIV      (IMX219_REG_CLK_SETUP + 0x0b)
> +#define IMX219_REG_PLL_OP_MULTIPLIER   (IMX219_REG_CLK_SETUP + 0x0c)
> +
>  /* Chip ID */
>  #define IMX219_REG_CHIP_ID             0x0000
>  #define IMX219_CHIP_ID                 0x0219
>
> -/* External clock frequency is 24.0M */
> -#define IMX219_XCLK_FREQ               24000000
> +/* External clock frequency 8.0M or 24.0M */
> +#define IMX219_XCLK_FREQ_8M            8000000
> +#define IMX219_XCLK_FREQ_24M           24000000
> +
> +#define IMX219_2LANE_PIXEL_RATE                182400000
> +#define IMX219_4LANE_PIXEL_RATE                280800000
>
> -/* Pixel rate is fixed at 182.4M for all the modes */
> -#define IMX219_PIXEL_RATE              182400000
> +#define IMX219_2LANE_DEFAULT_LINK_FREQ 456000000
> +#define IMX219_4LANE_DEFAULT_LINK_FREQ 702000000

That 4 lane rate sounds unlikely.
Link frequency is in MHz, and CSI2 is a DDR link, so the quoted 456MHz
for 2 lanes is 912MHz.
The CSI2 spec normally maxes out at 1Gbit/s/lane, or 500MHz, and my
datasheet for IMX219 says
Data rate: Max. 755 Mbps/lane(@4lane), 912Mbps/Lane(@2lane)

> -#define IMX219_DEFAULT_LINK_FREQ       456000000
> +/* Temperature */
> +#define IMX219_REG_TEMPERATURE         0x0140
> +#define IMX219_TEMPERATURE_EN          BIT(7)
> +#define IMX219_TEMPERATURE_MASK                0x7f
>
>  /* V_TIMING internal */
>  #define IMX219_REG_VTS                 0x0160
> -#define IMX219_VTS_15FPS               0x0dc6
> -#define IMX219_VTS_30FPS_1080P         0x06e3
> -#define IMX219_VTS_30FPS_BINNED                0x06e3
> -#define IMX219_VTS_30FPS_640x480       0x06e3
> +#define IMX219_VTS_8MP_30FPS_4LANE     2691
> +#define IMX219_VTS_8MP_15FPS_2LANE     3526
> +#define IMX219_VTS_60FPS_1080P         1237
> +#define IMX219_VTS_30FPS_BINNED                1346
> +#define IMX219_VTS_120FPS_720P         850
> +#define IMX219_VTS_200FPS_BINNED       481
> +#define IMX219_VTS_1000FPS_BINNED      481
>  #define IMX219_VTS_MAX                 0xffff
>
>  #define IMX219_VBLANK_MIN              4
> @@ -67,30 +140,27 @@
>  #define IMX219_PPL_DEFAULT             3448
>
>  /* Exposure control */
> -#define IMX219_REG_EXPOSURE            0x015a
>  #define IMX219_EXPOSURE_MIN            4
>  #define IMX219_EXPOSURE_STEP           1
>  #define IMX219_EXPOSURE_DEFAULT                0x640
>  #define IMX219_EXPOSURE_MAX            65535
>
>  /* Analog gain control */
> -#define IMX219_REG_ANALOG_GAIN         0x0157
>  #define IMX219_ANA_GAIN_MIN            0
>  #define IMX219_ANA_GAIN_MAX            232
>  #define IMX219_ANA_GAIN_STEP           1
>  #define IMX219_ANA_GAIN_DEFAULT                0x0
>
>  /* Digital gain control */
> -#define IMX219_REG_DIGITAL_GAIN                0x0158
>  #define IMX219_DGTL_GAIN_MIN           0x0100
>  #define IMX219_DGTL_GAIN_MAX           0x0fff
>  #define IMX219_DGTL_GAIN_DEFAULT       0x0100
>  #define IMX219_DGTL_GAIN_STEP          1
>
> -#define IMX219_REG_ORIENTATION         0x0172
> -
>  /* Test Pattern Control */
>  #define IMX219_REG_TEST_PATTERN                0x0600
> +#define IMX219_REG_TEST_PATTERN_WIDTH  0x0624
> +#define IMX219_REG_TEST_PATTERN_HEIGHT 0x0626
>  #define IMX219_TEST_PATTERN_DISABLE    0
>  #define IMX219_TEST_PATTERN_SOLID_COLOR        1
>  #define IMX219_TEST_PATTERN_COLOR_BARS 2
> @@ -120,7 +190,9 @@
>
>  struct imx219_reg {
>         u16 address;
> -       u8 val;
> +       u16 val;
> +       u8 reg_len;
> +       bool is_banked;
>  };
>
>  struct imx219_reg_list {
> @@ -134,11 +206,13 @@ struct imx219_mode {
>         unsigned int width;
>         /* Frame height */
>         unsigned int height;
> +       /* Maximum achievable FPS */
> +       unsigned int max_fps;
>
>         /* Analog crop rectangle. */
>         struct v4l2_rect crop;
>
> -       /* V-timing */
> +       /* V-timing default */
>         unsigned int vts_def;
>
>         /* Default register values */
> @@ -146,248 +220,196 @@ struct imx219_mode {
>  };
>
>  /*
> - * Register sets lifted off the i2C interface from the Raspberry Pi firmware
> - * driver.
> - * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
> + * The authentication sequence is needed to access registers beyond 0x3000,
> + * which the datasheet calls "Manufacturer Specific Registers", with a range
> + * going from 0x3000 to 0x5fff, but its documentation is full of holes:
> + * it is infact documenting registers from 0x3000 to 0x32ff as OTP Data
> + * and, as for the others, it documents 0x4053, 0x5e54 and 0x5e59.. and
> + * nothing else.
> + *
> + * On both Raspberry Pi and Xperia XA2 i2c dumps, there is an unknown
> + * write sequence that is totally the same between the two, but the sensor
> + * seems to work regardless of this being sent.
> + * Spirit here is to not send unknown things, especially if they don't seem
> + * to do anything... and that's what was done. Also, remember that the auth
> + * commands will allow to write to the OTP area, which may actually damage
> + * the sensor functionality (for example, factory calibrations may be damaged).
> + *
> + * The authentication sequence and the unknown one are kept here in case one
> + * day they get documented somehow, or any use for them is found.

The original register set was validated by Sony, so I'd want to
carefully study this change later to ensure that it still makes sense
(or ideally is the same) for the existing modes.

>   */
> -static const struct imx219_reg mode_3280x2464_regs[] = {
> -       {0x0100, 0x00},
> -       {0x30eb, 0x0c},
> -       {0x30eb, 0x05},
> -       {0x300a, 0xff},
> -       {0x300b, 0xff},
> -       {0x30eb, 0x05},
> -       {0x30eb, 0x09},
> -       {0x0114, 0x01},
> -       {0x0128, 0x00},
> -       {0x012a, 0x18},
> -       {0x012b, 0x00},
> -       {0x0164, 0x00},
> -       {0x0165, 0x00},
> -       {0x0166, 0x0c},
> -       {0x0167, 0xcf},
> -       {0x0168, 0x00},
> -       {0x0169, 0x00},
> -       {0x016a, 0x09},
> -       {0x016b, 0x9f},
> -       {0x016c, 0x0c},
> -       {0x016d, 0xd0},
> -       {0x016e, 0x09},
> -       {0x016f, 0xa0},
> -       {0x0170, 0x01},
> -       {0x0171, 0x01},
> -       {0x0174, 0x00},
> -       {0x0175, 0x00},
> -       {0x0301, 0x05},
> -       {0x0303, 0x01},
> -       {0x0304, 0x03},
> -       {0x0305, 0x03},
> -       {0x0306, 0x00},
> -       {0x0307, 0x39},
> -       {0x030b, 0x01},
> -       {0x030c, 0x00},
> -       {0x030d, 0x72},
> -       {0x0624, 0x0c},
> -       {0x0625, 0xd0},
> -       {0x0626, 0x09},
> -       {0x0627, 0xa0},
> -       {0x455e, 0x00},
> -       {0x471e, 0x4b},
> -       {0x4767, 0x0f},
> -       {0x4750, 0x14},
> -       {0x4540, 0x00},
> -       {0x47b4, 0x14},
> -       {0x4713, 0x30},
> -       {0x478b, 0x10},
> -       {0x478f, 0x10},
> -       {0x4793, 0x10},
> -       {0x4797, 0x0e},
> -       {0x479b, 0x0e},
> -       {0x0162, 0x0d},
> -       {0x0163, 0x78},
> +static const struct imx219_reg __maybe_unused imx219_auth[] = {
> +       { 0x30eb, 0x05, IMX219_REG_VALUE_08BIT, false },
> +       { 0x30eb, 0x0c, IMX219_REG_VALUE_08BIT, false },
> +       { 0x300a, 0xff, IMX219_REG_VALUE_08BIT, false },
> +       { 0x300b, 0xff, IMX219_REG_VALUE_08BIT, false },
> +       { 0x30eb, 0x05, IMX219_REG_VALUE_08BIT, false },
> +       { 0x30eb, 0x09, IMX219_REG_VALUE_08BIT, false },
> +};
> +
> +static const struct imx219_reg __maybe_unused imx219_unknown_seq[] = {
> +       { 0x455E, 0x00, IMX219_REG_VALUE_08BIT, false },
> +       { 0x471E, 0x4B, IMX219_REG_VALUE_08BIT, false },
> +       { 0x4767, 0x0F, IMX219_REG_VALUE_08BIT, false },
> +       { 0x4750, 0x14, IMX219_REG_VALUE_08BIT, false },
> +       { 0x4540, 0x00, IMX219_REG_VALUE_08BIT, false },
> +       { 0x47B4, 0x14, IMX219_REG_VALUE_08BIT, false },
> +       { 0x4713, 0x30, IMX219_REG_VALUE_08BIT, false },
> +       { 0x478B, 0x10, IMX219_REG_VALUE_08BIT, false },
> +       { 0x478F, 0x10, IMX219_REG_VALUE_08BIT, false },
> +       { 0x4793, 0x10, IMX219_REG_VALUE_08BIT, false },
> +       { 0x4797, 0x0e, IMX219_REG_VALUE_08BIT, false },
> +       { 0x479b, 0x0e, IMX219_REG_VALUE_08BIT, false },
> +};
> +
> +static const struct imx219_reg mode_24mhz_regs[] = {
> +       { IMX219_REG_EXCK_FREQ_MHZ, (24 << 8), IMX219_REG_VALUE_16BIT, false },
> +       { IMX219_REG_DPHY_CTRL, 0, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_VT_PIX_CLK_DIV, 5, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_VT_SYS_CLK_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PREPLLCK_VT_DIV, 3, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PREPLLCK_OP_DIV, 3, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_OP_PIX_CLK_DIV, 10, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_OP_SYS_CLK_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PLL_OP_MULTIPLIER, 84, IMX219_REG_VALUE_16BIT, false },
> +};
> +
> +static const struct imx219_reg mode_24mhz_2lane[] = {
> +       { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_LANE_MODE_2LANE,
> +                                       IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PLL_VT_MULTIPLIER, 57, IMX219_REG_VALUE_16BIT, false },
> +};
> +
> +static const struct imx219_reg mode_24mhz_4lane[] = {
> +       { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_LANE_MODE_4LANE,
> +                                       IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PLL_VT_MULTIPLIER, 82, IMX219_REG_VALUE_16BIT, false },
> +};
> +
> +static const struct imx219_reg mode_8mhz_regs[] = {
> +       { IMX219_REG_EXCK_FREQ_MHZ, (8 << 8), IMX219_REG_VALUE_16BIT, false },
> +       { IMX219_REG_DPHY_CTRL, 0, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_VT_PIX_CLK_DIV, 5, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_VT_SYS_CLK_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PREPLLCK_VT_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PREPLLCK_OP_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_OP_PIX_CLK_DIV, 10, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_OP_SYS_CLK_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PLL_OP_MULTIPLIER, 90, IMX219_REG_VALUE_16BIT, false },
> +};
> +
> +static const struct imx219_reg mode_8mhz_2lane[] = {
> +       { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_LANE_MODE_2LANE,
> +                                       IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PLL_VT_MULTIPLIER, 63, IMX219_REG_VALUE_16BIT, false },
>  };
>
> -static const struct imx219_reg mode_1920_1080_regs[] = {
> -       {0x0100, 0x00},
> -       {0x30eb, 0x05},
> -       {0x30eb, 0x0c},
> -       {0x300a, 0xff},
> -       {0x300b, 0xff},
> -       {0x30eb, 0x05},
> -       {0x30eb, 0x09},
> -       {0x0114, 0x01},
> -       {0x0128, 0x00},
> -       {0x012a, 0x18},
> -       {0x012b, 0x00},
> -       {0x0162, 0x0d},
> -       {0x0163, 0x78},
> -       {0x0164, 0x02},
> -       {0x0165, 0xa8},
> -       {0x0166, 0x0a},
> -       {0x0167, 0x27},
> -       {0x0168, 0x02},
> -       {0x0169, 0xb4},
> -       {0x016a, 0x06},
> -       {0x016b, 0xeb},
> -       {0x016c, 0x07},
> -       {0x016d, 0x80},
> -       {0x016e, 0x04},
> -       {0x016f, 0x38},
> -       {0x0170, 0x01},
> -       {0x0171, 0x01},
> -       {0x0174, 0x00},
> -       {0x0175, 0x00},
> -       {0x0301, 0x05},
> -       {0x0303, 0x01},
> -       {0x0304, 0x03},
> -       {0x0305, 0x03},
> -       {0x0306, 0x00},
> -       {0x0307, 0x39},
> -       {0x030b, 0x01},
> -       {0x030c, 0x00},
> -       {0x030d, 0x72},
> -       {0x0624, 0x07},
> -       {0x0625, 0x80},
> -       {0x0626, 0x04},
> -       {0x0627, 0x38},
> -       {0x455e, 0x00},
> -       {0x471e, 0x4b},
> -       {0x4767, 0x0f},
> -       {0x4750, 0x14},
> -       {0x4540, 0x00},
> -       {0x47b4, 0x14},
> -       {0x4713, 0x30},
> -       {0x478b, 0x10},
> -       {0x478f, 0x10},
> -       {0x4793, 0x10},
> -       {0x4797, 0x0e},
> -       {0x479b, 0x0e},
> +static const struct imx219_reg mode_8mhz_4lane[] = {
> +       { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_LANE_MODE_4LANE,
> +                                       IMX219_REG_VALUE_08BIT, false },
> +       { IMX219_REG_PLL_VT_MULTIPLIER, 88, IMX219_REG_VALUE_16BIT, false },
>  };
>
> -static const struct imx219_reg mode_1640_1232_regs[] = {
> -       {0x0100, 0x00},
> -       {0x30eb, 0x0c},
> -       {0x30eb, 0x05},
> -       {0x300a, 0xff},
> -       {0x300b, 0xff},
> -       {0x30eb, 0x05},
> -       {0x30eb, 0x09},
> -       {0x0114, 0x01},
> -       {0x0128, 0x00},
> -       {0x012a, 0x18},
> -       {0x012b, 0x00},
> -       {0x0164, 0x00},
> -       {0x0165, 0x00},
> -       {0x0166, 0x0c},
> -       {0x0167, 0xcf},
> -       {0x0168, 0x00},
> -       {0x0169, 0x00},
> -       {0x016a, 0x09},
> -       {0x016b, 0x9f},
> -       {0x016c, 0x06},
> -       {0x016d, 0x68},
> -       {0x016e, 0x04},
> -       {0x016f, 0xd0},
> -       {0x0170, 0x01},
> -       {0x0171, 0x01},
> -       {0x0174, 0x01},
> -       {0x0175, 0x01},
> -       {0x0301, 0x05},
> -       {0x0303, 0x01},
> -       {0x0304, 0x03},
> -       {0x0305, 0x03},
> -       {0x0306, 0x00},
> -       {0x0307, 0x39},
> -       {0x030b, 0x01},
> -       {0x030c, 0x00},
> -       {0x030d, 0x72},
> -       {0x0624, 0x06},
> -       {0x0625, 0x68},
> -       {0x0626, 0x04},
> -       {0x0627, 0xd0},
> -       {0x455e, 0x00},
> -       {0x471e, 0x4b},
> -       {0x4767, 0x0f},
> -       {0x4750, 0x14},
> -       {0x4540, 0x00},
> -       {0x47b4, 0x14},
> -       {0x4713, 0x30},
> -       {0x478b, 0x10},
> -       {0x478f, 0x10},
> -       {0x4793, 0x10},
> -       {0x4797, 0x0e},
> -       {0x479b, 0x0e},
> -       {0x0162, 0x0d},
> -       {0x0163, 0x78},
> +/* Note: Never forget to select BANK OFFSET when using these modes */
> +static const struct imx219_reg mode_3280x2464[] = {
> +       /* MAX: 4-Lane @ 30FPS - 2-Lane @ 15FPS */
> +       { IMX219_REG_FRAME_LEN_LINES, 2691, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_START, 0, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_END, 3279, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_START, 0, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_END, 2463, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_OUTPUT_SIZE, 3280, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 2464, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_H, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_V, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
>  };
>
> -static const struct imx219_reg mode_640_480_regs[] = {
> -       {0x0100, 0x00},
> -       {0x30eb, 0x05},
> -       {0x30eb, 0x0c},
> -       {0x300a, 0xff},
> -       {0x300b, 0xff},
> -       {0x30eb, 0x05},
> -       {0x30eb, 0x09},
> -       {0x0114, 0x01},
> -       {0x0128, 0x00},
> -       {0x012a, 0x18},
> -       {0x012b, 0x00},
> -       {0x0162, 0x0d},
> -       {0x0163, 0x78},
> -       {0x0164, 0x03},
> -       {0x0165, 0xe8},
> -       {0x0166, 0x08},
> -       {0x0167, 0xe7},
> -       {0x0168, 0x02},
> -       {0x0169, 0xf0},
> -       {0x016a, 0x06},
> -       {0x016b, 0xaf},
> -       {0x016c, 0x02},
> -       {0x016d, 0x80},
> -       {0x016e, 0x01},
> -       {0x016f, 0xe0},
> -       {0x0170, 0x01},
> -       {0x0171, 0x01},
> -       {0x0174, 0x03},
> -       {0x0175, 0x03},
> -       {0x0301, 0x05},
> -       {0x0303, 0x01},
> -       {0x0304, 0x03},
> -       {0x0305, 0x03},
> -       {0x0306, 0x00},
> -       {0x0307, 0x39},
> -       {0x030b, 0x01},
> -       {0x030c, 0x00},
> -       {0x030d, 0x72},
> -       {0x0624, 0x06},
> -       {0x0625, 0x68},
> -       {0x0626, 0x04},
> -       {0x0627, 0xd0},
> -       {0x455e, 0x00},
> -       {0x471e, 0x4b},
> -       {0x4767, 0x0f},
> -       {0x4750, 0x14},
> -       {0x4540, 0x00},
> -       {0x47b4, 0x14},
> -       {0x4713, 0x30},
> -       {0x478b, 0x10},
> -       {0x478f, 0x10},
> -       {0x4793, 0x10},
> -       {0x4797, 0x0e},
> -       {0x479b, 0x0e},
> +static const struct imx219_reg mode_1920x1080_cropped_60fps[] = {
> +       { IMX219_REG_FRAME_LEN_LINES, 1237, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_START, 680, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_END, 2599, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_START, 692, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_END, 1771, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_OUTPUT_SIZE, 1920, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 1080, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_H, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_V, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
> +};
> +
> +static const struct imx219_reg mode_1280x720_cropped_120fps[] = {
> +       /* Recommended coarse integration time value: 846 */
> +       { IMX219_REG_FRAME_LEN_LINES, 850, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_START, 1000, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_END, 2280, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_START, 872, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_END, 1592, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_OUTPUT_SIZE, 1280, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 720, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_H, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_V, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
> +};
> +
> +static const struct imx219_reg mode_640x480_x2_analog_200fps[] = {
> +       /* Recommended coarse integration time value: 477 */
> +       { IMX219_REG_FRAME_LEN_LINES, 481, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_START, 1000, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_END, 2280, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_START, 752, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_END, 1712, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_OUTPUT_SIZE, 640, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 480, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_H, 3, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_V, 3, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
> +};
> +
> +static const struct imx219_reg mode_640x80_x2_analog_1000fps[] = {
> +       /* Recommended coarse integration time value: 92 */
> +       { IMX219_REG_FRAME_LEN_LINES, 481, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_START, 1320, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ADDR_END, 2600, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_START, 990, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_ADDR_END, 1561, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_OUTPUT_SIZE, 640, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_Y_OUTPUT_SIZE, 80, IMX219_REG_VALUE_16BIT, true },
> +       { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_H, 3, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_MODE_V, 3, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
>  };
>
>  static const struct imx219_reg raw8_framefmt_regs[] = {
> -       {0x018c, 0x08},
> -       {0x018d, 0x08},
> -       {0x0309, 0x08},
> +       { IMX219_REG_CSI_DATA_FORMAT_HI, 8, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_CSI_DATA_FORMAT_LO, 8, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_OP_PIX_CLK_DIV, 8, IMX219_REG_VALUE_08BIT, false },
>  };
>
>  static const struct imx219_reg raw10_framefmt_regs[] = {
> -       {0x018c, 0x0a},
> -       {0x018d, 0x0a},
> -       {0x0309, 0x0a},
> +       { IMX219_REG_CSI_DATA_FORMAT_HI, 10, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_CSI_DATA_FORMAT_LO, 10, IMX219_REG_VALUE_08BIT, true },
> +       { IMX219_REG_OP_PIX_CLK_DIV, 10, IMX219_REG_VALUE_08BIT, false },
>  };
>
>  static const char * const imx219_test_pattern_menu[] = {
> @@ -461,73 +483,98 @@ static const u32 codes[] = {
>   * case of DT for regulator-fixed one should define the startup-delay-us
>   * property.
>   */
> -#define IMX219_XCLR_MIN_DELAY_US       6200
> +#define IMX219_XCLR_MIN_DELAY_US       7200

Sakari's just queried this change, but additionally it now contradicts
the comment immediately preceding it describing why the delay is
6200usecs.

>  #define IMX219_XCLR_DELAY_RANGE_US     1000
>
>  /* Mode configs */
>  static const struct imx219_mode supported_modes[] = {
>         {
> -               /* 8MPix 15fps mode */
> +               /* 8MPix 30/15fps mode (4/2-Lane) */
>                 .width = 3280,
>                 .height = 2464,
> +               .max_fps = 30,
>                 .crop = {
>                         .left = IMX219_PIXEL_ARRAY_LEFT,
>                         .top = IMX219_PIXEL_ARRAY_TOP,
>                         .width = 3280,
>                         .height = 2464
>                 },
> -               .vts_def = IMX219_VTS_15FPS,
> +               .vts_def = IMX219_VTS_8MP_30FPS_4LANE,
>                 .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> -                       .regs = mode_3280x2464_regs,
> +                       .num_of_regs = ARRAY_SIZE(mode_3280x2464),
> +                       .regs = mode_3280x2464,
>                 },
>         },
>         {
> -               /* 1080P 30fps cropped */
> +               /* 1080P 60fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> +               .max_fps = 60,
>                 .crop = {
>                         .left = 688,
>                         .top = 700,
>                         .width = 1920,
>                         .height = 1080
>                 },
> -               .vts_def = IMX219_VTS_30FPS_1080P,
> +               .vts_def = IMX219_VTS_60FPS_1080P,
>                 .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> -                       .regs = mode_1920_1080_regs,
> +                       .num_of_regs =
> +                               ARRAY_SIZE(mode_1920x1080_cropped_60fps),
> +                       .regs = mode_1920x1080_cropped_60fps,
>                 },
>         },
>         {
> -               /* 2x2 binned 30fps mode */
> -               .width = 1640,
> -               .height = 1232,
> +               /* 720P 120fps cropped */
> +               .width = 1280,
> +               .height = 720,
> +               .max_fps = 120,
>                 .crop = {
> -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> -                       .top = IMX219_PIXEL_ARRAY_TOP,
> -                       .width = 3280,
> -                       .height = 2464
> +                       .left = 1008,
> +                       .top = 864,
> +                       .width = 1280,
> +                       .height = 720
>                 },
> -               .vts_def = IMX219_VTS_30FPS_BINNED,
> +               .vts_def = IMX219_VTS_120FPS_720P,
>                 .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> -                       .regs = mode_1640_1232_regs,
> +                       .num_of_regs =
> +                               ARRAY_SIZE(mode_1280x720_cropped_120fps),
> +                       .regs = mode_1280x720_cropped_120fps,
>                 },
>         },
>         {
> -               /* 640x480 30fps mode */
> +               /* special analog binning, 640x480 200fps mode */
>                 .width = 640,
>                 .height = 480,
> +               .max_fps = 200,
>                 .crop = {
>                         .left = 1008,
> -                       .top = 760,
> -                       .width = 1280,
> -                       .height = 960
> +                       .top = 744,
> +                       .width = 640,
> +                       .height = 480
>                 },
> -               .vts_def = IMX219_VTS_30FPS_640x480,
> +               .vts_def = IMX219_VTS_200FPS_BINNED,
>                 .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_640_480_regs),
> -                       .regs = mode_640_480_regs,
> +                       .num_of_regs =
> +                               ARRAY_SIZE(mode_640x480_x2_analog_200fps),
> +                       .regs = mode_640x480_x2_analog_200fps,
> +               },
> +       },
> +       {
> +               /* special analog binning, 640x80 1000 mode */
> +               .width = 640,
> +               .height = 80,
> +               .max_fps = 1000,
> +               .crop = {
> +                       .left = 1328,
> +                       .top = 982,
> +                       .width = 640,
> +                       .height = 80
> +               },
> +               .vts_def = IMX219_VTS_1000FPS_BINNED,
> +               .reg_list = {
> +                       .num_of_regs =
> +                               ARRAY_SIZE(mode_640x80_x2_analog_1000fps),
> +                       .regs = mode_640x80_x2_analog_1000fps,
>                 },
>         },
>  };
> @@ -553,8 +600,12 @@ struct imx219 {
>         struct v4l2_ctrl *vblank;
>         struct v4l2_ctrl *hblank;
>
> +       /* Frame rate */
> +       struct v4l2_fract frame_rate;
> +
>         /* Current mode */
>         const struct imx219_mode *mode;
> +       bool is_4lane;
>
>         /*
>          * Mutex for serialized access:
> @@ -562,6 +613,9 @@ struct imx219 {
>          */
>         struct mutex mutex;
>
> +       /* Bank A or B */
> +       u32 frame_setup_bank_off;
> +
>         /* Streaming on/off */
>         bool streaming;
>  };
> @@ -604,7 +658,7 @@ static int imx219_read_reg(struct imx219 *imx219, u16 reg, u32 len, u32 *val)
>         return 0;
>  }
>
> -/* Write registers up to 2 at a time */
> +/* Write registers up to 4 at a time */

Whilst only a correction to a comment, this isn't covered in the
commit text. Another patch.

>  static int imx219_write_reg(struct imx219 *imx219, u16 reg, u32 len, u32 val)
>  {
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> @@ -621,6 +675,14 @@ static int imx219_write_reg(struct imx219 *imx219, u16 reg, u32 len, u32 val)
>         return 0;
>  }
>
> +static inline int imx219_write_banked_reg(struct imx219 *imx219,
> +                                         u16 reg, u32 len, u32 val)
> +{
> +       u16 reg_addr = reg + imx219->frame_setup_bank_off;
> +
> +       return imx219_write_reg(imx219, reg_addr, len, val);
> +}
> +
>  /* Write a list of registers */
>  static int imx219_write_regs(struct imx219 *imx219,
>                              const struct imx219_reg *regs, u32 len)
> @@ -630,11 +692,20 @@ static int imx219_write_regs(struct imx219 *imx219,
>         int ret;
>
>         for (i = 0; i < len; i++) {
> -               ret = imx219_write_reg(imx219, regs[i].address, 1, regs[i].val);
> +               u16 reg_addr = regs[i].address;
> +
> +               if (regs[i].is_banked)
> +                       ret = imx219_write_banked_reg(imx219, regs[i].address,
> +                                                     regs[i].reg_len,
> +                                                     regs[i].val);
> +               else
> +                       ret = imx219_write_reg(imx219, regs[i].address,
> +                                              regs[i].reg_len,
> +                                              regs[i].val);
>                 if (ret) {
>                         dev_err_ratelimited(&client->dev,
> -                                           "Failed to write reg 0x%4.4x. error = %d\n",
> -                                           regs[i].address, ret);
> +                                           "Cannot write reg 0x%4.4x. (%d)\n",
> +                                           reg_addr, ret);
>
>                         return ret;
>                 }
> @@ -737,16 +808,19 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>
>         switch (ctrl->id) {
>         case V4L2_CID_ANALOGUE_GAIN:
> -               ret = imx219_write_reg(imx219, IMX219_REG_ANALOG_GAIN,
> -                                      IMX219_REG_VALUE_08BIT, ctrl->val);
> +               ret = imx219_write_banked_reg(imx219, IMX219_REG_ANALOG_GAIN,
> +                                             IMX219_REG_VALUE_08BIT,
> +                                             ctrl->val);
>                 break;
>         case V4L2_CID_EXPOSURE:
> -               ret = imx219_write_reg(imx219, IMX219_REG_EXPOSURE,
> -                                      IMX219_REG_VALUE_16BIT, ctrl->val);
> +               ret = imx219_write_banked_reg(imx219, IMX219_REG_EXPOSURE,
> +                                             IMX219_REG_VALUE_16BIT,
> +                                             ctrl->val);
>                 break;
>         case V4L2_CID_DIGITAL_GAIN:
> -               ret = imx219_write_reg(imx219, IMX219_REG_DIGITAL_GAIN,
> -                                      IMX219_REG_VALUE_16BIT, ctrl->val);
> +               ret = imx219_write_banked_reg(imx219, IMX219_REG_DIGITAL_GAIN,
> +                                             IMX219_REG_VALUE_16BIT,
> +                                             ctrl->val);
>                 break;
>         case V4L2_CID_TEST_PATTERN:
>                 ret = imx219_write_reg(imx219, IMX219_REG_TEST_PATTERN,
> @@ -755,14 +829,15 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_HFLIP:
>         case V4L2_CID_VFLIP:
> -               ret = imx219_write_reg(imx219, IMX219_REG_ORIENTATION, 1,
> -                                      imx219->hflip->val |
> -                                      imx219->vflip->val << 1);
> +               ret = imx219_write_banked_reg(imx219, IMX219_REG_ORIENTATION,
> +                                             IMX219_REG_VALUE_08BIT,
> +                                             imx219->hflip->val |
> +                                             imx219->vflip->val << 1);
>                 break;
>         case V4L2_CID_VBLANK:
> -               ret = imx219_write_reg(imx219, IMX219_REG_VTS,
> -                                      IMX219_REG_VALUE_16BIT,
> -                                      imx219->mode->height + ctrl->val);
> +               ret = imx219_write_banked_reg(imx219, IMX219_REG_VTS,
> +                                            IMX219_REG_VALUE_16BIT,
> +                                            imx219->mode->height + ctrl->val);
>                 break;
>         case V4L2_CID_TEST_PATTERN_RED:
>                 ret = imx219_write_reg(imx219, IMX219_REG_TESTP_RED,
> @@ -837,6 +912,91 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>         return 0;
>  }
>
> +static int imx219_enum_frame_interval(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_pad_config *cfg,
> +                               struct v4l2_subdev_frame_interval_enum *fie)

No, this sensor uses the controls PIXEL_RATE, VBLANK, and HBLANK
to calculate and configure the frame rate.

https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#frame-interval-configuration
7.4. Frame interval configuration
There are two different methods for obtaining possibilities for
different frame intervals as well as configuring the frame interval.
Which one to implement depends on the type of the device.
7.4.1. Raw camera sensors
Instead of a high level parameter such as frame interval, the frame
interval is a result of the configuration of a number of camera sensor
implementation specific parameters. Luckily, these parameters tend to
be the same for more or less all modern raw camera sensors.

I don't see implementing both as being a valid choice.
Certainly at the moment if you go through imx219_s_frame_interval then
it doesn't update the vblank control, and setting VBLANK through the
control handler doesn't update imx219->frame_rate.

> +{
> +       unsigned int i;
> +
> +       if (fie->pad || fie->index >= ARRAY_SIZE(supported_modes))
> +               return -EINVAL;
> +
> +       for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
> +               if (fie->width == supported_modes[i].width &&
> +                   fie->height == supported_modes[i].height)
> +                       break;
> +
> +       if (i == ARRAY_SIZE(supported_modes))
> +               return -EINVAL;
> +
> +       fie->interval.numerator = 1;
> +       fie->interval.denominator = supported_modes[i].max_fps;
> +
> +       return 0;
> +}
> +
> +static int imx219_g_frame_interval(struct v4l2_subdev *sd,
> +                                  struct v4l2_subdev_frame_interval *ival)
> +{
> +       struct imx219 *imx219 = to_imx219(sd);
> +
> +       ival->interval.numerator = imx219->frame_rate.denominator;
> +       ival->interval.denominator = imx219->frame_rate.numerator;
> +
> +       return 0;
> +}
> +
> +static int imx219_s_frame_interval(struct v4l2_subdev *sd,
> +                                  struct v4l2_subdev_frame_interval *ival)
> +{
> +       struct imx219 *imx219 = to_imx219(sd);
> +       const struct imx219_mode *cur_mode = imx219->mode;
> +       struct v4l2_fract *tpf = &ival->interval;
> +       int exposure_max, exposure_def;
> +       u32 new_vts;
> +       u32 vblank = 0;
> +
> +       if (tpf->numerator == 0 || tpf->denominator == 0 ||
> +           (tpf->denominator > tpf->numerator * cur_mode->max_fps)) {
> +               /* reset to max frame rate */
> +               tpf->numerator = 1;
> +               tpf->denominator = cur_mode->max_fps;
> +               new_vts = cur_mode->vts_def;
> +       } else {
> +               /* Approximation of new VTS: recalculate default vblank */
> +               vblank = cur_mode->vts_def - cur_mode->height;
> +
> +               /* Avoid floating point */
> +               new_vts = vblank * 1000;
> +               new_vts = new_vts / cur_mode->max_fps;
> +               new_vts = (new_vts * tpf->denominator) / 1000;
> +               new_vts += vblank + cur_mode->height;
> +       }
> +
> +       imx219->frame_rate.numerator = tpf->numerator;
> +       imx219->frame_rate.denominator = tpf->denominator;
> +
> +       /*
> +        * Note: VTS cannot be less than cur_mode->height, but that's useless
> +        * to check at this point, since we are surely complying here.
> +        *
> +        * Now that we've got a new VTS, let's update the exposure control
> +        * min/max in order to avoid impossible and/or useless combinations.
> +        */
> +       exposure_max = new_vts - 4;
> +       exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> +                       exposure_max : IMX219_EXPOSURE_DEFAULT;
> +       __v4l2_ctrl_modify_range(imx219->exposure,
> +                                imx219->exposure->minimum,
> +                                exposure_max, imx219->exposure->step,
> +                                exposure_def);
> +
> +       /* Should we copy Bank A to Bank B with new VTS and then switch? */
> +       return imx219_write_banked_reg(imx219, IMX219_REG_VTS,
> +                                      IMX219_REG_VALUE_16BIT,
> +                                      new_vts);

Largely irrelevant, but there's no guarantee that the sensor is
powered up when s_frame_interval is called, at which point your write
is going to fail.

> +}
> +
>  static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
>  {
>         fmt->colorspace = V4L2_COLORSPACE_SRGB;
> @@ -1024,12 +1184,102 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>         return -EINVAL;
>  }
>
> +static int imx219_configure_stream(struct imx219 *imx219)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> +       struct imx219_reg_list reg_list;
> +       int ret;
> +
> +       /* Send auth command here if needed */
> +
> +       if (imx219->xclk_freq == IMX219_XCLK_FREQ_8M) {
> +               reg_list.regs = mode_8mhz_regs;
> +               reg_list.num_of_regs = ARRAY_SIZE(mode_8mhz_regs);
> +
> +               ret = imx219_write_regs(imx219, reg_list.regs,
> +                                       reg_list.num_of_regs);
> +               if (ret) {
> +                       dev_err(&client->dev,
> +                               "8m: Cannot write clocks setup\n");

Nit pick: It's not milli-Hz, so a capital letter would be nice.
I looked at it and initially thought it was a mis-typed ANSI escape sequence.
Writing out "8MHz" in full wouldn't be awful if we really need it
(there's a dev_debug in probe that will already have logged the clock
rate).

> +                       return ret;
> +               }
> +
> +               if (imx219->is_4lane) {
> +                       reg_list.regs = mode_8mhz_4lane;
> +                       reg_list.num_of_regs = ARRAY_SIZE(mode_8mhz_4lane);
> +               } else {
> +                       reg_list.regs = mode_8mhz_2lane;
> +                       reg_list.num_of_regs = ARRAY_SIZE(mode_8mhz_2lane);
> +               }
> +
> +               ret = imx219_write_regs(imx219, reg_list.regs,
> +                                       reg_list.num_of_regs);
> +               if (ret) {
> +                       dev_err(&client->dev,
> +                               "8m: Cannot write lanes setup\n");
> +                       return ret;
> +               }
> +       } else {
> +               reg_list.regs = mode_24mhz_regs;
> +               reg_list.num_of_regs = ARRAY_SIZE(mode_24mhz_regs);
> +
> +               ret = imx219_write_regs(imx219, reg_list.regs,
> +                                       reg_list.num_of_regs);
> +               if (ret) {
> +                       dev_err(&client->dev,
> +                               "24m: Cannot write clocks setup\n");
> +                       return ret;
> +               }
> +
> +               if (imx219->is_4lane) {
> +                       reg_list.regs = mode_24mhz_4lane;
> +                       reg_list.num_of_regs = ARRAY_SIZE(mode_24mhz_4lane);
> +               } else {
> +                       reg_list.regs = mode_24mhz_2lane;
> +                       reg_list.num_of_regs = ARRAY_SIZE(mode_24mhz_2lane);
> +               }
> +
> +               ret = imx219_write_regs(imx219, reg_list.regs,
> +                                       reg_list.num_of_regs);
> +               if (ret) {
> +                       dev_err(&client->dev,
> +                               "24m: Cannot write lanes setup\n");
> +                       return ret;
> +               }
> +       }
> +
> +       /* Send magic sequence (imx219_unknown_seq) here if needed */
> +
> +       return 0;
> +}
> +
>  static int imx219_start_streaming(struct imx219 *imx219)
>  {
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>         const struct imx219_reg_list *reg_list;
> +       u8 frame_bank;
>         int ret;
>
> +       /*
> +        * For a fast mode switch without tearing down and back up the
> +        * entire sensor configuration, do the setup on the other frame
> +        * setup bank and do a seamless switch to it.
> +        * If the sensor was reset, always use Bank Control Group A for
> +        * logical consistency.
> +        * As for the hardware itself, there is no such requirement.
> +        */
> +       if (imx219->frame_setup_bank_off == IMX219_REG_FRAME_BANK_BASE(1) ||
> +           !imx219->streaming)
> +               frame_bank = 0;
> +       else
> +               frame_bank = 1;

It may be more obvious if this was split out as a separate patch, but
I don't see how you really gain anything with this bank switching.

imx219->frame_setup_bank_off is only ever set from this function, and
always uses bank 0 if not streaming.
But imx219_start_streaming is only ever called from imx219_set_stream
if the state is not the same as before. Don't we always end up with
bank 0 being used? In which case we have a large change for no gain.

> +
> +       imx219->frame_setup_bank_off = IMX219_REG_FRAME_BANK_BASE(frame_bank);
> +
> +       ret = imx219_configure_stream(imx219);
> +       if (ret)
> +               return ret;
> +
>         /* Apply default values of current mode */
>         reg_list = &imx219->mode->reg_list;
>         ret = imx219_write_regs(imx219, reg_list->regs, reg_list->num_of_regs);
> @@ -1038,6 +1288,12 @@ static int imx219_start_streaming(struct imx219 *imx219)
>                 return ret;
>         }
>
> +       /* Set frame bank number */
> +       ret = imx219_write_reg(imx219, IMX219_REG_FRAME_BANK_CTRL,
> +                              IMX219_REG_VALUE_08BIT, frame_bank);
> +       if (ret)
> +               dev_err(&client->dev, "%s failed to set stream\n", __func__);
> +
>         ret = imx219_set_framefmt(imx219);
>         if (ret) {
>                 dev_err(&client->dev, "%s failed to set frame format: %d\n",
> @@ -1238,6 +1494,8 @@ static const struct v4l2_subdev_core_ops imx219_core_ops = {
>
>  static const struct v4l2_subdev_video_ops imx219_video_ops = {
>         .s_stream = imx219_set_stream,
> +       .g_frame_interval = imx219_g_frame_interval,
> +       .s_frame_interval = imx219_s_frame_interval,
>  };
>
>  static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> @@ -1246,6 +1504,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>         .set_fmt = imx219_set_pad_format,
>         .get_selection = imx219_get_selection,
>         .enum_frame_size = imx219_enum_frame_size,
> +       .enum_frame_interval = imx219_enum_frame_interval,
>  };
>
>  static const struct v4l2_subdev_ops imx219_subdev_ops = {
> @@ -1267,6 +1526,7 @@ static int imx219_init_controls(struct imx219 *imx219)
>         struct v4l2_fwnode_device_properties props;
>         int exposure_max, exposure_def, hblank;
>         int i, ret;
> +       u32 prate;
>
>         ctrl_hdlr = &imx219->ctrl_handler;
>         ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> @@ -1276,12 +1536,15 @@ static int imx219_init_controls(struct imx219 *imx219)
>         mutex_init(&imx219->mutex);
>         ctrl_hdlr->lock = &imx219->mutex;
>
> +       if (imx219->is_4lane)
> +               prate = IMX219_4LANE_PIXEL_RATE;
> +       else
> +               prate = IMX219_2LANE_PIXEL_RATE;
> +
>         /* By default, PIXEL_RATE is read only */
>         imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>                                                V4L2_CID_PIXEL_RATE,
> -                                              IMX219_PIXEL_RATE,
> -                                              IMX219_PIXEL_RATE, 1,
> -                                              IMX219_PIXEL_RATE);
> +                                              prate, prate, 1, prate);
>
>         /* Initial vblank/hblank/exposure parameters based on current mode */
>         imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> @@ -1374,7 +1637,7 @@ static void imx219_free_controls(struct imx219 *imx219)
>         mutex_destroy(&imx219->mutex);
>  }
>
> -static int imx219_check_hwcfg(struct device *dev)
> +static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>  {
>         struct fwnode_handle *endpoint;
>         struct v4l2_fwnode_endpoint ep_cfg = {
> @@ -1393,24 +1656,30 @@ static int imx219_check_hwcfg(struct device *dev)
>                 goto error_out;
>         }
>
> -       /* Check the number of MIPI CSI2 data lanes */
> -       if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> -               dev_err(dev, "only 2 data lanes are currently supported\n");
> +       /* Check the link frequency set in device tree */
> +       if (ep_cfg.nr_of_link_frequencies != 1) {
> +               dev_err(dev, "bad link-frequency property in DT\n");
>                 goto error_out;
>         }
>
> -       /* Check the link frequency set in device tree */
> -       if (!ep_cfg.nr_of_link_frequencies) {
> -               dev_err(dev, "link-frequency property not found in DT\n");
> +       /* Check the number of MIPI CSI2 data lanes */
> +       if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
> +           ep_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +               dev_err(dev, "Only 2-Lane and 4-Lane modes are supported\n");
>                 goto error_out;
>         }
>
> -       if (ep_cfg.nr_of_link_frequencies != 1 ||
> -           ep_cfg.link_frequencies[0] != IMX219_DEFAULT_LINK_FREQ) {
> -               dev_err(dev, "Link frequency not supported: %lld\n",
> -                       ep_cfg.link_frequencies[0]);
> +       imx219->is_4lane = ep_cfg.bus.mipi_csi2.num_data_lanes == 4;
> +
> +       if ((imx219->is_4lane &&
> +            ep_cfg.link_frequencies[0] != IMX219_4LANE_DEFAULT_LINK_FREQ) ||
> +           (!imx219->is_4lane &&
> +            ep_cfg.link_frequencies[0] != IMX219_2LANE_DEFAULT_LINK_FREQ)) {
> +               dev_err(dev,
> +                       "Unsupported link frequency for %u-Lane operation\n",
> +                       imx219->is_4lane ? 4 : 2);
>                 goto error_out;
> -       }
> +       };
>
>         ret = 0;
>
> @@ -1434,7 +1703,7 @@ static int imx219_probe(struct i2c_client *client)
>         v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
>
>         /* Check the hardware configuration in device tree */
> -       if (imx219_check_hwcfg(dev))
> +       if (imx219_check_hwcfg(dev, imx219))
>                 return -EINVAL;
>
>         /* Get system clock (xclk) */
> @@ -1445,7 +1714,8 @@ static int imx219_probe(struct i2c_client *client)
>         }
>
>         imx219->xclk_freq = clk_get_rate(imx219->xclk);
> -       if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> +       if (imx219->xclk_freq != IMX219_XCLK_FREQ_8M &&
> +           imx219->xclk_freq != IMX219_XCLK_FREQ_24M) {
>                 dev_err(dev, "xclk frequency not supported: %d Hz\n",
>                         imx219->xclk_freq);
>                 return -EINVAL;
> @@ -1473,6 +1743,9 @@ static int imx219_probe(struct i2c_client *client)
>         if (ret)
>                 goto error_power_off;
>
> +       /* Use the Frame Bank Group A for the first startup */
> +       imx219->frame_setup_bank_off = IMX219_REG_FRAME_BANK_BASE(0);
> +
>         /* Set default mode to max resolution */
>         imx219->mode = &supported_modes[0];
>
> @@ -1526,6 +1799,9 @@ static int imx219_probe(struct i2c_client *client)
>         pm_runtime_enable(dev);
>         pm_runtime_idle(dev);
>
> +       dev_dbg(dev, "Initialized with XCLK at %uHz, %d-Lane\n",
> +               imx219->xclk_freq, imx219->is_4lane ? 4 : 2);
> +
>         return 0;
>
>  error_media_entity:
> --
> 2.29.2
>

Thanks
  Dave
