Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05C6395979
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhEaLNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhEaLNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:13:46 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE97C061760
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:12:06 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id 11so1563469plk.12
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x/l5Ktt9uOtgP8qHkFSa6STZdcx8c0/6ABhZ+2M/nSw=;
        b=Wz4I7tWJccqyGeNNUm6ml2yW+9pRmBZixk7i7oSXQYnuwzRHJj4UHRQ9bbvDWY0LEm
         ct4EW3Afd4V6nvnvuBWVpSkkF+4XoMYSgFzxy0q7k3TxjI7+bSKFhskGTjxw3KQYd2BW
         B1xy5hMWT5WcOjSvSZKXiUFO28bD82JU5gVDpVBgT65pqdpgPVeAP+TQ6Ze++irdH84s
         w7gk+TpR4QyRo6+5knp4+SVSV2WXAPGDANxug0DemPEA76goKCxeKTE2vvKeRE1rgExI
         ukUKzBJaPNVw86pFwACCgmvJKj2kUnnq1e3XOOcEZZpkOAWDNK+NIcBMYKqowFs8RdAP
         JXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x/l5Ktt9uOtgP8qHkFSa6STZdcx8c0/6ABhZ+2M/nSw=;
        b=hlGu18JPFvrtUVmYQA3o9YjABGkVfJqcIdnQufi2+zxZHIZv0sAPUr8chuCFHyMcRs
         4CvicDxJ4OwEgIdH91F2moAFKw00Jjf7koVYP3xBSSUtutDMmreH1cbRdYZohj0ryAbi
         cPDaObBxPLL6hhipz9o3y3d/6ItZU2155Wv+T7G9G17Ps8MfI+RrCJ3FkqnrJsBIKLA7
         Wf/sH4NSK4+f9AlV+4lM4PbXEmXbW+YmOyGv13vs/Nw/AWoVPQ6m1Aoi+59TqKuaDXLm
         ONXmoEwxp7Omi0GDbVnyo0ghjgEl1hPmfwtnnRDMCuOkka9HI/RfsItAKjiuMVAWXF4A
         rdjw==
X-Gm-Message-State: AOAM531tcgA7BI9smybo0mgGq3GpvQxbuJoiU2l1cyhy4geMJrvjmf51
        4dkBby3ABNYezVnybpDNkHLQEJ/0sOJfct+pVNENMA==
X-Google-Smtp-Source: ABdhPJzfyWJyhV6SKME/dlvUc0Z4q1bm2l1mQxVZjQAKFk7H9k9yZUpGqoAzKG6G/qyStHd5XonEZDZl8L6SoK+RD4w=
X-Received: by 2002:a17:902:d104:b029:105:fff1:74ad with SMTP id
 w4-20020a170902d104b0290105fff174admr1808669plw.69.1622459525786; Mon, 31 May
 2021 04:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-13-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-13-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 31 May 2021 13:11:55 +0200
