Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6223B28E141
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 15:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgJNN0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 09:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgJNN0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 09:26:46 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739B4C061755
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 06:26:46 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id l15so2658362ybp.2
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tebraWFNq5reKSU5gdA5eDMfQ9aOLigIFx4s922kvnY=;
        b=g460us7zA2yx8nhsdqhfNuKBcwH6DD9uRv0rt/qwRMgcjVKCN6fsOSFgUt5TKSNbi7
         AZMCGiZkfDIBVSHD+pAzIJXqKDul/Est7GG5oSfYv3s8smrnoW3YoUeZhqOsmuLJ1nUT
         DqsvjGj2woO6242BSdW1sRqFNTnWc11BIPcRS2kFzocPulvdRSmMn2RYORWsV3C1/WiP
         zZbsca03E11Z+GiWn58bNDNCdP66kChqTaytdEB5+gi1TqVEHFRV/B47tLfmNDmYNdPh
         PDzd5NgKaleuVR3gJX7dFhrwLq1ra6jLfjjjfivmhawO8h2yjn26dRnY4yccaN78wUdq
         NSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tebraWFNq5reKSU5gdA5eDMfQ9aOLigIFx4s922kvnY=;
        b=Djn21ywKRsg0yAG5k0dtc2lEandFuZN4xzgYa0iPLSBGMOF8I7aeS8zBHQap2jVv53
         n1jY8Ie6GVjgo+wz4Wy3LmuorijOCYtVlJ9pjnOqRci4swiIkNKOWV0OgFvH6pcHjpg4
         p93yLiCBz8Or8ZunzvOiP+H3yBTWZLTV/09eV23u611mXDr0DTf17rfnSk3yKTAKxT8o
         Ge4T++l/1GQfE43TTV57EP4KhsVuzsK0YtxFGw6KdiWXaVS9Xn6aeCA8mejPDlxa4fSN
         txVaebQQcGBJZkv5+dsQlhut0dNXPuLqkbcPaMpf0dfO+5V5bAHC4POAOmcbUGZRCie1
         OrfA==
X-Gm-Message-State: AOAM533Xdz3Xfg+mc6LtnOvFsL+re3zFhrBcbDT6mocYIYMYmgBjKjff
        OIUO9JHeniVGp2mLbTF+6A+OKqgL1A1kK6Kmf9s=
X-Google-Smtp-Source: ABdhPJz6KW9GAcAORetS5XIFYRYlrQ8vOAYgPpOgbX5IlG+qswqhmE+9O9XwAmO3giln6VSWAc/ew91ZHKlQKqe07hQ=
X-Received: by 2002:a25:d8d1:: with SMTP id p200mr7183622ybg.76.1602682005707;
 Wed, 14 Oct 2020 06:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <1602579743-10286-1-git-send-email-hugues.fruchet@st.com>
In-Reply-To: <1602579743-10286-1-git-send-email-hugues.fruchet@st.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 14 Oct 2020 14:26:19 +0100
Message-ID: <CA+V-a8sDOBCYDkH+ty1SuoaOyhU-PFH8yEiY5tq2=4-M_xrf1Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: ov5640: fix support of BT656 bus mode
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alain Volmat <alain.volmat@st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

Thank you for the patch.

