Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97673A0790
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 01:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbhFHXMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 19:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbhFHXL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 19:11:59 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C79C061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 16:10:05 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id l17so12456385qtq.12
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3iREX/TCP6LJH8A+nFKwqAUN/Sh0UoIQJ/aYQ6z08s0=;
        b=wGVkMU69fS0AnElArGjlL/hAbIzZfHaG2QhdzdnJzQEhg/j4Pap730ENjOkX4xMvh1
         fdnJHHV45Z4GL21BsHFsmVAMbJQ4voj0ZLVa4i3E0cK+C3Sxgpfc0BW4MbHndMvHclbj
         8NJ+v6yxk6gtjSePtr5E/XAAsJ3r29oENltaplBksq3ALRX2lsDQkOt4oWH2vDX0XG4g
         v+fhxyLaJAm4fX6W1iM9l+ZPPnLXJICf+pfFuVaN8t8QMgA5M9Hme0Uj6dTi2g3crWpb
         r0uz+hy2X5lE3N/JEzlLpCyTSqikaBJRkSdAGk/o+h5Q8gnV+DTimBx89u6WfeJAFYGw
         8FWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3iREX/TCP6LJH8A+nFKwqAUN/Sh0UoIQJ/aYQ6z08s0=;
        b=anx+uyQnP1CeZbot5qdNxOeaP0r1uV+bL2aqLsAM8+dNl8xFwnJ1q4RtohceUtVdlH
         PW/Oy/6wgUKcyHCU6S6nqHJ3MT/Frag01FWJggzTY3zLMAXjUHiwvy+4Re0LrRwbrOzs
         O1jkp2/lc5mxniTKlINqZrwJtuubItja9LwTQrUnzM2pwkzm3e/M4BIhkrD91NPIWwWL
         LPYhJuncvLXtVZCGPr55E/uzpr3bdYQpwONuUvoffW/WiQIQ05H8al8gis3E6KU0xnML
         ryAq/OvuBZ/+ThlL3/5j4QgI6fZyG+8EPHjbIbdzSLprmrVNvvDKXJ3s26wh59hSTRQw
         YqAQ==
X-Gm-Message-State: AOAM532+gWUiVWXSd6weLBlfAQbUA2zTMP+uiB9Ndhnzm/jImbVUZEpK
        smxb7sGI3qt+ZwjjLjxtzZB/0OtjcNfkTYzzmuRy1Q==
X-Google-Smtp-Source: ABdhPJy/xUqbeyjrVrJgYcY0UYe0cf/qacFnN7A3o+IT61XxWb5Tlj5sqGODy/2iyb5BTSqaOkmdYA==
X-Received: by 2002:ac8:7f88:: with SMTP id z8mr3464130qtj.17.1623193803882;
        Tue, 08 Jun 2021 16:10:03 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id j62sm12930126qkf.125.2021.06.08.16.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 16:10:03 -0700 (PDT)
Subject: Re: [PATCH 14/17] media: camss: Add initial support for VFE hardware
 version Titan 480
To:     Robert Foss <robert.foss@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>
References: <20210511180728.23781-1-jonathan@marek.ca>
 <20210511180728.23781-15-jonathan@marek.ca>
 <CAG3jFytV1cchKPZP0_1qN+D9JUnhNDo6fJzEqz7e8LM7p4fysQ@mail.gmail.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <642d1669-32e1-624c-287a-7f51c45d48b8@marek.ca>
