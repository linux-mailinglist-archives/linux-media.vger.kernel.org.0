Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D878E432BD4
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 04:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhJSCcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 22:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhJSCcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 22:32:50 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B324C06161C;
        Mon, 18 Oct 2021 19:30:38 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id a8so16926984ilj.10;
        Mon, 18 Oct 2021 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nCwuUr5pAdfay/KdZ4f9hTVYfYbpLZ7R3+OaHbG1qmw=;
        b=PnkTm31JfSdFy7nLTXYMv5z5h/CWNgpGPqZruaAfo5qTS59XZT9R7Mrnyi70E6nkkC
         qin2YG48pGWgrlFVr7EymqEzb7Ss7HhUVlH2qL06ECu1gEPE4cyHYGjnw3zJNJUGFhi9
         aq2IS5qfmNkk4hFQy833qdiJNWZyiUJJs49NstNRfgK+M+Ge1DIKVM1vpFQe22j6IBGb
         PgwAAa0xhzKripIxt6Ojca4yDRMvICPpgyb9CD7nLwNuNyMfPJ/gMJbSNOBBgV0XtXRZ
         tZ+QgTnFyH6nigJB/HjTPvdKhL6z0IqntUxd/dbpSzZIOgiOZp7JgxSfHVFkf1Pl62Kn
         4z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nCwuUr5pAdfay/KdZ4f9hTVYfYbpLZ7R3+OaHbG1qmw=;
        b=lrxnPRPoa/BXXgf9xJQoGOMTKVh5y6PY08H3IzGdyGNW5lr9oBg3mfbGncYMrKY9M0
         QuAOzuIdL/VELV8C7om0axV7ifaTaHheA4FiEH7r3VmP1KPSFgyi+P0xomJMSD51w/Nz
         YS5NAVNcZ8zaN8eAM6ZIoZh43TyrhwOpz77+DwJxmg51E3SjRMVCr/ET7o5ztS0vJ162
         CLsskQqx/KxUNL5oFNprHSgenws7LtqEiF3ATHmcaMP7ujb0ZkePYcuQbiYPC6x1v9d2
         R/FVCl1+ain02L+nbI239wT8nUMMzFlQBFj1KgTkoKLjB3O9QM2fz+U2kjP8rzrIDAUJ
         1Fbg==
X-Gm-Message-State: AOAM531A4vCL8z175tdmOiBuW2BwNDn5Q8yA3MmB+nPV+M8gdYLrB9Be
        rHTD5PdtcL1u3Wxy+Vw5w1zNDyyKNRng5wVnky4=
X-Google-Smtp-Source: ABdhPJxHl+tgaXBoTKMWp6406v+aM11a0B6mE0L0AYRCJp89aIAltxU9yVD3F0LHbPOzKy1zUAuu2nBUBuGr2YziJQM=
X-Received: by 2002:a05:6e02:1c43:: with SMTP id d3mr17530787ilg.153.1634610637783;
 Mon, 18 Oct 2021 19:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
 <1634533488-25334-11-git-send-email-dillon.minfei@gmail.com>
 <5393e39f-cee8-cbe6-f8fd-203a48b35ed8@xs4all.nl> <CAL9mu0+Ea7eQDetJs8He9RNUDOO3UejQVepVLr_LTYqOYeUrXA@mail.gmail.com>
In-Reply-To: <CAL9mu0+Ea7eQDetJs8He9RNUDOO3UejQVepVLr_LTYqOYeUrXA@mail.gmail.com>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Tue, 19 Oct 2021 10:30:01 +0800
Message-ID: <CAL9mu0JY-9UuJ9QOXrqYFvSE_LhCw7Lhd+UwnXUsoY2vsRD_mA@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] media: stm32-dma2d: STM32 DMA2D driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com,
        Patrice CHOTARD <patrice.chotard@foss.st.com>,
        hugues.fruchet@foss.st.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Mon, 18 Oct 2021 at 18:25, Dillon Min <dillon.minfei@gmail.com> wrote:
