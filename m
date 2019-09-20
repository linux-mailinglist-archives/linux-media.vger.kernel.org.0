Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D093EB97D5
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 21:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbfITTdJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 20 Sep 2019 15:33:09 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44933 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfITTdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 15:33:08 -0400
Received: by mail-qt1-f196.google.com with SMTP id u40so9949681qth.11;
        Fri, 20 Sep 2019 12:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eW5Bek3/qrhSN7Ue9OhcG1dQFZzCZfqK/a8zEZpkGic=;
        b=J074CamlGYIMkHwD8TyuxZN6eWWyyz1lWUmDhwPAJWekZKLjswBCsfg2Gh2FNymLz/
         2n0GD3WwzuNrg7HGm7sumsDqBHtNplDfq0+6LRafVOduUvhdj6baxhggNUC4PyCDP+jI
         695iPpB/kZjNCfvH9REjfzchEYjQhYqiLASq+0DaMoS12RBTIS+IISVYr24iNsXya1Ld
         01FP+1xBVO+00+mtzr7K0ZBUYIrA61EQ6ZH4HxjzzReK9rKnr0R6TmE/ANg69egp6Ygh
         N5hYFs+XPbod9EKTfUY/KFaFWli7akjHLpubVh9PoVH+UhVhb6wMAvft+bRu4bGziBM9
         Pfrw==
X-Gm-Message-State: APjAAAUx5nBeuUH2mt4Tk6hEmns3rOsDXFsqYs9M7SDBa7JWJjQJz0X3
        SUzI2SYaVEDnlqIW/V3xmXUDysXiM/aDpwwLfpQ=
X-Google-Smtp-Source: APXvYqym/h2HHN3oASxR0ab7JXUTumeom5UHRPWJfFci8Kj44M6ZMOAgSvcKmbeBpxcHn1UCl/SFotB4KE0LZpDpGWI=
X-Received: by 2002:a0c:8aa1:: with SMTP id 30mr14417394qvv.93.1569007987460;
 Fri, 20 Sep 2019 12:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <dc354ede-5963-cd7f-ee53-f3df3061d39a@gmail.com>
 <20190725024129.22664-1-yuehaibing@huawei.com> <dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com>
In-Reply-To: <dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 20 Sep 2019 21:32:51 +0200
Message-ID: <CAK8P3a2Lxv6Wz3jv0eeNc7mfvNzSvh37QEx51W39eUnYPsxaYw@mail.gmail.com>
Subject: Re: [PATCH] media: staging: tegra-vde: Fix build error
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 25, 2019 at 2:24 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 25.07.2019 5:41, YueHaibing пишет:
> > If IOMMU_SUPPORT is not set, and COMPILE_TEST is y,
> > IOMMU_IOVA may be set to m. So building will fails:
> >
> > drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
> > iommu.c:(.text+0x41): undefined reference to `alloc_iova'
> > iommu.c:(.text+0x56): undefined reference to `__free_iova'
> >
> > Select IOMMU_IOVA while COMPILE_TEST is set to fix this.

> > @@ -3,7 +3,7 @@ config TEGRA_VDE
> >       tristate "NVIDIA Tegra Video Decoder Engine driver"
> >       depends on ARCH_TEGRA || COMPILE_TEST
> >       select DMA_SHARED_BUFFER
> > -     select IOMMU_IOVA if IOMMU_SUPPORT
> > +     select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
> >       select SRAM
> >       help
> >           Say Y here to enable support for the NVIDIA Tegra video decoder
> >
>
> This results in missing the case of compile-testing !IOMMU_IOVA for the
> driver, but probably that's not a big deal.
>
> Acked-by: Dmitry Osipenko <digetx@gmail.com>

I don't know what happened here, but the patch from YueHaibing caused this
error for me, which is very much like the problem it was meant to fix:

drivers/gpu/host1x/dev.o: In function `host1x_probe':
dev.c:(.text+0x1734): undefined reference to `put_iova_domain'
dev.c:(.text+0x1744): undefined reference to `iova_cache_put'
drivers/gpu/host1x/dev.o: In function `host1x_remove':
dev.c:(.text+0x1894): undefined reference to `put_iova_domain'
dev.c:(.text+0x1898): undefined reference to `iova_cache_put'
drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
cdma.c:(.text+0x5d0): undefined reference to `alloc_iova'
cdma.c:(.text+0x61c): undefined reference to `__free_iova'
drivers/gpu/host1x/cdma.o: In function `host1x_cdma_deinit':
cdma.c:(.text+0x6c8): undefined reference to `free_iova'
drivers/gpu/host1x/job.o: In function `host1x_job_pin':
job.c:(.text+0x514): undefined reference to `alloc_iova'
job.c:(.text+0x528): undefined reference to `__free_iova'
drivers/gpu/host1x/job.o: In function `host1x_job_unpin':
job.c:(.text+0x5bc): undefined reference to `free_iova'

After reverthing commit 6b2265975239 ("media: staging:
tegra-vde: Fix build error"), I can no longer reproduce the
issue.

       Arnd
