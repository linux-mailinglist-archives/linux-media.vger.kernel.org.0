Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85AC3A1892
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 17:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbhFIPJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 11:09:24 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:40561 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239012AbhFIPJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 11:09:22 -0400
Received: by mail-pf1-f178.google.com with SMTP id q25so18596354pfh.7
        for <linux-media@vger.kernel.org>; Wed, 09 Jun 2021 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jlamz4/7tXi3zJnKl6VdCUUz00XW6c/fJqRbFk+0qoU=;
        b=LPJ82NJQeHGvVEp2pZuW9JLJ3vjg/WvIijLBei/7Rl+kVFIuzv0P6rTDD5mrbqCoHh
         aMoYCKFsXpY7v79qqqsT7gyJWsPXETE4Qpsusd6VPlq5GxDE09U/WlbbD/50Erk3L1r2
         rbzufR6baefMgUDeGaaQnCxCpc3QNa/gY9MXzqUv4/CsaYezmBnaJe/Q10ubXnnVxgev
         HUZFKFTw4nDOq0dIMpIbJIR0cFqQa7OAUc9/57u2DqzX08CW9f0bpZWa5rJ/TXGl129s
         rfutLvkdQshm6ImDDEyNSER4zgEZyJWSmwQaU/mbKX/bNfv3Sgeu+8o5pAB1OELKvbPj
         PeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jlamz4/7tXi3zJnKl6VdCUUz00XW6c/fJqRbFk+0qoU=;
        b=XpgM/LPeJYc/za/Dt73eX3vFuM9j/t2+iPmTHusG5D+oeGXKYvaC0AyqJbmDiyekp5
         nbWmirdEs3pAglfeYSBsfQ920CFr2yJcPCGTdJENhShAUVZ/BFQcE8dvWMEPLv0E88HS
         NwO02GQXwbp7OghGBArXXc1Sihkq9sJVET6IIMlNkip17hcxBtJCDzdi0XVo+d1KpXMO
         4eg2arMHYljQQoIQ8w1tfb1fSbpC8TRunNm9CUHvXXwj6tif6kYMiBwSsB0Hia86lzZs
         SGTp+PyUvkbNcd82Qq/M+aajgtizIraIC1MCxe0NqyFVZQVxM80wqWcoU55DwrYUu2ao
         v8MQ==
X-Gm-Message-State: AOAM531KLrr632V8Em3XgKqtpzMhoEmXbWk84jCAkb7mnEeRoINRje/X
        tGhsWEVQiu0GaE3AYyTMR50ecnRvSKY8Yg+wt2eUZQ==
X-Google-Smtp-Source: ABdhPJzuDQ6ZeQVlrWP5p0SYwZtLT4lN1KX2ufcihKdafucvrdXJT/2a+GfZAv8u7MWvVxesPBEL4ObHgWKuMdHK8sA=
X-Received: by 2002:a63:9f19:: with SMTP id g25mr122813pge.265.1623251172949;
 Wed, 09 Jun 2021 08:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-15-jonathan@marek.ca>
 <CAG3jFytV1cchKPZP0_1qN+D9JUnhNDo6fJzEqz7e8LM7p4fysQ@mail.gmail.com> <642d1669-32e1-624c-287a-7f51c45d48b8@marek.ca>
