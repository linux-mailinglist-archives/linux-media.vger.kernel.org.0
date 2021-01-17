Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9090F2F950B
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 21:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbhAQUOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 15:14:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728469AbhAQUN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 15:13:58 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AA7C061573
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 12:13:17 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j18so807525wmi.3
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 12:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tRRZTNTdCM2wK1qBAzUzc3fToSofJCUQH4tlSHFfs+Q=;
        b=RwDuetPRfQmw/Yivgu/wrkTiurFzyUFD5alTlvCcPzZPKCoTi2dUiLTIzyr54kNG56
         V+OiHHcONXwK8KWMufySDOzEPxhPRMN0HmbMeSI5yPKXPvgMeTLynL3F3rghg+h8Ug5n
         9Qp+Z+yrWi0YbiwMlbx2lmQRkv5OhJ6C6HPT/gUcCT0iOQ4u2LUKiXECJumVyQJ6cpa9
         MmwMo64vfr+YneJaONNrIwIy0OqA5V1j7eMEIWEYTM7muhPQSPCnlPfRnncH2y9+RyNA
         b3hG89xiGWVCfmICsHMBuiNQQSog5hgVnK9AOBkusNjy1fNWn/hGicGroqhuTTP7wNcB
         gb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRRZTNTdCM2wK1qBAzUzc3fToSofJCUQH4tlSHFfs+Q=;
        b=VM2hh4QwnJMmCxyv/gEu1MiRcjeK9O/A269PDs28HHPtHfyzHpOWQwM3xuHYOx9QsZ
         IQ8j2OBKjuAdkJ9tzpBdG1uxb7lMV/qv560uZd9uhY7NENGQq3k8bgi/oaaLUwpyBapI
         5q47ki6pikVvy8eHqdBaqRQ52oIiGfpnQ2/x7h0/sCmu/ffdCs/ZQyLysFaAgsm3uaxM
         CncXIIx3NIDh7sOHSdKaMFPagBDNQKcbqKSzsaZ2WuKxrvIRgEObwtRseorwi+PsmOYP
         HDFJHhHKK4FCYCVeiStbwIPr8m7GzdbgklkZyfT7D9kd06TrLEVHPG0u+zwjxi3355rk
         CuAg==
X-Gm-Message-State: AOAM530WYTYkLUTA9fl6HoMUCxM2gyLptrcpfask4iv1NlXaqMnWI2jV
        3IG2kG6+oQo6XgxNti2oNSs5jXXhGT1FN0ekqXfnOQ==
X-Google-Smtp-Source: ABdhPJz03u2od//uX6xW7M0sajzPSOCAFbbM296D2tqLBh3bsKe+wxbfSqZ8YMXY1UHOuCcX4pbIRiDUpy0efQ1Og4o=
X-Received: by 2002:a1c:f201:: with SMTP id s1mr16742056wmc.158.1610914395841;
 Sun, 17 Jan 2021 12:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20210115185233.333407-1-angelogioacchino.delregno@somainline.org>
 <20210116231332.GT850@valkosipuli.retiisi.org.uk> <a641a46e-b6f8-f7a4-0413-914c19fb25c2@somainline.org>
In-Reply-To: <a641a46e-b6f8-f7a4-0413-914c19fb25c2@somainline.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Sun, 17 Jan 2021 20:13:01 +0000
Message-ID: <CAPY8ntCPfQcCAdRNfNw2_Otww1PYqDPvW0HbRqAQMmu=gL=Xhg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Rewrite tables and implement more modes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ebiggers@google.com,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Angelo