Date:   Tue, 8 Jun 2021 19:08:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAG3jFytV1cchKPZP0_1qN+D9JUnhNDo6fJzEqz7e8LM7p4fysQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/31/21 8:13 AM, Robert Foss wrote:
> Hey Jonathan,
> 
> Thanks for sending this out.
> 
> There are a few checkpatch --strict warnings/etc. in this patch. I
> won't cover them individually below.
> 
> On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Add support for VFE found on SM8250 (Titan 480). This implementation is
>> based on the titan 170 implementation. It supports the normal and lite VFE,
>> and only supports the RDI0 capture path.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>   .../media/platform/qcom/camss/camss-vfe-480.c | 554 ++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>>   3 files changed, 556 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
>> index 0752c46ea37b..81dd56aff0f2 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -15,6 +15,7 @@ qcom-camss-objs += \
>>                  camss-vfe-4-7.o \
>>                  camss-vfe-4-8.o \
>>                  camss-vfe-170.o \
>> +               camss-vfe-480.o \
>>                  camss-vfe-gen1.o \
>>                  camss-vfe.o \
>>                  camss-video.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
>> new file mode 100644
>> index 000000000000..79210fabbc2a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
>> @@ -0,0 +1,554 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-vfe-480.c
>> + *
>> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v480 (SM8250)
>> + *
>> + * Copyright (C) 2020-2021 Linaro Ltd.
>> + * Copyright (C) 2021 Jonathan Marek
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +
>> +#include "camss.h"
>> +#include "camss-vfe.h"
>> +
>> +/* VFE 2/3 are lite and have a different register layout */
>> +#define IS_LITE                (vfe->id >= 2 ? 1 : 0)
>> +
>> +#define VFE_HW_VERSION                 (0x00)
>> +
>> +#define VFE_GLOBAL_RESET_CMD           (IS_LITE ? 0x0c : 0x1c)
>> +#define            GLOBAL_RESET_HW_AND_REG     (IS_LITE ? BIT(1) : BIT(0))
>> +
>> +#define VFE_REG_UPDATE_CMD             (IS_LITE ? 0x20 : 0x34)
>> +#define            REG_UPDATE_RDI(n)           (IS_LITE ? BIT(n) : BIT(1 + (n)))
>> +#define VFE_IRQ_CMD                    (IS_LITE ? 0x24 : 0x38)
>> +#define     IRQ_CMD_GLOBAL_CLEAR       BIT(0)
>> +
>> +#define VFE_IRQ_MASK(n)                        ((IS_LITE ? 0x28 : 0x3c) + (n) * 4)
>> +#define            IRQ_MASK_0_RESET_ACK        (IS_LITE ? BIT(17) : BIT(0))
>> +#define            IRQ_MASK_0_BUS_TOP_IRQ      (IS_LITE ? BIT(4) : BIT(7))
>> +#define VFE_IRQ_CLEAR(n)               ((IS_LITE ? 0x34 : 0x48) + (n) * 4)
>> +#define VFE_IRQ_STATUS(n)              ((IS_LITE ? 0x40 : 0x54) + (n) * 4)
>> +
>> +#define BUS_REG_BASE                   (IS_LITE ? 0x1a00 : 0xaa00)
>> +
>> +#define VFE_BUS_WM_CGC_OVERRIDE                (BUS_REG_BASE + 0x08)
>> +#define                WM_CGC_OVERRIDE_ALL     (0x3FFFFFF)
>> +
>> +#define VFE_BUS_WM_TEST_BUS_CTRL       (BUS_REG_BASE + 0xdc)
>> +
>> +#define VFE_BUS_IRQ_MASK(n)            (BUS_REG_BASE + 0x18 + (n) * 4)
>> +#define     BUS_IRQ_MASK_0_RDI_RUP(n)  (IS_LITE ? BIT(n) : BIT(3 + (n)))
>> +#define     BUS_IRQ_MASK_0_COMP_DONE(n)        (IS_LITE ? BIT(4 + (n)) : BIT(6 + (n)))
>> +#define VFE_BUS_IRQ_CLEAR(n)           (BUS_REG_BASE + 0x20 + (n) * 4)
>> +#define VFE_BUS_IRQ_STATUS(n)          (BUS_REG_BASE + 0x28 + (n) * 4)
>> +#define VFE_BUS_IRQ_CLEAR_GLOBAL       (BUS_REG_BASE + 0x30)
>> +
>> +#define VFE_BUS_WM_CFG(n)              (BUS_REG_BASE + 0x200 + (n) * 0x100)
>> +#define                WM_CFG_EN                       (0)
>> +#define                WM_CFG_MODE                     (16)
>> +#define                        MODE_QCOM_PLAIN (0)
>> +#define                        MODE_MIPI_RAW   (1)
>> +#define VFE_BUS_WM_IMAGE_ADDR(n)       (BUS_REG_BASE + 0x204 + (n) * 0x100)
>> +#define VFE_BUS_WM_FRAME_INCR(n)       (BUS_REG_BASE + 0x208 + (n) * 0x100)
>> +#define VFE_BUS_WM_IMAGE_CFG_0(n)      (BUS_REG_BASE + 0x20c + (n) * 0x100)
>> +#define                WM_IMAGE_CFG_0_DEFAULT_WIDTH    (0xFFFF)
>> +#define VFE_BUS_WM_IMAGE_CFG_1(n)      (BUS_REG_BASE + 0x210 + (n) * 0x100)
>> +#define VFE_BUS_WM_IMAGE_CFG_2(n)      (BUS_REG_BASE + 0x214 + (n) * 0x100)
>> +#define VFE_BUS_WM_PACKER_CFG(n)       (BUS_REG_BASE + 0x218 + (n) * 0x100)
>> +#define VFE_BUS_WM_HEADER_ADDR(n)      (BUS_REG_BASE + 0x220 + (n) * 0x100)
>> +#define VFE_BUS_WM_HEADER_INCR(n)      (BUS_REG_BASE + 0x224 + (n) * 0x100)
>> +#define VFE_BUS_WM_HEADER_CFG(n)       (BUS_REG_BASE + 0x228 + (n) * 0x100)
>> +
>> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)     (BUS_REG_BASE + 0x230 + (n) * 0x100)
>> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)    (BUS_REG_BASE + 0x234 + (n) * 0x100)
>> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)         (BUS_REG_BASE + 0x238 + (n) * 0x100)
>> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)                (BUS_REG_BASE + 0x23c + (n) * 0x100)
>> +
>> +#define VFE_BUS_WM_SYSTEM_CACHE_CFG(n) (BUS_REG_BASE + 0x260 + (n) * 0x100)
>> +#define VFE_BUS_WM_BURST_LIMIT(n)      (BUS_REG_BASE + 0x264 + (n) * 0x100)
>> +
>> +/* for titan 480, each bus client is hardcoded to a specific path
>> + * and each bus client is part of a hardcoded "comp group"
>> + */
>> +#define RDI_WM(n)                      ((IS_LITE ? 0 : 23) + n)
>> +#define RDI_COMP_GROUP(n)              ((IS_LITE ? 0 : 11) + n)
> 
> The indentation of the different types of defines above differ from
> vfe170, but I kind of prefer this style. Feel free to change either.
> 