In-Reply-To: <642d1669-32e1-624c-287a-7f51c45d48b8@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 9 Jun 2021 17:06:01 +0200
Message-ID: <CAG3jFyttMspUEAo7OU7frhL+y+LUFw3Sbz+8SW_cby1uCDCqYg@mail.gmail.com>
Subject: Re: [PATCH 14/17] media: camss: Add initial support for VFE hardware
 version Titan 480
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 9 Jun 2021 at 01:10, Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 5/31/21 8:13 AM, Robert Foss wrote:
> > Hey Jonathan,
> >
> > Thanks for sending this out.
> >
> > There are a few checkpatch --strict warnings/etc. in this patch. I
> > won't cover them individually below.
> >
> > On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >> Add support for VFE found on SM8250 (Titan 480). This implementation is
> >> based on the titan 170 implementation. It supports the normal and lite VFE,
> >> and only supports the RDI0 capture path.
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >>   drivers/media/platform/qcom/camss/Makefile    |   1 +
> >>   .../media/platform/qcom/camss/camss-vfe-480.c | 554 ++++++++++++++++++
> >>   drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
> >>   3 files changed, 556 insertions(+)
> >>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c
> >>
> >> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> >> index 0752c46ea37b..81dd56aff0f2 100644
> >> --- a/drivers/media/platform/qcom/camss/Makefile
> >> +++ b/drivers/media/platform/qcom/camss/Makefile
> >> @@ -15,6 +15,7 @@ qcom-camss-objs += \
> >>                  camss-vfe-4-7.o \
> >>                  camss-vfe-4-8.o \
> >>                  camss-vfe-170.o \
> >> +               camss-vfe-480.o \
> >>                  camss-vfe-gen1.o \
> >>                  camss-vfe.o \
> >>                  camss-video.o \
> >> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> >> new file mode 100644
> >> index 000000000000..79210fabbc2a
> >> --- /dev/null
> >> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> >> @@ -0,0 +1,554 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * camss-vfe-480.c
> >> + *
> >> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v480 (SM8250)
> >> + *
> >> + * Copyright (C) 2020-2021 Linaro Ltd.
> >> + * Copyright (C) 2021 Jonathan Marek
> >> + */
> >> +
> >> +#include <linux/delay.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/io.h>
> >> +#include <linux/iopoll.h>
> >> +
> >> +#include "camss.h"
> >> +#include "camss-vfe.h"
> >> +
> >> +/* VFE 2/3 are lite and have a different register layout */
> >> +#define IS_LITE                (vfe->id >= 2 ? 1 : 0)
> >> +
> >> +#define VFE_HW_VERSION                 (0x00)
> >> +
> >> +#define VFE_GLOBAL_RESET_CMD           (IS_LITE ? 0x0c : 0x1c)
> >> +#define            GLOBAL_RESET_HW_AND_REG     (IS_LITE ? BIT(1) : BIT(0))
> >> +
> >> +#define VFE_REG_UPDATE_CMD             (IS_LITE ? 0x20 : 0x34)
> >> +#define            REG_UPDATE_RDI(n)           (IS_LITE ? BIT(n) : BIT(1 + (n)))
> >> +#define VFE_IRQ_CMD                    (IS_LITE ? 0x24 : 0x38)
> >> +#define     IRQ_CMD_GLOBAL_CLEAR       BIT(0)
> >> +
> >> +#define VFE_IRQ_MASK(n)                        ((IS_LITE ? 0x28 : 0x3c) + (n) * 4)
> >> +#define            IRQ_MASK_0_RESET_ACK        (IS_LITE ? BIT(17) : BIT(0))
> >> +#define            IRQ_MASK_0_BUS_TOP_IRQ      (IS_LITE ? BIT(4) : BIT(7))
> >> +#define VFE_IRQ_CLEAR(n)               ((IS_LITE ? 0x34 : 0x48) + (n) * 4)
> >> +#define VFE_IRQ_STATUS(n)              ((IS_LITE ? 0x40 : 0x54) + (n) * 4)
> >> +
> >> +#define BUS_REG_BASE                   (IS_LITE ? 0x1a00 : 0xaa00)
> >> +
> >> +#define VFE_BUS_WM_CGC_OVERRIDE                (BUS_REG_BASE + 0x08)
> >> +#define                WM_CGC_OVERRIDE_ALL     (0x3FFFFFF)
> >> +
> >> +#define VFE_BUS_WM_TEST_BUS_CTRL       (BUS_REG_BASE + 0xdc)
> >> +
> >> +#define VFE_BUS_IRQ_MASK(n)            (BUS_REG_BASE + 0x18 + (n) * 4)
> >> +#define     BUS_IRQ_MASK_0_RDI_RUP(n)  (IS_LITE ? BIT(n) : BIT(3 + (n)))
> >> +#define     BUS_IRQ_MASK_0_COMP_DONE(n)        (IS_LITE ? BIT(4 + (n)) : BIT(6 + (n)))
> >> +#define VFE_BUS_IRQ_CLEAR(n)           (BUS_REG_BASE + 0x20 + (n) * 4)
> >> +#define VFE_BUS_IRQ_STATUS(n)          (BUS_REG_BASE + 0x28 + (n) * 4)
> >> +#define VFE_BUS_IRQ_CLEAR_GLOBAL       (BUS_REG_BASE + 0x30)
> >> +
> >> +#define VFE_BUS_WM_CFG(n)              (BUS_REG_BASE + 0x200 + (n) * 0x100)
> >> +#define                WM_CFG_EN                       (0)
> >> +#define                WM_CFG_MODE                     (16)
> >> +#define                        MODE_QCOM_PLAIN (0)
> >> +#define                        MODE_MIPI_RAW   (1)
> >> +#define VFE_BUS_WM_IMAGE_ADDR(n)       (BUS_REG_BASE + 0x204 + (n) * 0x100)
> >> +#define VFE_BUS_WM_FRAME_INCR(n)       (BUS_REG_BASE + 0x208 + (n) * 0x100)
> >> +#define VFE_BUS_WM_IMAGE_CFG_0(n)      (BUS_REG_BASE + 0x20c + (n) * 0x100)
> >> +#define                WM_IMAGE_CFG_0_DEFAULT_WIDTH    (0xFFFF)
> >> +#define VFE_BUS_WM_IMAGE_CFG_1(n)      (BUS_REG_BASE + 0x210 + (n) * 0x100)
> >> +#define VFE_BUS_WM_IMAGE_CFG_2(n)      (BUS_REG_BASE + 0x214 + (n) * 0x100)
> >> +#define VFE_BUS_WM_PACKER_CFG(n)       (BUS_REG_BASE + 0x218 + (n) * 0x100)
> >> +#define VFE_BUS_WM_HEADER_ADDR(n)      (BUS_REG_BASE + 0x220 + (n) * 0x100)
> >> +#define VFE_BUS_WM_HEADER_INCR(n)      (BUS_REG_BASE + 0x224 + (n) * 0x100)
> >> +#define VFE_BUS_WM_HEADER_CFG(n)       (BUS_REG_BASE + 0x228 + (n) * 0x100)
> >> +
> >> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)     (BUS_REG_BASE + 0x230 + (n) * 0x100)
> >> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)    (BUS_REG_BASE + 0x234 + (n) * 0x100)
> >> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)         (BUS_REG_BASE + 0x238 + (n) * 0x100)
> >> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)                (BUS_REG_BASE + 0x23c + (n) * 0x100)
> >> +
> >> +#define VFE_BUS_WM_SYSTEM_CACHE_CFG(n) (BUS_REG_BASE + 0x260 + (n) * 0x100)
> >> +#define VFE_BUS_WM_BURST_LIMIT(n)      (BUS_REG_BASE + 0x264 + (n) * 0x100)
> >> +
> >> +/* for titan 480, each bus client is hardcoded to a specific path
> >> + * and each bus client is part of a hardcoded "comp group"
> >> + */
> >> +#define RDI_WM(n)                      ((IS_LITE ? 0 : 23) + n)
> >> +#define RDI_COMP_GROUP(n)              ((IS_LITE ? 0 : 11) + n)
> >
> > The indentation of the different types of defines above differ from
> > vfe170, but I kind of prefer this style. Feel free to change either.
> >
>
> Its not just the indentation, the naming style is a bit different too.
> Not sure its worth trying to make them fully consistent, but I wouldn't
> mind just changing the identation for 170.

