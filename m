Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B580460C36
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 02:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376948AbhK2B2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Nov 2021 20:28:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhK2B0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Nov 2021 20:26:08 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F510C061574;
        Sun, 28 Nov 2021 17:22:51 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id t5so65106697edd.0;
        Sun, 28 Nov 2021 17:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2WugqzB+J5SM2Rtu1AZbJ8JL6dAU1EZDnr7Z+hI1Bpg=;
        b=nVbPxULOFKfXYh+G7WbcBs5A6p/AxFpIj43fXP7exgEeqsDR/H3qMn5zEV2f6rn96e
         CYCrV0Ng4jTDcsLRvmAoSBGv8xG8F6EV9y6y7YL7mL+flHWeuNJ9f6f9AJumdg25PU2v
         9KLxVKS9KDmOqvXWJ0adTkHx83HPnPE7BZF1mT3L/MvHtnBLHoKXQBBDDT4nYf5LOERk
         Q300dySX48E0d0/gmA4PSbnA8APCiJy7Epnf5g7kDYifp0lSM2lBiZL0XhSLhm9JgNCZ
         g1UqWRxfGzmfKBiU2FhBG8aIPS2R7vwE8jV9m2BtZNF4d1w+TsSH0eBs4n7DZO4ADR3P
         it4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2WugqzB+J5SM2Rtu1AZbJ8JL6dAU1EZDnr7Z+hI1Bpg=;
        b=tbLJm4Cf8nv+CU1dakKwF2EKYm8hPso+MQXwKMnEFKuSLcIxoKQDQR7/WVy9J9vLMo
         w9q93hUg2YzBfcrA56D7Ovu1tEmCtRL1ebttMvJ6bM6K6VSSVyHuc/rDRCDfB61vHyly
         dxv9q0Pv04Ch7oqXVbGafz3vilfexfOEE24UGdUzd2EciV5aaFlG6CuDkdnvXQiTCQO8
         rp31zMPE1L68AEnQQmwBI6aVN/vepegmKujAO4ccFxQqoC9VDTVemRqvHXNubYOxns++
         npjc0xQzPTMkMC8QwOlEn1LfvGvyDjW9cHrAvI37WSBXusMvxdZtadAdFX6e4HCs18et
         +m7A==
X-Gm-Message-State: AOAM531efU1DjnLU6J0BZfSOMteE2EHv3XykOLSQGxl51OWh6CR2mWoR
        smvALoqhs5fJO0tjBnuAxNdlZy/l+T31WpldoRI=
X-Google-Smtp-Source: ABdhPJwnrfHgQd/tfeBEWdEPtQrPXMjh1vw1CRpwTWw3YbXmoC7e5wjs368se5IEgH9mVDvsz1hEtOuYN15u0i/ehGs=
X-Received: by 2002:aa7:d288:: with SMTP id w8mr30316877edq.404.1638148969734;
 Sun, 28 Nov 2021 17:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
 <20211125155650.630977-4-benjamin.gaignard@collabora.com> <YaC+jkYwouR9Aa0s@eze-laptop>
In-Reply-To: <YaC+jkYwouR9Aa0s@eze-laptop>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 28 Nov 2021 19:22:38 -0600
Message-ID: <CAHCN7xLprYQ7tbbdrg6Foenx8tAVfMopmc2b=c=FYrLgH2d8pg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: hantro: Use syscon instead of 'ctrl' register
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        hverkuil-cisco@xs4all.nl,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 28, 2021 at 6:47 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Benjamin,
>
> On Thu, Nov 25, 2021 at 04:56:49PM +0100, Benjamin Gaignard wrote:
> > In order to be able to share the control hardware block between
> > VPUs use a syscon instead a ioremap it in the driver.
> > To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
> > phandle is not found look at 'ctrl' reg-name.
> > With the method it becomes useless to provide a list of register
> > names so remove it.
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> >
> > Please note that the only purpose of this commit is to allow to test
> > G2 hardware block for IMX8MQ until a proper solution isuing power domain
> > can be found. Do not merge it.
>
> It's been too many months waiting for the BLK-CTRL to be solved.
> Perhaps we can consider merging this approach instead.

If someone wants to send me an imx8mq board, I can attempt to work on
the blk-ctrl.  I ported it to imx8mn, and I have sent an update for
imx8mm.  I just don't have any imx8mq hardware.

