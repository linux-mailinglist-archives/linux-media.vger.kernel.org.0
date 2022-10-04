Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20C85F4044
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 11:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJDJtH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 05:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiJDJsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 05:48:24 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786B3E0DE
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 02:45:56 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g27so1200987edf.11
        for <linux-media@vger.kernel.org>; Tue, 04 Oct 2022 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=j42zsrLpglIyk6hhWvWfHg+b8IPm4LPenAg4v6G9/CE=;
        b=nGh1OTXQqLWRtOqqf3mSHyjelBHcOlSbYfYNq64nAyiasWl/2tiWqAxtREAtpgzv8O
         oCYbFHGX6483De7qM/14ZRjuMp8MhGeCxGm9Zn5v+JYqpmvWAtU8xuf+xGFwb1tLRuvD
         O4dJjbHv3YsQKOBQrL48/aYYR+DKQ7IfJ9EE6Z/VUZJ7Y5dPREZqSJA+07jGsYZuk8KK
         UZZDIsZ+xn3BD6H//w6s/37IAWGlV9w1VZnlNRRlbVC5tb+o6sid0xTKXsmkyG2NeXXQ
         dVfr7KurKEMvCEEg6J0huEMdgGd0UCjlRky4b8vSQ/8jzsBduI7AN1qjFSdpSKZVem/K
         wbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=j42zsrLpglIyk6hhWvWfHg+b8IPm4LPenAg4v6G9/CE=;
        b=AnvFdhXNQZaZUg3vqQRK90GXa8tPkvHmQT1oeOwMaULHhcr8wpkRbRZ7NANvUZ2MjN
         t9xDkIldJEyFAIYQ/+GPxsWNz40icrNarhK2jgQxnwYbYlBmUEtRW56frsqaHWnin8gl
         XunNf93DEl9qyNjUdQLi7IgExaZUMa83n39ui+hayOUDUbaAT2Nl4/Hz9ZlfIhenaC1m
         YyYdva6K40qTZHNat/VMzYIyomWJmMh+sH6n6DNkpOaZ0DjYIv7i1dWjYSbkvX00bJxH
         AJ/VtvwTX+diNx06VB7sbGebTzAZuKK8K3uT5Ed7wsYdshtCWytiIEVaRkxeJBZHsMbF
         KM2Q==
X-Gm-Message-State: ACrzQf2sdsdJgo+Xy2wgPC9gISktdfWzcyVQZkLEbjNFhXHlCXVIYPwJ
        7t26c5ggDDYKTAUvNLtMBulrKM/1evzaOTvxK5Ho2g==
X-Google-Smtp-Source: AMsMyM4a+OBVeJnPOhidcL6L8XfKfS37mTdniqshkSrYC2ikdDNYKF+zPoQsi8nAT5u/mzV7rsJk+kZvIfCDapIPdKs=
X-Received: by 2002:aa7:c792:0:b0:453:98b7:213c with SMTP id
 n18-20020aa7c792000000b0045398b7213cmr22553964eds.159.1664876722426; Tue, 04
 Oct 2022 02:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220926142505.1827-1-quic_mmitkov@quicinc.com> <20220926142505.1827-4-quic_mmitkov@quicinc.com>
