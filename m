Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99ACF29377A
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392355AbgJTJDF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390191AbgJTJDE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:03:04 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C15C0613D3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 02:03:04 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id p3so626708pjd.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 02:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4lQcBmOx+lvoDIHPYrOlN9FBXHgOaL5X05LzK3XG/XQ=;
        b=v+he3CT+vb5JfZ0WlJ1o1sKt8IelhzSVPbdoKqDaMa3qicDs8NSBARNqrwLVI0t6Ty
         FgKbb4XuNvDqIlCT1BG0paS4VI1ybb2zIlCfRPAwIvWTNOXyd9JfMnLdv4BF0c4MfokU
         L1eIqY97FugKgjx2q72bTywQvQ/CsH28WNPLhWrYZ2skPK2XdPNG50i76LgNJLU1EGB1
         Ox3jOh5jHBq41skGgbrODfSHiqO3v96xm7zzEM2m400KMkgfTtfQlpjs4fI1+Psn5Wxj
         qedWL6RFJwzpiZY/qoMIXTAW5mWATlxDTjsW5Fl/E2wMLR6kKsqJ3NG4oXjbUjzTsK0Q
         afbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4lQcBmOx+lvoDIHPYrOlN9FBXHgOaL5X05LzK3XG/XQ=;
        b=GqNsW0+U/IEce7tlE6Y6SA5HQ2ZNDbpz05NzAdmKnk+AzOZKAdNTubMvu0LlyAgz48
         tmXFy5DjD76KC9d+0pT4zOLRF7Lsqk5JDhNWbxEK7HI9orSryY8rLH218ANqV95QGBH/
         NhwNbpXacaUK/NNhmBncIEMTjJ7V2OVIOXxXLUt3DiEJjEPH9ckFVacB7IVnYfrmJ2Zh
         js2Jfx4b23aYlQLD8kvf+CeVRHs0QRzzT3Noo0bxSSM2XyBxDWhI5jfgmEYlRvK167wj
         sgt98DQOgNmliRG1SH+2GDINOusvFHAfCHV8avG0/J5BpMeQwh7nrcPQ7REhzd29wQsy
         vh7Q==
X-Gm-Message-State: AOAM533IHArdyi/fb3ngiuSa3KRSuVSrASLEW4GYFliAE7N9n9fDkiny
        9VrO5Ulx/beVMC6+Hv1ZGtBvqkMNRm6sle6CZ9ygaQ==
X-Google-Smtp-Source: ABdhPJwWCzlh8uDQnkFjSqFvhNnIZyi4d3tXWB6qbOY8CvvsOGePNZT4R9Cn1vFLc3D5jU5csfuet3fJdMBQ//klqa0=
X-Received: by 2002:a17:90a:160f:: with SMTP id n15mr1905532pja.75.1603184583629;
 Tue, 20 Oct 2020 02:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201018125237.16717-1-kholk11@gmail.com> <20201018125237.16717-3-kholk11@gmail.com>
 <CAG3jFysokz0+NCHLp9-nhxG3wGVzk1TAFBwZmhMgViUr-sk-BA@mail.gmail.com>
In-Reply-To: <CAG3jFysokz0+NCHLp9-nhxG3wGVzk1TAFBwZmhMgViUr-sk-BA@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 20 Oct 2020 11:02:51 +0200
Message-ID: <CAG3jFysUQJXdy0ogK1shbgW1Tmk6DJbS26EaeRPMDEnObQ2_zg@mail.gmail.com>
Subject: Re: [PATCH 2/6] media: camss: ispif: Correctly reset based on the VFE ID
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

I found a build issue in this commit.


