Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02825568A40
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 15:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbiGFN4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 09:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbiGFN4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 09:56:49 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB1617048
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 06:56:48 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-10bd4812c29so15742400fac.11
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ldH9+gxiVVWoGGSTb1LluVInskYjuLpgVtgP5uhcskw=;
        b=bJC00Bvj3ejNUIXsfUg/AECgvyrxnSbLDDGaiOye8vB17SdvPDIc7fSNPJKmvxqNm3
         yvzzS5uK7iqv3u42ihG+RunEW1B/ko4qKFASciootr/aQM9n4ztQG8vLRKJwKJDG0JF4
         9WkUIsG/bJDJy1ZWTOhecG2zH/RS7jPaNCoyZs2uX3r7Huw8XpZ4l9y8rPSDW7bTBgLi
         5ZOSffPrtMykQLehOxef3bXhfbP2j2j2NWJ5KF1U710wICyLAgw84mRLLG7I17Nuj95J
         U9j3SROnq1OxnAB35m7wKAcQEQojeRfEbiGCHuAm0r48hWmI69D1VY1DmwlMdCXShgQm
         qoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ldH9+gxiVVWoGGSTb1LluVInskYjuLpgVtgP5uhcskw=;
        b=t0snE3pKXGQODTkibI35Pkpma2Aw0RbNQPMz4nzRRVvL+huLkX3Eiec0wGlryVwKmn
         B9KS1cJAD9squksAGrkvB0hMNRj4a1jbK6UGQtw2ZX3cfyCUoyMrI5V/JmjTKxte2H2n
         eanyFLvOKuPfexFZuYe9sR836+gxNt568wlBPDgIhl2XMLA+//k3HhOr/XEuo4aYB93N
         ZtChKr8M8ajmRFxXcOaVKJJoAT2VDXmva+WscM98ugfuTpwwUSg9UUY+OOwwjJZ8cXIt
         fRwU9TC0P6owr6rrDOZv8Pwt6uhTl8uHgQab9mryt5avoQUk8X2pR4+MQ7FqRvIRj45V
         iKbA==
X-Gm-Message-State: AJIora/urtG8SM1HogUlXJNchnCF1vdTgM6AFGXcdti0EDyj71o9UknE
        ecYxovOL3B5BNHNV6xZIbWWi3QBOxyFOUOxyatHWqg==
X-Google-Smtp-Source: AGRyM1sYeBgdjgB0S8VrA4C6cSRdrEdFOo4rQG4LZyb/WRq2vu4q0pAwO2Yk8hNeo2BKudd9wfmebkmxaoN48GmPI6g=
X-Received: by 2002:a05:6870:1601:b0:108:2d92:5494 with SMTP id
 b1-20020a056870160100b001082d925494mr25254953oae.109.1657115807907; Wed, 06
 Jul 2022 06:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220704221548.629302-1-vladimir.zapolskiy@linaro.org> <20220704221548.629302-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704221548.629302-3-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 6 Jul 2022 15:56:37 +0200
