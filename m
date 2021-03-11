Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE0133760A
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 15:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233663AbhCKOqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 09:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbhCKOql (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 09:46:41 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8706C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 06:46:40 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id 18so14621445pfo.6
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 06:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RKA/jrWTBPwpiQYV1eE8JFx+Yx5MC4/QLvPQUrGwNl8=;
        b=DJywM3WNsmEjzR+pGMQYMQBDYLSHNIRSIp6GiSKbMBz/o7Jy1QM68Ne4tF2uFiQiBv
         xvzZHGXkYQfb4AsrdBCle0AJt4bOFMAcIUSas3DuXriY3LZgmQYio7ocSGeM/LBwcNFo
         XFBMY1wUkxVttmBk2MV74jfzxdKCANetLDLDAW0QJ1vdQZBnsQIE8dGcDi+KrmZ2UAdE
         4fbboMQxWQf8I8vgQni79a3B4iOYDi3u1INhj9ArHr4oQGEACkr355jpeYlfmN3APDMf
         m6+fv703vph98im6k1wuRLGU8zwUWCFKWb+damEzwLlyK87asOui5cxL68W6g1x/a/FH
         5b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RKA/jrWTBPwpiQYV1eE8JFx+Yx5MC4/QLvPQUrGwNl8=;
        b=Rm2SmWsLjhZQ3ZttfwpY0Sn9pjnrfOpR5LnRMZtWMmDSQSYgoxdPpKa9Y1WctWyDH/
         ikKedm+u7nk05KtaTa5AMRz8AiIjv0m6XUQ9RFy2MxRdALVrtBD/1hPlfj9zhFe8U6V0
         QQQ/Mjkn0iexSeKR5x9PBbSPkREdJdWqtM58eTejRT1Su8rX4XMA8bJbq48/y3w8kbZO
         rkvBA+MI0ViiMKsscOE6uwDQYzY/MvQI4945WyuD9yP+GC4F5sjrLJPVj5yH0FJ+Q0Fd
         QdBN6wN3hNWvgTgsE/OqGNxzmGovPiMh84dw459LPMvFivwnYJdVu3Lk6+x3z3gAtLv0
         rP1A==
X-Gm-Message-State: AOAM531tO8n/oBaa2xrubaQoHwgdX+anrdl1Ghb+7ZyrfpZVE9GY5P5M
        iZ5g3oPOQHYDPL17I4F3ipkurSfKgOSUjDVt/7RvGw==
X-Google-Smtp-Source: ABdhPJx9teDjLZjwrRM/eYaR0PVkCy7k6f5ba8tTHVd7RqTrqN/yC+FB+lTyUx35/EU+YNPt5nlj8odHeE1Y+pz+NBA=
X-Received: by 2002:a62:80cf:0:b029:1f3:1959:2e42 with SMTP id
 j198-20020a6280cf0000b02901f319592e42mr7744862pfd.39.1615473999923; Thu, 11
 Mar 2021 06:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20210304120326.153966-1-robert.foss@linaro.org>
 <20210304120326.153966-13-robert.foss@linaro.org> <a60346bb-4929-c6c1-cd47-4b732175d6c7@linaro.org>
In-Reply-To: <a60346bb-4929-c6c1-cd47-4b732175d6c7@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 11 Mar 2021 15:46:27 +0100
Message-ID: <CAG3jFytcTeh6uwsCL7a2mAgPmxvrgu0OMY97_5MmsHAnAML87A@mail.gmail.com>
Subject: Re: [PATCH v6 12/22] media: camss: Remove per VFE power domain toggling
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Rob Herring <robh@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 11 Mar 2021 at 15:43, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> Thank you for the patch!
>
> On 04.03.2021 15:03, Robert Foss wrote:
> > For Titan ISPs clocks fail to re-enable during vfe_get()
> > after any vfe has been halted and its corresponding power
> > domain power has been detached.
> >
> > Since all of the clocks depend on all of the PDs, per
> > VFE PD detaching is no option for this generation of HW.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >
> >
> > Changes since v5:
> >   - Andrey: Bifurcated PD support into Gen1 & Gen2 paths
>
> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks!

>
> Thanks,
> Andrey
>
> >   .../media/platform/qcom/camss/camss-vfe-170.c | 21 +++++
> >   .../media/platform/qcom/camss/camss-vfe-4-1.c | 19 ++++
> >   .../media/platform/qcom/camss/camss-vfe-4-7.c | 39 ++++++++
> >   .../media/platform/qcom/camss/camss-vfe-4-8.c | 34 +++++++
> >   drivers/media/platform/qcom/camss/camss-vfe.c |  6 +-
> >   drivers/media/platform/qcom/camss/camss-vfe.h |  2 +
> >   drivers/media/platform/qcom/camss/camss.c     | 94 +++++++++++++------
> >   drivers/media/platform/qcom/camss/camss.h     | 10 +-
> >   8 files changed, 189 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> > index ce1130108e01..99f27124ad3b 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> > @@ -714,6 +714,25 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
> >       spin_unlock_irqrestore(&vfe->output_lock, flags);
> >   }
> >
> > +/*
> > + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> > + * @vfe: VFE Device
> > + */
> > +static void vfe_pm_domain_off(struct vfe_device *vfe)
> > +{
> > +
> > +}
> > +
> > +
> > +/*
> > + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> > + * @vfe: VFE Device
> > + */
> > +static int vfe_pm_domain_on(struct vfe_device *vfe)
> > +{
> > +     return 0;
> > +}
> > +
> >   /*
> >    * vfe_queue_buffer - Add empty buffer
> >    * @vid: Video device structure
> > @@ -775,6 +794,8 @@ const struct vfe_hw_ops vfe_ops_170 = {
> >       .hw_version_read = vfe_hw_version_read,
> >       .isr_read = vfe_isr_read,
> >       .isr = vfe_isr,
> > +     .pm_domain_off = vfe_pm_domain_off,
> > +     .pm_domain_on = vfe_pm_domain_on,
> >       .reg_update_clear = vfe_reg_update_clear,
> >       .reg_update = vfe_reg_update,
> >       .subdev_init = vfe_subdev_init,
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> > index 81756d7fd5c2..9fc44be3ccb8 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> > @@ -938,6 +938,23 @@ static irqreturn_t vfe_isr(int irq, void *dev)
> >       return IRQ_HANDLED;
> >   }
> >
> > +/*
> > + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> > + * @vfe: VFE Device
> > + */
> > +static void vfe_pm_domain_off(struct vfe_device *vfe)
> > +{
> > +
> > +}
> > +
> > +/*
> > + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> > + * @vfe: VFE Device
> > + */
> > +static int vfe_pm_domain_on(struct vfe_device *vfe)
> > +{
> > +     return 0;
> > +}
> >
> >   const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_1 = {
> >       .bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
> > @@ -990,6 +1007,8 @@ const struct vfe_hw_ops vfe_ops_4_1 = {
> >       .hw_version_read = vfe_hw_version_read,
> >       .isr_read = vfe_isr_read,
> >       .isr = vfe_isr,
> > +     .pm_domain_off = vfe_pm_domain_off,
> > +     .pm_domain_on = vfe_pm_domain_on,
> >       .reg_update_clear = vfe_reg_update_clear,
> >       .reg_update = vfe_reg_update,
> >       .subdev_init = vfe_subdev_init,
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> > index 5ecb87f1b047..41cf150d9efe 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> > @@ -8,6 +8,7 @@
> >    * Copyright (C) 2015-2018 Linaro Ltd.
> >    */
> >
> > +#include <linux/device.h>
> >   #include <linux/interrupt.h>
> >   #include <linux/io.h>
> >   #include <linux/iopoll.h>
> > @@ -1104,6 +1105,42 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
> >       writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
> >   }
> >
> > +/*
> > + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> > + * @vfe: VFE Device
> > + */
> > +static void vfe_pm_domain_off(struct vfe_device *vfe)
> > +{
> > +     struct camss *camss;
> > +
> > +     if (!vfe)
> > +             return;
> > +
> > +     camss = vfe->camss;
> > +
> > +     device_link_del(camss->genpd_link[vfe->id]);
> > +}
> > +
> > +/*
> > + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> > + * @vfe: VFE Device
> > + */
> > +static int vfe_pm_domain_on(struct vfe_device *vfe)
> > +{
> > +     struct camss *camss = vfe->camss;
> > +     enum vfe_line_id id = vfe->id;
> > +
> > +     camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id], DL_FLAG_STATELESS |
> > +                                             DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> > +
> > +     if (!camss->genpd_link[id]) {
> > +             dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", id);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static void vfe_violation_read(struct vfe_device *vfe)
> >   {
> >       u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
> > @@ -1162,6 +1199,8 @@ const struct vfe_hw_ops vfe_ops_4_7 = {
> >       .hw_version_read = vfe_hw_version_read,
> >       .isr_read = vfe_isr_read,
> >       .isr = vfe_isr,
> > +     .pm_domain_off = vfe_pm_domain_off,
> > +     .pm_domain_on = vfe_pm_domain_on,
> >       .reg_update_clear = vfe_reg_update_clear,
> >       .reg_update = vfe_reg_update,
> >       .subdev_init = vfe_subdev_init,
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> > index 732b93b365d3..f368870ae36d 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> > @@ -8,6 +8,7 @@
> >    * Copyright (C) 2015-2021 Linaro Ltd.
> >    */
> >
> > +#include <linux/device.h>
> >   #include <linux/interrupt.h>
> >   #include <linux/io.h>
> >   #include <linux/iopoll.h>
> > @@ -1098,6 +1099,37 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
> >       writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
> >   }
> >
> > +/*
> > + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> > + * @vfe: VFE Device
> > + */
> > +static void vfe_pm_domain_off(struct vfe_device *vfe)
> > +{
> > +     struct camss *camss = vfe->camss;
> > +
> > +     device_link_del(camss->genpd_link[vfe->id]);
> > +}
> > +
> > +/*
> > + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> > + * @vfe: VFE Device
> > + */
> > +static int vfe_pm_domain_on(struct vfe_device *vfe)
> > +{
> > +     struct camss *camss = vfe->camss;
> > +     enum vfe_line_id id = vfe->id;
> > +
> > +     camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id], DL_FLAG_STATELESS |
> > +                                             DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> > +
> > +     if (!camss->genpd_link[id]) {
> > +             dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", id);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static void vfe_violation_read(struct vfe_device *vfe)
> >   {
> >       u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
> > @@ -1156,6 +1188,8 @@ const struct vfe_hw_ops vfe_ops_4_8 = {
> >       .hw_version_read = vfe_hw_version_read,
> >       .isr_read = vfe_isr_read,
> >       .isr = vfe_isr,
> > +     .pm_domain_off = vfe_pm_domain_off,
> > +     .pm_domain_on = vfe_pm_domain_on,
> >       .reg_update_clear = vfe_reg_update_clear,
> >       .reg_update = vfe_reg_update,
> >       .subdev_init = vfe_subdev_init,
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> > index 6fafeb8a5484..402f18729f9f 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -580,7 +580,7 @@ static int vfe_get(struct vfe_device *vfe)
> >       mutex_lock(&vfe->power_lock);
> >
> >       if (vfe->power_count == 0) {
> > -             ret = camss_pm_domain_on(vfe->camss, vfe->id);
> > +             ret = vfe->ops->pm_domain_on(vfe);
> >               if (ret < 0)
> >                       goto error_pm_domain;
> >
> > @@ -620,7 +620,7 @@ static int vfe_get(struct vfe_device *vfe)
> >
> >   error_pm_runtime_get:
> >       pm_runtime_put_sync(vfe->camss->dev);
> > -     camss_pm_domain_off(vfe->camss, vfe->id);
> > +     vfe->ops->pm_domain_off(vfe);
> >
> >   error_pm_domain:
> >       mutex_unlock(&vfe->power_lock);
> > @@ -646,7 +646,7 @@ static void vfe_put(struct vfe_device *vfe)
> >               }
> >               camss_disable_clocks(vfe->nclocks, vfe->clock);
> >               pm_runtime_put_sync(vfe->camss->dev);
> > -             camss_pm_domain_off(vfe->camss, vfe->id);
> > +             vfe->ops->pm_domain_off(vfe);
> >       }
> >
> >       vfe->power_count--;
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> > index 29b3d930ffc6..05839a9f60f6 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> > @@ -106,6 +106,8 @@ struct vfe_hw_ops {
> >       void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
> >       irqreturn_t (*isr)(int irq, void *dev);
> >       void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
> > +     void (*pm_domain_off)(struct vfe_device *vfe);
> > +     int (*pm_domain_on)(struct vfe_device *vfe);
> >       void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
> >       void (*reg_update_clear)(struct vfe_device *vfe,
> >                                enum vfe_line_id line_id);
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > index 5d0479b5589c..0a9388227c59 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -776,24 +776,24 @@ int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
> >
> >   int camss_pm_domain_on(struct camss *camss, int id)
> >   {
> > -     if (camss->version == CAMSS_8x96 ||
> > -         camss->version == CAMSS_660) {
> > -             camss->genpd_link[id] = device_link_add(camss->dev,
> > -                             camss->genpd[id], DL_FLAG_STATELESS |
> > -                             DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> > +     int ret = 0;
> > +
> > +     if (id < camss->vfe_num) {
> > +             struct vfe_device *vfe = &camss->vfe[id];
> >
> > -             if (!camss->genpd_link[id])
> > -                     return -EINVAL;
> > +             ret = vfe->ops->pm_domain_on(vfe);
> >       }
> >
> > -     return 0;
> > +     return ret;
> >   }
> >
> >   void camss_pm_domain_off(struct camss *camss, int id)
> >   {
> > -     if (camss->version == CAMSS_8x96 ||
> > -         camss->version == CAMSS_660)
> > -             device_link_del(camss->genpd_link[id]);
> > +     if (id < camss->vfe_num) {
> > +             struct vfe_device *vfe = &camss->vfe[id];
> > +
> > +             vfe->ops->pm_domain_off(vfe);
> > +     }
> >   }
> >
> >   /*
> > @@ -1207,6 +1207,48 @@ static const struct media_device_ops camss_media_ops = {
> >       .link_notify = v4l2_pipeline_link_notify,
> >   };
> >
> > +
> > +static int camss_configure_pd(struct camss *camss)
> > +{
> > +     int nbr_pm_domains = 0;
> > +     int last_pm_domain = 0;
> > +     int i;
> > +     int ret;
> > +
> > +     if (camss->version == CAMSS_8x96 ||
> > +         camss->version == CAMSS_660)
> > +             nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> > +
> > +     for (i = 0; i < nbr_pm_domains; i++) {
> > +             camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
> > +             if (IS_ERR(camss->genpd[i])) {
> > +                     ret = PTR_ERR(camss->genpd[i]);
> > +                     goto fail_pm;
> > +             }
> > +
> > +             camss->genpd_link[i] = device_link_add(camss->dev, camss->genpd[i],
> > +                     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> > +
> > +             if (!camss->genpd_link[i]) {
> > +                     dev_pm_domain_detach(camss->genpd[i], true);
> > +                     ret = -EINVAL;
> > +                     goto fail_pm;
> > +             }
> > +
> > +             last_pm_domain = i;
> > +     }
> > +
> > +     return 0;
> > +
> > +fail_pm:
> > +     for (i = 0; i < last_pm_domain; i++) {
> > +             device_link_del(camss->genpd_link[i]);
> > +             dev_pm_domain_detach(camss->genpd[i], true);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >   /*
> >    * camss_probe - Probe CAMSS platform device
> >    * @pdev: Pointer to CAMSS platform device
> > @@ -1339,20 +1381,10 @@ static int camss_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > -     if (camss->version == CAMSS_8x96 ||
> > -         camss->version == CAMSS_660) {
> > -             camss->genpd[PM_DOMAIN_VFE0] = dev_pm_domain_attach_by_id(
> > -                                             camss->dev, PM_DOMAIN_VFE0);
> > -             if (IS_ERR(camss->genpd[PM_DOMAIN_VFE0]))
> > -                     return PTR_ERR(camss->genpd[PM_DOMAIN_VFE0]);
> > -
> > -             camss->genpd[PM_DOMAIN_VFE1] = dev_pm_domain_attach_by_id(
> > -                                             camss->dev, PM_DOMAIN_VFE1);
> > -             if (IS_ERR(camss->genpd[PM_DOMAIN_VFE1])) {
> > -                     dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0],
> > -                                          true);
> > -                     return PTR_ERR(camss->genpd[PM_DOMAIN_VFE1]);
> > -             }
> > +     ret = camss_configure_pd(camss);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to configure power domains: %d\n", ret);
> > +             return ret;
> >       }
> >
> >       pm_runtime_enable(dev);
> > @@ -1373,6 +1405,9 @@ static int camss_probe(struct platform_device *pdev)
> >
> >   void camss_delete(struct camss *camss)
> >   {
> > +     int nbr_pm_domains = 0;
> > +     int i;
> > +
> >       v4l2_device_unregister(&camss->v4l2_dev);
> >       media_device_unregister(&camss->media_dev);
> >       media_device_cleanup(&camss->media_dev);
> > @@ -1380,9 +1415,12 @@ void camss_delete(struct camss *camss)
> >       pm_runtime_disable(camss->dev);
> >
> >       if (camss->version == CAMSS_8x96 ||
> > -         camss->version == CAMSS_660) {
> > -             dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0], true);
> > -             dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE1], true);
> > +         camss->version == CAMSS_660)
> > +             nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> > +
> > +     for (i = 0; i < nbr_pm_domains; i++) {
> > +             device_link_del(camss->genpd_link[i]);
> > +             dev_pm_domain_detach(camss->genpd[i], true);
> >       }
> >
> >       kfree(camss);
> > diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> > index b7ad8e9f68a8..244991710879 100644
> > --- a/drivers/media/platform/qcom/camss/camss.h
> > +++ b/drivers/media/platform/qcom/camss/camss.h
> > @@ -57,9 +57,9 @@ struct resources_ispif {
> >   };
> >
> >   enum pm_domain {
> > -     PM_DOMAIN_VFE0,
> > -     PM_DOMAIN_VFE1,
> > -     PM_DOMAIN_COUNT
> > +     PM_DOMAIN_VFE0 = 0,
> > +     PM_DOMAIN_VFE1 = 1,
> > +     PM_DOMAIN_GEN1_COUNT = 2,       /* CAMSS series of ISPs */
> >   };
> >
> >   enum camss_version {
> > @@ -83,8 +83,8 @@ struct camss {
> >       int vfe_num;
> >       struct vfe_device *vfe;
> >       atomic_t ref_count;
> > -     struct device *genpd[PM_DOMAIN_COUNT];
> > -     struct device_link *genpd_link[PM_DOMAIN_COUNT];
> > +     struct device *genpd[PM_DOMAIN_GEN1_COUNT];
> > +     struct device_link *genpd_link[PM_DOMAIN_GEN1_COUNT];
> >   };
> >
> >   struct camss_camera_interface {
> >
