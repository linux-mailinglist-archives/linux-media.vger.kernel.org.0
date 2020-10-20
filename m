Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1270B2937C3
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392656AbgJTJOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392637AbgJTJOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:14:48 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F181C061755
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 02:14:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d23so700187pll.7
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GgUTm7wJH0+BRi8dDrO/9JHL4EFO+jAdr22a/R5dUE4=;
        b=eMtxHibWARRLqoeW4sCOa4QI9fV0tMk9huMSb4iZpL7QmvStdAiADhOCqPLKdjLYN9
         0+dCfmlFFHela6luwDNMF/Tv6a/d+cjSdRTO13hSNiJ4oLu4/YT0xIM3+wQpvpxEE82X
         M7kPWKXpaVeflEQhOiSq+BWx9up3X76B+okSsx1etsLl8F9F7MYSiyBBHf1Y3uNzMQJL
         drp4qsvCfMTtpMIxL3BEfGjx/3ZMJKbPNYnsSttD95PBTdWblDkI0MHPy46N3eWsXgh8
         rhiaBY1KBskWfyRQiXWDkkSvAG7lwXFWZLqWVR/T0/PfDF3jVlGFyU0nQSoQkZLmBoV4
         6ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GgUTm7wJH0+BRi8dDrO/9JHL4EFO+jAdr22a/R5dUE4=;
        b=brZrMMRA3E8AzoLKUWTJcUSjih8CdQOwnnGa5JB+lvImnFo19oWUlCKbhe3TM+cct6
         AxwBeU6uDXcMRBqJ4iJs63oeawKtyDKOdKYKf9OZXFoj5pZDnPAyTrAnL8mA3TXSpiUc
         1ivCyab+uFqQVKs+1sETs15wSGDErhn0EMzvq9OtL9L/tsNpeaebRgrU2o5IFHQuerCt
         K47iM448ECfalWhEBrP2m/jXO3Tx//3rRgmCEf8sxJbE2e9JHL/Yn+DOBr7RPAaGwqpe
         JvxM49WX2U+sxqTPJVH9XXQyC7EHqHeMx4PmEIJKgCG87/Wda6p/2aSY92g2qV/xcnzd
         LKiA==
X-Gm-Message-State: AOAM530xX+MNdChxiVpu+H1QAgug/qeUxQtrw48Ba0f0BJ8JPknbDuvw
        lEIiK5F8j3OHto2cuQZeVw7pSoYn2sO9rdWwMymp3g==
X-Google-Smtp-Source: ABdhPJw35ny+DmJ64Kw4jWL/AzIFdAaUCgdu6gfPtMx7VHnN5OGS4XD7HvYfKSSjQd3rybheCX+98kTo9aEJoO8q5to=
X-Received: by 2002:a17:90a:160f:: with SMTP id n15mr1940273pja.75.1603185285795;
 Tue, 20 Oct 2020 02:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201018125237.16717-1-kholk11@gmail.com> <20201018125237.16717-4-kholk11@gmail.com>
In-Reply-To: <20201018125237.16717-4-kholk11@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 20 Oct 2020 11:14:34 +0200
Message-ID: <CAG3jFysZbg_2XBjPryY1DN0xqu6VLzed6tLmoVeJ3NTb7dA22w@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: camss: vfe: Add support for VFE 4.8
To:     kholk11@gmail.com
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Angelo,

The VFE abstraction layers are something I've been looking at too, and
there's no neat solution that both eliminates code duplication,
separates revisions into individual files, and still avoids creating
even more abstraction layers. So while combining vfe47 and vfe48 looks
and feels a bit cluttered, I think it is a necessary evil.

I've got some minor nits below.

