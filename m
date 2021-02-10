Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9E131642D
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 11:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhBJKqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 05:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbhBJKoC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 05:44:02 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495CEC061788
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 02:43:22 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id cl8so889450pjb.0
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 02:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VJPaFcCKZNLbXWapYNAd0NymA7bO1jo9zonk/mKyYf8=;
        b=nb0EewriMuDEJxXllvNX4f4NTJmhaZ1DiA3/RDUXHpZiic8hz28yWkBljbvlGTz4hM
         KVfTJzB+MyXdUYc2InBkj4XGffYERrHYbMFFZFP+F9BDXGfvf8k7TH+9+7iUvGxxx+EL
         i1EHFg+VNCxwm2/BcpMVa3M53BZ/vfo2Wz91wZg9Zrb7qWuqa2ygGybC3vrJFCIreT3M
         C0UkMgZrVmNHpFXVrZFFMlD8gRaZlCDQyk+gQ9mSRf5QnRAZlN7d7bKAb1Ant2r4KdCe
         8xVL9SJsC8LIwLAFVArGmIZ3Kq/Df9fGwSUNANGRYJLuEwS/pSeiAABuJpvKIiEscAGw
         Luxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VJPaFcCKZNLbXWapYNAd0NymA7bO1jo9zonk/mKyYf8=;
        b=rA29o14S3n1hY0/KopxS+BLOn8E88vHLuCeDJtbFEmfsu0ES+PNSwAKqZqRm/CAAB4
         1b8dBfeE0Sh8zALW873KzFCmEVC0LET8Kt3iRyIMiCJWYRc92z+ZZN5EUxlGxtuHf5dc
         ytGk2FVvZKnC1ugtewKc9Tay/eTX6wIOvm6Zoq9CO4TVKD4c+9fZqRihLGSrtwRl/BDX
         xSkGKfKkZ/E3qltbLW0KsUMd6FVft1J5+i7TUZfDjIajF+IPhazvY0eRLiurWFl1MeOY
         cz6Ejsac4RioF7CAKH8RCUDmPsaUJywgIzLpoQuB4CEUIMqLBWEIa3e6sQtZPONqysbM
         XQIQ==
X-Gm-Message-State: AOAM530KzSNxKRogLaS9c7S11Ww5r2RUDLdUuJkqP5avF32tEfOJexKA
        MeY6ldiXFN5xMuccL6yYElQVoIfE2wd+AwVFBsYaYA==
X-Google-Smtp-Source: ABdhPJyj6LmXCh7+X3A332u4OriwNuGxW3wbbK7G+rJyhFMFD0CZgu9lZByieG1Qz8qO+DUS9AusK/c5W11t3ZsK+Qc=
X-Received: by 2002:a17:902:9b91:b029:e2:898c:d721 with SMTP id
 y17-20020a1709029b91b02900e2898cd721mr2469538plp.32.1612953801383; Wed, 10
 Feb 2021 02:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-6-robert.foss@linaro.org> <17d3e2e8-497a-bf4e-66ac-7ed1a4c9bde6@linaro.org>
In-Reply-To: <17d3e2e8-497a-bf4e-66ac-7ed1a4c9bde6@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 10 Feb 2021 11:43:10 +0100
Message-ID: <CAG3jFyunJB37bVeOMcYcGiY4RAa-rE4z2i+9a0NfL15xgCAeEg@mail.gmail.com>
Subject: Re: [PATCH v4 05/22] media: camss: Make ISPIF subdevice optional
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Andrey,

Thanks for starting this review!