On Tue, 20 Oct 2020 at 10:59, Robert Foss <robert.foss@linaro.org> wrote:
>
> Nice catch! This patch looks good to me.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> On Sun, 18 Oct 2020 at 14:54, <kholk11@gmail.com> wrote:
> >
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > Resetting the ISPIF VFE0 context is wrong if we are using the VFE1
> > for dual-camera or simply because a secondary camera is connected
> > to it: in this case the reset will always happen on the VFE0 ctx
> > of the ISPIF, which is .. useless.
> >
> > Fix this usecase by adding the ISPIF_RST_CMD_1 address and choose
> > where to do the (or what to) reset based on the VFE line id.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  .../media/platform/qcom/camss/camss-ispif.c   | 87 ++++++++++++-------
> >  .../media/platform/qcom/camss/camss-ispif.h   |  2 +-
> >  2 files changed, 57 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> > index db94cfd6c508..252db6b33dab 100644
> > --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> > +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> > @@ -26,6 +26,7 @@
> >  #define MSM_ISPIF_NAME "msm_ispif"
> >
> >  #define ISPIF_RST_CMD_0                        0x008
> > +#define ISPIF_RST_CMD_1                        0x00c
> >  #define ISPIF_RST_CMD_0_STROBED_RST_EN         (1 << 0)
> >  #define ISPIF_RST_CMD_0_MISC_LOGIC_RST         (1 << 1)
> >  #define ISPIF_RST_CMD_0_SW_REG_RST             (1 << 2)
> > @@ -179,7 +180,10 @@ static irqreturn_t ispif_isr_8x96(int irq, void *dev)
> >         writel(0x1, ispif->base + ISPIF_IRQ_GLOBAL_CLEAR_CMD);
> >
> >         if ((value0 >> 27) & 0x1)
> > -               complete(&ispif->reset_complete);
> > +               complete(&ispif->reset_complete[0]);
> > +
> > +       if ((value3 >> 27) & 0x1)
> > +               complete(&ispif->reset_complete[1]);
> >
> >         if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
> >                 dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow\n");
> > @@ -237,7 +241,7 @@ static irqreturn_t ispif_isr_8x16(int irq, void *dev)
> >         writel(0x1, ispif->base + ISPIF_IRQ_GLOBAL_CLEAR_CMD);
> >
> >         if ((value0 >> 27) & 0x1)
> > -               complete(&ispif->reset_complete);
> > +               complete(&ispif->reset_complete[0]);
> >
> >         if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
> >                 dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow\n");
> > @@ -257,33 +261,17 @@ static irqreturn_t ispif_isr_8x16(int irq, void *dev)
> >         return IRQ_HANDLED;
> >  }
> >
> > -/*
> > - * ispif_reset - Trigger reset on ISPIF module and wait to complete
> > - * @ispif: ISPIF device
> > - *
> > - * Return 0 on success or a negative error code otherwise
> > - */
> > -static int ispif_reset(struct ispif_device *ispif)
> > +static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
> >  {
> > -       unsigned long time;
> >         u32 val;
> > -       int ret;
> > -
> > -       ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
> > -       if (ret < 0)
> > -               return ret;
> >
> > -       ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE1);
> > -       if (ret < 0)
> > -               return ret;
> > -
> > -       ret = camss_enable_clocks(ispif->nclocks_for_reset,
> > -                                 ispif->clock_for_reset,
> > -                                 to_device(ispif));
> > -       if (ret < 0)
> > -               return ret;
> > +       if (vfe_id > (to_camss(ispif)->vfe_num - 1)) {
> > +               dev_err(to_device(ispif),
> > +                       "Error: asked reset for invalid VFE%d\n", vfe_id);
> > +               return -ENOENT;
> > +       }
> >
> > -       reinit_completion(&ispif->reset_complete);
> > +       reinit_completion(&ispif->reset_complete[vfe_id]);
> >
> >         val = ISPIF_RST_CMD_0_STROBED_RST_EN |
> >                 ISPIF_RST_CMD_0_MISC_LOGIC_RST |
> > @@ -303,15 +291,51 @@ static int ispif_reset(struct ispif_device *ispif)
> >                 ISPIF_RST_CMD_0_RDI_OUTPUT_1_MISR_RST |
> >                 ISPIF_RST_CMD_0_RDI_OUTPUT_2_MISR_RST;
> >
> > -       writel_relaxed(val, ispif->base + ISPIF_RST_CMD_0);
> > +       if (vfe_id == 1)
> > +               writel_relaxed(val, ispif->base + ISPIF_RST_CMD_1);
> > +       else
> > +               writel_relaxed(val, ispif->base + ISPIF_RST_CMD_0);
> >
> > -       time = wait_for_completion_timeout(&ispif->reset_complete,
> > +       time = wait_for_completion_timeout(&ispif->reset_complete[vfe_id],

'time' is not a variable that exists in this scope, so the build fails.

> >                 msecs_to_jiffies(ISPIF_RESET_TIMEOUT_MS));
> >         if (!time) {
> > -               dev_err(to_device(ispif), "ISPIF reset timeout\n");
> > -               ret = -EIO;
> > +               dev_err(to_device(ispif),
> > +                       "ISPIF for VFE%d reset timeout\n", vfe_id);
> > +               return -EIO;
> >         }
> >
> > +       return 0;
> > +}
> > +
> > +/*
> > + * ispif_reset - Trigger reset on ISPIF module and wait to complete
> > + * @ispif: ISPIF device
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> > +static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
> > +{
> > +       unsigned long time;
> > +       int ret;
> > +
> > +       ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE1);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret = camss_enable_clocks(ispif->nclocks_for_reset,
> > +                                 ispif->clock_for_reset,
> > +                                 to_device(ispif));
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret = ispif_vfe_reset(ispif, vfe_id);
> > +       if (ret)
> > +               dev_dbg(to_device(ispif), "ISPIF Reset failed\n");
> > +
> >         camss_disable_clocks(ispif->nclocks_for_reset, ispif->clock_for_reset);
> >
> >         camss_pm_domain_off(to_camss(ispif), PM_DOMAIN_VFE0);
> > @@ -355,7 +379,7 @@ static int ispif_set_power(struct v4l2_subdev *sd, int on)
> >                         goto exit;
> >                 }
> >
> > -               ret = ispif_reset(ispif);
> > +               ret = ispif_reset(ispif, line->vfe_id);
> >                 if (ret < 0) {
> >                         pm_runtime_put_sync(dev);
> >                         camss_disable_clocks(ispif->nclocks, ispif->clock);
> > @@ -1192,7 +1216,8 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
> >
> >         mutex_init(&ispif->config_lock);
> >
> > -       init_completion(&ispif->reset_complete);
> > +       for (i = 0; i < MSM_ISPIF_VFE_NUM; i++)
> > +               init_completion(&ispif->reset_complete[i]);
> >
> >         return 0;
> >  }
> > diff --git a/drivers/media/platform/qcom/camss/camss-ispif.h b/drivers/media/platform/qcom/camss/camss-ispif.h
> > index 1a5ba2425a42..4132174f7ea1 100644
> > --- a/drivers/media/platform/qcom/camss/camss-ispif.h
> > +++ b/drivers/media/platform/qcom/camss/camss-ispif.h
> > @@ -56,7 +56,7 @@ struct ispif_device {
> >         int nclocks;
> >         struct camss_clock  *clock_for_reset;
> >         int nclocks_for_reset;
> > -       struct completion reset_complete;
> > +       struct completion reset_complete[MSM_ISPIF_VFE_NUM];
> >         int power_count;
> >         struct mutex power_lock;
> >         struct ispif_intf_cmd_reg intf_cmd[MSM_ISPIF_VFE_NUM];
> > --
> > 2.28.0
> >
