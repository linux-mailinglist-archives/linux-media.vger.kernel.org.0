Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E27524966
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 11:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbiELJt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 05:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352064AbiELJtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 05:49:52 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0056410277D
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 02:49:50 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id cu23-20020a17090afa9700b001d98d8e53b7so5750331pjb.0
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7vDNoP7XYZM3/ecf9dF4efDv9n8wOqQ+k/mfwEFZVIM=;
        b=mb92F89vgo93E7/HsAj5LhpLUe2i/MZtHILNRe75gO/u8vSR6E4KoOIWY05n54OXmz
         mStucuOBt/mx5YODMzmguRiRGW0C6PK+Qhy4Gxo41h2ZGeHfRnFpxkV4B+XOtzRir0SW
         m7yXYiECGjYG1D5VZammiNH5/3r1i9R0tEcPRI4jwmbgu1JPZRKmU+Byga0DD0gvU2Zk
         UTaY9/D5/zr6yKOB4m3zKtMmvS9VK9vRIk9OnwksPefaPoa/FtM3LSy/kNbnD1i7EK8u
         0ufH+P+PpOp1wi1sr34e+VJk6cqN6yT2FLjWRENwrUIeH5lQKsGdvxl0fyyLClXKz/At
         VjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7vDNoP7XYZM3/ecf9dF4efDv9n8wOqQ+k/mfwEFZVIM=;
        b=oXbcqz5VB43PmyJI7PLterjVx7FGqg+1BJL9iPsoDPYgqAmWpc4ZoByXe0te9rSn5n
         udpV1eHPHtMudtwRIlWdTJShr9u7SFZUWKC/phthJJnYKn0nmytrSN7jlfugpOo5t6IY
         fKrBBqFmamp6vfAvuAZRjrZ6e5Gvt4IrRTsNRwQOScSNs71FTHK4VgSkUnKG2qnmOoh7
         1KFzFe3jT1NMM6HvIIek/A2BT8fTLorjQ4037SIIBhFbUWK5RN2xAzGLZ4STN68YIbV/
         lKYuh5xU/VCCnoxhVapwhru1IuCgdWEsw/JTCC02jSrQAQaSPLcYBxCMJTiW3tfRBqfy
         ywSw==
X-Gm-Message-State: AOAM530dusAtyi260HqX/HMHNFwuMZguDT0YkgYvFFpvPj3HekTeU46O
        uZq7silc1evfcvUoTU+iQe8KBPRl11yS+zZVcl7kQA==
X-Google-Smtp-Source: ABdhPJwHk7Xh/yhC4dMbEG6r7xpO7vJpDubqawNg75H5HqMpAfXdlGz3L8x/czAh8IkjrnGfxoy7bw/M8FPCKoWmg0o=
X-Received: by 2002:a17:903:228f:b0:15e:be12:a181 with SMTP id
 b15-20020a170903228f00b0015ebe12a181mr29895350plh.21.1652348990250; Thu, 12
 May 2022 02:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220512082318.189398-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220512082318.189398-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 12 May 2022 11:49:39 +0200
Message-ID: <CAG3jFysytZ9JjNA3qLWv24hi7tPC2sE1F8wcyOTfJvdgJ+NaQw@mail.gmail.com>
Subject: Re: [PATCH] media: camss: Allocate power domain resources dynamically
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 12 May 2022 at 10:23, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> To simplify the driver's maintenance it makes sense to escape from
> hardcoded numbers of power domain resources per platform and statical
> allocation of the resources. For instance on a QCOM SM8450 platform
> the number of CAMSS power domains shall be bumped up to 6, also notably
> CAMSS on MSM8916 has only one power domain, however it expects to get 2,
> and thus it should result in a runtime error on driver probe.
>
> The change fixes an issue mentioned above and gives more flexibility
> to support more platforms in future.

This is a great idea, thanks for submitting this.

>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 38 +++++++++++++----------
>  drivers/media/platform/qcom/camss/camss.h |  7 ++---
>  2 files changed, 24 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 79ad82e233cb..32d72b4f947b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1452,19 +1452,31 @@ static const struct media_device_ops camss_media_ops = {
>
>  static int camss_configure_pd(struct camss *camss)
>  {
> -       int nbr_pm_domains = 0;
> +       struct device *dev = camss->dev;
>         int last_pm_domain = 0;
>         int i;
>         int ret;
>
> -       if (camss->version == CAMSS_8x96 ||
> -           camss->version == CAMSS_660)
> -               nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> -       else if (camss->version == CAMSS_845 ||
> -                camss->version == CAMSS_8250)
> -               nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
> +       camss->genpd_num = of_count_phandle_with_args(dev->of_node,
> +                                                     "power-domains",
> +                                                     "#power-domain-cells");
> +       if (camss->genpd_num < 0) {
> +               dev_err(dev, "Power domains are not defined for camss\n");
> +               return camss->genpd_num;
> +       }
> +
> +       camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
> +                                         sizeof(*camss->genpd), GFP_KERNEL);
> +       if (!camss->genpd)
> +               return -ENOMEM;
>
> -       for (i = 0; i < nbr_pm_domains; i++) {
> +       camss->genpd_link = devm_kmalloc_array(dev, camss->genpd_num,
> +                                              sizeof(*camss->genpd_link),
> +                                              GFP_KERNEL);
> +       if (!camss->genpd_link)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < camss->genpd_num; i++) {
>                 camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
>                 if (IS_ERR(camss->genpd[i])) {
>                         ret = PTR_ERR(camss->genpd[i]);
> @@ -1689,7 +1701,6 @@ static int camss_probe(struct platform_device *pdev)
>
>  void camss_delete(struct camss *camss)
>  {
> -       int nbr_pm_domains = 0;
>         int i;
>
>         v4l2_device_unregister(&camss->v4l2_dev);
> @@ -1698,14 +1709,7 @@ void camss_delete(struct camss *camss)
>
>         pm_runtime_disable(camss->dev);
>
> -       if (camss->version == CAMSS_8x96 ||
> -           camss->version == CAMSS_660)
> -               nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> -       else if (camss->version == CAMSS_845 ||
> -                camss->version == CAMSS_8250)
> -               nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
> -
> -       for (i = 0; i < nbr_pm_domains; i++) {
> +       for (i = 0; i < camss->genpd_num; i++) {
>                 device_link_del(camss->genpd_link[i]);
>                 dev_pm_domain_detach(camss->genpd[i], true);
>         }
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index c9b3e0df5be8..0db80cadbbaa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -69,9 +69,7 @@ struct resources_icc {
>  enum pm_domain {
>         PM_DOMAIN_VFE0 = 0,
>         PM_DOMAIN_VFE1 = 1,
> -       PM_DOMAIN_GEN1_COUNT = 2,       /* CAMSS series of ISPs */
>         PM_DOMAIN_VFELITE = 2,          /* VFELITE / TOP GDSC */
> -       PM_DOMAIN_GEN2_COUNT = 3,       /* Titan series of ISPs */
>  };
>
>  enum camss_version {
> @@ -101,8 +99,9 @@ struct camss {
>         int vfe_num;
>         struct vfe_device *vfe;
>         atomic_t ref_count;
> -       struct device *genpd[PM_DOMAIN_GEN2_COUNT];
> -       struct device_link *genpd_link[PM_DOMAIN_GEN2_COUNT];
> +       int genpd_num;
> +       struct device **genpd;
> +       struct device_link **genpd_link;
>         struct icc_path *icc_path[ICC_SM8250_COUNT];
>         struct icc_bw_tbl icc_bw_tbl[ICC_SM8250_COUNT];
>  };
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
