Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7301A31D7D9
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhBQLEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbhBQLDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:03:32 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7797DC061786
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:02:51 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id lw17so1327738pjb.0
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IF3naIPHrxG+YY8ojenAP8RgGdoo8ykpCwM24B6T4pE=;
        b=ZmvF+kX7hzVj6WDbOKyCHSUocBPV3meM3E9IJFbb+WgKIyivvLQKaY156TKzTN+keZ
         zasxrQ0nFTATnlQjQ7A0lI6Q4shFm2WBsoHdFFJgcI/cH+qYOB1ehFz+3/1ie/7bdSii
         eQoXAvzpjgEsPsCHZXoHoEt8Q+R/bwaQq42I/e/zAR3OxZ+xJKg543CprFjNam+hgKuV
         UQflrXvcYt3EZx2iUO5yMcYx+A2vdIka6SxHC+CAJK3pUp/gq2bLNgw61nnjg+12F6L5
         1zTk/2rvWtM8VtXE5EQUgDnWKN7bdM8GsN24Y2aNbx98glr4dyjgXpu8rmNPIrvtKVIA
         OeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IF3naIPHrxG+YY8ojenAP8RgGdoo8ykpCwM24B6T4pE=;
        b=r4FI3ME7B0vXLylULdWZp8aOPY2YfdILnDgcUDqwYkyOhYKo74aICmt58Jx0pZp0vr
         gzk/VBR0JDhY+TgfJIB2OrWoN/qoK+m09owPBYSa3io9ACkr4C6+dNwOCnVjmpHLf9wm
         1aa12OruNBmUyGYYw3JCnq41iPhIDOrGw1StCFn1lk+dexID6P1dbnzzanreAQX8itn2
         mnL/x6+N4NvmWilJpDZ6F8zey3JkHM4vqBZvBtaqXWHcOiPHtTVmF5TajUbnrE2i0gsT
         zEWIwoxOJS0/82jrKC/P5+7cTKTK6rqc7ZgkTvkOPXiFX4SorauW6wxLh5z/L7SRicPM
         i8vA==
X-Gm-Message-State: AOAM5338lrBeAH3EanRdNIN/pr6vlDYWg3H7uk649xWqDbc0czNcXbMM
        6140X+CJtifKTxivyxXYHOU6pHz00oisa0YoBz3eAQ==
X-Google-Smtp-Source: ABdhPJzIQQpWb1GY42kbE4sRkOhJ6SwO4dAB3c+Wu5hjb7zKSIibsOUu7mEH7lVuLw3bahrnX4jd+ogK7JZjMLqVAi8=
X-Received: by 2002:a17:90a:70c1:: with SMTP id a1mr8823123pjm.19.1613559770779;
 Wed, 17 Feb 2021 03:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-8-robert.foss@linaro.org> <e815d577-74de-ce45-848b-5baba8f5267c@linaro.org>
In-Reply-To: <e815d577-74de-ce45-848b-5baba8f5267c@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 17 Feb 2021 12:02:37 +0100
Message-ID: <CAG3jFys4RquqkXHs=LL7_D_kKJYY=VF7GQVqxfSSX1u3=F=9OA@mail.gmail.com>
Subject: Re: [PATCH v4 07/22] media: camss: Add support for VFE hardware
 version Titan 170
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 10 Feb 2021 at 20:36, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> Thank you for your patch!
>
> In the patchset summary email you are saying that camss does not support
> the PIX interface for this generation of ISPs. But this patch still
> carries quite a lot of code handling the PIX interface. Like:
>
> -----8<-----
> #define         REG_UPDATE_line_n(n)            \
>                         ((n) == VFE_LINE_PIX ? 1 : REG_UPDATE_RDIn(n))
> -----8<-----
>         for (i = VFE_LINE_RDI0; i <= VFE_LINE_PIX; i++)
>                 if (status0 & STATUS_0_line_n_REG_UPDATE(i))
>                         vfe->isr_ops.reg_update(vfe, i);

Thanks, I'll rework these defines for v5.