On Sun, 18 Oct 2020 at 14:54, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add the support for VFE 4.8 in the camss-vfe-4-7 driver, as this one
> really is a minor revision, requiring the very same management and
> basically having the same register layout as VFE 4.7, but needing
> a different QoS and DS configuration, using a different register to
> enable the wm and habing the same UB size for both instances (instead
> of a different size between instance 0 and 1).
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../media/platform/qcom/camss/camss-vfe-4-7.c | 129 ++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>  2 files changed, 122 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> index 0dca8bf9281e..e48d58a4a9d1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> @@ -133,6 +133,11 @@
>  #define VFE_0_BUS_BDG_QOS_CFG_7                0x420
>  #define VFE_0_BUS_BDG_QOS_CFG_7_CFG    0x0001aaa9
>
> +#define VFE48_0_BUS_BDG_QOS_CFG_0_CFG  0xaaa5aaa5
> +#define VFE48_0_BUS_BDG_QOS_CFG_3_CFG  0xaa55aaa5
> +#define VFE48_0_BUS_BDG_QOS_CFG_4_CFG  0xaa55aa55
> +#define VFE48_0_BUS_BDG_QOS_CFG_7_CFG  0x0005aa55
> +
>  #define VFE_0_BUS_BDG_DS_CFG_0         0x424
>  #define VFE_0_BUS_BDG_DS_CFG_0_CFG     0xcccc0011
>  #define VFE_0_BUS_BDG_DS_CFG_1         0x428
> @@ -153,6 +158,9 @@
>  #define VFE_0_BUS_BDG_DS_CFG_16                0x464
>  #define VFE_0_BUS_BDG_DS_CFG_16_CFG    0x40000103
>
> +#define VFE48_0_BUS_BDG_DS_CFG_0_CFG   0xcccc1111
> +#define VFE48_0_BUS_BDG_DS_CFG_16_CFG  0x00000110
> +
>  #define VFE_0_RDI_CFG_x(x)             (0x46c + (0x4 * (x)))
>  #define VFE_0_RDI_CFG_x_RDI_STREAM_SEL_SHIFT   28
>  #define VFE_0_RDI_CFG_x_RDI_STREAM_SEL_MASK    (0xf << 28)
> @@ -231,6 +239,9 @@
>  #define VFE_0_REALIGN_BUF_CFG_CR_ODD_PIXEL     BIT(3)
>  #define VFE_0_REALIGN_BUF_CFG_HSUB_ENABLE      BIT(4)
>
> +#define VFE48_0_BUS_IMAGE_MASTER_CMD           0xcec
> +#define VFE48_0_BUS_IMAGE_MASTER_n_SHIFT(x)    (2 * (x))
> +
>  #define CAMIF_TIMEOUT_SLEEP_US 1000
>  #define CAMIF_TIMEOUT_ALL_US 1000000
>
> @@ -246,7 +257,7 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
>         dev_err(dev, "VFE HW Version = 0x%08x\n", hw_version);
>  }
>
> -static u16 vfe_get_ub_size(u8 vfe_id)
> +static u16 vfe47_get_ub_size(u8 vfe_id)
>  {
>         if (vfe_id == 0)
>                 return MSM_VFE_VFE0_UB_SIZE_RDI;
> @@ -299,7 +310,7 @@ static void vfe_halt_clear(struct vfe_device *vfe)
>         writel_relaxed(0x0, vfe->base + VFE_0_BUS_BDG_CMD);
>  }
>
> -static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
> +static void vfe47_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
>  {
>         if (enable)
>                 vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(wm),
> @@ -883,7 +894,7 @@ static void vfe_set_clamp_cfg(struct vfe_device *vfe)
>         writel_relaxed(val, vfe->base + VFE_0_CLAMP_ENC_MIN_CFG);
>  }
>
> -static void vfe_set_qos(struct vfe_device *vfe)
> +static void vfe47_set_qos(struct vfe_device *vfe)
>  {
>         u32 val = VFE_0_BUS_BDG_QOS_CFG_0_CFG;
>         u32 val7 = VFE_0_BUS_BDG_QOS_CFG_7_CFG;
> @@ -898,7 +909,7 @@ static void vfe_set_qos(struct vfe_device *vfe)
>         writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
>  }
>
> -static void vfe_set_ds(struct vfe_device *vfe)
> +static void vfe47_set_ds(struct vfe_device *vfe)
>  {
>         u32 val = VFE_0_BUS_BDG_DS_CFG_0_CFG;
>         u32 val16 = VFE_0_BUS_BDG_DS_CFG_16_CFG;
> @@ -1098,11 +1109,113 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>
>  const struct vfe_hw_ops vfe_ops_4_7 = {
>         .hw_version_read = vfe_hw_version_read,
> -       .get_ub_size = vfe_get_ub_size,
> +       .get_ub_size = vfe47_get_ub_size,
> +       .global_reset = vfe_global_reset,
> +       .halt_request = vfe_halt_request,
> +       .halt_clear = vfe_halt_clear,
> +       .wm_enable = vfe47_wm_enable,
> +       .wm_frame_based = vfe_wm_frame_based,
> +       .wm_line_based = vfe_wm_line_based,
> +       .wm_set_framedrop_period = vfe_wm_set_framedrop_period,
> +       .wm_set_framedrop_pattern = vfe_wm_set_framedrop_pattern,
> +       .wm_set_ub_cfg = vfe_wm_set_ub_cfg,
> +       .bus_reload_wm = vfe_bus_reload_wm,
> +       .wm_set_ping_addr = vfe_wm_set_ping_addr,
> +       .wm_set_pong_addr = vfe_wm_set_pong_addr,
> +       .wm_get_ping_pong_status = vfe_wm_get_ping_pong_status,
> +       .bus_enable_wr_if = vfe_bus_enable_wr_if,
> +       .bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
> +       .wm_set_subsample = vfe_wm_set_subsample,
> +       .bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
> +       .set_xbar_cfg = vfe_set_xbar_cfg,
> +       .set_realign_cfg = vfe_set_realign_cfg,
> +       .set_rdi_cid = vfe_set_rdi_cid,
> +       .reg_update = vfe_reg_update,
> +       .reg_update_clear = vfe_reg_update_clear,
> +       .enable_irq_wm_line = vfe_enable_irq_wm_line,
> +       .enable_irq_pix_line = vfe_enable_irq_pix_line,
> +       .enable_irq_common = vfe_enable_irq_common,
> +       .set_demux_cfg = vfe_set_demux_cfg,
> +       .set_scale_cfg = vfe_set_scale_cfg,
> +       .set_crop_cfg = vfe_set_crop_cfg,
> +       .set_clamp_cfg = vfe_set_clamp_cfg,
> +       .set_qos = vfe47_set_qos,
> +       .set_ds = vfe47_set_ds,
> +       .set_cgc_override = vfe_set_cgc_override,
> +       .set_camif_cfg = vfe_set_camif_cfg,
> +       .set_camif_cmd = vfe_set_camif_cmd,
> +       .set_module_cfg = vfe_set_module_cfg,
> +       .camif_wait_for_stop = vfe_camif_wait_for_stop,
> +       .isr_read = vfe_isr_read,
> +       .violation_read = vfe_violation_read,
> +       .isr = vfe_isr,
> +};

I would consider splitting the assignments that aren't related to
vfe48 support out into another commit. The ones that are vfe48 related
can stay in this commit.

> +
> +static u16 vfe48_get_ub_size(u8 vfe_id)
> +{
> +       /* On VFE4.8 the ub-size is the same on both instances */
> +       return MSM_VFE_VFE0_UB_SIZE_RDI;
> +}
> +
> +static void vfe48_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
> +{
> +       if (enable)
> +               writel_relaxed(2 << VFE48_0_BUS_IMAGE_MASTER_n_SHIFT(wm),
> +                              vfe->base + VFE48_0_BUS_IMAGE_MASTER_CMD);
> +       else
> +               writel_relaxed(1 << VFE48_0_BUS_IMAGE_MASTER_n_SHIFT(wm),
> +                              vfe->base + VFE48_0_BUS_IMAGE_MASTER_CMD);
> +       wmb();

checkpatch rightly complains about this wmb() call being uncommented.
None or nearly none of the other wmb() calls are documented, but I
think it would be good practice to start documenting their purpose in
order to increase long-term maintainability.

> +}
> +
> +static void vfe48_set_qos(struct vfe_device *vfe)
> +{
> +       u32 val = VFE48_0_BUS_BDG_QOS_CFG_0_CFG;
> +       u32 val3 = VFE48_0_BUS_BDG_QOS_CFG_3_CFG;
> +       u32 val4 = VFE48_0_BUS_BDG_QOS_CFG_4_CFG;
> +       u32 val7 = VFE48_0_BUS_BDG_QOS_CFG_7_CFG;
> +
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_0);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_1);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_2);
> +       writel_relaxed(val3, vfe->base + VFE_0_BUS_BDG_QOS_CFG_3);
> +       writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_4);
> +       writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
> +       writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
> +       writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
> +}
> +
> +static void vfe48_set_ds(struct vfe_device *vfe)
> +{
> +       u32 val = VFE48_0_BUS_BDG_DS_CFG_0_CFG;
> +       u32 val16 = VFE48_0_BUS_BDG_DS_CFG_16_CFG;
> +
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_0);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_1);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_2);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_3);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_4);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_5);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_6);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_7);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_8);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_9);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_10);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_11);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_12);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_13);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_14);
> +       writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_15);
> +       writel_relaxed(val16, vfe->base + VFE_0_BUS_BDG_DS_CFG_16);
> +}
> +
> +const struct vfe_hw_ops vfe_ops_4_8 = {
> +       .hw_version_read = vfe_hw_version_read,
> +       .get_ub_size = vfe48_get_ub_size,
>         .global_reset = vfe_global_reset,
>         .halt_request = vfe_halt_request,
>         .halt_clear = vfe_halt_clear,
> -       .wm_enable = vfe_wm_enable,
> +       .wm_enable = vfe48_wm_enable,
>         .wm_frame_based = vfe_wm_frame_based,
>         .wm_line_based = vfe_wm_line_based,
>         .wm_set_framedrop_period = vfe_wm_set_framedrop_period,
> @@ -1128,8 +1241,8 @@ const struct vfe_hw_ops vfe_ops_4_7 = {
>         .set_scale_cfg = vfe_set_scale_cfg,
>         .set_crop_cfg = vfe_set_crop_cfg,
>         .set_clamp_cfg = vfe_set_clamp_cfg,
> -       .set_qos = vfe_set_qos,
> -       .set_ds = vfe_set_ds,
> +       .set_qos = vfe48_set_qos,
> +       .set_ds = vfe48_set_ds,
>         .set_cgc_override = vfe_set_cgc_override,
>         .set_camif_cfg = vfe_set_camif_cfg,
>         .set_camif_cmd = vfe_set_camif_cmd,
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index a90b0d2cc6de..5bce6736e4bb 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -180,5 +180,6 @@ void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
>
>  extern const struct vfe_hw_ops vfe_ops_4_1;
>  extern const struct vfe_hw_ops vfe_ops_4_7;
> +extern const struct vfe_hw_ops vfe_ops_4_8;
>
>  #endif /* QC_MSM_CAMSS_VFE_H */
> --
> 2.28.0
>