In-Reply-To: <20220926142505.1827-4-quic_mmitkov@quicinc.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 4 Oct 2022 11:45:11 +0200
Message-ID: <CAG3jFysF6_b67-HGUhNCzfBu7Zmh+41nZRdt6hffn8Txy-RU7g@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: camss: vfe-480: Multiple outputs support for SM8250
To:     quic_mmitkov@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 26 Sept 2022 at 16:25, <quic_mmitkov@quicinc.com> wrote:
>
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>
> On SM8250 each VFE supports at least 3 RDI channels, or 4
> in case of VFE-Lite, so add appropriate IRQ setup and handling.
>
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> ---
>  .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
>  1 file changed, 40 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> index 129585110393..537dede334be 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> @@ -94,6 +94,8 @@ static inline int bus_irq_mask_0_comp_done(struct vfe_device *vfe, int n)
>  #define RDI_WM(n)                      ((IS_LITE ? 0 : 23) + (n))
>  #define RDI_COMP_GROUP(n)              ((IS_LITE ? 0 : 11) + (n))
>
> +#define MAX_VFE_OUTPUT_LINES   4
> +
>  static u32 vfe_hw_version(struct vfe_device *vfe)
>  {
>         u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
> @@ -171,12 +173,26 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>
>  static void vfe_enable_irq_common(struct vfe_device *vfe)
>  {
> -       /* enable only the IRQs used: rup and comp_done irqs for RDI0 */
> +       /* enable reset ack IRQ and top BUS status IRQ */
>         writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
>                        vfe->base + VFE_IRQ_MASK(0));
> -       writel_relaxed(BUS_IRQ_MASK_0_RDI_RUP(vfe, 0) |
> -                      BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(0)),
> -                      vfe->base + VFE_BUS_IRQ_MASK(0));
> +}
> +
> +static void vfe_enable_lines_irq(struct vfe_device *vfe)
> +{
> +       u32 bus_irq_mask;
> +       int i;
> +
> +       for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
> +               /* Enable IRQ for newly added lines, but also keep already running lines's IRQ */
> +               if (vfe->line[i].output.state == VFE_OUTPUT_RESERVED ||
> +                   vfe->line[i].output.state == VFE_OUTPUT_ON) {
> +                       bus_irq_mask |= BUS_IRQ_MASK_0_RDI_RUP(vfe, i)
> +                                       | BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i));
> +                       }
> +       }
> +
> +       writel_relaxed(bus_irq_mask, vfe->base + VFE_BUS_IRQ_MASK(0));
>  }
>
>  static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id);
> @@ -193,6 +209,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>  {
>         struct vfe_device *vfe = dev;
>         u32 status;
> +       int i;
>
>         status = readl_relaxed(vfe->base + VFE_IRQ_STATUS(0));
>         writel_relaxed(status, vfe->base + VFE_IRQ_CLEAR(0));
> @@ -207,11 +224,14 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>                 writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
>                 writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
>
> -               if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, 0))
> -                       vfe_isr_reg_update(vfe, 0);
> +               /* Loop through all WMs IRQs */
> +               for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
> +                       if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, i))
> +                               vfe_isr_reg_update(vfe, i);
>
> -               if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(0)))
> -                       vfe_isr_wm_done(vfe, 0);
> +                       if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
> +                               vfe_isr_wm_done(vfe, i);
> +               }
>         }
>
>         return IRQ_HANDLED;
> @@ -234,24 +254,23 @@ static int vfe_get_output(struct vfe_line *line)
>         struct vfe_device *vfe = to_vfe(line);
>         struct vfe_output *output;
>         unsigned long flags;
> -       int wm_idx;
>
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
>         output = &line->output;
> -       if (output->state != VFE_OUTPUT_OFF) {
> +       if (output->state > VFE_OUTPUT_RESERVED) {
>                 dev_err(vfe->camss->dev, "Output is running\n");
>                 goto error;
>         }
>
>         output->wm_num = 1;
>
> -       wm_idx = vfe_reserve_wm(vfe, line->id);
> -       if (wm_idx < 0) {
> -               dev_err(vfe->camss->dev, "Can not reserve wm\n");
> -               goto error_get_wm;
> -       }
> -       output->wm_idx[0] = wm_idx;
> +       /* Correspondence between VFE line number and WM number.
> +        * line 0 -> RDI 0, line 1 -> RDI1, line 2 -> RDI2, line 3 -> PIX/RDI3
> +        * Note this 1:1 mapping will not work for PIX streams.
> +        */
> +       output->wm_idx[0] = line->id;
> +       vfe->wm_output_map[line->id] = line->id;
>
>         output->drop_update_idx = 0;
>
> @@ -259,11 +278,9 @@ static int vfe_get_output(struct vfe_line *line)
>
>         return 0;
>
> -error_get_wm:
> -       vfe_release_wm(vfe, output->wm_idx[0]);
> -       output->state = VFE_OUTPUT_OFF;
>  error:
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
> +       output->state = VFE_OUTPUT_OFF;
>
>         return -EINVAL;
>  }
> @@ -279,7 +296,7 @@ static int vfe_enable_output(struct vfe_line *line)
>
>         vfe_reg_update_clear(vfe, line->id);
>
> -       if (output->state != VFE_OUTPUT_OFF) {
> +       if (output->state > VFE_OUTPUT_RESERVED) {
>                 dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
>                         output->state);
>                 spin_unlock_irqrestore(&vfe->output_lock, flags);
> @@ -360,6 +377,8 @@ static int vfe_enable(struct vfe_line *line)
>
>         vfe->stream_count++;
>
> +       vfe_enable_lines_irq(vfe);
> +
>         mutex_unlock(&vfe->stream_lock);
>
>         ret = vfe_get_output(line);
> @@ -548,7 +567,7 @@ static const struct camss_video_ops vfe_video_ops_480 = {
>  static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>  {
>         vfe->video_ops = vfe_video_ops_480;
> -       vfe->line_num = 1;
> +       vfe->line_num = MAX_VFE_OUTPUT_LINES;
>  }
>
>  const struct vfe_hw_ops vfe_ops_480 = {
> --
> 2.37.3
>


Reviewed-by: Robert Foss <robert.foss@linaro.org>
