Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD72B24C2A2
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbgHTPzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgHTPzQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:55:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F250C061385;
        Thu, 20 Aug 2020 08:55:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f18so4058327wmc.0;
        Thu, 20 Aug 2020 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4gsAD01Lu/a6HHuOZz2Js+H3gnol7gh8tJ3zMDutdDc=;
        b=ebljxtw8UtQQ032VUUuCGK812jroSyyHZHtTYoOMrud/UydGhZ3UMgBUN9qe9aAvk4
         EHygzdAvntJ9+R/Y3KA0p2V8fSCNXm6RFtsp3+CZNKezVJQ8X2aAKOeBHvVnuXgBzp1O
         Z4mdnxldoQFQbYRJYgGPkdtLHKlnlIzkaDXqkqTa3laBrCC8GM7uy1HvEv9ndhSWNfl7
         gtrl6II21EVeL5x1fdWpBOS2x6s/Ea7ce8pWBuPej62eiBTIeFwATx0cPhjPkPFtdmbp
         cpVIJwigFocq1ZQgZzWrnaG3CAmE48jwTnhO+RO8Uw3CBwiyc46QOxMJqP5MrYAE3v9X
         TZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4gsAD01Lu/a6HHuOZz2Js+H3gnol7gh8tJ3zMDutdDc=;
        b=M2YK8C25wXwiSlREDrwaje+Pc+ecbq1cXWwfA8Fk0e9DOJid8OOBnn1mdwH3HLoous
         spe0JTBTU3BNH/1lUxcQP12SqaQP8TYy2nFQR2zIJ3JzMtU+1MdVXEvzUuz+ynyXOHiF
         NNTrAesVGO/237I03JgLbMlQPOIN5jPIWKW4dzmQMu3ka0K3Syc1BFhzgpSjAKYmIIUS
         Ro13v0tmcQNrOn33wGG5SB10T/CLuBTvcn77p1DsTRl0j6dZ9dv/YDzJlp/D+ELCDXbC
         G7VxZ0V+V37l9EphncDzikuoaGxD/q+oXognZs/fniQ6Xkup3rk+ZulWtNICnYb73WzT
         76mQ==
X-Gm-Message-State: AOAM530phEGQ7c76G/posaBLJMHDsZTTmg628O0OV4MvnhllB/svZFvP
        zyvsTVBmsgak4Hyt5yvUQEi8fi8A0NvkmP5s33Q=
X-Google-Smtp-Source: ABdhPJymrLvmSo2mjxf1P+WzawgnYC5TC99FhFkAg2iJ/mZCttmTx/9BBIkjwyymKsU721sVZprDLyZXm16x0EfQzm0=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr3974646wmj.164.1597938913876;
 Thu, 20 Aug 2020 08:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597931875.git.robin.murphy@arm.com> <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
In-Reply-To: <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 20 Aug 2020 08:55:02 -0700
Message-ID: <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
Subject: Re: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        digetx@gmail.com, Suman Anna <s-anna@ti.com>,
        Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "moderated list:ARM/S5P EXYNOS AR..." 
        <linux-samsung-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
        linux-media@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>, linux-tegra@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        t-kristo@ti.com,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Side note, I suspect we'll end up needing something like
0e764a01015dfebff8a8ffd297d74663772e248a .. if someone can dig a 32b
device out of the closet and dust it off, the fix is easy enough.
Just wanted to mention that here so anyone with a 32b device could
find what is needed.

BR,
-R

On Thu, Aug 20, 2020 at 8:09 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Now that arch/arm is wired up for default domains and iommu-dma,
> implement the corresponding driver-side support for DMA domains.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/msm_iommu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 3615cd6241c4..f34efcbb0b2b 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -8,6 +8,7 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
> +#include <linux/dma-iommu.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
>  #include <linux/io-pgtable.h>
> @@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
>  {
>         struct msm_priv *priv;
>
> -       if (type != IOMMU_DOMAIN_UNMANAGED)
> +       if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>                 return NULL;
>
>         priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 goto fail_nomem;
>
> +       if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
> +               goto fail_nomem;
> +
>         INIT_LIST_HEAD(&priv->list_attached);
>
>         priv->domain.geometry.aperture_start = 0;
> @@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
>         struct msm_priv *priv;
>         unsigned long flags;
>
> +       iommu_put_dma_cookie(domain);
>         spin_lock_irqsave(&msm_iommu_lock, flags);
>         priv = to_msm_priv(domain);
>         kfree(priv);
> --
> 2.28.0.dirty
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
