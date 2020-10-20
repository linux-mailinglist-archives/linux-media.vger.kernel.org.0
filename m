Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DE429393B
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 12:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392127AbgJTKfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 06:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388224AbgJTKfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 06:35:43 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B61C0613D1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 03:35:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ds1so694274pjb.5
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 03:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k40p/TeTSBCnYnmdeXcl5d+yUSPbyw9jvLg468r2bq0=;
        b=CkH8rcRgSS61NJ0Nk7uX4ybp4pUswOiSBKXWxnHqkXFFG1I5B9UhQTDXbnO4dR6tEt
         Zgils15Hn+Uo/WI/KpYz9cwb5SqXBic9T4ZFcqzoExoRsUHiROexKTtohb9HboqvQDcg
         ao+WEbs/Po/vW2No+kjSaBl7sA9BBsi1lXaIyrnkNqLMmXyXllDOleF1SQ0cFAXBTWrG
         MvDCCVyHfNxdMNBu6VtfG1vnYrNTu8Fxkzy1e4OB71qF/N1RrfmfgwzPjoEeH5/iGBGY
         JINmDFYiGhdb62uzfr8TuCrfMrSMdTP+n8SSMDsPnQHUSrMt+WUPD6O7CQ8kkFplL20z
         hwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k40p/TeTSBCnYnmdeXcl5d+yUSPbyw9jvLg468r2bq0=;
        b=OcT9LAP6ebJGpVRAftCbIk3UOKoau1NPXprylBMQive0yQClnfsU4GJC91TdhF7ING
         XKMlU6Ueb4wAr/QtF4kaKRSNwQBbtL8KtxuZxtirjiWJGS2coYQw+UrMdke3WhRDEnfU
         ETQX8/uYgdQkLMcH3IVaQ1qo3cmWowHVdvx3RADeoLbAhHvs77LLWdBEaGkmCbM6CoQy
         9D12CsgAwMyIqr6MB5XHdy5oJf6c4Xwje516Uuohfb+KKONtdB7q6q1vQWyVl4RL7Tn/
         lSTd30dG4zaUOoJlOEw6Lf02P7WeKGI2I7NJpj0HMaVSMOM3iIgbI6M3aS/MnTPvNl8s
         ffQw==
X-Gm-Message-State: AOAM530Ya87GEQDN2N+ccMQwfPqQ6mAe41eRnsp9FKaUtYb9nNGuzaKS
        6wLXO3c0IRNfq9MD2bldBCn/v+8ciXZ8Gk9XFM6e2w==
X-Google-Smtp-Source: ABdhPJxGTD2sg1dy+OBDXRxwUamj9At+GgAySaXyHJO4hLCK1PcnnEbJUi66rwy84mMzTtDPxlDHIVv2XITElCAfJdk=
X-Received: by 2002:a17:90a:160f:: with SMTP id n15mr2190488pja.75.1603190143362;
 Tue, 20 Oct 2020 03:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201018125237.16717-1-kholk11@gmail.com> <20201018125237.16717-7-kholk11@gmail.com>
In-Reply-To: <20201018125237.16717-7-kholk11@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 20 Oct 2020 12:35:32 +0200
Message-ID: <CAG3jFyt+rf_efCw3TLR9R4aHSfBaAh9tKwcp7yhyVys64iaqLA@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660
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

Looks good to me.

Signed-off-by: Robert Foss <robert.foss@linaro.org>

On Sun, 18 Oct 2020 at 14:53, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> The SDM630/660 SoCs (and variants) have another clock source
> for the PHY, which must be set to a rate that's equal or
> greater than the CSI PHY timer clock: failing to do this
> will produce PHY overflows when trying to get a stream from
> a very high bandwidth camera sensor and outputting no frame
> or a partial one.
>
> Since I haven't found any usecase in which the csiX_phy
> clock needs to be higher than the csiXphy_timer, let's just
> set the same rate on both, which seems to work just perfect.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../media/platform/qcom/camss/camss-csiphy.c  | 22 ++++++++++++++++---
>  .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
>  2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index c00f25aac21b..a5d717d022a5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -113,9 +113,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>         for (i = 0; i < csiphy->nclocks; i++) {
>                 struct camss_clock *clock = &csiphy->clock[i];
>
> -               if (!strcmp(clock->name, "csiphy0_timer") ||
> -                   !strcmp(clock->name, "csiphy1_timer") ||
> -                   !strcmp(clock->name, "csiphy2_timer")) {
> +               if (csiphy->rate_set[i]) {
>                         u8 bpp = csiphy_get_bpp(csiphy->formats,
>                                         csiphy->nformats,
>                                         csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> @@ -611,6 +609,13 @@ int msm_csiphy_subdev_init(struct camss *camss,
>         if (!csiphy->clock)
>                 return -ENOMEM;
>
> +       csiphy->rate_set = devm_kcalloc(dev,
> +                                       csiphy->nclocks,
> +                                       sizeof(*csiphy->rate_set),
> +                                       GFP_KERNEL);
> +       if (!csiphy->rate_set)
> +               return -ENOMEM;
> +
>         for (i = 0; i < csiphy->nclocks; i++) {
>                 struct camss_clock *clock = &csiphy->clock[i];
>
> @@ -638,6 +643,17 @@ int msm_csiphy_subdev_init(struct camss *camss,
>
>                 for (j = 0; j < clock->nfreqs; j++)
>                         clock->freq[j] = res->clock_rate[i][j];
> +
> +               if (!strcmp(clock->name, "csiphy0_timer") ||
> +                   !strcmp(clock->name, "csiphy1_timer") ||
> +                   !strcmp(clock->name, "csiphy2_timer"))
> +                       csiphy->rate_set[i] = true;
> +
> +               if (camss->version == CAMSS_660 &&
> +                   (!strcmp(clock->name, "csi0_phy") ||
> +                    !strcmp(clock->name, "csi1_phy") ||
> +                    !strcmp(clock->name, "csi2_phy")))
> +                       csiphy->rate_set[i] = true;
>         }
>
>         return 0;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 376f865ad383..f7967ef836dc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -66,6 +66,7 @@ struct csiphy_device {
>         u32 irq;
>         char irq_name[30];
>         struct camss_clock *clock;
> +       bool *rate_set;
>         int nclocks;
>         u32 timer_clk_rate;
>         struct csiphy_config cfg;
> --
> 2.28.0
>
