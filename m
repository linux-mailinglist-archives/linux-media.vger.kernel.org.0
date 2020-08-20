Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC5324C436
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 19:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730505AbgHTRK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 13:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730151AbgHTRGy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 13:06:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7ADC061344;
        Thu, 20 Aug 2020 10:05:38 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u18so2268482wmc.3;
        Thu, 20 Aug 2020 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4eX00c0ckm8hT0A0C/n4MyfX4EjjAaDz31mN/Lb//fY=;
        b=Z11Hdhb8fIf+RWDsfZYkftMhqk7M2OXy0n6MgA0ETp9jr3pQV8ulNcpRKj/wKp+Jcb
         TJydKyyk8agCFCKNNVnmf/LSzwt5bkfqxPoBrJfk9wIeWsj3ZxeZ0ypZrs1MtkVmxRRX
         x81JDHis0hoohcY0Q6Ywz9FkA4+uo/uBfiR3m6br16gLBDZ0jm2DrQuA5qDaLjy/F60S
         V1fg+5A7e4NKYugc3e5Xg2R7tNWQTDUK4LztV5U6/Rt21jkXnI9pXAOnIuQyz923d1dR
         HzHV5ev7gLhj5R1KTo733m06xj4N6pqkhAWVg59VKP5cboJK1OKaF5Gqsjv4rsSG1r1h
         /zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4eX00c0ckm8hT0A0C/n4MyfX4EjjAaDz31mN/Lb//fY=;
        b=W7viDUIzQeVWC4fmHbZnzjL+PO/ocamtCcGRVbGD0NCpaaG/aa4jR6mGhIByr93I7f
         SGeUXhiEFNVRN+2797aPBmyV0H5soFmbHJBrTGxxA3c48ZF3KhOSt4vE8j/r7k8HPTwI
         IDDtoTrQMMPMb3Mqo48PpYY/actmh78WXexKjbMCjlz0YL8YlS/md7TzMOKOo4sa2NHg
         VyPDqisW5phnZ3JsqGifqRT+TK6iiVVx/4KzDsBVjZ5LEqIsSmmcykwXXabRpJ4Zrgfs
         ODmaateMyqQCTxS2EJ8CGHlaWP8V6SLiEw3Q2HZKLGCjBpRWKnZckjq1f15iw9BvzGJ4
         sZJw==
X-Gm-Message-State: AOAM533E4ix4X1ebe6UxaRiTRi7hNGbor95VCmjX2lFNnc7vfZ9ogSdS
        I4jYnOz/hwwYC/ivdkuSvQ50T66K7xZl1ZKoN5o=
X-Google-Smtp-Source: ABdhPJyyd8HHoirSU/WeVEZLJyRDkczRjPGF9/eWaPA4wGBOVGhOy7ejxlGod+q0XjTYTyGC7MJSrAGP/V2HLxQLL8g=
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr4638247wmf.49.1597943137022;
 Thu, 20 Aug 2020 10:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597931875.git.robin.murphy@arm.com> <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
 <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com> <b5aa001f-6a1c-af0b-1526-c5b7a2e29ef7@arm.com>
In-Reply-To: <b5aa001f-6a1c-af0b-1526-c5b7a2e29ef7@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 20 Aug 2020 10:05:25 -0700
Message-ID: <CAF6AEGs1JyZqNYyHC6DsjZa2wbHVhP-M=ZVJxHqYjeFQPZ3APA@mail.gmail.com>
Subject: Re: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
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

On Thu, Aug 20, 2020 at 9:58 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-08-20 16:55, Rob Clark wrote:
> > Side note, I suspect we'll end up needing something like
> > 0e764a01015dfebff8a8ffd297d74663772e248a .. if someone can dig a 32b
> > device out of the closet and dust it off, the fix is easy enough.
> > Just wanted to mention that here so anyone with a 32b device could
> > find what is needed.
>
> FWIW there shouldn't be any material change here - the generic default
> domain is installed under the same circumstances as the Arm
> dma_iommu_mapping was, so if any platform does have an issue, then it
> should already have started 4 years with f78ebca8ff3d ("iommu/msm: Add
> support for generic master bindings").

ok, it has, I guess, been a while since playing with 32b things..
someone on IRC had mentioned a problem that sounded like what
0e764a01015dfebff8a8ffd297d74663772e248a solved, unless they disabled
some ARCH_HAS_xyz thing (IIRC), which I guess is related..

BR,
-R

> Robin.
>
> >
> > BR,
> > -R
> >
> > On Thu, Aug 20, 2020 at 8:09 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> Now that arch/arm is wired up for default domains and iommu-dma,
> >> implement the corresponding driver-side support for DMA domains.
> >>
> >> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >> ---
> >>   drivers/iommu/msm_iommu.c | 7 ++++++-
> >>   1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> >> index 3615cd6241c4..f34efcbb0b2b 100644
> >> --- a/drivers/iommu/msm_iommu.c
> >> +++ b/drivers/iommu/msm_iommu.c
> >> @@ -8,6 +8,7 @@
> >>   #include <linux/kernel.h>
> >>   #include <linux/init.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/dma-iommu.h>
> >>   #include <linux/errno.h>
> >>   #include <linux/io.h>
> >>   #include <linux/io-pgtable.h>
> >> @@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
> >>   {
> >>          struct msm_priv *priv;
> >>
> >> -       if (type != IOMMU_DOMAIN_UNMANAGED)
> >> +       if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
> >>                  return NULL;
> >>
> >>          priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> >>          if (!priv)
> >>                  goto fail_nomem;
> >>
> >> +       if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
> >> +               goto fail_nomem;
> >> +
> >>          INIT_LIST_HEAD(&priv->list_attached);
> >>
> >>          priv->domain.geometry.aperture_start = 0;
> >> @@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
> >>          struct msm_priv *priv;
> >>          unsigned long flags;
> >>
> >> +       iommu_put_dma_cookie(domain);
> >>          spin_lock_irqsave(&msm_iommu_lock, flags);
> >>          priv = to_msm_priv(domain);
> >>          kfree(priv);
> >> --
> >> 2.28.0.dirty
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