On Sun, 17 Jan 2021 at 17:33, AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 17/01/21 00:13, Sakari Ailus ha scritto:
> > Hi AngeloGioacchino,
> >
> > On Fri, Jan 15, 2021 at 07:52:33PM +0100, AngeloGioacchino Del Regno wrote:
> >> Enhance the feature set for this camera sensor by in rewriting the
> >> entire tables (as they were just meaningless magic register writes)
> >> in a similar form, but giving some names to the actual registers
> >> we write to, separating common sequences and reusing them for the
> >> various configuration variations that are now supported, hence
> >> implementing support for:
> >> - 8MHz XCLK, as used by (and not only) some Sony Xperia smartphones
> >> - 4-Lane Mode in both 24MHz and 8MHz XCLK configuration
> >> - High Frame Rate output modes support on 4-Lane operation, up to
> >>    1000FPS (also on 2-Lane but, being bandwidth-constrained, the
> >>    maximum achievable frame rate gets lower there)
> >
> > That's a lot of changes for a single patch. Could you split each of these
> > into separate patches, please?
> >
>
> Sure! I agree with you, let's split them for the V2 patch series!
>
> >> - Frame Bank Control Groups, in order to support a fast output
> >>    resolution switch, without resetting the entire sensor during
> >>    a streaming session: here the new mode gets configured on the
> >>    secondary (or primary, read: "the other") bank and the sensor
> >>    will be able to switch to it at the end of the "current frame".
> >
> > You basically need to stop streaming to reconfigure the sensor; V4L2
> > currently does not doing this on the fly.
> >
> > There's no need to rest the sensor though, and I don't think the driver did
> > that before either.
> >
>
> If V4L2 needs to stop streaming, then the sensor is "put to rest".
> By the way... okay, I can remove the implementation to fast-switch
> between the frame banks, but the registers are still laid out in frame
> banks in hardware so, in my opinion, the "new" layout should be kept.
>
> I wrote something more about this in reply to D. Stevenson so, please,
> for more information, look at my reply to him.
> Copy-pasting should not be necessary. Thank you!
>
> >>
> >> Please note: an unknown register write sequence was found in both
> >> the Raspberry Pi and a Sony Xperia smartphone i2c dump, but this
> >> seems to do literally nothing, as the sensor seems to work
> >> in the exact same way when sending and when not sending this
> >> write sequence, which is undocumented in the datasheet.
> >>
> >> Both the authentication and magic sequences were left in the
> >> driver with a big comment explaining what's going on so that,
> >> in the event that someone discovers the meaning of it (or
> >> Sony distributes documentation for that), it'll be pretty
> >> straightforward to insert them when needed.
> >>
> >> All the modes that got implemented in this commit have been tested
> >> with all combinations of 24/8MHz, 2/4Lane, all resolutions, on the
> >> following smartphones:
> >> - Sony Xperia XA2 (SDM630)
> >> - Sony Xperia XA2 Ultra (SDM630)
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >> ---
> >>   drivers/media/i2c/imx219.c | 884 ++++++++++++++++++++++++-------------
> >>   1 file changed, 580 insertions(+), 304 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >> index 92a8d52776b8..360730d5b81c 100644
> >> --- a/drivers/media/i2c/imx219.c
> >> +++ b/drivers/media/i2c/imx219.c
> >> @@ -12,6 +12,10 @@
> >>    * Flip handling taken from the Sony IMX319 driver.
> >>    * Copyright (C) 2018 Intel Corporation
> >>    *
> >> + * 8MHz, 4-Lane, High Frame Rate modes, Frame Bank Control groups,
> >> + * fast mode switching
> >> + * Copyright (C) 2020, AngeloGioacchino Del Regno
> >> + *                     <angelogioacchino.delregno@somainline.org>
> >>    */
> >>
> >>   #include <linux/clk.h>
> >> @@ -35,24 +39,93 @@
> >>   #define IMX219_MODE_STANDBY                0x00
> >>   #define IMX219_MODE_STREAMING              0x01
> >>
> >> +#define IMX219_REG_SW_RESET         0x0103
> >> +
> >> +/* Output Set-up */
> >> +#define IMX219_REG_CSI_LANE_MODE    0x0114
> >> +#define IMX219_CSI_LANE_MODE_2LANE  BIT(0)
> >> +#define IMX219_CSI_LANE_MODE_4LANE  (BIT(0) | BIT(1))
> >> +
> >> +#define IMX219_REG_DPHY_CTRL                0x0128
> >> +#define IMX219_DPHY_CTRL_AUTO               0
> >> +#define IMX219_DPHY_CTRL_MANUAL             1
> >> +
> >> +/* Use as 16-bits reg */
> >> +#define IMX219_REG_EXCK_FREQ_MHZ    0x012A
> >> +#define IMX219_EXCK_FREQ_MHZ_MIN    6
> >> +#define IMX219_EXCK_FREQ_MHZ_MAX    27
> >> +
> >> +/* Frame Bank Control Registers*/
> >> +#define IMX219_REG_FRAME_BANK_CTRL  0x0150
> >> +#define IMX219_FRAME_BANK_EN_SHIFT  BIT(0)
> >> +#define IMX219_FRAME_BANK_STAT_SHIFT        BIT(1)
> >> +
> >> +#define IMX219_REG_FRAME_COUNT              0x0151
> >> +#define IMX219_REG_FRAME_FAST_TRACKING      0x0152
> >> +
> >> +/* Frame Bank  0: Group "A" - 1: Group "B" */
> >> +#define IMX219_REG_FRAME_BANK_BASE(x)       ((0x100 * x) + 0x154)
> >> +#define IMX219_REG_ANALOG_GAIN              0x03
> >> +#define IMX219_REG_DIGITAL_GAIN             0x04
> >> +#define IMX219_REG_EXPOSURE         0x06
> >> +#define IMX219_REG_FRAME_LEN_LINES  0x0c
> >> +#define IMX219_REG_LINE_LEN_PCK             0x0e
> >> +#define IMX219_REG_X_ADDR_START             0x10
> >> +#define IMX219_REG_X_ADDR_END               0x12
> >> +#define IMX219_REG_Y_ADDR_START             0x14
> >> +#define IMX219_REG_Y_ADDR_END               0x16
> >> +#define IMX219_REG_X_OUTPUT_SIZE    0x18
> >> +#define IMX219_REG_Y_OUTPUT_SIZE    0x1a
> >> +#define IMX219_REG_X_ODD_INC                0x1c
> >> +#define IMX219_REG_Y_ODD_INC                0x1d
> >> +#define IMX219_REG_ORIENTATION              0x1e
> >> +#define IMX219_REG_BINNING_MODE_H   0x20
> >> +#define IMX219_REG_BINNING_MODE_V   0x21
> >> +#define IMX219_REG_BINNING_CAL_H    0x22
> >> +#define IMX219_REG_BINNING_CAL_V    0x23
> >> +#define IMX219_REG_CSI_DATA_FORMAT_HI       0x38
> >> +#define IMX219_REG_CSI_DATA_FORMAT_LO       0x39
> >> +#define IMX219_CSI_DATA_FMT_8BIT    8
> >> +#define IMX219_CSI_DATA_FMT_10BIT   10
> >> +
> >> +#define IMX219_REG_CLK_SETUP                0x300
> >> +#define IMX219_REG_VT_PIX_CLK_DIV   (IMX219_REG_CLK_SETUP + 0x01)
> >> +#define IMX219_REG_VT_SYS_CLK_DIV   (IMX219_REG_CLK_SETUP + 0x03)
> >> +#define IMX219_REG_PREPLLCK_VT_DIV  (IMX219_REG_CLK_SETUP + 0x04)
> >> +#define IMX219_REG_PREPLLCK_OP_DIV  (IMX219_REG_CLK_SETUP + 0x05)
> >> +#define IMX219_REG_PLL_VT_MULTIPLIER        (IMX219_REG_CLK_SETUP + 0x06)
> >> +#define IMX219_REG_OP_PIX_CLK_DIV   (IMX219_REG_CLK_SETUP + 0x09)
> >> +#define IMX219_REG_OP_SYS_CLK_DIV   (IMX219_REG_CLK_SETUP + 0x0b)
> >> +#define IMX219_REG_PLL_OP_MULTIPLIER        (IMX219_REG_CLK_SETUP + 0x0c)
> >> +
> >>   /* Chip ID */
> >>   #define IMX219_REG_CHIP_ID         0x0000
> >>   #define IMX219_CHIP_ID                     0x0219
> >>
> >> -/* External clock frequency is 24.0M */
> >> -#define IMX219_XCLK_FREQ            24000000
> >> +/* External clock frequency 8.0M or 24.0M */
> >> +#define IMX219_XCLK_FREQ_8M         8000000
> >> +#define IMX219_XCLK_FREQ_24M                24000000
> >> +
> >> +#define IMX219_2LANE_PIXEL_RATE             182400000
> >> +#define IMX219_4LANE_PIXEL_RATE             280800000
> >>
> >> -/* Pixel rate is fixed at 182.4M for all the modes */
> >> -#define IMX219_PIXEL_RATE           182400000
> >> +#define IMX219_2LANE_DEFAULT_LINK_FREQ      456000000
> >> +#define IMX219_4LANE_DEFAULT_LINK_FREQ      702000000
> >>
> >> -#define IMX219_DEFAULT_LINK_FREQ    456000000
> >> +/* Temperature */
> >> +#define IMX219_REG_TEMPERATURE              0x0140
> >> +#define IMX219_TEMPERATURE_EN               BIT(7)
> >> +#define IMX219_TEMPERATURE_MASK             0x7f
> >>
> >>   /* V_TIMING internal */
> >>   #define IMX219_REG_VTS                     0x0160
> >> -#define IMX219_VTS_15FPS            0x0dc6
> >> -#define IMX219_VTS_30FPS_1080P              0x06e3
> >> -#define IMX219_VTS_30FPS_BINNED             0x06e3
> >> -#define IMX219_VTS_30FPS_640x480    0x06e3
> >> +#define IMX219_VTS_8MP_30FPS_4LANE  2691
> >> +#define IMX219_VTS_8MP_15FPS_2LANE  3526
> >> +#define IMX219_VTS_60FPS_1080P              1237
> >> +#define IMX219_VTS_30FPS_BINNED             1346
> >> +#define IMX219_VTS_120FPS_720P              850
> >> +#define IMX219_VTS_200FPS_BINNED    481
> >> +#define IMX219_VTS_1000FPS_BINNED   481
> >>   #define IMX219_VTS_MAX                     0xffff
> >>
> >>   #define IMX219_VBLANK_MIN          4
> >> @@ -67,30 +140,27 @@
> >>   #define IMX219_PPL_DEFAULT         3448
> >>
> >>   /* Exposure control */
> >> -#define IMX219_REG_EXPOSURE         0x015a
> >>   #define IMX219_EXPOSURE_MIN                4
> >>   #define IMX219_EXPOSURE_STEP               1
> >>   #define IMX219_EXPOSURE_DEFAULT            0x640
> >>   #define IMX219_EXPOSURE_MAX                65535
> >>
> >>   /* Analog gain control */
> >> -#define IMX219_REG_ANALOG_GAIN              0x0157
> >>   #define IMX219_ANA_GAIN_MIN                0
> >>   #define IMX219_ANA_GAIN_MAX                232
> >>   #define IMX219_ANA_GAIN_STEP               1
> >>   #define IMX219_ANA_GAIN_DEFAULT            0x0
> >>
> >>   /* Digital gain control */
> >> -#define IMX219_REG_DIGITAL_GAIN             0x0158
> >>   #define IMX219_DGTL_GAIN_MIN               0x0100
> >>   #define IMX219_DGTL_GAIN_MAX               0x0fff
> >>   #define IMX219_DGTL_GAIN_DEFAULT   0x0100
> >>   #define IMX219_DGTL_GAIN_STEP              1
> >>
> >> -#define IMX219_REG_ORIENTATION              0x0172
> >> -
> >>   /* Test Pattern Control */
> >>   #define IMX219_REG_TEST_PATTERN            0x0600
> >> +#define IMX219_REG_TEST_PATTERN_WIDTH       0x0624
> >> +#define IMX219_REG_TEST_PATTERN_HEIGHT      0x0626
> >>   #define IMX219_TEST_PATTERN_DISABLE        0
> >>   #define IMX219_TEST_PATTERN_SOLID_COLOR    1
> >>   #define IMX219_TEST_PATTERN_COLOR_BARS     2
> >> @@ -120,7 +190,9 @@
> >>
> >>   struct imx219_reg {
> >>      u16 address;
> >> -    u8 val;
> >> +    u16 val;
> >> +    u8 reg_len;
> >> +    bool is_banked;
> >>   };
> >>
> >>   struct imx219_reg_list {
> >> @@ -134,11 +206,13 @@ struct imx219_mode {
> >>      unsigned int width;
> >>      /* Frame height */
> >>      unsigned int height;
> >> +    /* Maximum achievable FPS */
> >> +    unsigned int max_fps;
> >>
> >>      /* Analog crop rectangle. */
> >>      struct v4l2_rect crop;
> >>
> >> -    /* V-timing */
> >> +    /* V-timing default */
> >>      unsigned int vts_def;
> >>
> >>      /* Default register values */
> >> @@ -146,248 +220,196 @@ struct imx219_mode {
> >>   };
> >>
> >>   /*
> >> - * Register sets lifted off the i2C interface from the Raspberry Pi firmware
> >> - * driver.
> >> - * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
> >> + * The authentication sequence is needed to access registers beyond 0x3000,
> >> + * which the datasheet calls "Manufacturer Specific Registers", with a range
> >> + * going from 0x3000 to 0x5fff, but its documentation is full of holes:
> >> + * it is infact documenting registers from 0x3000 to 0x32ff as OTP Data
> >> + * and, as for the others, it documents 0x4053, 0x5e54 and 0x5e59.. and
> >> + * nothing else.
> >> + *
> >> + * On both Raspberry Pi and Xperia XA2 i2c dumps, there is an unknown
> >> + * write sequence that is totally the same between the two, but the sensor
> >> + * seems to work regardless of this being sent.
> >> + * Spirit here is to not send unknown things, especially if they don't seem
> >> + * to do anything... and that's what was done. Also, remember that the auth
> >> + * commands will allow to write to the OTP area, which may actually damage
> >> + * the sensor functionality (for example, factory calibrations may be damaged).
> >> + *
> >> + * The authentication sequence and the unknown one are kept here in case one
> >> + * day they get documented somehow, or any use for them is found.
> >>    */
> >> -static const struct imx219_reg mode_3280x2464_regs[] = {
> >> -    {0x0100, 0x00},
> >> -    {0x30eb, 0x0c},
> >> -    {0x30eb, 0x05},
> >> -    {0x300a, 0xff},
> >> -    {0x300b, 0xff},
> >> -    {0x30eb, 0x05},
> >> -    {0x30eb, 0x09},
> >> -    {0x0114, 0x01},
> >> -    {0x0128, 0x00},
> >> -    {0x012a, 0x18},
> >> -    {0x012b, 0x00},
> >> -    {0x0164, 0x00},
> >> -    {0x0165, 0x00},
> >> -    {0x0166, 0x0c},
> >> -    {0x0167, 0xcf},
> >> -    {0x0168, 0x00},
> >> -    {0x0169, 0x00},
> >> -    {0x016a, 0x09},
> >> -    {0x016b, 0x9f},
> >> -    {0x016c, 0x0c},
> >> -    {0x016d, 0xd0},
> >> -    {0x016e, 0x09},
> >> -    {0x016f, 0xa0},
> >> -    {0x0170, 0x01},
> >> -    {0x0171, 0x01},
> >> -    {0x0174, 0x00},
> >> -    {0x0175, 0x00},
> >> -    {0x0301, 0x05},
> >> -    {0x0303, 0x01},
> >> -    {0x0304, 0x03},
> >> -    {0x0305, 0x03},
> >> -    {0x0306, 0x00},
> >> -    {0x0307, 0x39},
> >> -    {0x030b, 0x01},
> >> -    {0x030c, 0x00},
> >> -    {0x030d, 0x72},
> >> -    {0x0624, 0x0c},
> >> -    {0x0625, 0xd0},
> >> -    {0x0626, 0x09},
> >> -    {0x0627, 0xa0},
> >> -    {0x455e, 0x00},
> >> -    {0x471e, 0x4b},
> >> -    {0x4767, 0x0f},
> >> -    {0x4750, 0x14},
> >> -    {0x4540, 0x00},
> >> -    {0x47b4, 0x14},
> >> -    {0x4713, 0x30},
> >> -    {0x478b, 0x10},
> >> -    {0x478f, 0x10},
> >> -    {0x4793, 0x10},
> >> -    {0x4797, 0x0e},
> >> -    {0x479b, 0x0e},
> >> -    {0x0162, 0x0d},
> >> -    {0x0163, 0x78},
> >> +static const struct imx219_reg __maybe_unused imx219_auth[] = {
> >> +    { 0x30eb, 0x05, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x30eb, 0x0c, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x300a, 0xff, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x300b, 0xff, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x30eb, 0x05, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x30eb, 0x09, IMX219_REG_VALUE_08BIT, false },
> >> +};
> >> +
> >> +static const struct imx219_reg __maybe_unused imx219_unknown_seq[] = {
> >
> > Why are these __maybe_unused?
> >
> >> +    { 0x455E, 0x00, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x471E, 0x4B, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x4767, 0x0F, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x4750, 0x14, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x4540, 0x00, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x47B4, 0x14, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x4713, 0x30, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x478B, 0x10, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x478F, 0x10, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x4793, 0x10, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x4797, 0x0e, IMX219_REG_VALUE_08BIT, false },
> >> +    { 0x479b, 0x0e, IMX219_REG_VALUE_08BIT, false },
> >> +};
> >> +
> >> +static const struct imx219_reg mode_24mhz_regs[] = {
> >> +    { IMX219_REG_EXCK_FREQ_MHZ, (24 << 8), IMX219_REG_VALUE_16BIT, false },
> >> +    { IMX219_REG_DPHY_CTRL, 0, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_VT_PIX_CLK_DIV, 5, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_VT_SYS_CLK_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PREPLLCK_VT_DIV, 3, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PREPLLCK_OP_DIV, 3, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_OP_PIX_CLK_DIV, 10, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_OP_SYS_CLK_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PLL_OP_MULTIPLIER, 84, IMX219_REG_VALUE_16BIT, false },
> >> +};
> >> +
> >> +static const struct imx219_reg mode_24mhz_2lane[] = {
> >> +    { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_LANE_MODE_2LANE,
> >> +                                    IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PLL_VT_MULTIPLIER, 57, IMX219_REG_VALUE_16BIT, false },
> >> +};
> >> +
> >> +static const struct imx219_reg mode_24mhz_4lane[] = {
> >> +    { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_LANE_MODE_4LANE,
> >> +                                    IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PLL_VT_MULTIPLIER, 82, IMX219_REG_VALUE_16BIT, false },
> >> +};
> >> +
> >> +static const struct imx219_reg mode_8mhz_regs[] = {
> >> +    { IMX219_REG_EXCK_FREQ_MHZ, (8 << 8), IMX219_REG_VALUE_16BIT, false },
> >> +    { IMX219_REG_DPHY_CTRL, 0, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_VT_PIX_CLK_DIV, 5, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_VT_SYS_CLK_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PREPLLCK_VT_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PREPLLCK_OP_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_OP_PIX_CLK_DIV, 10, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_OP_SYS_CLK_DIV, 1, IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PLL_OP_MULTIPLIER, 90, IMX219_REG_VALUE_16BIT, false },
> >> +};
> >> +
> >> +static const struct imx219_reg mode_8mhz_2lane[] = {
> >> +    { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_LANE_MODE_2LANE,
> >> +                                    IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PLL_VT_MULTIPLIER, 63, IMX219_REG_VALUE_16BIT, false },
> >>   };
> >>
> >> -static const struct imx219_reg mode_1920_1080_regs[] = {
> >> -    {0x0100, 0x00},
> >> -    {0x30eb, 0x05},
> >> -    {0x30eb, 0x0c},
> >> -    {0x300a, 0xff},
> >> -    {0x300b, 0xff},
> >> -    {0x30eb, 0x05},
> >> -    {0x30eb, 0x09},
> >> -    {0x0114, 0x01},
> >> -    {0x0128, 0x00},
> >> -    {0x012a, 0x18},
> >> -    {0x012b, 0x00},
> >> -    {0x0162, 0x0d},
> >> -    {0x0163, 0x78},
> >> -    {0x0164, 0x02},
> >> -    {0x0165, 0xa8},
> >> -    {0x0166, 0x0a},
> >> -    {0x0167, 0x27},
> >> -    {0x0168, 0x02},
> >> -    {0x0169, 0xb4},
> >> -    {0x016a, 0x06},
> >> -    {0x016b, 0xeb},
> >> -    {0x016c, 0x07},
> >> -    {0x016d, 0x80},
> >> -    {0x016e, 0x04},
> >> -    {0x016f, 0x38},
> >> -    {0x0170, 0x01},
> >> -    {0x0171, 0x01},
> >> -    {0x0174, 0x00},
> >> -    {0x0175, 0x00},
> >> -    {0x0301, 0x05},
> >> -    {0x0303, 0x01},
> >> -    {0x0304, 0x03},
> >> -    {0x0305, 0x03},
> >> -    {0x0306, 0x00},
> >> -    {0x0307, 0x39},
> >> -    {0x030b, 0x01},
> >> -    {0x030c, 0x00},
> >> -    {0x030d, 0x72},
> >> -    {0x0624, 0x07},
> >> -    {0x0625, 0x80},
> >> -    {0x0626, 0x04},
> >> -    {0x0627, 0x38},
> >> -    {0x455e, 0x00},
> >> -    {0x471e, 0x4b},
> >> -    {0x4767, 0x0f},
> >> -    {0x4750, 0x14},
> >> -    {0x4540, 0x00},
> >> -    {0x47b4, 0x14},
> >> -    {0x4713, 0x30},
> >> -    {0x478b, 0x10},
> >> -    {0x478f, 0x10},
> >> -    {0x4793, 0x10},
> >> -    {0x4797, 0x0e},
> >> -    {0x479b, 0x0e},
> >> +static const struct imx219_reg mode_8mhz_4lane[] = {
> >> +    { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_LANE_MODE_4LANE,
> >> +                                    IMX219_REG_VALUE_08BIT, false },
> >> +    { IMX219_REG_PLL_VT_MULTIPLIER, 88, IMX219_REG_VALUE_16BIT, false },
> >>   };
> >>
> >> -static const struct imx219_reg mode_1640_1232_regs[] = {
> >> -    {0x0100, 0x00},
> >> -    {0x30eb, 0x0c},
> >> -    {0x30eb, 0x05},
> >> -    {0x300a, 0xff},
> >> -    {0x300b, 0xff},
> >> -    {0x30eb, 0x05},
> >> -    {0x30eb, 0x09},
> >> -    {0x0114, 0x01},
> >> -    {0x0128, 0x00},
> >> -    {0x012a, 0x18},
> >> -    {0x012b, 0x00},
> >> -    {0x0164, 0x00},
> >> -    {0x0165, 0x00},
> >> -    {0x0166, 0x0c},
> >> -    {0x0167, 0xcf},
> >> -    {0x0168, 0x00},
> >> -    {0x0169, 0x00},
> >> -    {0x016a, 0x09},
> >> -    {0x016b, 0x9f},
> >> -    {0x016c, 0x06},
> >> -    {0x016d, 0x68},
> >> -    {0x016e, 0x04},
> >> -    {0x016f, 0xd0},
> >> -    {0x0170, 0x01},
> >> -    {0x0171, 0x01},
> >> -    {0x0174, 0x01},
> >> -    {0x0175, 0x01},
> >> -    {0x0301, 0x05},
> >> -    {0x0303, 0x01},
> >> -    {0x0304, 0x03},
> >> -    {0x0305, 0x03},
> >> -    {0x0306, 0x00},
> >> -    {0x0307, 0x39},
> >> -    {0x030b, 0x01},
> >> -    {0x030c, 0x00},
> >> -    {0x030d, 0x72},
> >> -    {0x0624, 0x06},
> >> -    {0x0625, 0x68},
> >> -    {0x0626, 0x04},
> >> -    {0x0627, 0xd0},
> >> -    {0x455e, 0x00},
> >> -    {0x471e, 0x4b},
> >> -    {0x4767, 0x0f},
> >> -    {0x4750, 0x14},
> >> -    {0x4540, 0x00},
> >> -    {0x47b4, 0x14},
> >> -    {0x4713, 0x30},
> >> -    {0x478b, 0x10},
> >> -    {0x478f, 0x10},
> >> -    {0x4793, 0x10},
> >> -    {0x4797, 0x0e},
> >> -    {0x479b, 0x0e},
> >> -    {0x0162, 0x0d},
> >> -    {0x0163, 0x78},
> >> +/* Note: Never forget to select BANK OFFSET when using these modes */
> >> +static const struct imx219_reg mode_3280x2464[] = {
> >> +    /* MAX: 4-Lane @ 30FPS - 2-Lane @ 15FPS */
> >> +    { IMX219_REG_FRAME_LEN_LINES, 2691, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_START, 0, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_END, 3279, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_START, 0, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_END, 2463, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_OUTPUT_SIZE, 3280, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_OUTPUT_SIZE, 2464, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_H, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_V, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
> >>   };
> >>
> >> -static const struct imx219_reg mode_640_480_regs[] = {
> >> -    {0x0100, 0x00},
> >> -    {0x30eb, 0x05},
> >> -    {0x30eb, 0x0c},
> >> -    {0x300a, 0xff},
> >> -    {0x300b, 0xff},
> >> -    {0x30eb, 0x05},
> >> -    {0x30eb, 0x09},
> >> -    {0x0114, 0x01},
> >> -    {0x0128, 0x00},
> >> -    {0x012a, 0x18},
> >> -    {0x012b, 0x00},
> >> -    {0x0162, 0x0d},
> >> -    {0x0163, 0x78},
> >> -    {0x0164, 0x03},
> >> -    {0x0165, 0xe8},
> >> -    {0x0166, 0x08},
> >> -    {0x0167, 0xe7},
> >> -    {0x0168, 0x02},
> >> -    {0x0169, 0xf0},
> >> -    {0x016a, 0x06},
> >> -    {0x016b, 0xaf},
> >> -    {0x016c, 0x02},
> >> -    {0x016d, 0x80},
> >> -    {0x016e, 0x01},
> >> -    {0x016f, 0xe0},
> >> -    {0x0170, 0x01},
> >> -    {0x0171, 0x01},
> >> -    {0x0174, 0x03},
> >> -    {0x0175, 0x03},
> >> -    {0x0301, 0x05},
> >> -    {0x0303, 0x01},
> >> -    {0x0304, 0x03},
> >> -    {0x0305, 0x03},
> >> -    {0x0306, 0x00},
> >> -    {0x0307, 0x39},
> >> -    {0x030b, 0x01},
> >> -    {0x030c, 0x00},
> >> -    {0x030d, 0x72},
> >> -    {0x0624, 0x06},
> >> -    {0x0625, 0x68},
> >> -    {0x0626, 0x04},
> >> -    {0x0627, 0xd0},
> >> -    {0x455e, 0x00},
> >> -    {0x471e, 0x4b},
> >> -    {0x4767, 0x0f},
> >> -    {0x4750, 0x14},
> >> -    {0x4540, 0x00},
> >> -    {0x47b4, 0x14},
> >> -    {0x4713, 0x30},
> >> -    {0x478b, 0x10},
> >> -    {0x478f, 0x10},
> >> -    {0x4793, 0x10},
> >> -    {0x4797, 0x0e},
> >> -    {0x479b, 0x0e},
> >> +static const struct imx219_reg mode_1920x1080_cropped_60fps[] = {
> >> +    { IMX219_REG_FRAME_LEN_LINES, 1237, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_START, 680, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_END, 2599, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_START, 692, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_END, 1771, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_OUTPUT_SIZE, 1920, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_OUTPUT_SIZE, 1080, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_H, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_V, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
> >> +};
> >> +
> >> +static const struct imx219_reg mode_1280x720_cropped_120fps[] = {
> >> +    /* Recommended coarse integration time value: 846 */
> >> +    { IMX219_REG_FRAME_LEN_LINES, 850, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_START, 1000, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_END, 2280, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_START, 872, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_END, 1592, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_OUTPUT_SIZE, 1280, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_OUTPUT_SIZE, 720, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_H, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_V, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
> >> +};
> >> +
> >> +static const struct imx219_reg mode_640x480_x2_analog_200fps[] = {
> >> +    /* Recommended coarse integration time value: 477 */
> >> +    { IMX219_REG_FRAME_LEN_LINES, 481, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_START, 1000, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_END, 2280, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_START, 752, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_END, 1712, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_OUTPUT_SIZE, 640, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_OUTPUT_SIZE, 480, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_H, 3, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_V, 3, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
> >> +};
> >> +
> >> +static const struct imx219_reg mode_640x80_x2_analog_1000fps[] = {
> >> +    /* Recommended coarse integration time value: 92 */
> >> +    { IMX219_REG_FRAME_LEN_LINES, 481, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_LINE_LEN_PCK, 3448, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_START, 1320, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ADDR_END, 2600, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_START, 990, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_ADDR_END, 1561, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_OUTPUT_SIZE, 640, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_Y_OUTPUT_SIZE, 80, IMX219_REG_VALUE_16BIT, true },
> >> +    { IMX219_REG_X_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_Y_ODD_INC, 1, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_H, 3, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_MODE_V, 3, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_H, 0, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_BINNING_CAL_V, 0, IMX219_REG_VALUE_08BIT, true },
> >>   };
> >>
> >>   static const struct imx219_reg raw8_framefmt_regs[] = {
> >> -    {0x018c, 0x08},
> >> -    {0x018d, 0x08},
> >> -    {0x0309, 0x08},
> >> +    { IMX219_REG_CSI_DATA_FORMAT_HI, 8, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_CSI_DATA_FORMAT_LO, 8, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_OP_PIX_CLK_DIV, 8, IMX219_REG_VALUE_08BIT, false },
> >>   };
> >>
> >>   static const struct imx219_reg raw10_framefmt_regs[] = {
> >> -    {0x018c, 0x0a},
> >> -    {0x018d, 0x0a},
> >> -    {0x0309, 0x0a},
> >> +    { IMX219_REG_CSI_DATA_FORMAT_HI, 10, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_CSI_DATA_FORMAT_LO, 10, IMX219_REG_VALUE_08BIT, true },
> >> +    { IMX219_REG_OP_PIX_CLK_DIV, 10, IMX219_REG_VALUE_08BIT, false },
> >>   };
> >>
> >>   static const char * const imx219_test_pattern_menu[] = {
> >> @@ -461,73 +483,98 @@ static const u32 codes[] = {
> >>    * case of DT for regulator-fixed one should define the startup-delay-us
> >>    * property.
> >>    */
> >> -#define IMX219_XCLR_MIN_DELAY_US    6200
> >> +#define IMX219_XCLR_MIN_DELAY_US    7200
> >
> > Why?
> >
>
> Because I forgot to update the comment, that's why you're asking!!!
> ...but you definitely deserve your answer before me updating the
> comment, so here's the gold:
>
> This driver was clearly made with the Raspberry Pi IMX219 camera sensor
> board in mind - and there's nothing wrong with this: the issue here is
> that this board (combined to the SoC on which it was tested) seems to
> require less time to bring up the XCLR compared to the camera module
> that is attached to the Sony Xperia XA2 and Sony Xperia XA2 Ultra
> smartphones.
>
> On these smartphones, it looks like the minimum delay (from my own
> tests) is around 6800uS, but that doesn't work in all of the conditions
> that I've tested (sometimes does, sometimes does not).
> The best *stable* delay that I've found (stable meaning that it always
> worked) was 7000uS so - accounting for eventual other factors (that I
> don't need to explain, as you surely know what I'm talking about, basic
> electronics anyway), I chose to go for sure stability, giving it 200
> more microseconds - reaching 7200uS.
>
> So.. that's why :)

If there is an additional delay required for the regulators to
stabilise on a particular board then that should be accounted for in
the regulator framework.
The last paragraph of the comment above even states this:

 * This delay doesn't account for the power supply startup time. If needed,
 * this should be taken care of via the regulator framework. E.g. in the
 * case of DT for regulator-fixed one should define the startup-delay-us
 * property.

The duration of this delay is lifted straight from the sensor
datasheet so is not open for debate (beyond potential for a very small
optimisation).
Computing the value was explicitly asked for when the original driver
was submitted [1].

We have a similar "slow" response to being enabled for our IMX477
boards. If you look at the DT overlay for that [2] we define
"startup-delay-us" for the regulator to compensate for the slowness of
the board.

  Dave

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20191227122114.23075-3-andrey.konovalov@linaro.org/#114407
[2] https://github.com/raspberrypi/linux/blob/rpi-5.4.y/arch/arm/boot/dts/overlays/imx477-overlay.dts#L79
