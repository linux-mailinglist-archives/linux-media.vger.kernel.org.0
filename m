Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB64303DFD
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 14:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392661AbhAZNCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 08:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391769AbhAZNCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 08:02:06 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02660C0611C2
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 05:01:24 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id u14so2376676wml.4
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 05:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jQcCABBC17KmUAuXZo/7BHi5IQnnHongxBg4EuG4t3M=;
        b=ENvx/iua50dPt58+eNmVO50QUi/SXoqwTbAA5pJ7ByKjuAr2UdPD3ZfOOqfb0KVfiV
         KaScskpmF5l/0Mn4dPLoblMLtaCbF0pXWm23GpeD60kCMc106bxTN4dV3kiJ3xgjqiQh
         i9Xc5DwoDIbf+4l57/3zyhvTi51I0p1LLKL7/jJvym2lq74TYcTJ2yyUI6TltKwMiS1x
         HTHTJ+GkmIZ+ewqLshGC+FeGzjNFZHZVH6JY1mtC20LQrckUFP+W3yv94B4HWFecfoHb
         IMHVNnbcmjHg6nr9BvdVvtervE7KfgywPo5JkBN+89ja1fTCcp+F2S2zteJnu+wxkoao
         ZhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jQcCABBC17KmUAuXZo/7BHi5IQnnHongxBg4EuG4t3M=;
        b=PriWmdAfKIm628n+1OmAwiAT78a87UhhveQcmBr8t1Iy8dpsHK9Ykge1X/Mplnrr6R
         F8O6Dity7ibBEgpFSiReYgo5vmtZpwdSNcSIbsxxYQib9+95jJnBLiydtWGGLjjgjsMC
         U9J9wyIzmz7lvIQaP24cuITey3Oj8DGgpljOWNsJLAA8y03wZ7wmFtSf4og3QuU94k1b
         T/yh86vz8phG0uxIKELBwi1ZHL4jcb07mPoj83Q2ex1uw3+piPWpjU3RvqCheF5L1210
         uSTB43NkQ8Ipq+mAaS0y0m07hZHmmxaKIoByQXUdOd5pOu8ENuBPlLLFrAELW2kuO5MD
         zNMA==
X-Gm-Message-State: AOAM532UDi0s7u+7mG7WcmC8bOyWfjBHv4VZVTecZJg0MpS7sz0jlTfF
        m7IM588/TrqThgItnMNutbLkX3SSKexJyhPdKwGvlix4vxFwwg==
X-Google-Smtp-Source: ABdhPJx3hN3dZ1xidgjf1Yv1njehKBHPzWVi6WvH91KkJXQf0bGe7T55AITysNAZ6kUy9DAcxf7tCLbFwiP6fcCV334=
X-Received: by 2002:a7b:cbd7:: with SMTP id n23mr4609756wmi.116.1611666082750;
 Tue, 26 Jan 2021 05:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20210126074934.26980-1-andrey.konovalov@linaro.org>
In-Reply-To: <20210126074934.26980-1-andrey.konovalov@linaro.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 26 Jan 2021 13:01:08 +0000
Message-ID: <CAPY8ntBmVoe_dMKhd7imcQYRcdJLn4PG3rXzZvGBRVbeCjiL0A@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Implement V4L2_CID_LINK_FREQ control
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey

On Tue, 26 Jan 2021 at 07:50, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> This control is needed for imx219 driver, as the link frequency
> is independent from the pixel rate in this case, and can't be
> calculated from the pixel rate.
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/i2c/imx219.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 92a8d52776b8..6e3382b85a90 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -390,6 +390,10 @@ static const struct imx219_reg raw10_framefmt_regs[] = {
>         {0x0309, 0x0a},
>  };
>
> +static const s64 imx219_link_freq_menu[] = {
> +       IMX219_DEFAULT_LINK_FREQ,

Link frequency is one of the parameters that is largely irrelevant on
the Pi, so I've partially ignored it.

Is the link frequency really the same for all modes? Even 8 bit vs 10
bit readout?

The pixel rate is constant at 182.4Mpix/s for all modes.
Switching to 8 bit changes register 0x0309 (op_pix_clk_div) from 10 to 8.
Figure 43 "Clock System Block Diagram" in the datasheet I have says
this reduces the divider to the FIFO between the pipeline and MIPI. As
we haven't changed PLL2 or Pre-div2 I'd expect the link frequency to
stay the same, but that leaves me confused over that FIFO clock as
it'll go UP in frequency. I can't quite see how that works, but it
clearly does.

Both 8 and 10 bit modes do read out at the same frame / pixel rate,
therefore that bit is correct, but that leaves me puzzling over link
frequency. I have no information on how big that FIFO is, or how it's
clocked on input and output.

Simplest option is that as I need to go into the office in the next
day or so I'll pop into the lab and measure it in each mode.

Otherwise I have no issues with the implementation of the patch.

  Dave

> +};
> +
>  static const char * const imx219_test_pattern_menu[] = {
>         "Disabled",
>         "Color Bars",
> @@ -547,6 +551,7 @@ struct imx219 {
>         struct v4l2_ctrl_handler ctrl_handler;
>         /* V4L2 Controls */
>         struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *link_freq;
>         struct v4l2_ctrl *exposure;
>         struct v4l2_ctrl *vflip;
>         struct v4l2_ctrl *hflip;
> @@ -1269,7 +1274,7 @@ static int imx219_init_controls(struct imx219 *imx219)
>         int i, ret;
>
>         ctrl_hdlr = &imx219->ctrl_handler;
> -       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>         if (ret)
>                 return ret;
>
> @@ -1283,6 +1288,14 @@ static int imx219_init_controls(struct imx219 *imx219)
>                                                IMX219_PIXEL_RATE, 1,
>                                                IMX219_PIXEL_RATE);
>
> +       imx219->link_freq =
> +               v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
> +                                      V4L2_CID_LINK_FREQ,
> +                                      ARRAY_SIZE(imx219_link_freq_menu) - 1, 0,
> +                                      imx219_link_freq_menu);
> +       if (imx219->link_freq)
> +               imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>         /* Initial vblank/hblank/exposure parameters based on current mode */
>         imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>                                            V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
> --
> 2.17.1
>