Its not just the indentation, the naming style is a bit different too. 
Not sure its worth trying to make them fully consistent, but I wouldn't 
mind just changing the identation for 170.

>> +
>> +static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
>> +{
>> +       u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
>> +
>> +       u32 gen = (hw_version >> 28) & 0xF;
>> +       u32 rev = (hw_version >> 16) & 0xFFF;
>> +       u32 step = hw_version & 0xFFFF;
>> +
>> +       dev_dbg(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
>> +}
>> +
>> +static void vfe_global_reset(struct vfe_device *vfe)
>> +{
>> +       writel_relaxed(IRQ_MASK_0_RESET_ACK, vfe->base + VFE_IRQ_MASK(0));
>> +       writel_relaxed(GLOBAL_RESET_HW_AND_REG, vfe->base + VFE_GLOBAL_RESET_CMD);
>> +}
>> +
>> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>> +{
>> +       struct v4l2_pix_format_mplane *pix =
>> +               &line->video_out.active_fmt.fmt.pix_mp;
>> +
>> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
>> +
>> +       /* no clock gating at bus input */
>> +       writel_relaxed(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
>> +
>> +       writel_relaxed(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
>> +
>> +       writel_relaxed(pix->plane_fmt[0].bytesperline * pix->height,
>> +                      vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
>> +       writel_relaxed(0xf, vfe->base + VFE_BUS_WM_BURST_LIMIT(wm));
>> +       writel_relaxed(WM_IMAGE_CFG_0_DEFAULT_WIDTH,
>> +                      vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
>> +       writel_relaxed(pix->plane_fmt[0].bytesperline,
>> +                      vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
>> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> 
> ^^^ using more of the 130char line length is probably better for legibility.
> 

More than 100 line length is still a warning from checkpatch, and this 
is IMO more readable since all the "vfe->base + X" are more or less at 
the same indentation, and removing the line breaks would make it harder 
to see which registers are being updated.

>> +
>> +       /* no dropped frames, one irq per frame */
>> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
>> +       writel_relaxed(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
>> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
>> +       writel_relaxed(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
>> +
>> +       writel_relaxed(1 << WM_CFG_EN | MODE_MIPI_RAW << WM_CFG_MODE,
>> +                      vfe->base + VFE_BUS_WM_CFG(wm));
>> +}
>> +
>> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>> +{
>> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
>> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
>> +}
>> +
>> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>> +                         struct vfe_line *line)
>> +{
>> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
>> +       writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
>> +}
>> +
>> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>> +{
>> +       vfe->reg_update |= REG_UPDATE_RDI(line_id);
>> +       writel_relaxed(vfe->reg_update, vfe->base + VFE_REG_UPDATE_CMD);
>> +}
>> +
>> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>> +                                       enum vfe_line_id line_id)
>> +{
>> +       vfe->reg_update &= ~REG_UPDATE_RDI(line_id);
>> +}
>> +
>> +static void vfe_enable_irq_common(struct vfe_device *vfe)
>> +{
>> +       /* enable only the IRQs used: rup and comp_done irqs for RDI0 */
>> +       writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
>> +                      vfe->base + VFE_IRQ_MASK(0));
>> +       writel_relaxed(BUS_IRQ_MASK_0_RDI_RUP(0) |
>> +                      BUS_IRQ_MASK_0_COMP_DONE(RDI_COMP_GROUP(0)),
>> +                      vfe->base + VFE_BUS_IRQ_MASK(0));
>> +}
>> +
>> +/*
>> + * vfe_isr - VFE module interrupt handler
>> + * @irq: Interrupt line
>> + * @dev: VFE device
>> + *
>> + * Return IRQ_HANDLED on success
>> + */
>> +static irqreturn_t vfe_isr(int irq, void *dev)
>> +{
>> +       struct vfe_device *vfe = dev;
>> +       u32 status;
>> +
>> +       status = readl_relaxed(vfe->base + VFE_IRQ_STATUS(0));
>> +       writel_relaxed(status, vfe->base + VFE_IRQ_CLEAR(0));
>> +       writel_relaxed(IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
>> +
>> +       if (status & IRQ_MASK_0_RESET_ACK)
>> +               vfe->isr_ops.reset_ack(vfe);
>> +
>> +       if (status & IRQ_MASK_0_BUS_TOP_IRQ) {
>> +               u32 status = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(0));
>> +               writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
>> +               writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
>> +
>> +               if (status & BUS_IRQ_MASK_0_RDI_RUP(0))
>> +                       vfe->isr_ops.reg_update(vfe, 0);
>> +
>> +               if (status & BUS_IRQ_MASK_0_COMP_DONE(RDI_COMP_GROUP(0)))
>> +                       vfe->isr_ops.wm_done(vfe, 0);
> 
> COMP_DONE is signalled in the status register, but wm_done() is
> called. comp_done() seems to never be called.
> 

The current "vfe_isr_comp_done" is not relevant to RDI capture. Titan 
480 (unlike 170) now uses comp done IRQs for RDI too.

This is a bit of a hack. wm_done is called with wm=0, but the 
implementation passes it through RDI_WM(0) to map it to wm=23 (which is 
the WM for RDI0 - with titan 480 the WM paths are fixed).

...

>> +const struct vfe_hw_ops vfe_ops_480 = {
>> +       .global_reset = vfe_global_reset,
>> +       .hw_version_read = vfe_hw_version_read,
>> +       .isr = vfe_isr,
>> +       .pm_domain_off = vfe_pm_domain_off,
>> +       .pm_domain_on = vfe_pm_domain_on,
>> +       .reg_update_clear = vfe_reg_update_clear,
>> +       .reg_update = vfe_reg_update,
>> +       .subdev_init = vfe_subdev_init,
>> +       .vfe_disable = vfe_disable,
>> +       .vfe_enable = vfe_enable,
>> +       .vfe_halt = vfe_halt,
>> +};
> 
> Again there are some functions that could be refactored out to a vfe
> gen2 parent struct & object. This time I think it's worth refactoring
> out the common code, especially since we know more platforms based on
> this architecture are coming.
> 
> vfe_queue_buffer
> vfe_pm_domain_on
> vfe_pm_domain_off
> vfe_isr_wm_done
> vfe_isr_reg_update
> vfe_get_output (although vfe170 contains a frame_skip chunk that
> should be removed)
> vfe_halt
> 

In the current minimal implementation of both vfe-170 and vfe-480, most 
of these could be shared, but I think duplicating these few functions 
for now is fine, it can easily be resolved later. (there might be less 
shared code than expected if the titan 480 WMs are implementated fully 
instead of the "hack" I've used to support only RDI cases).

>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index 844b9275031d..83b11ae1572d 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -201,5 +201,6 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
>>   extern const struct vfe_hw_ops vfe_ops_4_7;
>>   extern const struct vfe_hw_ops vfe_ops_4_8;
>>   extern const struct vfe_hw_ops vfe_ops_170;
>> +extern const struct vfe_hw_ops vfe_ops_480;
>>
>>   #endif /* QC_MSM_CAMSS_VFE_H */
>> --
>> 2.26.1
>>