>
> Hi Hans
>
> On Mon, 18 Oct 2021 at 17:30, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > On 18/10/2021 07:04, dillon.minfei@gmail.com wrote:
> > > From: Dillon Min <dillon.minfei@gmail.com>
> > >
> > > This V4L2 subdev m2m driver enables Chrom-Art Accelerator unit
> > > of STMicroelectronics STM32 SoC series.
> > >
> > > Currently support r2m, m2m, m2m_pfc functions.
> > > - r2m, Filling a part or the whole of a destination image with a specific
> > >   color.
> > > - m2m, Copying a part or the whole of a source image into a part or the
> > >   whole of a destination.
> > > - m2m_pfc, Copying a part or the whole of a source image into a part or the
> > >   whole of a destination image with a pixel format conversion.
> > >
> > > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > > ---
> > > v5:
> > > - remove useless log from dma2d driver.
> > > - update config VIDEO_STM32_DMA2D description.
> > >
> > >  drivers/media/platform/Kconfig                  |  11 +
> > >  drivers/media/platform/Makefile                 |   1 +
> > >  drivers/media/platform/stm32/Makefile           |   2 +
> > >  drivers/media/platform/stm32/dma2d/dma2d-hw.c   | 143 +++++
> > >  drivers/media/platform/stm32/dma2d/dma2d-regs.h | 113 ++++
> > >  drivers/media/platform/stm32/dma2d/dma2d.c      | 739 ++++++++++++++++++++++++
> > >  drivers/media/platform/stm32/dma2d/dma2d.h      | 135 +++++
> > >  7 files changed, 1144 insertions(+)
> > >  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
> > >  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
> > >  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
> > >  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
> > >
> > > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > > index d9f90084c2f6..0b3bdf56b44e 100644
> > > --- a/drivers/media/platform/Kconfig
> > > +++ b/drivers/media/platform/Kconfig
> > > @@ -476,6 +476,17 @@ config VIDEO_STI_DELTA_DRIVER
> > >
> > >  endif # VIDEO_STI_DELTA
> > >
> > > +config VIDEO_STM32_DMA2D
> > > +     tristate "STM32 Chrom-Art Accelerator (DMA2D)"
> > > +     depends on (VIDEO_DEV && VIDEO_V4L2 && ARCH_STM32) || COMPILE_TEST
> > > +     select VIDEOBUF2_DMA_CONTIG
> > > +     select V4L2_MEM2MEM_DEV
> > > +     help
> > > +       Enables DMA2D hwarware support on stm32.
> > > +
> > > +       The STM32 DMA2D is a memory-to-memory engine for pixel conversion
> > > +       and specialized DMA dedicated to image manipulation.
> > > +
> > >  config VIDEO_RENESAS_FDP1
> > >       tristate "Renesas Fine Display Processor"
> > >       depends on VIDEO_DEV && VIDEO_V4L2
> > > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > > index 73ce083c2fc6..46f1c05bc576 100644
> > > --- a/drivers/media/platform/Makefile
> > > +++ b/drivers/media/platform/Makefile
> > > @@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_ATMEL_ISI)               += atmel/
> > >  obj-$(CONFIG_VIDEO_ATMEL_XISC)               += atmel/
> > >
> > >  obj-$(CONFIG_VIDEO_STM32_DCMI)               += stm32/
> > > +obj-$(CONFIG_VIDEO_STM32_DMA2D)              += stm32/
> > >
> > >  obj-$(CONFIG_VIDEO_MEDIATEK_VPU)     += mtk-vpu/
> > >
> > > diff --git a/drivers/media/platform/stm32/Makefile b/drivers/media/platform/stm32/Makefile
> > > index 48b36db2c2e2..896ef98a73ab 100644
> > > --- a/drivers/media/platform/stm32/Makefile
> > > +++ b/drivers/media/platform/stm32/Makefile
> > > @@ -1,2 +1,4 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >  obj-$(CONFIG_VIDEO_STM32_DCMI) += stm32-dcmi.o
> > > +stm32-dma2d-objs := dma2d/dma2d.o dma2d/dma2d-hw.o
> > > +obj-$(CONFIG_VIDEO_STM32_DMA2D) += stm32-dma2d.o
> > > diff --git a/drivers/media/platform/stm32/dma2d/dma2d-hw.c b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
> > > new file mode 100644
> > > index 000000000000..8c1c664ab13b
> > > --- /dev/null
> > > +++ b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
> > > @@ -0,0 +1,143 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * ST stm32 Chrom-Art - 2D Graphics Accelerator Driver
> > > + *
> > > + * Copyright (c) 2021 Dillon Min
> > > + * Dillon Min, <dillon.minfei@gmail.com>
> > > + *
> > > + * based on s5p-g2d
> > > + *
> > > + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> > > + * Kamil Debski, <k.debski@samsung.com>
> > > + */
> > > +
> > > +#include <linux/io.h>
> > > +
> > > +#include "dma2d.h"
> > > +#include "dma2d-regs.h"
> > > +
> > > +static inline u32 reg_read(void __iomem *base, u32 reg)
> > > +{
> > > +     return readl_relaxed(base + reg);
> > > +}
> > > +
> > > +static inline void reg_write(void __iomem *base, u32 reg, u32 val)
> > > +{
> > > +     writel_relaxed(val, base + reg);
> > > +}
> > > +
> > > +static inline void reg_set(void __iomem *base, u32 reg, u32 mask)
> > > +{
> > > +     reg_write(base, reg, reg_read(base, reg) | mask);
> > > +}
> > > +
> > > +static inline void reg_clear(void __iomem *base, u32 reg, u32 mask)
> > > +{
> > > +     reg_write(base, reg, reg_read(base, reg) & ~mask);
> > > +}
> > > +
> > > +static inline void reg_update_bits(void __iomem *base, u32 reg, u32 mask,
> > > +                                u32 val)
> > > +{
> > > +     reg_write(base, reg, (reg_read(base, reg) & ~mask) | val);
> > > +}
> > > +
> > > +void dma2d_start(struct dma2d_dev *d)
> > > +{
> > > +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_START, CR_START);
> > > +}
> > > +
> > > +u32 dma2d_get_int(struct dma2d_dev *d)
> > > +{
> > > +     return reg_read(d->regs, DMA2D_ISR_REG);
> > > +}
> > > +
> > > +void dma2d_clear_int(struct dma2d_dev *d)
> > > +{
> > > +     u32 isr_val = reg_read(d->regs, DMA2D_ISR_REG);
> > > +
> > > +     reg_write(d->regs, DMA2D_IFCR_REG, isr_val & 0x003f);
> > > +}
> > > +
> > > +void dma2d_config_common(struct dma2d_dev *d, enum dma2d_op_mode op_mode,
> > > +                      u16 width, u16 height)
> > > +{
> > > +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_MODE_MASK,
> > > +                     op_mode << CR_MODE_SHIFT);
> > > +
> > > +     reg_write(d->regs, DMA2D_NLR_REG, (width << 16) | height);
> > > +}
> > > +
> > > +void dma2d_config_out(struct dma2d_dev *d, struct dma2d_frame *frm,
> > > +                   dma_addr_t o_addr)
> > > +{
> > > +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_CEIE, CR_CEIE);
> > > +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_CTCIE, CR_CTCIE);
> > > +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_CAEIE, CR_CAEIE);
> > > +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_TCIE, CR_TCIE);
> > > +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_TEIE, CR_TEIE);
> > > +
> > > +     if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
> > > +         frm->fmt->cmode <= CM_MODE_ARGB4444)
> > > +             reg_update_bits(d->regs, DMA2D_OPFCCR_REG, OPFCCR_CM_MASK,
> > > +                             frm->fmt->cmode);
> > > +
> > > +     reg_write(d->regs, DMA2D_OMAR_REG, o_addr);
> > > +
> > > +     reg_write(d->regs, DMA2D_OCOLR_REG,
> > > +               (frm->a_rgb[3] << 24) |
> > > +               (frm->a_rgb[2] << 16) |
> > > +               (frm->a_rgb[1] << 8) |
> > > +               frm->a_rgb[0]);
> > > +
> > > +     reg_update_bits(d->regs, DMA2D_OOR_REG, OOR_LO_MASK,
> > > +                     frm->line_offset & 0x3fff);
> > > +}
> > > +
> > > +void dma2d_config_fg(struct dma2d_dev *d, struct dma2d_frame *frm,
> > > +                  dma_addr_t f_addr)
> > > +{
> > > +     reg_write(d->regs, DMA2D_FGMAR_REG, f_addr);
> > > +     reg_update_bits(d->regs, DMA2D_FGOR_REG, FGOR_LO_MASK,
> > > +                     frm->line_offset);
> > > +
> > > +     if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
> > > +         frm->fmt->cmode <= CM_MODE_A4)
> > > +             reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_CM_MASK,
> > > +                             frm->fmt->cmode);
> > > +
> > > +     reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_AM_MASK,
> > > +                     (frm->a_mode << 16) & 0x03);
> > > +
> > > +     reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_ALPHA_MASK,
> > > +                     frm->a_rgb[3] << 24);
> > > +
> > > +     reg_write(d->regs, DMA2D_FGCOLR_REG,
> > > +               (frm->a_rgb[2] << 16) |
> > > +               (frm->a_rgb[1] << 8) |
> > > +               frm->a_rgb[0]);
> > > +}
> > > +
> > > +void dma2d_config_bg(struct dma2d_dev *d, struct dma2d_frame *frm,
> > > +                  dma_addr_t b_addr)
> > > +{
> > > +     reg_write(d->regs, DMA2D_BGMAR_REG, b_addr);
> > > +     reg_update_bits(d->regs, DMA2D_BGOR_REG, BGOR_LO_MASK,
> > > +                     frm->line_offset);
> > > +
> > > +     if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
> > > +         frm->fmt->cmode <= CM_MODE_A4)
> > > +             reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_CM_MASK,
> > > +                             frm->fmt->cmode);
> > > +
> > > +     reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_AM_MASK,
> > > +                     (frm->a_mode << 16) & 0x03);
> > > +
> > > +     reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_ALPHA_MASK,
> > > +                     frm->a_rgb[3] << 24);
> > > +
> > > +     reg_write(d->regs, DMA2D_BGCOLR_REG,
> > > +               (frm->a_rgb[2] << 16) |
> > > +               (frm->a_rgb[1] << 8) |
> > > +               frm->a_rgb[0]);
> > > +}
> > > diff --git a/drivers/media/platform/stm32/dma2d/dma2d-regs.h b/drivers/media/platform/stm32/dma2d/dma2d-regs.h
> > > new file mode 100644
> > > index 000000000000..2128364406c8
> > > --- /dev/null
> > > +++ b/drivers/media/platform/stm32/dma2d/dma2d-regs.h
> > > @@ -0,0 +1,113 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +/*
> > > + * ST stm32 Chrom-Art - 2D Graphics Accelerator Driver
> > > + *
> > > + * Copyright (c) 2021 Dillon Min
> > > + * Dillon Min, <dillon.minfei@gmail.com>
> > > + *
> > > + * based on s5p-g2d
> > > + *
> > > + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> > > + * Kamil Debski, <k.debski@samsung.com>
> > > + */
> > > +
> > > +#ifndef __DMA2D_REGS_H__
> > > +#define __DMA2D_REGS_H__
> > > +
> > > +#define DMA2D_CR_REG         0x0000
> > > +#define CR_MODE_MASK         GENMASK(17, 16)
> > > +#define CR_MODE_SHIFT                16
> > > +#define CR_M2M                       0x0000
> > > +#define CR_M2M_PFC           BIT(16)
> > > +#define CR_M2M_BLEND         BIT(17)
> > > +#define CR_R2M                       (BIT(17) | BIT(16))
> > > +#define CR_CEIE                      BIT(13)
> > > +#define CR_CTCIE             BIT(12)
> > > +#define CR_CAEIE             BIT(11)
> > > +#define CR_TWIE                      BIT(10)
> > > +#define CR_TCIE                      BIT(9)
> > > +#define CR_TEIE                      BIT(8)
> > > +#define CR_ABORT             BIT(2)
> > > +#define CR_SUSP                      BIT(1)
> > > +#define CR_START             BIT(0)
> > > +
> > > +#define DMA2D_ISR_REG                0x0004
> > > +#define ISR_CEIF             BIT(5)
> > > +#define ISR_CTCIF            BIT(4)
> > > +#define ISR_CAEIF            BIT(3)
> > > +#define ISR_TWIF             BIT(2)
> > > +#define ISR_TCIF             BIT(1)
> > > +#define ISR_TEIF             BIT(0)
> > > +
> > > +#define DMA2D_IFCR_REG               0x0008
> > > +#define IFCR_CCEIF           BIT(5)
> > > +#define IFCR_CCTCIF          BIT(4)
> > > +#define IFCR_CAECIF          BIT(3)
> > > +#define IFCR_CTWIF           BIT(2)
> > > +#define IFCR_CTCIF           BIT(1)
> > > +#define IFCR_CTEIF           BIT(0)
> > > +
> > > +#define DMA2D_FGMAR_REG              0x000c
> > > +#define DMA2D_FGOR_REG               0x0010
> > > +#define FGOR_LO_MASK         GENMASK(13, 0)
> > > +
> > > +#define DMA2D_BGMAR_REG              0x0014
> > > +#define DMA2D_BGOR_REG               0x0018
> > > +#define BGOR_LO_MASK         GENMASK(13, 0)
> > > +
> > > +#define DMA2D_FGPFCCR_REG    0x001c
> > > +#define FGPFCCR_ALPHA_MASK   GENMASK(31, 24)
> > > +#define FGPFCCR_AM_MASK              GENMASK(17, 16)
> > > +#define FGPFCCR_CS_MASK              GENMASK(15, 8)
> > > +#define FGPFCCR_START                BIT(5)
> > > +#define FGPFCCR_CCM_RGB888   BIT(4)
> > > +#define FGPFCCR_CM_MASK              GENMASK(3, 0)
> > > +
> > > +#define DMA2D_FGCOLR_REG     0x0020
> > > +#define FGCOLR_REG_MASK              GENMASK(23, 16)
> > > +#define FGCOLR_GREEN_MASK    GENMASK(15, 8)
> > > +#define FGCOLR_BLUE_MASK     GENMASK(7, 0)
> > > +
> > > +#define DMA2D_BGPFCCR_REG    0x0024
> > > +#define BGPFCCR_ALPHA_MASK   GENMASK(31, 24)
> > > +#define BGPFCCR_AM_MASK              GENMASK(17, 16)
> > > +#define BGPFCCR_CS_MASK              GENMASK(15, 8)
> > > +#define BGPFCCR_START                BIT(5)
> > > +#define BGPFCCR_CCM_RGB888   BIT(4)
> > > +#define BGPFCCR_CM_MASK              GENMASK(3, 0)
> > > +
> > > +#define DMA2D_BGCOLR_REG     0x0028
> > > +#define BGCOLR_REG_MASK              GENMASK(23, 16)
> > > +#define BGCOLR_GREEN_MASK    GENMASK(15, 8)
> > > +#define BGCOLR_BLUE_MASK     GENMASK(7, 0)
> > > +
> > > +#define DMA2D_OPFCCR_REG     0x0034
> > > +#define OPFCCR_CM_MASK               GENMASK(2, 0)
> > > +
> > > +#define DMA2D_OCOLR_REG              0x0038
> > > +#define OCOLR_ALPHA_MASK     GENMASK(31, 24)
> > > +#define OCOLR_RED_MASK               GENMASK(23, 16)
> > > +#define OCOLR_GREEN_MASK     GENMASK(15, 8)
> > > +#define OCOLR_BLUE_MASK              GENMASK(7, 0)
> > > +
> > > +#define DMA2D_OMAR_REG               0x003c
> > > +
> > > +#define DMA2D_OOR_REG                0x0040
> > > +#define OOR_LO_MASK          GENMASK(13, 0)
> > > +
> > > +#define DMA2D_NLR_REG                0x0044
> > > +#define NLR_PL_MASK          GENMASK(29, 16)
> > > +#define NLR_NL_MASK          GENMASK(15, 0)
> > > +
> > > +/* Hardware limits */
> > > +#define MAX_WIDTH            0x3fff
> > > +#define MAX_HEIGHT           0xffff
> >
> > I think these max width/height values are unrealistic. Even though the hardware
> > theoretically supports this, it is causing the memory alloc failures.
>
> Oh, I suppose the memory alloc failures test case was fixed, designed
> by v4l2-compliance , actually it depends on the driver's ability.
>
> >
> > I see that the camera driver has 2592x2592 as the max width/height, so perhaps
> > that should be used? Or alternatively the max resolution of the video output driver,
> > whatever that is?
>
> I will try 2592x2592, and 2048x2048[display driver]. It fits the
> camera's output or display input is a good idea.

Tried 2592x2592 and 2048x2048, both failed on my setup due to the low
memory size. I'd like to send v6 with max 2592x2592 if you prefer?

fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
        BA24 (32-bit ARGB 8-8-8-8) 2048x2048 -> BA24 (32-bit ARGB
8-8-8-8) 2048x2048: FAIL

fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
        BA24 (32-bit ARGB 8-8-8-8) 2592x2592 -> BA24 (32-bit ARGB
8-8-8-8) 2592x2592: FAIL

~ # free
                    total          used        free          shared
buff/cache available
Mem:          15648        4060        8276           0        3312        7648

Thanks & Regards

Dillon

>
> [display driver] drivers/gpu/drm/stm/drv.c
>
> Thanks & Regards
> Dillon
>
> >
> > Regards,
> >
> >         Hans
> >
> > > +
> > > +#define DEFAULT_WIDTH                240
> > > +#define DEFAULT_HEIGHT               320
> > > +#define DEFAULT_SIZE         307200
> > > +
> > > +#define CM_MODE_ARGB8888     0x00
> > > +#define CM_MODE_ARGB4444     0x04
> > > +#define CM_MODE_A4           0x0a
> > > +#endif /* __DMA2D_REGS_H__ */
