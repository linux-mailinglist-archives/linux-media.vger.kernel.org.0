Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354D44476AA
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 00:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbhKGXYR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 18:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235164AbhKGXYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 18:24:15 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7931C061570;
        Sun,  7 Nov 2021 15:21:31 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id ee33so55552138edb.8;
        Sun, 07 Nov 2021 15:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WTBhpEahrowQ2ALiN3lDIEDJOWsyFFyMB8PMmXvvAeE=;
        b=HkgOqWZv0C0DRhygxSzbwd/rCaJhsyioUQv53BfYE3oHlGgTy1zXcwkisbZXt+oMUg
         +EqANN7/n8Z5FVdRsvQm1hMCiahTfDIEiqlF4NAdZABtLVdBUyOlc7WgRx7LnPd62+B2
         BFuVdgzjKyZL0bzdDNqUlsdOjwXbtWzCiaIOuiT/BLogIjqlmXqhMN/JNjSqVkm05+hN
         yhv73OLAElPDKIHfM8MWiS0c7GYYra7wnbEHR2xFP4e8ohKXS5YnaYDOp6/TuhMTjtNe
         W2W1O8OqHc75/82f/bUU6wynxWo/cbeHxhz6jlZWpsBVyipSiEkUtTl49vaC1Tsm0rFU
         7awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WTBhpEahrowQ2ALiN3lDIEDJOWsyFFyMB8PMmXvvAeE=;
        b=sMJmEccgslzvF+r2ZdvDHYxD4D1noquqG5/iYiILjIj5Vk4SICwmi7dA90ef+Pz/ZN
         Aom3zc8xQWtO4oeJffp9PXPUdUeSuJD0eUCt8+uJfREKqZ4woHmOZC4tCFgKWU5g/1Cd
         FVrop8QAcEgzm/puuEUtniGFdxoNwghsdwhym+f7Da992PbOzZKK3aUHFG1rDzwrtvL0
         f6sUnkddR9azXtRle1WsimcvzZjl5XKeqV4qSJMURuG+/reaEOHvid4+1RlZdLg9kkoy
         emOOIFRQO1buUiJQogxhz8dJCOWTpYPB8Nnc02VmlNn8VoHqVCTSOG6XomxAqZQ0+oFw
         z4GA==
X-Gm-Message-State: AOAM533ENYVGPe93dm9K27zD544NgvPsPjI+uRPM4pLp0VaLRSpv6YVf
        kzHXk8LDU4V2bmlEongDvpjcWg136SwuUsSG5av3zR7d
X-Google-Smtp-Source: ABdhPJzeXuWd/+oKqkEM8Fm9c1no/YXBkjFWIOBrPvS2fO6XwWF/9C+38d3ftpq6Jm/S3kIQv5cEJOhH/8Me8fy2avw=
X-Received: by 2002:a17:906:1112:: with SMTP id h18mr23416237eja.50.1636327290054;
 Sun, 07 Nov 2021 15:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20211106183802.893285-1-aford173@gmail.com> <20211106183802.893285-5-aford173@gmail.com>
In-Reply-To: <20211106183802.893285-5-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 7 Nov 2021 17:21:19 -0600
Message-ID: <CAHCN7xKOpc9p+zk1DgAZV5kYh+GHMT6pr-sQ87So6tQPHnp22w@mail.gmail.com>
Subject: Re: [RFC 4/5] media: hantro: Add H1 encoder support on i.MX8M Mini
To:     linux-media <linux-media@vger.kernel.org>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Marek Vasut <marek.vasut@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 6, 2021 at 1:38 PM Adam Ford <aford173@gmail.com> wrote:
>
> The i.MX8M Mini has supports the Hantro H1 encoder, so
> enable it using the same supported formats as other devices
> using the H1 encoder.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---

I randomly checked one or two registers when I first attempted this
patch, but it does appear that the H1 is likely not to work yet due to
too many differences.  It appears that patches 4 and 5 will likely
have to be dropped until they can be investigated and reworked.

I am still running into some power domain issues for the rest of the
series where I cannot read the regmaps for the vpu blk-ctrl register
even when H1 is disabled.

adam


