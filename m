Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AD52F60C2
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 13:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbhANMIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 07:08:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbhANMIs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 07:08:48 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7662C061757
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 04:08:02 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id v3so2786626plz.13
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 04:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WRtdlH5otbG4J5chqvugvbgbfEzIvg3j7USF4KSz5JQ=;
        b=sa+LCMLR59WKaF0oov79BF956chODSr4nGlbUebB6gL4l1d5nUv8WaLJvRENYEyWTZ
         ZB3X/a5CcI0kIjTXhq8f0R6+ocpr/kEp7cyVaXCxP+PCqYdqus3Tuq1s5f6HaHVNF8YR
         Bvy+yoqgEE4X50/oY0vopWVhoNDSbBGO7ZTAJ3LnIpXmskpJb8qp+JoxlvN5J+SY/MOW
         uF5TsqsBejNatIFcwFNK8GHsdodn2VeYs6rL+uA4wO5s44NCv063TFq2sqt0dGTwfN90
         PgT8vC4GDM/VtjR8ODHdDuWKdnkCddIN5Ogc2LnJ7UgQM4a5uJcpt9z6UcUxZBxjl+vi
         3T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WRtdlH5otbG4J5chqvugvbgbfEzIvg3j7USF4KSz5JQ=;
        b=l80Pj6Mzokbpii6H70sA8LA/uAjEnTHSL/8bEuFT/ylM9KFS4IUudBiWkTbp96Bsvs
         WgYIV5hqMnzlxcxPw9XybUz+rqT0BCRCGkYns7fuAKUOGcqph+zfBF5Xp/6XzNM+SyIR
         qH1ph8df3vtzx9LItqoNio5cEFgpgNIuJ8NXhrEMSOiENTvPIMiJV7JOJwVZpfDwMJJX
         u5SIbRFNFZYdL5h91P/etQJMF3iNKG9y26z1O74j9YBprxUcW/pqjCFWdxmig4YSxTGC
         unPLijKgqd45muqX9ACDDvviF5DQBXQLe4Y65dz3QFCv+sJkUocFWg15mu3E3MiUOtor
         tzTg==
X-Gm-Message-State: AOAM532Fwcu7tu84Vpk0oH4Gne5Oo79C2X62OE01oBZB7sIg8aS8utHR
        IsPwTdPUViYxm7pAJu0JX+Rkb/ptbVnJFhbwlyLVQw==
X-Google-Smtp-Source: ABdhPJyq1gcYUpvfnA3k6lH3ynV0del5mCLRJud+gLEyPh+MNasvgxGPiqkpqDcfH9PpPpHVUwZafF9EyIb9kTLGc5I=
X-Received: by 2002:a17:90a:e604:: with SMTP id j4mr4730598pjy.19.1610626081770;
 Thu, 14 Jan 2021 04:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-7-robert.foss@linaro.org> <5ea1460a-6ae4-c85f-f14c-d6f9022af0f3@linaro.org>