Ack.

>
> >> +
> >> +static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
> >> +{
> >> +       u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
> >> +
> >> +       u32 gen = (hw_version >> 28) & 0xF;
> >> +       u32 rev = (hw_version >> 16) & 0xFFF;
> >> +       u32 step = hw_version & 0xFFFF;
> >> +
> >> +       dev_dbg(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
> >> +}
> >> +
> >> +static void vfe_global_reset(struct vfe_device *vfe)
> >> +{
> >> +       writel_relaxed(IRQ_MASK_0_RESET_ACK, vfe->base + VFE_IRQ_MASK(0));
> >> +       writel_relaxed(GLOBAL_RESET_HW_AND_REG, vfe->base + VFE_GLOBAL_RESET_CMD);
> >> +}
> >> +
> >> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> >> +{
> >> +       struct v4l2_pix_format_mplane *pix =
> >> +               &line->video_out.active_fmt.fmt.pix_mp;
> >> +
> >> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> >> +
> >> +       /* no clock gating at bus input */
> >> +       writel_relaxed(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> >> +
> >> +       writel_relaxed(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> >> +
> >> +       writel_relaxed(pix->plane_fmt[0].bytesperline * pix->height,
> >> +                      vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> >> +       writel_relaxed(0xf, vfe->base + VFE_BUS_WM_BURST_LIMIT(wm));
> >> +       writel_relaxed(WM_IMAGE_CFG_0_DEFAULT_WIDTH,
> >> +                      vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> >> +       writel_relaxed(pix->plane_fmt[0].bytesperline,
> >> +                      vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> >> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> >
> > ^^^ using more of the 130char line length is probably better for legibility.
> >
>
> More than 100 line length is still a warning from checkpatch, and this
> is IMO more readable since all the "vfe->base + X" are more or less at
> the same indentation, and removing the line breaks would make it harder
> to see which registers are being updated.

You're right.

>
> >> +
> >> +       /* no dropped frames, one irq per frame */
> >> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> >> +       writel_relaxed(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> >> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> >> +       writel_relaxed(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> >> +
> >> +       writel_relaxed(1 << WM_CFG_EN | MODE_MIPI_RAW << WM_CFG_MODE,
> >> +                      vfe->base + VFE_BUS_WM_CFG(wm));
> >> +}
> >> +
> >> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> >> +{
> >> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> >> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
> >> +}
> >> +
> >> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> >> +                         struct vfe_line *line)
> >> +{
> >> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> >> +       writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> >> +}
> >> +
> >> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> >> +{
> >> +       vfe->reg_update |= REG_UPDATE_RDI(line_id);
> >> +       writel_relaxed(vfe->reg_update, vfe->base + VFE_REG_UPDATE_CMD);
> >> +}
> >> +
> >> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> >> +                                       enum vfe_line_id line_id)
> >> +{
> >> +       vfe->reg_update &= ~REG_UPDATE_RDI(line_id);
> >> +}
> >> +
> >> +static void vfe_enable_irq_common(struct vfe_device *vfe)
> >> +{
> >> +       /* enable only the IRQs used: rup and comp_done irqs for RDI0 */
> >> +       writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
> >> +                      vfe->base + VFE_IRQ_MASK(0));
> >> +       writel_relaxed(BUS_IRQ_MASK_0_RDI_RUP(0) |
> >> +                      BUS_IRQ_MASK_0_COMP_DONE(RDI_COMP_GROUP(0)),
> >> +                      vfe->base + VFE_BUS_IRQ_MASK(0));
> >> +}
> >> +
> >> +/*
> >> + * vfe_isr - VFE module interrupt handler
> >> + * @irq: Interrupt line
> >> + * @dev: VFE device
> >> + *
> >> + * Return IRQ_HANDLED on success
> >> + */
> >> +static irqreturn_t vfe_isr(int irq, void *dev)
> >> +{
> >> +       struct vfe_device *vfe = dev;
> >> +       u32 status;
> >> +
> >> +       status = readl_relaxed(vfe->base + VFE_IRQ_STATUS(0));
> >> +       writel_relaxed(status, vfe->base + VFE_IRQ_CLEAR(0));
> >> +       writel_relaxed(IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
> >> +
> >> +       if (status & IRQ_MASK_0_RESET_ACK)
> >> +               vfe->isr_ops.reset_ack(vfe);
> >> +
> >> +       if (status & IRQ_MASK_0_BUS_TOP_IRQ) {
> >> +               u32 status = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(0));
> >> +               writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
> >> +               writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
> >> +
> >> +               if (status & BUS_IRQ_MASK_0_RDI_RUP(0))
> >> +                       vfe->isr_ops.reg_update(vfe, 0);
> >> +
> >> +               if (status & BUS_IRQ_MASK_0_COMP_DONE(RDI_COMP_GROUP(0)))
> >> +                       vfe->isr_ops.wm_done(vfe, 0);
> >
> > COMP_DONE is signalled in the status register, but wm_done() is
> > called. comp_done() seems to never be called.
> >
>
> The current "vfe_isr_comp_done" is not relevant to RDI capture. Titan
> 480 (unlike 170) now uses comp done IRQs for RDI too.
>
> This is a bit of a hack. wm_done is called with wm=0, but the
> implementation passes it through RDI_WM(0) to map it to wm=23 (which is
> the WM for RDI0 - with titan 480 the WM paths are fixed).

I think that sounds quite reasonable. Maybe a comment explaining the
nuances would be nice. For the next guy :p

>
> ...
>
> >> +const struct vfe_hw_ops vfe_ops_480 = {
> >> +       .global_reset = vfe_global_reset,
> >> +       .hw_version_read = vfe_hw_version_read,
> >> +       .isr = vfe_isr,
> >> +       .pm_domain_off = vfe_pm_domain_off,
> >> +       .pm_domain_on = vfe_pm_domain_on,
> >> +       .reg_update_clear = vfe_reg_update_clear,
> >> +       .reg_update = vfe_reg_update,
> >> +       .subdev_init = vfe_subdev_init,
> >> +       .vfe_disable = vfe_disable,
> >> +       .vfe_enable = vfe_enable,
> >> +       .vfe_halt = vfe_halt,
> >> +};
> >
> > Again there are some functions that could be refactored out to a vfe
> > gen2 parent struct & object. This time I think it's worth refactoring
> > out the common code, especially since we know more platforms based on
> > this architecture are coming.
> >
> > vfe_queue_buffer
> > vfe_pm_domain_on
> > vfe_pm_domain_off
> > vfe_isr_wm_done
> > vfe_isr_reg_update
> > vfe_get_output (although vfe170 contains a frame_skip chunk that
> > should be removed)
> > vfe_halt
> >
>
> In the current minimal implementation of both vfe-170 and vfe-480, most
> of these could be shared, but I think duplicating these few functions
> for now is fine, it can easily be resolved later. (there might be less
> shared code than expected if the titan 480 WMs are implementated fully
> instead of the "hack" I've used to support only RDI cases).

Fair enough.

>
> >> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> >> index 844b9275031d..83b11ae1572d 100644
> >> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> >> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> >> @@ -201,5 +201,6 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
> >>   extern const struct vfe_hw_ops vfe_ops_4_7;
> >>   extern const struct vfe_hw_ops vfe_ops_4_8;
> >>   extern const struct vfe_hw_ops vfe_ops_170;
> >> +extern const struct vfe_hw_ops vfe_ops_480;
> >>
> >>   #endif /* QC_MSM_CAMSS_VFE_H */
> >> --
> >> 2.26.1
> >>