> -----8<-----
>         switch (f->fmt.pix_mp.pixelformat) {
>         case V4L2_PIX_FMT_NV12:
>         case V4L2_PIX_FMT_NV21:
>         case V4L2_PIX_FMT_NV16:
>         case V4L2_PIX_FMT_NV61:
> -----8<-----
> - the NV pixel formats are only supported for PIX

Ack, cutting this section out for v5.

>
> -----8<-----
>                         if (i == VFE_LINE_PIX) {
>                                 l->formats = formats_pix_845;
>                                 l->nformats = ARRAY_SIZE(formats_pix_845);
>                         } else {
> -----8<-----

Yep, removing this for v5.

> static const struct camss_format_info formats_pix_845[] = {
>         { MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
>           { { 1, 1 } }, { { 2, 3 } }, { 8 } },
>         { MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV12, 1,
>           { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> ...
> -----8<-----

Removing this for v5.

>
> Guess clearing the PIX related interrupt status bits is correct (provided that
> the driver doesn't try to really process them, and just clears these bits if
> they happen to be set for some reason). But the rest should be removed.
>
> One more comment inline below.
>
> On 05.02.2021 13:43, Robert Foss wrote:
> > Add register definitions for version 170 of the Titan architecture
> > and implement support for the RDI output mode.
> >
> > The RDI mode as opposed to the PIX output mode for the VFE unit does
> > not support any ISP functionality. This means essentially only
> > supporting dumping the output of the whatever the CSI decoder receives
> > from the sensor.
> >
> > For example will a sensor outputting YUV pixel format frames, only
> > allow the VFE to dump those frames as they are received by the ISP
> > to memory through the RDI interface.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >
> > Changes since v1:
> >   - Andrey: Removed commented out chunk
> >   - Remove left over WIP comments
> >
> >
> >   drivers/media/platform/qcom/camss/Makefile    |   1 +
> >   .../media/platform/qcom/camss/camss-vfe-170.c | 805 ++++++++++++++++++
> >   drivers/media/platform/qcom/camss/camss-vfe.c |  59 +-
> >   drivers/media/platform/qcom/camss/camss-vfe.h |  25 +-
> >   .../media/platform/qcom/camss/camss-video.c   | 100 +++
> >   drivers/media/platform/qcom/camss/camss.c     |  61 ++
> >   6 files changed, 1031 insertions(+), 20 deletions(-)
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
> >
> > diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> > index 940c0ae3e003..052c4f405fa3 100644
> > --- a/drivers/media/platform/qcom/camss/Makefile
> > +++ b/drivers/media/platform/qcom/camss/Makefile
> > @@ -11,6 +11,7 @@ qcom-camss-objs += \
> >               camss-vfe-4-1.o \
> >               camss-vfe-4-7.o \
> >               camss-vfe-4-8.o \
> > +             camss-vfe-170.o \
> >               camss-vfe-gen1.o \
> >               camss-vfe.o \
> >               camss-video.o \
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> > new file mode 100644
> > index 000000000000..b8ac3a137c8a
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> > @@ -0,0 +1,805 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * camss-vfe-4-7.c
> > + *
> > + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v4.7
> > + *
> > + * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
> > + * Copyright (C) 2015-2018 Linaro Ltd.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +
> > +#include "camss.h"
> > +#include "camss-vfe.h"
> > +
> > +#define VFE_HW_VERSION                               (0x000)
> > +
> > +#define VFE_GLOBAL_RESET_CMD                 (0x018)
> > +#define              GLOBAL_RESET_CMD_CORE           BIT(0)
> > +#define              GLOBAL_RESET_CMD_CAMIF          BIT(1)
> > +#define              GLOBAL_RESET_CMD_BUS            BIT(2)
> > +#define              GLOBAL_RESET_CMD_BUS_BDG        BIT(3)
> > +#define              GLOBAL_RESET_CMD_REGISTER       BIT(4)
> > +#define              GLOBAL_RESET_CMD_PM             BIT(5)
> > +#define              GLOBAL_RESET_CMD_BUS_MISR       BIT(6)
> > +#define              GLOBAL_RESET_CMD_TESTGEN        BIT(7)
> > +#define              GLOBAL_RESET_CMD_DSP            BIT(8)
> > +#define              GLOBAL_RESET_CMD_IDLE_CGC       BIT(9)
> > +
> > +#define VFE_CORE_CFG                         (0x050)
> > +#define              CFG_PIXEL_PATTERN_YCBYCR        (0x4)
> > +#define              CFG_PIXEL_PATTERN_YCRYCB        (0x5)
> > +#define              CFG_PIXEL_PATTERN_CBYCRY        (0x6)
> > +#define              CFG_PIXEL_PATTERN_CRYCBY        (0x7)
> > +#define              CFG_COMPOSITE_REG_UPDATE_EN     BIT(4)
> > +
> > +#define VFE_IRQ_CMD                          (0x058)
> > +#define              CMD_GLOBAL_CLEAR                BIT(0)
> > +
> > +#define VFE_IRQ_MASK_0                                       (0x05c)
> > +#define              MASK_0_CAMIF_SOF                        BIT(0)
> > +#define              MASK_0_CAMIF_EOF                        BIT(1)
> > +#define              MASK_0_RDIn_REG_UPDATE(n)               BIT((n) + 5)
> > +#define              MASK_0_line_n_REG_UPDATE(n)             \
> > +                     ((n) == VFE_LINE_PIX ? \
> > +                             BIT(4) : MASK_0_RDIn_REG_UPDATE(n))
> > +#define              MASK_0_IMAGE_MASTER_n_PING_PONG(n)      BIT((n) + 8)
> > +#define              MASK_0_IMAGE_COMPOSITE_DONE_n(n)        BIT((n) + 25)
> > +#define              MASK_0_RESET_ACK                        BIT(31)
> > +
> > +#define VFE_IRQ_MASK_1                                       (0x060)
> > +#define              MASK_1_CAMIF_ERROR                      BIT(0)
> > +#define              MASK_1_VIOLATION                        BIT(7)
> > +#define              MASK_1_BUS_BDG_HALT_ACK                 BIT(8)
> > +#define              MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(n)   BIT((n) + 9)
> > +#define              MASK_1_RDIn_SOF(n)                      BIT((n) + 29)
> > +
> > +#define VFE_IRQ_CLEAR_0                                      (0x064)
> > +#define VFE_IRQ_CLEAR_1                                      (0x068)
> > +
> > +#define VFE_IRQ_STATUS_0                             (0x06c)
> > +#define              STATUS_0_CAMIF_SOF                      BIT(0)
> > +#define              STATUS_0_RDIn_REG_UPDATE(n)             BIT((n) + 5)
> > +#define              STATUS_0_line_n_REG_UPDATE(n)           \
> > +                     ((n) == VFE_LINE_PIX ? \
> > +                             BIT(4) : STATUS_0_RDIn_REG_UPDATE(n))
> > +#define              STATUS_0_IMAGE_MASTER_n_PING_PONG(n)    BIT((n) + 8)
> > +#define              STATUS_0_IMAGE_COMPOSITE_DONE_n(n)      BIT((n) + 25)
> > +#define              STATUS_0_RESET_ACK                      BIT(31)
> > +
> > +#define VFE_IRQ_STATUS_1                             (0x070)
> > +#define              STATUS_1_VIOLATION                      BIT(7)
> > +#define              STATUS_1_BUS_BDG_HALT_ACK               BIT(8)
> > +#define              STATUS_1_RDIn_SOF(n)                    BIT((n) + 27)
> > +
> > +#define VFE_VIOLATION_STATUS                 (0x07c)
> > +
> > +#define VFE_CAMIF_CMD                                (0x478)
> > +#define              CMD_CLEAR_CAMIF_STATUS          BIT(2)
> > +
> > +#define VFE_CAMIF_CFG                                (0x47c)
> > +#define              CFG_VSYNC_SYNC_EDGE             (0)
> > +#define                      VSYNC_ACTIVE_HIGH       (0)
> > +#define                      VSYNC_ACTIVE_LOW        (1)
> > +#define              CFG_HSYNC_SYNC_EDGE             (1)
> > +#define                      HSYNC_ACTIVE_HIGH       (0)
> > +#define                      HSYNC_ACTIVE_LOW        (1)
> > +#define              CFG_VFE_SUBSAMPLE_ENABLE        BIT(4)
> > +#define              CFG_BUS_SUBSAMPLE_ENABLE        BIT(5)
> > +#define              CFG_VFE_OUTPUT_EN               BIT(6)
> > +#define              CFG_BUS_OUTPUT_EN               BIT(7)
> > +#define              CFG_BINNING_EN                  BIT(9)
> > +#define              CFG_FRAME_BASED_EN              BIT(10)
> > +#define              CFG_RAW_CROP_EN                 BIT(22)
> > +
> > +// XXX different, don't exist in TITAN register docs
> > +#define VFE_0_CAMIF_FRAME_CFG                        0x484
> > +#define VFE_0_CAMIF_WINDOW_WIDTH_CFG         0x488
> > +#define VFE_0_CAMIF_WINDOW_HEIGHT_CFG                0x48c
> > +#define VFE_0_CAMIF_SUBSAMPLE_CFG            0x490
> > +#define VFE_0_CAMIF_IRQ_FRAMEDROP_PATTERN    0x498
> > +#define VFE_0_CAMIF_IRQ_SUBSAMPLE_PATTERN    0x49c
> > +#define VFE_0_CAMIF_STATUS                   0x4a4
> > +#define VFE_0_CAMIF_STATUS_HALT                      BIT(31)
> > +#define CAMIF_TIMEOUT_SLEEP_US 1000
> > +#define CAMIF_TIMEOUT_ALL_US 1000000
> > +
> > +#define VFE_REG_UPDATE_CMD                   (0x4ac)
> > +#define              REG_UPDATE_RDIn(n)              BIT(1 + (n))
> > +#define              REG_UPDATE_line_n(n)            \
> > +                     ((n) == VFE_LINE_PIX ? 1 : REG_UPDATE_RDIn(n))
> > +
> > +
> > +#define VFE_BUS_IRQ_MASK(n)          (0x2044 + (n) * 4)
> > +#define VFE_BUS_IRQ_CLEAR(n)         (0x2050 + (n) * 4)
> > +
> > +#define VFE_BUS_IRQ_STATUS(n)                (0x205c + (n) * 4)
> > +#define              STATUS0_COMP_RESET_DONE         BIT(0)
> > +#define              STATUS0_COMP_REG_UPDATE0_DONE   BIT(1)
> > +#define              STATUS0_COMP_REG_UPDATE1_DONE   BIT(2)
> > +#define              STATUS0_COMP_REG_UPDATE2_DONE   BIT(3)
> > +#define              STATUS0_COMP_REG_UPDATE3_DONE   BIT(4)
> > +#define              STATUS0_COMP_REG_UPDATE_DONE(n) BIT(n + 1)
> > +#define              STATUS0_COMP0_BUF_DONE          BIT(5)
> > +#define              STATUS0_COMP1_BUF_DONE          BIT(6)
> > +#define              STATUS0_COMP2_BUF_DONE          BIT(7)
> > +#define              STATUS0_COMP3_BUF_DONE          BIT(8)
> > +#define              STATUS0_COMP4_BUF_DONE          BIT(9)
> > +#define              STATUS0_COMP5_BUF_DONE          BIT(10)
> > +#define              STATUS0_COMP_BUF_DONE(n)        BIT(n + 5)
> > +#define              STATUS0_COMP_ERROR              BIT(11)
> > +#define              STATUS0_COMP_OVERWRITE          BIT(12)
> > +#define              STATUS0_OVERFLOW                BIT(13)
> > +#define              STATUS0_VIOLATION               BIT(14)
> > +/* WM_CLIENT_BUF_DONE defined for buffers 0:19 */
> > +#define              STATUS1_WM_CLIENT_BUF_DONE(n)           BIT(n)
> > +#define              STATUS1_EARLY_DONE                      BIT(24)
> > +#define              STATUS2_DUAL_COMP0_BUF_DONE             BIT(0)
> > +#define              STATUS2_DUAL_COMP1_BUF_DONE             BIT(1)
> > +#define              STATUS2_DUAL_COMP2_BUF_DONE             BIT(2)
> > +#define              STATUS2_DUAL_COMP3_BUF_DONE             BIT(3)
> > +#define              STATUS2_DUAL_COMP4_BUF_DONE             BIT(4)
> > +#define              STATUS2_DUAL_COMP5_BUF_DONE             BIT(5)
> > +#define              STATUS2_DUAL_COMP_BUF_DONE(n)           BIT(n)
> > +#define              STATUS2_DUAL_COMP_ERROR                 BIT(6)
> > +#define              STATUS2_DUAL_COMP_OVERWRITE             BIT(7)
> > +
> > +#define VFE_BUS_IRQ_CLEAR_GLOBAL             (0x2068)
> > +
> > +#define VFE_BUS_WM_DEBUG_STATUS_CFG          (0x226c)
> > +#define              DEBUG_STATUS_CFG_STATUS0(n)     BIT(n)
> > +#define              DEBUG_STATUS_CFG_STATUS1(n)     BIT(8+n)
> > +
> > +#define VFE_BUS_WM_ADDR_SYNC_FRAME_HEADER    (0x2080)
> > +
> > +#define VFE_BUS_WM_ADDR_SYNC_NO_SYNC         (0x2084)
> > +#define              BUS_VER2_MAX_CLIENTS (24)
> > +#define              WM_ADDR_NO_SYNC_DEFAULT_VAL \
> > +                             ((1 << BUS_VER2_MAX_CLIENTS) - 1)
> > +
> > +#define VFE_BUS_WM_CGC_OVERRIDE                      (0x200c)
> > +#define              WM_CGC_OVERRIDE_ALL             (0xFFFFF)
> > +
> > +#define VFE_BUS_WM_TEST_BUS_CTRL             (0x211c)
> > +
> > +#define VFE_BUS_WM_STATUS0(n)                        (0x2200 + (n) * 0x100)
> > +#define VFE_BUS_WM_STATUS1(n)                        (0x2204 + (n) * 0x100)
> > +#define VFE_BUS_WM_CFG(n)                    (0x2208 + (n) * 0x100)
> > +#define              WM_CFG_EN                       (0)
> > +#define              WM_CFG_MODE                     (1)
> > +#define                      MODE_QCOM_PLAIN (0)
> > +#define                      MODE_MIPI_RAW   (1)
> > +#define              WM_CFG_VIRTUALFRAME             (2)
> > +#define VFE_BUS_WM_HEADER_ADDR(n)            (0x220c + (n) * 0x100)
> > +#define VFE_BUS_WM_HEADER_CFG(n)             (0x2210 + (n) * 0x100)
> > +#define VFE_BUS_WM_IMAGE_ADDR(n)             (0x2214 + (n) * 0x100)
> > +#define VFE_BUS_WM_IMAGE_ADDR_OFFSET(n)              (0x2218 + (n) * 0x100)
> > +#define VFE_BUS_WM_BUFFER_WIDTH_CFG(n)               (0x221c + (n) * 0x100)
> > +#define              WM_BUFFER_DEFAULT_WIDTH         (0xFF01)
> > +
> > +#define VFE_BUS_WM_BUFFER_HEIGHT_CFG(n)              (0x2220 + (n) * 0x100)
> > +#define VFE_BUS_WM_PACKER_CFG(n)             (0x2224 + (n) * 0x100)
> > +
> > +#define VFE_BUS_WM_STRIDE(n)                 (0x2228 + (n) * 0x100)
> > +#define              WM_STRIDE_DEFAULT_STRIDE        (0xFF01)
> > +
> > +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)   (0x2248 + (n) * 0x100)
> > +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)  (0x224c + (n) * 0x100)
> > +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)               (0x2250 + (n) * 0x100)
> > +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)              (0x2254 + (n) * 0x100)
> > +#define VFE_BUS_WM_FRAME_INC(n)                      (0x2258 + (n) * 0x100)
> > +#define VFE_BUS_WM_BURST_LIMIT(n)            (0x225c + (n) * 0x100)
> > +
> > +
> > +static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
> > +{
> > +     u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
> > +
> > +     u32 gen = (hw_version >> 28) & 0xF;
> > +     u32 rev = (hw_version >> 16) & 0xFFF;
> > +     u32 step = hw_version & 0xFFFF;
> > +
> > +     dev_err(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
> > +}
> > +
> > +static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
> > +{
> > +     u32 bits = readl_relaxed(vfe->base + reg);
> > +
> > +     writel_relaxed(bits & ~clr_bits, vfe->base + reg);
> > +}
> > +
> > +static inline void vfe_reg_set(struct vfe_device *vfe, u32 reg, u32 set_bits)
> > +{
> > +     u32 bits = readl_relaxed(vfe->base + reg);
> > +
> > +     writel_relaxed(bits | set_bits, vfe->base + reg);
> > +}
> > +
> > +static void vfe_global_reset(struct vfe_device *vfe)
> > +{
>
> reset_bits are written to twice, the second write overwriting the first written value:
>
> > +     u32 reset_bits = GLOBAL_RESET_CMD_IDLE_CGC      |
> > +                      GLOBAL_RESET_CMD_DSP           |
> > +                      GLOBAL_RESET_CMD_TESTGEN       |
> > +                      GLOBAL_RESET_CMD_BUS_MISR      |
> > +                      GLOBAL_RESET_CMD_PM            |
> > +                      GLOBAL_RESET_CMD_REGISTER      |
> > +                      GLOBAL_RESET_CMD_BUS_BDG       |
> > +                      GLOBAL_RESET_CMD_BUS           |
> > +                      GLOBAL_RESET_CMD_CAMIF         |
> > +                      GLOBAL_RESET_CMD_CORE;
>
> - 1st write
>
> > +     reset_bits = 0x00003F9F;
>
> - 2nd write

I found the documentation for these fields, and replaced the 2nd write
by setting all of its bits in the 1st write.
Nice catch!

>
> Thanks,
> Andrey
>
> <snip>