On Tue, 9 Feb 2021 at 21:59, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> Thank you for your patch!
>
> On 05.02.2021 13:43, Robert Foss wrote:
> > This driver supports multiple architecture versions of the Qualcomm ISP=
.
> > The CAMSS architecure which this driver is name after, and with the
> > introduction of this series, the Titan architecture.
> >
> > The ISPIF is an IP-block that is only present in the CAMSS generation o=
f
> > the architecture. In order to support the Titan generation, make the
> > ISPIF an optional subdevice.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >
> > Changes since v1:
> >   - Bj=C3=B6rn: Improved commit message
> >   - Bj=C3=B6rn: Use local 'dev' ptr instead of 'camss->dev'
> >   - Bj=C3=B6rn: Remove res/ispif NULL checks
> >   - Bj=C3=B6rn: Remove ispif NULL checks before calling
> >     msm_ispif_unregister_entities()
> >   - Andrey: Fixed incorrect allocation size
> >
> >
> >   .../media/platform/qcom/camss/camss-ispif.c   | 114 ++++++++++-------=
-
> >   .../media/platform/qcom/camss/camss-ispif.h   |   3 +-
> >   drivers/media/platform/qcom/camss/camss.c     | 111 +++++++++++------
> >   drivers/media/platform/qcom/camss/camss.h     |   2 +-
> >   4 files changed, 142 insertions(+), 88 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/=
media/platform/qcom/camss/camss-ispif.c
> > index adeb92808998..c36570042082 100644
> > --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> > +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> > @@ -161,6 +161,7 @@ static const u32 ispif_formats_8x96[] =3D {
> >   static irqreturn_t ispif_isr_8x96(int irq, void *dev)
> >   {
> >       struct ispif_device *ispif =3D dev;
> > +     struct camss *camss =3D ispif->camss;
> >       u32 value0, value1, value2, value3, value4, value5;
> >
> >       value0 =3D readl_relaxed(ispif->base + ISPIF_VFE_m_IRQ_STATUS_0(0=
));
> > @@ -186,34 +187,34 @@ static irqreturn_t ispif_isr_8x96(int irq, void *=
dev)
> >               complete(&ispif->reset_complete[1]);
> >
> >       if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 pix0 overflow\n");
> >
> >       if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_RDI0_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 rdi0 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 rdi0 overflow\n");
> >
> >       if (unlikely(value1 & ISPIF_VFE_m_IRQ_STATUS_1_PIX1_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 pix1 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 pix1 overflow\n");
> >
> >       if (unlikely(value1 & ISPIF_VFE_m_IRQ_STATUS_1_RDI1_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 rdi1 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 rdi1 overflow\n");
> >
> >       if (unlikely(value2 & ISPIF_VFE_m_IRQ_STATUS_2_RDI2_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 rdi2 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 rdi2 overflow\n");
> >
> >       if (unlikely(value3 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE1 pix0 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE1 pix0 overflow\n");
> >
> >       if (unlikely(value3 & ISPIF_VFE_m_IRQ_STATUS_0_RDI0_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE1 rdi0 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE1 rdi0 overflow\n");
> >
> >       if (unlikely(value4 & ISPIF_VFE_m_IRQ_STATUS_1_PIX1_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE1 pix1 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE1 pix1 overflow\n");
> >
> >       if (unlikely(value4 & ISPIF_VFE_m_IRQ_STATUS_1_RDI1_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE1 rdi1 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE1 rdi1 overflow\n");
> >
> >       if (unlikely(value5 & ISPIF_VFE_m_IRQ_STATUS_2_RDI2_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE1 rdi2 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE1 rdi2 overflow\n");
> >
> >       return IRQ_HANDLED;
> >   }
> > @@ -228,6 +229,7 @@ static irqreturn_t ispif_isr_8x96(int irq, void *de=
v)
> >   static irqreturn_t ispif_isr_8x16(int irq, void *dev)
> >   {
> >       struct ispif_device *ispif =3D dev;
> > +     struct camss *camss =3D ispif->camss;
> >       u32 value0, value1, value2;
> >
> >       value0 =3D readl_relaxed(ispif->base + ISPIF_VFE_m_IRQ_STATUS_0(0=
));
> > @@ -244,30 +246,32 @@ static irqreturn_t ispif_isr_8x16(int irq, void *=
dev)
> >               complete(&ispif->reset_complete[0]);
> >
> >       if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 pix0 overflow\n");
> >
> >       if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_RDI0_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 rdi0 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 rdi0 overflow\n");
> >
> >       if (unlikely(value1 & ISPIF_VFE_m_IRQ_STATUS_1_PIX1_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 pix1 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 pix1 overflow\n");
> >
> >       if (unlikely(value1 & ISPIF_VFE_m_IRQ_STATUS_1_RDI1_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 rdi1 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 rdi1 overflow\n");
> >
> >       if (unlikely(value2 & ISPIF_VFE_m_IRQ_STATUS_2_RDI2_OVERFLOW))
> > -             dev_err_ratelimited(to_device(ispif), "VFE0 rdi2 overflow=
\n");
> > +             dev_err_ratelimited(camss->dev, "VFE0 rdi2 overflow\n");
> >
> >       return IRQ_HANDLED;
> >   }
> >
> >   static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
> >   {
> > +     struct camss *camss =3D ispif->camss;
> > +
> >       unsigned long time;
> >       u32 val;
> >
> > -     if (vfe_id > (to_camss(ispif)->vfe_num - 1)) {
> > -             dev_err(to_device(ispif),
> > +     if (vfe_id > (camss->vfe_num - 1)) {
> > +             dev_err(camss->dev,
> >                       "Error: asked reset for invalid VFE%d\n", vfe_id)=
;
> >               return -ENOENT;
> >       }
> > @@ -300,7 +304,7 @@ static int ispif_vfe_reset(struct ispif_device *isp=
if, u8 vfe_id)
> >       time =3D wait_for_completion_timeout(&ispif->reset_complete[vfe_i=
d],
> >               msecs_to_jiffies(ISPIF_RESET_TIMEOUT_MS));
> >       if (!time) {
> > -             dev_err(to_device(ispif),
> > +             dev_err(camss->dev,
> >                       "ISPIF for VFE%d reset timeout\n", vfe_id);
> >               return -EIO;
> >       }
> > @@ -316,30 +320,31 @@ static int ispif_vfe_reset(struct ispif_device *i=
spif, u8 vfe_id)
> >    */
> >   static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
> >   {
> > +     struct camss *camss =3D ispif->camss;
> >       int ret;
> >
> > -     ret =3D camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
> > +     ret =3D camss_pm_domain_on(camss, PM_DOMAIN_VFE0);
> >       if (ret < 0)
> >               return ret;
> >
> > -     ret =3D camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE1);
> > +     ret =3D camss_pm_domain_on(camss, PM_DOMAIN_VFE1);
> >       if (ret < 0)
> >               return ret;
> >
> >       ret =3D camss_enable_clocks(ispif->nclocks_for_reset,
> >                                 ispif->clock_for_reset,
> > -                               to_device(ispif));
> > +                               camss->dev);
> >       if (ret < 0)
> >               return ret;
> >
> >       ret =3D ispif_vfe_reset(ispif, vfe_id);
> >       if (ret)
> > -             dev_dbg(to_device(ispif), "ISPIF Reset failed\n");
> > +             dev_dbg(camss->dev, "ISPIF Reset failed\n");
> >
> >       camss_disable_clocks(ispif->nclocks_for_reset, ispif->clock_for_r=
eset);
> >
> > -     camss_pm_domain_off(to_camss(ispif), PM_DOMAIN_VFE0);
> > -     camss_pm_domain_off(to_camss(ispif), PM_DOMAIN_VFE1);
> > +     camss_pm_domain_off(camss, PM_DOMAIN_VFE0);
> > +     camss_pm_domain_off(camss, PM_DOMAIN_VFE1);
> >
> >       return ret;
> >   }
> > @@ -355,7 +360,7 @@ static int ispif_set_power(struct v4l2_subdev *sd, =
int on)
> >   {
> >       struct ispif_line *line =3D v4l2_get_subdevdata(sd);
> >       struct ispif_device *ispif =3D line->ispif;
> > -     struct device *dev =3D to_device(ispif);
> > +     struct device *dev =3D ispif->camss->dev;
> >       int ret =3D 0;
> >
> >       mutex_lock(&ispif->power_lock);
> > @@ -505,7 +510,7 @@ static int ispif_validate_intf_status(struct ispif_=
device *ispif,
> >       }
> >
> >       if ((val & 0xf) !=3D 0xf) {
> > -             dev_err(to_device(ispif), "%s: ispif is busy: 0x%x\n",
> > +             dev_err(ispif->camss->dev, "%s: ispif is busy: 0x%x\n",
> >                       __func__, val);
> >               ret =3D -EBUSY;
> >       }
> > @@ -552,7 +557,7 @@ static int ispif_wait_for_stop(struct ispif_device =
*ispif,
> >                                ISPIF_TIMEOUT_SLEEP_US,
> >                                ISPIF_TIMEOUT_ALL_US);
> >       if (ret < 0)
> > -             dev_err(to_device(ispif), "%s: ispif stop timeout\n",
> > +             dev_err(ispif->camss->dev, "%s: ispif stop timeout\n",
> >                       __func__);
> >
> >       return ret;
> > @@ -800,6 +805,7 @@ static int ispif_set_stream(struct v4l2_subdev *sd,=
 int enable)
> >   {
> >       struct ispif_line *line =3D v4l2_get_subdevdata(sd);
> >       struct ispif_device *ispif =3D line->ispif;
> > +     struct camss *camss =3D ispif->camss;
> >       enum ispif_intf intf =3D line->interface;
> >       u8 csid =3D line->csid_id;
> >       u8 vfe =3D line->vfe_id;
> > @@ -825,8 +831,8 @@ static int ispif_set_stream(struct v4l2_subdev *sd,=
 int enable)
> >               ispif_select_csid(ispif, intf, csid, vfe, 1);
> >               ispif_select_cid(ispif, intf, cid, vfe, 1);
> >               ispif_config_irq(ispif, intf, vfe, 1);
> > -             if (to_camss(ispif)->version =3D=3D CAMSS_8x96 ||
> > -                 to_camss(ispif)->version =3D=3D CAMSS_660)
> > +             if (camss->version =3D=3D CAMSS_8x96 ||
> > +                 camss->version =3D=3D CAMSS_660)
> >                       ispif_config_pack(ispif,
> >                                         line->fmt[MSM_ISPIF_PAD_SINK].c=
ode,
> >                                         intf, cid, vfe, 1);
> > @@ -843,8 +849,8 @@ static int ispif_set_stream(struct v4l2_subdev *sd,=
 int enable)
> >                       return ret;
> >
> >               mutex_lock(&ispif->config_lock);
> > -             if (to_camss(ispif)->version =3D=3D CAMSS_8x96 ||
> > -                 to_camss(ispif)->version =3D=3D CAMSS_660)
> > +             if (camss->version =3D=3D CAMSS_8x96 ||
> > +                 camss->version =3D=3D CAMSS_660)
> >                       ispif_config_pack(ispif,
> >                                         line->fmt[MSM_ISPIF_PAD_SINK].c=
ode,
> >                                         intf, cid, vfe, 0);
> > @@ -1088,26 +1094,29 @@ static int ispif_init_formats(struct v4l2_subde=
v *sd, struct v4l2_subdev_fh *fh)
> >    *
> >    * Return 0 on success or a negative error code otherwise
> >    */
> > -int msm_ispif_subdev_init(struct ispif_device *ispif,
> > +int msm_ispif_subdev_init(struct camss *camss,
> >                         const struct resources_ispif *res)
> >   {
> > -     struct device *dev =3D to_device(ispif);
> > +     struct device *dev =3D camss->dev;
> > +     struct ispif_device *ispif =3D camss->ispif;
> >       struct platform_device *pdev =3D to_platform_device(dev);
> >       struct resource *r;
> >       int i;
> >       int ret;
> >
> > +     ispif->camss =3D camss;
> > +
> >       /* Number of ISPIF lines - same as number of CSID hardware module=
s */
> > -     if (to_camss(ispif)->version =3D=3D CAMSS_8x16)
> > +     if (camss->version =3D=3D CAMSS_8x16)
> >               ispif->line_num =3D 2;
> > -     else if (to_camss(ispif)->version =3D=3D CAMSS_8x96 ||
> > -              to_camss(ispif)->version =3D=3D CAMSS_660)
> > +     else if (camss->version =3D=3D CAMSS_8x96 ||
> > +              camss->version =3D=3D CAMSS_660)
> >               ispif->line_num =3D 4;
> >       else
> >               return -EINVAL;
> >
> > -     ispif->line =3D devm_kcalloc(dev, ispif->line_num, sizeof(*ispif-=
>line),
> > -                                GFP_KERNEL);
> > +     ispif->line =3D devm_kcalloc(dev, ispif->line_num,
> > +                     sizeof(*ispif->line), GFP_KERNEL);
> >       if (!ispif->line)
> >               return -ENOMEM;
> >
> > @@ -1115,12 +1124,12 @@ int msm_ispif_subdev_init(struct ispif_device *=
ispif,
> >               ispif->line[i].ispif =3D ispif;
> >               ispif->line[i].id =3D i;
> >
> > -             if (to_camss(ispif)->version =3D=3D CAMSS_8x16) {
> > +             if (camss->version =3D=3D CAMSS_8x16) {
> >                       ispif->line[i].formats =3D ispif_formats_8x16;
> >                       ispif->line[i].nformats =3D
> >                                       ARRAY_SIZE(ispif_formats_8x16);
> > -             } else if (to_camss(ispif)->version =3D=3D CAMSS_8x96 ||
> > -                        to_camss(ispif)->version =3D=3D CAMSS_660) {
> > +             } else if (camss->version =3D=3D CAMSS_8x96 ||
> > +                        camss->version =3D=3D CAMSS_660) {
> >                       ispif->line[i].formats =3D ispif_formats_8x96;
> >                       ispif->line[i].nformats =3D
> >                                       ARRAY_SIZE(ispif_formats_8x96);
> > @@ -1157,15 +1166,16 @@ int msm_ispif_subdev_init(struct ispif_device *=
ispif,
> >       ispif->irq =3D r->start;
> >       snprintf(ispif->irq_name, sizeof(ispif->irq_name), "%s_%s",
> >                dev_name(dev), MSM_ISPIF_NAME);
> > -     if (to_camss(ispif)->version =3D=3D CAMSS_8x16)
> > +     if (camss->version =3D=3D CAMSS_8x16)
> >               ret =3D devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
> >                              IRQF_TRIGGER_RISING, ispif->irq_name, ispi=
f);
> > -     else if (to_camss(ispif)->version =3D=3D CAMSS_8x96 ||
> > -              to_camss(ispif)->version =3D=3D CAMSS_660)
> > +     else if (camss->version =3D=3D CAMSS_8x96 ||
> > +              camss->version =3D=3D CAMSS_660)
> >               ret =3D devm_request_irq(dev, ispif->irq, ispif_isr_8x96,
> >                              IRQF_TRIGGER_RISING, ispif->irq_name, ispi=
f);
> >       else
> >               ret =3D -EINVAL;
> > +
> >       if (ret < 0) {
> >               dev_err(dev, "request_irq failed: %d\n", ret);
> >               return ret;
> > @@ -1331,10 +1341,13 @@ static const struct media_entity_operations isp=
if_media_ops =3D {
> >   int msm_ispif_register_entities(struct ispif_device *ispif,
> >                               struct v4l2_device *v4l2_dev)
> >   {
> > -     struct device *dev =3D to_device(ispif);
> > +     struct camss *camss =3D  ispif->camss;
>
> - here ispif is used before the if (!ispif) check below...

You are completely right, but due to another mistake this code
actually works ok. msm_ispif_register_entities() is only called is
camss->ispif is set, so we're not going to do NULL derefs.

>
> >       int ret;
> >       int i;
>
> ... and here is the check:

Let's fix this check and remove the check in camss.c

>
> > +     if (!ispif)
> > +             return 0;
>
> Thanks,
> Andrey
>
> > +
> >       for (i =3D 0; i < ispif->line_num; i++) {
> >               struct v4l2_subdev *sd =3D &ispif->line[i].subdev;
> >               struct media_pad *pads =3D ispif->line[i].pads;
> > @@ -1348,7 +1361,7 @@ int msm_ispif_register_entities(struct ispif_devi=
ce *ispif,
> >
> >               ret =3D ispif_init_formats(sd, NULL);
> >               if (ret < 0) {
> > -                     dev_err(dev, "Failed to init format: %d\n", ret);
> > +                     dev_err(camss->dev, "Failed to init format: %d\n"=
, ret);
> >                       goto error;
> >               }
> >
> > @@ -1360,13 +1373,15 @@ int msm_ispif_register_entities(struct ispif_de=
vice *ispif,
> >               ret =3D media_entity_pads_init(&sd->entity, MSM_ISPIF_PAD=
S_NUM,
> >                                            pads);
> >               if (ret < 0) {
> > -                     dev_err(dev, "Failed to init media entity: %d\n",=
 ret);
> > +                     dev_err(camss->dev, "Failed to init media entity:=
 %d\n",
> > +                             ret);
> >                       goto error;
> >               }
> >
> >               ret =3D v4l2_device_register_subdev(v4l2_dev, sd);
> >               if (ret < 0) {
> > -                     dev_err(dev, "Failed to register subdev: %d\n", r=
et);
> > +                     dev_err(camss->dev, "Failed to register subdev: %=
d\n",
> > +                             ret);
> >                       media_entity_cleanup(&sd->entity);
> >                       goto error;
> >               }
> > @@ -1393,6 +1408,9 @@ void msm_ispif_unregister_entities(struct ispif_d=
evice *ispif)
> >   {
> >       int i;
> >
> > +     if (!ispif)
> > +             return;
> > +
> >       mutex_destroy(&ispif->power_lock);
> >       mutex_destroy(&ispif->config_lock);
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-ispif.h b/drivers/=
media/platform/qcom/camss/camss-ispif.h
> > index 4132174f7ea1..fdf28e68cc7d 100644
> > --- a/drivers/media/platform/qcom/camss/camss-ispif.h
> > +++ b/drivers/media/platform/qcom/camss/camss-ispif.h
> > @@ -63,11 +63,12 @@ struct ispif_device {
> >       struct mutex config_lock;
> >       unsigned int line_num;
> >       struct ispif_line *line;
> > +     struct camss *camss;
> >   };
> >
> >   struct resources_ispif;
> >
> > -int msm_ispif_subdev_init(struct ispif_device *ispif,
> > +int msm_ispif_subdev_init(struct camss *camss,
> >                         const struct resources_ispif *res);
> >
> >   int msm_ispif_register_entities(struct ispif_device *ispif,
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/=
platform/qcom/camss/camss.c
> > index 8fefce57bc49..b966de344b5b 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -748,11 +748,13 @@ static int camss_init_subdevices(struct camss *ca=
mss)
> >               }
> >       }
> >
> > -     ret =3D msm_ispif_subdev_init(&camss->ispif, ispif_res);
> > -     if (ret < 0) {
> > -             dev_err(camss->dev, "Failed to init ispif sub-device: %d\=
n",
> > +     if (camss->ispif) {
> > +             ret =3D msm_ispif_subdev_init(camss, ispif_res);
> > +             if (ret < 0) {
> > +                     dev_err(camss->dev, "Failed to init ispif sub-dev=
ice: %d\n",
> >                       ret);
> > -             return ret;
> > +                     return ret;
> > +             }
> >       }
> >
> >       for (i =3D 0; i < camss->vfe_num; i++) {
> > @@ -801,11 +803,14 @@ static int camss_register_entities(struct camss *=
camss)
> >               }
> >       }
> >
> > -     ret =3D msm_ispif_register_entities(&camss->ispif, &camss->v4l2_d=
ev);
> > -     if (ret < 0) {
> > -             dev_err(camss->dev, "Failed to register ispif entities: %=
d\n",
> > +     if (camss->ispif) {
> > +             ret =3D msm_ispif_register_entities(camss->ispif,
> > +                                               &camss->v4l2_dev);
> > +             if (ret < 0) {
> > +                     dev_err(camss->dev, "Failed to register ispif ent=
ities: %d\n",
> >                       ret);
> > -             goto err_reg_ispif;
> > +                     goto err_reg_ispif;
> > +             }
> >       }
> >
> >       for (i =3D 0; i < camss->vfe_num; i++) {
> > @@ -838,43 +843,64 @@ static int camss_register_entities(struct camss *=
camss)
> >               }
> >       }
> >
> > -     for (i =3D 0; i < camss->csid_num; i++) {
> > -             for (j =3D 0; j < camss->ispif.line_num; j++) {
> > -                     ret =3D media_create_pad_link(
> > -                             &camss->csid[i].subdev.entity,
> > -                             MSM_CSID_PAD_SRC,
> > -                             &camss->ispif.line[j].subdev.entity,
> > -                             MSM_ISPIF_PAD_SINK,
> > -                             0);
> > -                     if (ret < 0) {
> > -                             dev_err(camss->dev,
> > -                                     "Failed to link %s->%s entities: =
%d\n",
> > -                                     camss->csid[i].subdev.entity.name=
,
> > -                                     camss->ispif.line[j].subdev.entit=
y.name,
> > -                                     ret);
> > -                             goto err_link;
> > -                     }
> > -             }
> > -     }
> > -
> > -     for (i =3D 0; i < camss->ispif.line_num; i++)
> > -             for (k =3D 0; k < camss->vfe_num; k++)
> > -                     for (j =3D 0; j < ARRAY_SIZE(camss->vfe[k].line);=
 j++) {
> > +     if (camss->ispif) {
> > +             for (i =3D 0; i < camss->csid_num; i++) {
> > +                     for (j =3D 0; j < camss->ispif->line_num; j++) {
> >                               ret =3D media_create_pad_link(
> > -                                     &camss->ispif.line[i].subdev.enti=
ty,
> > -                                     MSM_ISPIF_PAD_SRC,
> > -                                     &camss->vfe[k].line[j].subdev.ent=
ity,
> > -                                     MSM_VFE_PAD_SINK,
> > +                                     &camss->csid[i].subdev.entity,
> > +                                     MSM_CSID_PAD_SRC,
> > +                                     &camss->ispif->line[j].subdev.ent=
ity,
> > +                                     MSM_ISPIF_PAD_SINK,
> >                                       0);
> >                               if (ret < 0) {
> >                                       dev_err(camss->dev,
> >                                               "Failed to link %s->%s en=
tities: %d\n",
> > -                                             camss->ispif.line[i].subd=
ev.entity.name,
> > -                                             camss->vfe[k].line[j].sub=
dev.entity.name,
> > +                                             camss->csid[i].subdev.ent=
ity.name,
> > +                                             camss->ispif->line[j].sub=
dev.entity.name,
> >                                               ret);
> >                                       goto err_link;
> >                               }
> >                       }
> > +             }
> > +
> > +             for (i =3D 0; i < camss->ispif->line_num; i++)
> > +                     for (k =3D 0; k < camss->vfe_num; k++)
> > +                             for (j =3D 0; j < ARRAY_SIZE(camss->vfe[k=
].line); j++) {
> > +                                     ret =3D media_create_pad_link(
> > +                                             &camss->ispif->line[i].su=
bdev.entity,
> > +                                             MSM_ISPIF_PAD_SRC,
> > +                                             &camss->vfe[k].line[j].su=
bdev.entity,
> > +                                             MSM_VFE_PAD_SINK,
> > +                                             0);
> > +                                     if (ret < 0) {
> > +                                             dev_err(camss->dev,
> > +                                                     "Failed to link %=
s->%s entities: %d\n",
> > +                                                     camss->ispif->lin=
e[i].subdev.entity.name,
> > +                                                     camss->vfe[k].lin=
e[j].subdev.entity.name,
> > +                                                     ret);
> > +                                             goto err_link;
> > +                                     }
> > +                             }
> > +     } else {
> > +             for (i =3D 0; i < camss->csid_num; i++)
> > +                     for (k =3D 0; k < camss->vfe_num; k++)
> > +                             for (j =3D 0; j < ARRAY_SIZE(camss->vfe[k=
].line); j++) {
> > +                                     ret =3D media_create_pad_link(
> > +                                             &camss->csid[i].subdev.en=
tity,
> > +                                             MSM_CSID_PAD_SRC,
> > +                                             &camss->vfe[k].line[j].su=
bdev.entity,
> > +                                             MSM_VFE_PAD_SINK,
> > +                                             0);
> > +                                     if (ret < 0) {
> > +                                             dev_err(camss->dev,
> > +                                                     "Failed to link %=
s->%s entities: %d\n",
> > +                                                     camss->csid[i].su=
bdev.entity.name,
> > +                                                     camss->vfe[k].lin=
e[j].subdev.entity.name,
> > +                                                     ret);
> > +                                             goto err_link;
> > +                                     }
> > +                             }
> > +     }
> >
> >       return 0;
> >
> > @@ -884,8 +910,8 @@ static int camss_register_entities(struct camss *ca=
mss)
> >       for (i--; i >=3D 0; i--)
> >               msm_vfe_unregister_entities(&camss->vfe[i]);
> >
> > -     msm_ispif_unregister_entities(&camss->ispif);
> >   err_reg_ispif:
> > +     msm_ispif_unregister_entities(camss->ispif);
> >
> >       i =3D camss->csid_num;
> >   err_reg_csid:
> > @@ -916,7 +942,7 @@ static void camss_unregister_entities(struct camss =
*camss)
> >       for (i =3D 0; i < camss->csid_num; i++)
> >               msm_csid_unregister_entity(&camss->csid[i]);
> >
> > -     msm_ispif_unregister_entities(&camss->ispif);
> > +     msm_ispif_unregister_entities(camss->ispif);
> >
> >       for (i =3D 0; i < camss->vfe_num; i++)
> >               msm_vfe_unregister_entities(&camss->vfe[i]);
> > @@ -1047,6 +1073,15 @@ static int camss_probe(struct platform_device *p=
dev)
> >               goto err_free;
> >       }
> >
> > +     if (camss->version =3D=3D CAMSS_8x16 ||
> > +         camss->version =3D=3D CAMSS_8x96) {
> > +             camss->ispif =3D devm_kcalloc(dev, 1, sizeof(*camss->ispi=
f), GFP_KERNEL);
> > +             if (!camss->ispif) {
> > +                     ret =3D -ENOMEM;
> > +                     goto err_free;
> > +             }
> > +     }
> > +
> >       camss->vfe =3D devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->v=
fe),
> >                                 GFP_KERNEL);
> >       if (!camss->vfe) {
> > diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/=
platform/qcom/camss/camss.h
> > index 46e986452824..b7ad8e9f68a8 100644
> > --- a/drivers/media/platform/qcom/camss/camss.h
> > +++ b/drivers/media/platform/qcom/camss/camss.h
> > @@ -79,7 +79,7 @@ struct camss {
> >       struct csiphy_device *csiphy;
> >       int csid_num;
> >       struct csid_device *csid;
> > -     struct ispif_device ispif;
> > +     struct ispif_device *ispif;
> >       int vfe_num;
> >       struct vfe_device *vfe;
> >       atomic_t ref_count;
> >