>  drivers/staging/media/hantro/hantro_drv.c   |  1 +
>  drivers/staging/media/hantro/hantro_hw.h    |  1 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 83 +++++++++++++++++++++
>  3 files changed, 85 insertions(+)
>
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 2aa1c520be50..29e8dc52c2e4 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -594,6 +594,7 @@ static const struct of_device_id of_hantro_match[] = {
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>         { .compatible = "nxp,imx8mm-vpu", .data = &imx8mm_vpu_variant, },
>         { .compatible = "nxp,imx8mm-vpu-g2", .data = &imx8mm_vpu_g2_variant },
> +       { .compatible = "nxp,imx8mm-vpu-h1", .data = &imx8mm_vpu_h1_variant },
>         { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>         { .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
>  #endif
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index c276ecd57066..9f6ae5bf13ee 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -212,6 +212,7 @@ enum hantro_enc_fmt {
>  };
>
>  extern const struct hantro_variant imx8mm_vpu_g2_variant;
> +extern const struct hantro_variant imx8mm_vpu_h1_variant;
>  extern const struct hantro_variant imx8mm_vpu_variant;
>  extern const struct hantro_variant imx8mq_vpu_g2_variant;
>  extern const struct hantro_variant imx8mq_vpu_variant;
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index c819609d14d1..69760f88efa5 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -12,6 +12,7 @@
>  #include "hantro_jpeg.h"
>  #include "hantro_g1_regs.h"
>  #include "hantro_g2_regs.h"
> +#include "hantro_h1_regs.h"
>
>  #define CTRL_SOFT_RESET                0x00
>  #define RESET_G1               BIT(1)
> @@ -151,6 +152,43 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
>         },
>  };
>
> +static const struct hantro_fmt imx8m_vpu_h1_enc_fmts[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_YUV420M,
> +               .codec_mode = HANTRO_MODE_NONE,
> +               .enc_fmt = HANTRO_VPU_ENC_FMT_YUV420P,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_NV12M,
> +               .codec_mode = HANTRO_MODE_NONE,
> +               .enc_fmt = HANTRO_VPU_ENC_FMT_YUV420SP,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_YUYV,
> +               .codec_mode = HANTRO_MODE_NONE,
> +               .enc_fmt = HANTRO_VPU_ENC_FMT_YUYV422,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_UYVY,
> +               .codec_mode = HANTRO_MODE_NONE,
> +               .enc_fmt = HANTRO_VPU_ENC_FMT_UYVY422,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_JPEG,
> +               .codec_mode = HANTRO_MODE_JPEG_ENC,
> +               .max_depth = 2,
> +               .header_size = JPEG_HEADER_SIZE,
> +               .frmsize = {
> +                       .min_width = 96,
> +                       .max_width = 8192,
> +                       .step_width = MB_DIM,
> +                       .min_height = 32,
> +                       .max_height = 8192,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +};
> +
>  static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
>  {
>         struct hantro_dev *vpu = dev_id;
> @@ -187,6 +225,24 @@ static irqreturn_t imx8m_vpu_g2_irq(int irq, void *dev_id)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t imx8m_vpu_h1_irq(int irq, void *dev_id)
> +{
> +       struct hantro_dev *vpu = dev_id;
> +       enum vb2_buffer_state state;
> +       u32 status;
> +
> +       status = vepu_read(vpu, H1_REG_INTERRUPT);
> +       state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
> +               VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +
> +       vepu_write(vpu, 0, H1_REG_INTERRUPT);
> +       vepu_write(vpu, 0, H1_REG_AXI_CTRL);
> +
> +       hantro_irq_done(vpu, state);
> +
> +       return IRQ_HANDLED;
> +}
> +
>  static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
>  {
>         vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
> @@ -268,6 +324,15 @@ static const struct hantro_codec_ops imx8mm_vpu_g2_codec_ops[] = {
>         },
>  };
>
> +static const struct hantro_codec_ops imx8mm_vpu_h1_codec_ops[] = {
> +       [HANTRO_MODE_JPEG_ENC] = {
> +               .run = hantro_h1_jpeg_enc_run,
> +               .init = hantro_jpeg_enc_init,
> +               .done = hantro_jpeg_enc_done,
> +               .exit = hantro_jpeg_enc_exit,
> +       },
> +};
> +
>  /*
>   * VPU variants.
>   */
> @@ -280,6 +345,10 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
>         { "g2", imx8m_vpu_g2_irq },
>  };
>
> +static const struct hantro_irq imx8mq_h1_irqs[] = {
> +       { "h1", imx8m_vpu_h1_irq },
> +};
> +
>  static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
>  static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
>
> @@ -287,6 +356,8 @@ static const char * const imx8mm_g1_clk_names[] = { "g1", "bus" };
>  static const char * const imx8mm_g1_reg_names[] = { "g1" };
>  static const char * const imx8mm_g2_clk_names[] = { "g2", "bus" };
>  static const char * const imx8mm_g2_reg_names[] = { "g2" };
> +static const char * const imx8mm_h1_clk_names[] = { "h1", "bus" };
> +static const char * const imx8mm_h1_reg_names[] = { "h1" };
>
>  const struct hantro_variant imx8mq_vpu_variant = {
>         .dec_fmts = imx8m_vpu_dec_fmts,
> @@ -349,3 +420,15 @@ const struct hantro_variant imx8mm_vpu_g2_variant = {
>         .clk_names = imx8mm_g2_clk_names,
>         .num_clocks = ARRAY_SIZE(imx8mm_g2_reg_names),
>  };
> +
> +const struct hantro_variant imx8mm_vpu_h1_variant = {
> +       .enc_offset = 0x0,
> +       .enc_fmts = imx8m_vpu_h1_enc_fmts,
> +       .num_enc_fmts = ARRAY_SIZE(imx8m_vpu_h1_enc_fmts),
> +       .codec = HANTRO_JPEG_ENCODER,
> +       .codec_ops = imx8mm_vpu_h1_codec_ops,
> +       .irqs = imx8mq_h1_irqs,
> +       .num_irqs = ARRAY_SIZE(imx8mq_h1_irqs),
> +       .clk_names = imx8mm_h1_clk_names,
> +       .num_clocks = ARRAY_SIZE(imx8mm_h1_clk_names)
> +};
> --
> 2.32.0
>