Message-ID: <CAG3jFyv4UdeUOq=qtxgv1HEDTeePC8xL=8RWCR_WU8XCHP3=-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camss: Split power domain management
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 5 Jul 2022 at 00:15, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> There are three cases of power domain management on supported platforms:
> 1) CAMSS on MSM8916, where a single VFE power domain is operated outside
>    of the camss device driver,
> 2) CAMSS on MSM8996 and SDM630/SDM660, where two VFE power domains are
>    managed separately by the camss device driver, the power domains are
>    linked and unlinked on demand by their functions vfe_pm_domain_on()
>    and vfe_pm_domain_off() respectively,
> 3) CAMSS on SDM845 and SM8250 platforms, and there are two VFE power
>    domains and their parent power domain TITAN_TOP, the latter one
>    shall be turned on prior to turning on any of VFE power domains.
>
> Due to a previously missing link between TITAN_TOP and VFEx power domains
> in the latter case, which is now fixed by [1], it was decided always to
> turn on all found VFE power domains and TITAN_TOP power domain, even if
> just one particular VFE is needed to be enabled or none of VFE power domains
> are required, for instance the latter case is when vfe_lite is in use.
> This misusage becomes more incovenient and clumsy, if next generations are
> to be supported, for instance CAMSS on SM8450 has three VFE power domains.
>
> The change splits the power management support for platforms with TITAN_TOP
> parent power domain, and, since 'power-domain-names' property is not present
> in camss device tree nodes, the assumption is that the first N power domains
> from the 'power-domains' list correspond to VFE power domains, and, if the
> number of power domains is greater than number of non-lite VFEs, then the
> last power domain from the list is the TITAN_TOP power domain.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../media/platform/qcom/camss/camss-vfe-170.c | 20 ++++++++++++-
>  .../media/platform/qcom/camss/camss-vfe-480.c | 20 ++++++++++++-
>  drivers/media/platform/qcom/camss/camss.c     | 30 ++++++++++---------
>  3 files changed, 54 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> index 600150cfc4f7..8e506a805d11 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> @@ -687,7 +687,12 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
>   */
>  static void vfe_pm_domain_off(struct vfe_device *vfe)
>  {
> -       /* nop */
> +       struct camss *camss = vfe->camss;
> +
> +       if (vfe->id >= camss->vfe_num)
> +               return;
> +
> +       device_link_del(camss->genpd_link[vfe->id]);
>  }
>
>  /*
> @@ -696,6 +701,19 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
>   */
>  static int vfe_pm_domain_on(struct vfe_device *vfe)
>  {
> +       struct camss *camss = vfe->camss;
> +       enum vfe_line_id id = vfe->id;
> +
> +       if (id >= camss->vfe_num)
> +               return 0;
> +
> +       camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id],
> +                                               DL_FLAG_STATELESS |
> +                                               DL_FLAG_PM_RUNTIME |
> +                                               DL_FLAG_RPM_ACTIVE);
> +       if (!camss->genpd_link[id])
> +               return -EINVAL;
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> index 129585110393..3aa962b5663b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> @@ -494,7 +494,12 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
>   */
>  static void vfe_pm_domain_off(struct vfe_device *vfe)
>  {
> -       /* nop */
> +       struct camss *camss = vfe->camss;
> +
> +       if (vfe->id >= camss->vfe_num)
> +               return;
> +
> +       device_link_del(camss->genpd_link[vfe->id]);
>  }
>
>  /*
> @@ -503,6 +508,19 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
>   */
>  static int vfe_pm_domain_on(struct vfe_device *vfe)
>  {
> +       struct camss *camss = vfe->camss;
> +       enum vfe_line_id id = vfe->id;
> +
> +       if (id >= camss->vfe_num)
> +               return 0;
> +
> +       camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id],
> +                                               DL_FLAG_STATELESS |
> +                                               DL_FLAG_PM_RUNTIME |
> +                                               DL_FLAG_RPM_ACTIVE);
> +       if (!camss->genpd_link[id])
> +               return -EINVAL;
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 795eebd9af6c..f009297ba182 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1453,7 +1453,6 @@ static const struct media_device_ops camss_media_ops = {
>  static int camss_configure_pd(struct camss *camss)
>  {
>         struct device *dev = camss->dev;
> -       int last_pm_domain = 0;
>         int i;
>         int ret;
>
> @@ -1484,32 +1483,34 @@ static int camss_configure_pd(struct camss *camss)
>         if (!camss->genpd_link)
>                 return -ENOMEM;
>
> +       /*
> +        * VFE power domains are in the beginning of the list, and while all
> +        * power domains should be attached, only if TITAN_TOP power domain is
> +        * found in the list, it should be linked over here.
> +        */
>         for (i = 0; i < camss->genpd_num; i++) {
>                 camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
>                 if (IS_ERR(camss->genpd[i])) {
>                         ret = PTR_ERR(camss->genpd[i]);
>                         goto fail_pm;
>                 }
> +       }
>
> -               camss->genpd_link[i] = device_link_add(camss->dev, camss->genpd[i],
> -                                                      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
> -                                                      DL_FLAG_RPM_ACTIVE);
> -               if (!camss->genpd_link[i]) {
> -                       dev_pm_domain_detach(camss->genpd[i], true);
> +       if (i > camss->vfe_num) {
> +               camss->genpd_link[i - 1] = device_link_add(camss->dev, camss->genpd[i - 1],
> +                                                          DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
> +                                                          DL_FLAG_RPM_ACTIVE);
> +               if (!camss->genpd_link[i - 1]) {
>                         ret = -EINVAL;
>                         goto fail_pm;
>                 }
> -
> -               last_pm_domain = i;
>         }
>
>         return 0;
>
>  fail_pm:
> -       for (i = 0; i < last_pm_domain; i++) {
> -               device_link_del(camss->genpd_link[i]);
> +       for (--i ; i >= 0; i--)
>                 dev_pm_domain_detach(camss->genpd[i], true);
> -       }
>
>         return ret;
>  }
> @@ -1711,10 +1712,11 @@ void camss_delete(struct camss *camss)
>         if (camss->genpd_num == 1)
>                 return;
>
> -       for (i = 0; i < camss->genpd_num; i++) {
> -               device_link_del(camss->genpd_link[i]);
> +       if (camss->genpd_num > camss->vfe_num)
> +               device_link_del(camss->genpd_link[camss->genpd_num - 1]);
> +
> +       for (i = 0; i < camss->genpd_num; i++)
>                 dev_pm_domain_detach(camss->genpd[i], true);
> -       }
>  }
>
>  /*
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