Message-ID: <CAG3jFyvOtEoTGVp8WaqNgeHB20PSmEXR6mJykyridAG55aa9rw@mail.gmail.com>
Subject: Re: [PATCH 12/17] media: camss: vfe-170: clean up some dead code
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> vfe_isr_read()/vfe_isr_halt_ack()/vfe_reg_clr() are never called.
>
> vfe_isr_sof() does nothing, remove it.
>
> The only vfe_reg_set() usage can be easily replaced with a writel.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../media/platform/qcom/camss/camss-vfe-170.c | 53 +------------------
>  1 file changed, 2 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> index 8594d275b41d..076ca082e107 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> @@ -188,20 +188,6 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
>         dev_err(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
>  }
>
> -static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
> -{
> -       u32 bits = readl_relaxed(vfe->base + reg);
> -
> -       writel_relaxed(bits & ~clr_bits, vfe->base + reg);
> -}
> -
> -static inline void vfe_reg_set(struct vfe_device *vfe, u32 reg, u32 set_bits)
> -{
> -       u32 bits = readl_relaxed(vfe->base + reg);
> -
> -       writel_relaxed(bits | set_bits, vfe->base + reg);
> -}
> -
>  static void vfe_global_reset(struct vfe_device *vfe)
>  {
>         u32 reset_bits = GLOBAL_RESET_CMD_CORE          |
> @@ -305,32 +291,14 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>
>  static void vfe_enable_irq_common(struct vfe_device *vfe)
>  {
> -       vfe_reg_set(vfe, VFE_IRQ_MASK_0, ~0u);
> -       vfe_reg_set(vfe, VFE_IRQ_MASK_1, ~0u);
> +       writel_relaxed(~0u, vfe->base + VFE_IRQ_MASK_0);
> +       writel_relaxed(~0u, vfe->base + VFE_IRQ_MASK_1);
>
>         writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(0));
>         writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(1));
>         writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(2));
>  }
>
> -static void vfe_isr_halt_ack(struct vfe_device *vfe)
> -{
> -       complete(&vfe->halt_complete);
> -}
> -
> -static void vfe_isr_read(struct vfe_device *vfe, u32 *status0, u32 *status1)
> -{
> -       *status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
> -       *status1 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_1);
> -
> -       writel_relaxed(*status0, vfe->base + VFE_IRQ_CLEAR_0);
> -       writel_relaxed(*status1, vfe->base + VFE_IRQ_CLEAR_1);
> -
> -       /* Enforce ordering between IRQ Clear and Global IRQ Clear */
> -       wmb();
> -       writel_relaxed(CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
> -}
> -
>  static void vfe_violation_read(struct vfe_device *vfe)
>  {
>         u32 violation = readl_relaxed(vfe->base + VFE_VIOLATION_STATUS);
> @@ -375,10 +343,6 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>                 if (status0 & STATUS_0_RDI_REG_UPDATE(i))
>                         vfe->isr_ops.reg_update(vfe, i);
>
> -       for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
> -               if (status0 & STATUS_1_RDI_SOF(i))
> -                       vfe->isr_ops.sof(vfe, i);
> -
>         for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
>                 if (vfe_bus_status[0] & STATUS0_COMP_BUF_DONE(i))
>                         vfe->isr_ops.comp_done(vfe, i);
> @@ -607,16 +571,6 @@ static int vfe_disable(struct vfe_line *line)
>         return 0;
>  }
>
> -/*
> - * vfe_isr_sof - Process start of frame interrupt
> - * @vfe: VFE Device
> - * @line_id: VFE line
> - */
> -static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
> -{
> -       /* nop */
> -}
> -
>  /*
>   * vfe_isr_reg_update - Process reg update interrupt
>   * @vfe: VFE Device
> @@ -749,9 +703,7 @@ static int vfe_queue_buffer(struct camss_video *vid,
>
>  static const struct vfe_isr_ops vfe_isr_ops_170 = {
>         .reset_ack = vfe_isr_reset_ack,
> -       .halt_ack = vfe_isr_halt_ack,
>         .reg_update = vfe_isr_reg_update,
> -       .sof = vfe_isr_sof,
>         .comp_done = vfe_isr_comp_done,
>         .wm_done = vfe_isr_wm_done,
>  };
> @@ -772,7 +724,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>  const struct vfe_hw_ops vfe_ops_170 = {
>         .global_reset = vfe_global_reset,
>         .hw_version_read = vfe_hw_version_read,
> -       .isr_read = vfe_isr_read,
>         .isr = vfe_isr,
>         .pm_domain_off = vfe_pm_domain_off,
>         .pm_domain_on = vfe_pm_domain_on,

Gen1 & gen2 seem to diverge in terms of which ISR & helpers are
needed. Should the vfe_isr_ops & vfe_hw_ops structs have generation
based versions? I'm fine with a no here. There are diminishing returns
to this pedantism.

With ^^^ covered, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