adam
>
> Thanks,
> Ezequiel
>
> > ---
> >  drivers/staging/media/hantro/hantro.h       |  5 ++-
> >  drivers/staging/media/hantro/imx8m_vpu_hw.c | 48 +++++++++++++--------
> >  2 files changed, 34 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> > index 7da23f7f207a..616b5a6854cd 100644
> > --- a/drivers/staging/media/hantro/hantro.h
> > +++ b/drivers/staging/media/hantro/hantro.h
> > @@ -13,6 +13,7 @@
> >  #define HANTRO_H_
> >
> >  #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> >  #include <linux/videodev2.h>
> >  #include <linux/wait.h>
> >  #include <linux/clk.h>
> > @@ -174,7 +175,7 @@ hantro_vdev_to_func(struct video_device *vdev)
> >   * @reg_bases:               Mapped addresses of VPU registers.
> >   * @enc_base:                Mapped address of VPU encoder register for convenience.
> >   * @dec_base:                Mapped address of VPU decoder register for convenience.
> > - * @ctrl_base:               Mapped address of VPU control block.
> > + * @ctrl_base:               Regmap of VPU control block.
> >   * @vpu_mutex:               Mutex to synchronize V4L2 calls.
> >   * @irqlock:         Spinlock to synchronize access to data structures
> >   *                   shared with interrupt handlers.
> > @@ -193,7 +194,7 @@ struct hantro_dev {
> >       void __iomem **reg_bases;
> >       void __iomem *enc_base;
> >       void __iomem *dec_base;
> > -     void __iomem *ctrl_base;
> > +     struct regmap *ctrl_base;
> >
> >       struct mutex vpu_mutex; /* video_device lock */
> >       spinlock_t irqlock;
> > diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > index 1a43f6fceef9..d7a63b41eb0e 100644
> > --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> > +#include <linux/mfd/syscon.h>
> >
> >  #include "hantro.h"
> >  #include "hantro_jpeg.h"
> > @@ -25,30 +26,28 @@
> >  #define CTRL_G1_PP_FUSE              0x0c
> >  #define CTRL_G2_DEC_FUSE     0x10
> >
> > +static const struct regmap_config ctrl_regmap_ctrl = {
> > +     .reg_bits = 32,
> > +     .val_bits = 32,
> > +     .reg_stride = 0x14,
> > +};
> > +
> >  static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
> >  {
> > -     u32 val;
> > -
> >       /* Assert */
> > -     val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> > -     val &= ~reset_bits;
> > -     writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> > +     regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET, reset_bits, 0);
> >
> >       udelay(2);
> >
> >       /* Release */
> > -     val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> > -     val |= reset_bits;
> > -     writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> > +     regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET,
> > +                        reset_bits, reset_bits);
> >  }
> >
> >  static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
> >  {
> > -     u32 val;
> > -
> > -     val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> > -     val |= clock_bits;
> > -     writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> > +     regmap_update_bits(vpu->ctrl_base, CTRL_CLOCK_ENABLE,
> > +                        clock_bits, clock_bits);
> >  }
> >
> >  static int imx8mq_runtime_resume(struct hantro_dev *vpu)
> > @@ -65,9 +64,9 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
> >       imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
> >
> >       /* Set values of the fuse registers */
> > -     writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
> > -     writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
> > -     writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
> > +     regmap_write(vpu->ctrl_base, CTRL_G1_DEC_FUSE, 0xffffffff);
> > +     regmap_write(vpu->ctrl_base, CTRL_G1_PP_FUSE, 0xffffffff);
> > +     regmap_write(vpu->ctrl_base, CTRL_G2_DEC_FUSE, 0xffffffff);
> >
> >       clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
> >
> > @@ -211,7 +210,22 @@ static irqreturn_t imx8m_vpu_g2_irq(int irq, void *dev_id)
> >
> >  static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
> >  {
> > -     vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
> > +     struct device_node *np = vpu->dev->of_node;
> > +
> > +     vpu->ctrl_base = syscon_regmap_lookup_by_phandle(np, "nxp,imx8m-vpu-ctrl");
> > +     if (IS_ERR(vpu->ctrl_base)) {
> > +             struct resource *res;
> > +             void __iomem *ctrl;
> > +
> > +             res = platform_get_resource_byname(vpu->pdev, IORESOURCE_MEM, "ctrl");
> > +             ctrl = devm_ioremap_resource(vpu->dev, res);
> > +             if (IS_ERR(ctrl))
> > +                     return PTR_ERR(ctrl);
> > +
> > +             vpu->ctrl_base = devm_regmap_init_mmio(vpu->dev, ctrl, &ctrl_regmap_ctrl);
> > +             if (IS_ERR(vpu->ctrl_base))
> > +                     return PTR_ERR(vpu->ctrl_base);
> > +     }
> >
> >       return 0;
> >  }
> > --
> > 2.30.2
> >