On Tue, Oct 13, 2020 at 1:01 PM Hugues Fruchet <hugues.fruchet@st.com> wrote:
>
> Fix PCLK polarity not being taken into account.
> Add comments about BT656 register control.
> Remove useless ov5640_set_stream_bt656() function.
> Refine comments about MIPI IO register control.
>
> Fixes: 4039b03720f7 ("media: i2c: ov5640: Add support for BT656 mode")
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
> version 3:
>   - reformat code as per Jacopo's comments
> version 2:
>   - keep reset to default without error check at power off
>
>  drivers/media/i2c/ov5640.c | 82 +++++++++++++++++++++++++---------------------
>  1 file changed, 45 insertions(+), 37 deletions(-)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8d0254d..8f0812e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1216,20 +1216,6 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>                               BIT(1), on ? 0 : BIT(1));
>  }
>
> -static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> -{
> -       int ret;
> -
> -       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> -                              on ? 0x1 : 0x00);
> -       if (ret)
> -               return ret;
> -
> -       return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> -                               OV5640_REG_SYS_CTRL0_SW_PWUP :
> -                               OV5640_REG_SYS_CTRL0_SW_PWDN);
> -}
> -
>  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  {
>         return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> @@ -1994,13 +1980,13 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>  {
>         unsigned int flags = sensor->ep.bus.parallel.flags;
> -       u8 pclk_pol = 0;
> -       u8 hsync_pol = 0;
> -       u8 vsync_pol = 0;
> +       bool bt656 = sensor->ep.bus_type == V4L2_MBUS_BT656;
> +       u8 polarities = 0;
>         int ret;
>
>         if (!on) {
>                 /* Reset settings to their default values. */
> +               ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00, 0x00);
>                 ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
>                 ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
>                 ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
> @@ -2024,7 +2010,35 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>          * - VSYNC:     active high
>          * - HREF:      active low
>          * - PCLK:      active low
> +        *
> +        * VSYNC & HREF are not configured if BT656 bus mode is selected
>          */
> +
> +       /*
> +        * BT656 embedded synchronization configuration
> +        *
> +        * CCIR656 CTRL00
> +        * - [7]:       SYNC code selection (0: auto generate sync code,
> +        *              1: sync code from regs 0x4732-0x4735)
> +        * - [6]:       f value in CCIR656 SYNC code when fixed f value
> +        * - [5]:       Fixed f value
> +        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
> +        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
> +        * - [1]:       Clip data disable
> +        * - [0]:       CCIR656 mode enable
> +        *
> +        * Default CCIR656 SAV/EAV mode with default codes
> +        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> +        * - CCIR656 mode enable
> +        * - auto generation of sync codes
> +        * - blank toggle data 1'h040/1'h200
> +        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
> +        */
> +       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> +                              bt656 ? 0x01 : 0x00);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * configure parallel port control lines polarity
>          *
> @@ -2035,29 +2049,26 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>          *              datasheet and hardware, 0 is active high
>          *              and 1 is active low...)
>          */
> -       if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
> -               if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> -                       pclk_pol = 1;
> +       if (!bt656) {
>                 if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> -                       hsync_pol = 1;
> +                       polarities |= BIT(1);
>                 if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> -                       vsync_pol = 1;
> -
> -               ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> -                                      (pclk_pol << 5) | (hsync_pol << 1) |
> -                                      vsync_pol);
> -
> -               if (ret)
> -                       return ret;
> +                       polarities |= BIT(0);
>         }
> +       if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> +               polarities |= BIT(5);
> +
> +       ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, polarities);
> +       if (ret)
> +               return ret;
>
>         /*
> -        * powerdown MIPI TX/RX PHY & disable MIPI
> +        * powerdown MIPI TX/RX PHY & enable DVP
>          *
>          * MIPI CONTROL 00
> -        * 4:    PWDN PHY TX
> -        * 3:    PWDN PHY RX
> -        * 2:    MIPI enable
> +        * [4] = 1      : Power down MIPI HS Tx
> +        * [3] = 1      : Power down MIPI LS Rx
> +        * [2] = 0      : DVP enable (MIPI disable)
>          */
>         ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
>         if (ret)
> @@ -2074,8 +2085,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>          * - [3:0]:     D[9:6] output enable
>          */
>         ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
> -                              sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
> -                              0x7f : 0x1f);
> +                              bt656 ? 0x1f : 0x7f);
>         if (ret)
>                 return ret;
>
> @@ -2925,8 +2935,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>
>                 if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
>                         ret = ov5640_set_stream_mipi(sensor, enable);
> -               else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
> -                       ret = ov5640_set_stream_bt656(sensor, enable);
>                 else
>                         ret = ov5640_set_stream_dvp(sensor, enable);
>
> --
> 2.7.4
>