In-Reply-To: <5ea1460a-6ae4-c85f-f14c-d6f9022af0f3@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 14 Jan 2021 13:07:50 +0100
Message-ID: <CAG3jFyt72zCOex9O7rFMeUngOO_4MTMJxTmDCiSj4KoZWZGYkg@mail.gmail.com>
Subject: Re: [PATCH v1 06/17] media: camss: Add support for VFE hardware
 version Titan 170
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, arnd@arndb.de, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 14 Jan 2021 at 11:48, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> Thank you for the patch!
>
> On 08.01.2021 15:04, Robert Foss wrote:
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
> >   drivers/media/platform/qcom/camss/Makefile    |   1 +
> >   .../media/platform/qcom/camss/camss-vfe-170.c | 808 ++++++++++++++++++
> >   drivers/media/platform/qcom/camss/camss-vfe.c |  59 +-
> >   drivers/media/platform/qcom/camss/camss-vfe.h |  25 +-
> >   .../media/platform/qcom/camss/camss-video.c   | 100 +++
> >   drivers/media/platform/qcom/camss/camss.c     |  61 ++
> >   6 files changed, 1034 insertions(+), 20 deletions(-)
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
> > index 000000000000..89b6c47cca22
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> > @@ -0,0 +1,808 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * camss-vfe-4-7.c
> > + *
> > + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v4.7
>
> - the above two lines aren't updated to vfe-170
>
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
> - the above settings are overwritten by this assignment:
>
> > +     reset_bits = 0x00003F9F;
> > +
> > +     writel_relaxed(BIT(31), vfe->base + VFE_IRQ_MASK_0);
> > +
> > +     /* Make sure IRQ mask has been written before resetting */
> > +     wmb();
> > +
> > +     writel_relaxed(reset_bits, vfe->base + VFE_GLOBAL_RESET_CMD);
> > +}
> > +
> > +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> > +{
> > +     u32 val;
> > +
> > +     /*Set Debug Registers*/
> > +     val = DEBUG_STATUS_CFG_STATUS0(1) |
> > +           DEBUG_STATUS_CFG_STATUS0(7);
> > +     writel_relaxed(val, vfe->base + VFE_BUS_WM_DEBUG_STATUS_CFG);
> > +
> > +     /* BUS_WM_INPUT_IF_ADDR_SYNC_FRAME_HEADER */
> > +     writel_relaxed(0, vfe->base + VFE_BUS_WM_ADDR_SYNC_FRAME_HEADER);
> > +
> > +     /* no clock gating at bus input */
> > +     val = WM_CGC_OVERRIDE_ALL;
> > +     writel_relaxed(val, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> > +
> > +     writel_relaxed(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> > +
> > +     /* if addr_no_sync has default value then config the addr no sync reg */
> > +     val = WM_ADDR_NO_SYNC_DEFAULT_VAL;
> > +     writel_relaxed(val, vfe->base + VFE_BUS_WM_ADDR_SYNC_NO_SYNC);
> > +
> > +     writel_relaxed(0xf, vfe->base + VFE_BUS_WM_BURST_LIMIT(wm));
> > +
> > +     val = WM_BUFFER_DEFAULT_WIDTH;
> > +     writel_relaxed(val, vfe->base + VFE_BUS_WM_BUFFER_WIDTH_CFG(wm));
> > +
> > +     val = 0;
> > +     writel_relaxed(val, vfe->base + VFE_BUS_WM_BUFFER_HEIGHT_CFG(wm));
> > +
> > +     val = 0;
> > +     writel_relaxed(val, vfe->base + VFE_BUS_WM_PACKER_CFG(wm)); // XXX 1 for PLAIN8?
>
> - C++ style comment
>
>    Also here and in several comments below you use the XXX tag which looks
>    more confusing than helpful for me. Would it be possible to expand such comments
>    to make them more explicit? Just a nitpick though.
>
> > +
> > +     /* Configure stride for RDIs */
> > +     //val = pix->plane_fmt[0].bytesperline;
>
> - the commented out line should probably be removed. Or changed into real
>    comment.

Will do! Thanks for finding this.

>
> Thanks,
> Andrey
>
> > +     val = WM_STRIDE_DEFAULT_STRIDE;
> > +     writel_relaxed(val, vfe->base + VFE_BUS_WM_STRIDE(wm));
> > +
> > +     /* Enable WM */
> > +     val = 1 << WM_CFG_EN |
> > +           MODE_MIPI_RAW << WM_CFG_MODE;
> > +     writel_relaxed(val, vfe->base + VFE_BUS_WM_CFG(wm));
> > +}
> > +
> > +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> > +{
> > +     /* Disable WM */
> > +     writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
> > +}
> > +
> > +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> > +                       struct vfe_line *line)
> > +{
> > +     /* XXX use cmdbuf for this ?? */
> > +     struct v4l2_pix_format_mplane *pix =
> > +             &line->video_out.active_fmt.fmt.pix_mp;
> > +     u32 stride = pix->plane_fmt[0].bytesperline;
> > +
> > +     writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> > +     writel_relaxed(stride * pix->height, vfe->base + VFE_BUS_WM_FRAME_INC(wm));
> > +
> > +     /* XXX enable wm ? */
> > +}
> > +
> > +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> > +{
> > +     vfe->reg_update |= REG_UPDATE_line_n(line_id);
> > +
> > +     /* Enforce ordering between previous reg writes and reg update */
> > +     wmb();
> > +
> > +     writel_relaxed(vfe->reg_update, vfe->base + VFE_REG_UPDATE_CMD);
> > +
> > +     /* Enforce ordering between reg update and subsequent reg writes */
> > +     wmb();
> > +}
> > +
> > +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> > +                                     enum vfe_line_id line_id)
> > +{
> > +     vfe->reg_update &= ~REG_UPDATE_line_n(line_id);
> > +}
> > +
> > +static void vfe_enable_irq_common(struct vfe_device *vfe)
> > +{
> > +     vfe_reg_set(vfe, VFE_IRQ_MASK_0, ~0u);
> > +     vfe_reg_set(vfe, VFE_IRQ_MASK_1, ~0u);
> > +
> > +     writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(0));
> > +     writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(1));
> > +     writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(2));
> > +}
> > +
> > +static void vfe_isr_halt_ack(struct vfe_device *vfe)
> > +{
> > +     complete(&vfe->halt_complete);
> > +}
> > +
> > +static void vfe_isr_read(struct vfe_device *vfe, u32 *status0, u32 *status1)
> > +{
> > +     *status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
> > +     *status1 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_1);
> > +
> > +     writel_relaxed(*status0, vfe->base + VFE_IRQ_CLEAR_0);
> > +     writel_relaxed(*status1, vfe->base + VFE_IRQ_CLEAR_1);
> > +
> > +     /* Enforce ordering between IRQ Clear and Global IRQ Clear */
> > +     wmb();
> > +     writel_relaxed(CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
> > +}
> > +
> > +static void vfe_violation_read(struct vfe_device *vfe)
> > +{
> > +     u32 violation = readl_relaxed(vfe->base + VFE_VIOLATION_STATUS);
> > +
> > +     pr_err_ratelimited("VFE: violation = 0x%08x\n", violation);
> > +}
> > +
> > +/*
> > + * vfe_isr - VFE module interrupt handler
> > + * @irq: Interrupt line
> > + * @dev: VFE device
> > + *
> > + * Return IRQ_HANDLED on success
> > + */
> > +static irqreturn_t vfe_isr(int irq, void *dev)
> > +{
> > +     struct vfe_device *vfe = dev;
> > +     u32 status0, status1, vfe_bus_status[3];
> > +     int i, wm;
> > +
> > +     status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
> > +     status1 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_1);
> > +
> > +     writel_relaxed(status0, vfe->base + VFE_IRQ_CLEAR_0);
> > +     writel_relaxed(status1, vfe->base + VFE_IRQ_CLEAR_1);
> > +
> > +     for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++) {
> > +             vfe_bus_status[i] = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(i));
> > +             writel_relaxed(vfe_bus_status[i], vfe->base + VFE_BUS_IRQ_CLEAR(i));
> > +     }
> > +
> > +     /* Enforce ordering between IRQ reading and interpretation */
> > +     wmb();
> > +
> > +     writel_relaxed(CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
> > +     writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
> > +
> > +     if (status0 & STATUS_0_RESET_ACK)
> > +             vfe->isr_ops.reset_ack(vfe);
> > +
> > +     for (i = VFE_LINE_RDI0; i <= VFE_LINE_PIX; i++)
> > +             if (status0 & STATUS_0_line_n_REG_UPDATE(i))
> > +                     vfe->isr_ops.reg_update(vfe, i);
> > +
> > +     for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
> > +             if (status0 & STATUS_1_RDIn_SOF(i))
> > +                     vfe->isr_ops.sof(vfe, i);
> > +
> > +     for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
> > +             if (vfe_bus_status[0] & STATUS0_COMP_BUF_DONE(i))
> > +                     vfe->isr_ops.comp_done(vfe, i);
> > +
> > +     for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
> > +             if (status0 & BIT(9))
> > +                     if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
> > +                             vfe->isr_ops.wm_done(vfe, wm);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +/*
> > + * vfe_halt - Trigger halt on VFE module and wait to complete
> > + * @vfe: VFE device
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> > +static int vfe_halt(struct vfe_device *vfe)
> > +{
> > +     unsigned long time;
> > +
> > +     return 0;
> > +
> > +     reinit_completion(&vfe->halt_complete);
> > +
> > +     time = wait_for_completion_timeout(&vfe->halt_complete,
> > +             msecs_to_jiffies(VFE_HALT_TIMEOUT_MS));
> > +     if (!time) {
> > +             dev_err(vfe->camss->dev, "VFE halt timeout\n");
> > +             return -EIO;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int vfe_get_output(struct vfe_line *line)
> > +{
> > +     struct vfe_device *vfe = to_vfe(line);
> > +     struct vfe_output *output;
> > +     struct v4l2_format *f = &line->video_out.active_fmt;
> > +     unsigned long flags;
> > +     int i;
> > +     int wm_idx;
> > +
> > +     spin_lock_irqsave(&vfe->output_lock, flags);
> > +
> > +     output = &line->output;
> > +     if (output->state != VFE_OUTPUT_OFF) {
> > +             dev_err(vfe->camss->dev, "Output is running\n");
> > +             goto error;
> > +     }
> > +
> > +     switch (f->fmt.pix_mp.pixelformat) {
> > +     case V4L2_PIX_FMT_NV12:
> > +     case V4L2_PIX_FMT_NV21:
> > +     case V4L2_PIX_FMT_NV16:
> > +     case V4L2_PIX_FMT_NV61:
> > +             output->wm_num = 2;
> > +             break;
> > +     default:
> > +             output->wm_num = 1;
> > +             break;
> > +     }
> > +
> > +     for (i = 0; i < output->wm_num; i++) {
> > +             wm_idx = vfe_reserve_wm(vfe, line->id);
> > +             if (wm_idx < 0) {
> > +                     dev_err(vfe->camss->dev, "Can not reserve wm\n");
> > +                     goto error_get_wm;
> > +             }
> > +             output->wm_idx[i] = wm_idx;
> > +     }
> > +
> > +     output->drop_update_idx = 0;
> > +
> > +     spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +
> > +     return 0;
> > +
> > +error_get_wm:
> > +     for (i--; i >= 0; i--)
> > +             vfe_release_wm(vfe, output->wm_idx[i]);
> > +     output->state = VFE_OUTPUT_OFF;
> > +error:
> > +     spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int vfe_enable_output(struct vfe_line *line)
> > +{
> > +     struct vfe_device *vfe = to_vfe(line);
> > +     struct vfe_output *output = &line->output;
> > +     const struct vfe_hw_ops *ops = vfe->ops;
> > +     struct media_entity *sensor;
> > +     unsigned long flags;
> > +     unsigned int frame_skip = 0;
> > +     unsigned int i;
> > +
> > +     sensor = camss_find_sensor(&line->subdev.entity);
> > +     if (sensor) {
> > +             struct v4l2_subdev *subdev =
> > +                                     media_entity_to_v4l2_subdev(sensor);
> > +
> > +             v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
> > +             /* Max frame skip is 29 frames */
> > +             if (frame_skip > VFE_FRAME_DROP_VAL - 1)
> > +                     frame_skip = VFE_FRAME_DROP_VAL - 1;
> > +     }
> > +
> > +     spin_lock_irqsave(&vfe->output_lock, flags);
> > +
> > +     ops->reg_update_clear(vfe, line->id);
> > +
> > +     if (output->state != VFE_OUTPUT_OFF) {
> > +             dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
> > +                     output->state);
> > +             spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +             return -EINVAL;
> > +     }
> > +
> > +     WARN_ON(output->gen2.active_num);
> > +
> > +     output->state = VFE_OUTPUT_ON;
> > +
> > +     output->sequence = 0;
> > +     output->wait_reg_update = 0;
> > +     reinit_completion(&output->reg_update);
> > +
> > +     if (line->id != VFE_LINE_PIX)
> > +             vfe_wm_start(vfe, output->wm_idx[0], line);
> > +
> > +     for (i = 0; i < 2; i++) {
> > +             output->buf[i] = vfe_buf_get_pending(output);
> > +             if (!output->buf[i])
> > +                     break;
> > +             output->gen2.active_num++;
> > +             vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
> > +     }
> > +
> > +     ops->reg_update(vfe, line->id);
> > +
> > +     spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static int vfe_disable_output(struct vfe_line *line)
> > +{
> > +     struct vfe_device *vfe = to_vfe(line);
> > +     struct vfe_output *output = &line->output;
> > +     unsigned long flags;
> > +     unsigned int i;
> > +     bool done;
> > +     int timeout = 0;
> > +
> > +     do {
> > +             spin_lock_irqsave(&vfe->output_lock, flags);
> > +             done = !output->gen2.active_num;
> > +             spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +             usleep_range(10000, 20000);
> > +
> > +             if (timeout++ == 100) {
> > +                     dev_err(vfe->camss->dev, "VFE idle timeout - resetting\n");
> > +                     vfe_reset(vfe);
> > +                     output->gen2.active_num = 0;
> > +                     return 0;
> > +             }
> > +     } while (!done);
> > +
> > +     spin_lock_irqsave(&vfe->output_lock, flags);
> > +     for (i = 0; i < output->wm_num; i++)
> > +             vfe_wm_stop(vfe, output->wm_idx[i]);
> > +     spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * vfe_enable - Enable streaming on VFE line
> > + * @line: VFE line
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> > +static int vfe_enable(struct vfe_line *line)
> > +{
> > +     struct vfe_device *vfe = to_vfe(line);
> > +     int ret;
> > +
> > +     mutex_lock(&vfe->stream_lock);
> > +
> > +     if (!vfe->stream_count)
> > +             vfe_enable_irq_common(vfe);
> > +
> > +     vfe->stream_count++;
> > +
> > +     mutex_unlock(&vfe->stream_lock);
> > +
> > +     ret = vfe_get_output(line);
> > +     if (ret < 0)
> > +             goto error_get_output;
> > +
> > +     ret = vfe_enable_output(line);
> > +     if (ret < 0)
> > +             goto error_enable_output;
> > +
> > +     vfe->was_streaming = 1;
> > +
> > +     return 0;
> > +
> > +
> > +error_enable_output:
> > +     vfe_put_output(line);
> > +
> > +error_get_output:
> > +     mutex_lock(&vfe->stream_lock);
> > +
> > +     vfe->stream_count--;
> > +
> > +     mutex_unlock(&vfe->stream_lock);
> > +
> > +     return ret;
> > +}
> > +
> > +/*
> > + * vfe_disable - Disable streaming on VFE line
> > + * @line: VFE line
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> > +static int vfe_disable(struct vfe_line *line)
> > +{
> > +     struct vfe_device *vfe = to_vfe(line);
> > +
> > +     vfe_disable_output(line);
> > +
> > +     vfe_put_output(line);
> > +
> > +     mutex_lock(&vfe->stream_lock);
> > +
> > +     vfe->stream_count--;
> > +
> > +     mutex_unlock(&vfe->stream_lock);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * vfe_isr_sof - Process start of frame interrupt
> > + * @vfe: VFE Device
> > + * @line_id: VFE line
> > + */
> > +static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
> > +{
> > +
> > +}
> > +
> > +/*
> > + * vfe_isr_reg_update - Process reg update interrupt
> > + * @vfe: VFE Device
> > + * @line_id: VFE line
> > + */
> > +static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> > +{
> > +     struct vfe_output *output;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&vfe->output_lock, flags);
> > +     vfe->ops->reg_update_clear(vfe, line_id);
> > +
> > +     output = &vfe->line[line_id].output;
> > +
> > +     if (output->wait_reg_update) {
> > +             output->wait_reg_update = 0;
> > +             complete(&output->reg_update);
> > +     }
> > +
> > +     spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +}
> > +
> > +/*
> > + * vfe_isr_wm_done - Process write master done interrupt
> > + * @vfe: VFE Device
> > + * @wm: Write master id
> > + */
> > +static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
> > +{
> > +     struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
> > +     struct camss_buffer *ready_buf;
> > +     struct vfe_output *output;
> > +     unsigned long flags;
> > +     u32 index;
> > +     u64 ts = ktime_get_ns();
> > +
> > +     spin_lock_irqsave(&vfe->output_lock, flags);
> > +
> > +     if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
> > +             dev_err_ratelimited(vfe->camss->dev,
> > +                                 "Received wm done for unmapped index\n");
> > +             goto out_unlock;
> > +     }
> > +     output = &vfe->line[vfe->wm_output_map[wm]].output;
> > +
> > +     ready_buf = output->buf[0];
> > +     if (!ready_buf) {
> > +             dev_err_ratelimited(vfe->camss->dev,
> > +                                 "Missing ready buf %d!\n", output->state);
> > +             goto out_unlock;
> > +     }
> > +
> > +     ready_buf->vb.vb2_buf.timestamp = ts;
> > +     ready_buf->vb.sequence = output->sequence++;
> > +
> > +     index = 0;
> > +     output->buf[0] = output->buf[1];
> > +     if (output->buf[0])
> > +             index = 1;
> > +
> > +     output->buf[index] = vfe_buf_get_pending(output);
> > +
> > +     if (output->buf[index])
> > +             vfe_wm_update(vfe, output->wm_idx[0], output->buf[index]->addr[0], line);
> > +     else
> > +             output->gen2.active_num--;
> > +
> > +     spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +
> > +     vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> > +
> > +     return;
> > +
> > +out_unlock:
> > +     spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +}
> > +
> > +/*
> > + * vfe_queue_buffer - Add empty buffer
> > + * @vid: Video device structure
> > + * @buf: Buffer to be enqueued
> > + *
> > + * Add an empty buffer - depending on the current number of buffers it will be
> > + * put in pending buffer queue or directly given to the hardware to be filled.
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> > +static int vfe_queue_buffer(struct camss_video *vid,
> > +                         struct camss_buffer *buf)
> > +{
> > +     struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
> > +     struct vfe_device *vfe = to_vfe(line);
> > +     struct vfe_output *output;
> > +     unsigned long flags;
> > +
> > +     output = &line->output;
> > +
> > +     spin_lock_irqsave(&vfe->output_lock, flags);
> > +
> > +     if (output->state == VFE_OUTPUT_ON && output->gen2.active_num < 2) {
> > +             output->buf[output->gen2.active_num++] = buf;
> > +             vfe_wm_update(vfe, output->wm_idx[0], buf->addr[0], line);
> > +     } else {
> > +             vfe_buf_add_pending(output, buf);
> > +     }
> > +
> > +     spin_unlock_irqrestore(&vfe->output_lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +const struct vfe_isr_ops vfe_isr_ops_170 = {
> > +     .reset_ack = vfe_isr_reset_ack,
> > +     .halt_ack = vfe_isr_halt_ack,
> > +     .reg_update = vfe_isr_reg_update,
> > +     .sof = vfe_isr_sof,
> > +     .comp_done = vfe_isr_comp_done,
> > +     .wm_done = vfe_isr_wm_done,
> > +};
> > +
> > +static const struct camss_video_ops vfe_video_ops_170 = {
> > +     .queue_buffer = vfe_queue_buffer,
> > +     .flush_buffers = vfe_flush_buffers,
> > +};
> > +
> > +static void vfe_subdev_init(struct vfe_device *vfe)
> > +{
> > +     vfe->isr_ops = vfe_isr_ops_170;
> > +     vfe->video_ops = vfe_video_ops_170;
> > +}
> > +
> > +const struct vfe_hw_ops vfe_ops_170 = {
> > +     .global_reset = vfe_global_reset,
> > +     .hw_version_read = vfe_hw_version_read,
> > +     .isr_read = vfe_isr_read,
> > +     .isr = vfe_isr,
> > +     .reg_update_clear = vfe_reg_update_clear,
> > +     .reg_update = vfe_reg_update,
> > +     .subdev_init = vfe_subdev_init,
> > +     .vfe_disable = vfe_disable,
> > +     .vfe_enable = vfe_enable,
> > +     .vfe_halt = vfe_halt,
> > +     .violation_read = vfe_violation_read,
> > +};
> > +
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> > index 2ffa5b3c5426..5a874b544391 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -96,6 +96,39 @@ static const struct vfe_format formats_pix_8x96[] = {
> >       { MEDIA_BUS_FMT_YVYU8_2X8, 8 },
> >   };
> >
> > +static const struct vfe_format formats_rdi_845[] = {
> > +     { MEDIA_BUS_FMT_UYVY8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_VYUY8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_YUYV8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_YVYU8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
> > +     { MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
> > +     { MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
> > +     { MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
> > +     { MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16 },
> > +     { MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
> > +     { MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
> > +     { MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
> > +     { MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> > +     { MEDIA_BUS_FMT_SBGGR14_1X14, 14 },
> > +     { MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
> > +     { MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
> > +     { MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
> > +     { MEDIA_BUS_FMT_Y10_1X10, 10 },
> > +     { MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
> > +};
> > +
> > +static const struct vfe_format formats_pix_845[] = {
> > +     { MEDIA_BUS_FMT_UYVY8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_VYUY8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_YUYV8_2X8, 8 },
> > +     { MEDIA_BUS_FMT_YVYU8_2X8, 8 },
> > +};
> > +
> >   /*
> >    * vfe_get_bpp - map media bus format to bits per pixel
> >    * @formats: supported media bus formats array
> > @@ -192,7 +225,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
> >                       return sink_code;
> >               }
> >       else if (vfe->camss->version == CAMSS_8x96 ||
> > -              vfe->camss->version == CAMSS_660)
> > +              vfe->camss->version == CAMSS_660 ||
> > +              vfe->camss->version == CAMSS_845)
> >               switch (sink_code) {
> >               case MEDIA_BUS_FMT_YUYV8_2X8:
> >               {
> > @@ -256,13 +290,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
> >               return 0;
> >   }
> >
> > -/*
> > - * vfe_reset - Trigger reset on VFE module and wait to complete
> > - * @vfe: VFE device
> > - *
> > - * Return 0 on success or a negative error code otherwise
> > - */
> > -static int vfe_reset(struct vfe_device *vfe)
> > +int vfe_reset(struct vfe_device *vfe)
> >   {
> >       unsigned long time;
> >
> > @@ -429,7 +457,8 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
> >               struct camss_clock *clock = &vfe->clock[i];
> >
> >               if (!strcmp(clock->name, "vfe0") ||
> > -                 !strcmp(clock->name, "vfe1")) {
> > +                 !strcmp(clock->name, "vfe1") ||
> > +                 !strcmp(clock->name, "vfe_lite")) {
> >                       u64 min_rate = 0;
> >                       long rate;
> >
> > @@ -1268,6 +1297,10 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
> >       case CAMSS_660:
> >               vfe->ops = &vfe_ops_4_8;
> >               break;
> > +
> > +     case CAMSS_845:
> > +             vfe->ops = &vfe_ops_170;
> > +             break;
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -1379,6 +1412,14 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
> >                               l->formats = formats_rdi_8x96;
> >                               l->nformats = ARRAY_SIZE(formats_rdi_8x96);
> >                       }
> > +             } else if (camss->version == CAMSS_845) {
> > +                     if (i == VFE_LINE_PIX) {
> > +                             l->formats = formats_pix_845;
> > +                             l->nformats = ARRAY_SIZE(formats_pix_845);
> > +                     } else {
> > +                             l->formats = formats_rdi_845;
> > +                             l->nformats = ARRAY_SIZE(formats_rdi_845);
> > +                     }
> >               } else {
> >                       return -EINVAL;
> >               }
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> > index 8629c833f130..a0b618c9cec8 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> > @@ -19,7 +19,6 @@
> >   #include "camss-video.h"
> >   #include "camss-vfe-gen1.h"
> >
> > -
> >   #define MSM_VFE_PAD_SINK 0
> >   #define MSM_VFE_PAD_SRC 1
> >   #define MSM_VFE_PADS_NUM 2
> > @@ -39,14 +38,14 @@
> >   #define to_vfe(ptr_line)    \
> >       container_of(vfe_line_array(ptr_line), struct vfe_device, line)
> >
> > -
> >   enum vfe_output_state {
> >       VFE_OUTPUT_OFF,
> >       VFE_OUTPUT_RESERVED,
> >       VFE_OUTPUT_SINGLE,
> >       VFE_OUTPUT_CONTINUOUS,
> >       VFE_OUTPUT_IDLE,
> > -     VFE_OUTPUT_STOPPING
> > +     VFE_OUTPUT_STOPPING,
> > +     VFE_OUTPUT_ON,
> >   };
> >
> >   enum vfe_line_id {
> > @@ -72,6 +71,9 @@ struct vfe_output {
> >                       int active_buf;
> >                       int wait_sof;
> >               } gen1;
> > +             struct {
> > +                     int active_num;
> > +             } gen2;
> >       };
> >       enum vfe_output_state state;
> >       unsigned int sequence;
> > @@ -169,14 +171,6 @@ void vfe_buf_add_pending(struct vfe_output *output, struct camss_buffer *buffer)
> >
> >   struct camss_buffer *vfe_buf_get_pending(struct vfe_output *output);
> >
> > -/*
> > - * vfe_disable - Disable streaming on VFE line
> > - * @line: VFE line
> > - *
> > - * Return 0 on success or a negative error code otherwise
> > - */
> > -int vfe_disable(struct vfe_line *line);
> > -
> >   int vfe_flush_buffers(struct camss_video *vid, enum vb2_buffer_state state);
> >
> >   /*
> > @@ -191,8 +185,17 @@ int vfe_put_output(struct vfe_line *line);
> >   int vfe_release_wm(struct vfe_device *vfe, u8 wm);
> >   int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id);
> >
> > +/*
> > + * vfe_reset - Trigger reset on VFE module and wait to complete
> > + * @vfe: VFE device
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> > +int vfe_reset(struct vfe_device *vfe);
> > +
> >   extern const struct vfe_hw_ops vfe_ops_4_1;
> >   extern const struct vfe_hw_ops vfe_ops_4_7;
> >   extern const struct vfe_hw_ops vfe_ops_4_8;
> > +extern const struct vfe_hw_ops vfe_ops_170;
> >
> >   #endif /* QC_MSM_CAMSS_VFE_H */
> > diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> > index bd9334af1c73..b4943df9eaf6 100644
> > --- a/drivers/media/platform/qcom/camss/camss-video.c
> > +++ b/drivers/media/platform/qcom/camss/camss-video.c
> > @@ -133,6 +133,55 @@ static const struct camss_format_info formats_rdi_8x96[] = {
> >         { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> >   };
> >
> > +static const struct camss_format_info formats_rdi_845[] = {
> > +     { MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_UYVY, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +     { MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_VYUY, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +     { MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_YUYV, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +     { MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_YVYU, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +     { MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_PIX_FMT_SGBRG8, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_PIX_FMT_SGRBG8, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_PIX_FMT_SRGGB8, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_SBGGR10_1X10, V4L2_PIX_FMT_SBGGR10P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> > +     { MEDIA_BUS_FMT_SGBRG10_1X10, V4L2_PIX_FMT_SGBRG10P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> > +     { MEDIA_BUS_FMT_SGRBG10_1X10, V4L2_PIX_FMT_SGRBG10P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> > +     { MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_PIX_FMT_SRGGB10P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> > +     { MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, V4L2_PIX_FMT_SBGGR10, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +     { MEDIA_BUS_FMT_SBGGR12_1X12, V4L2_PIX_FMT_SBGGR12P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> > +     { MEDIA_BUS_FMT_SGBRG12_1X12, V4L2_PIX_FMT_SGBRG12P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> > +     { MEDIA_BUS_FMT_SGRBG12_1X12, V4L2_PIX_FMT_SGRBG12P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> > +     { MEDIA_BUS_FMT_SRGGB12_1X12, V4L2_PIX_FMT_SRGGB12P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> > +     { MEDIA_BUS_FMT_SBGGR14_1X14, V4L2_PIX_FMT_SBGGR14P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> > +     { MEDIA_BUS_FMT_SGBRG14_1X14, V4L2_PIX_FMT_SGBRG14P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> > +     { MEDIA_BUS_FMT_SGRBG14_1X14, V4L2_PIX_FMT_SGRBG14P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> > +     { MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> > +     { MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> > +     { MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +};
> > +
> >   static const struct camss_format_info formats_pix_8x16[] = {
> >       { MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> >         { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > @@ -211,6 +260,49 @@ static const struct camss_format_info formats_pix_8x96[] = {
> >         { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> >   };
> >
> > +static const struct camss_format_info formats_pix_845[] = {
> > +     { MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> > +       { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> > +       { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> > +       { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> > +       { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> > +       { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> > +       { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> > +       { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> > +       { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_NV16, 1,
> > +       { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_NV16, 1,
> > +       { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_NV16, 1,
> > +       { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_NV16, 1,
> > +       { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_NV61, 1,
> > +       { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_NV61, 1,
> > +       { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_NV61, 1,
> > +       { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_NV61, 1,
> > +       { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> > +     { MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_UYVY, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +     { MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_VYUY, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +     { MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_YUYV, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +     { MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_YVYU, 1,
> > +       { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> > +};
> > +
> >   /* -----------------------------------------------------------------------------
> >    * Helper functions
> >    */
> > @@ -960,6 +1052,14 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
> >                       video->formats = formats_rdi_8x96;
> >                       video->nformats = ARRAY_SIZE(formats_rdi_8x96);
> >               }
> > +     }  else if (video->camss->version == CAMSS_845) {
> > +             if (is_pix) {
> > +                     video->formats = formats_pix_845;
> > +                     video->nformats = ARRAY_SIZE(formats_pix_845);
> > +             } else {
> > +                     video->formats = formats_rdi_845;
> > +                     video->nformats = ARRAY_SIZE(formats_rdi_845);
> > +             }
> >       } else {
> >               goto error_video_register;
> >       }
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > index aeec59bc6194..1c3d64d612ff 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -465,6 +465,67 @@ static const struct resources vfe_res_660[] = {
> >       }
> >   };
> >
> > +static const struct resources vfe_res_845[] = {
> > +     /* VFE0 */
> > +     {
> > +             .regulator = { NULL },
> > +             .clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
> > +                             "soc_ahb", "vfe0", "vfe0_axi",
> > +                             "vfe0_src", "csi0",
> > +                             "csi0_src"},
> > +             .clock_rate = { { 0 },
> > +                             { 0 },
> > +                             { 80000000 },
> > +                             { 0 },
> > +                             { 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
> > +                             { 0 },
> > +                             { 320000000 },
> > +                             { 19200000, 75000000, 384000000, 538666667 },
> > +                             { 384000000 } },
> > +             .reg = { "vfe0" },
> > +             .interrupt = { "vfe0" }
> > +     },
> > +
> > +     /* VFE1 */
> > +     {
> > +             .regulator = { NULL },
> > +             .clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
> > +                             "soc_ahb", "vfe1", "vfe1_axi",
> > +                             "vfe1_src", "csi1",
> > +                             "csi1_src"},
> > +             .clock_rate = { { 0 },
> > +                             { 0 },
> > +                             { 80000000 },
> > +                             { 0 },
> > +                             { 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
> > +                             { 0 },
> > +                             { 320000000 },
> > +                             { 19200000, 75000000, 384000000, 538666667 },
> > +                             { 384000000 } },
> > +             .reg = { "vfe1" },
> > +             .interrupt = { "vfe1" }
> > +     },
> > +
> > +     /* VFE-lite */
> > +     {
> > +             .regulator = { NULL },
> > +             .clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
> > +                             "soc_ahb", "vfe_lite",
> > +                             "vfe_lite_src", "csi2",
> > +                             "csi2_src"},
> > +             .clock_rate = { { 0 },
> > +                             { 0 },
> > +                             { 80000000 },
> > +                             { 0 },
> > +                             { 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
> > +                             { 320000000 },
> > +                             { 19200000, 75000000, 384000000, 538666667 },
> > +                             { 384000000 } },
> > +             .reg = { "vfe_lite" },
> > +             .interrupt = { "vfe_lite" }
> > +     }
> > +};
> > +
> >   /*
> >    * camss_add_clock_margin - Add margin to clock frequency rate
> >    * @rate: Clock frequency rate
> >
