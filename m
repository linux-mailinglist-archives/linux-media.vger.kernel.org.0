Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A42C20283B
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 06:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgFUEAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jun 2020 00:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFUEA3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jun 2020 00:00:29 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132CDC061794;
        Sat, 20 Jun 2020 21:00:28 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y13so7749849lfe.9;
        Sat, 20 Jun 2020 21:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JltmKVlnuo/vC27A3oTu5+r3QU8IRKlE54WmVpTd+6k=;
        b=s8LYsDYdjxem9SLD1lfB4S3L0wgiHScLHWSjUkMidXktbmXmoFoTDBs1IbY2RwA2F1
         EXug365lNfpf1c5EIkE19nWURBfp1SgHgRH1JFN1Y73oUrRxuyh3mU1EYkLaX1ivi8bq
         UmiKqb7y0GNzxSjVlDxQiNIe0bJDKEUNZ35GUG6kdqE8kpW7gGT86lBkEgHc1ctOXksG
         mWPblnYPDRqHCY8twJXwNrXzYVqGeCSxNOFjQ44nD5tzTN/b1DWhf9g3x2Ck0oI78twV
         JgTgWEfLztztE4ybodOqRtpugw1CA0r/7k5o8A4kXuiMuFEbV34XN4QHJrAWORLAzTqH
         wMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JltmKVlnuo/vC27A3oTu5+r3QU8IRKlE54WmVpTd+6k=;
        b=KjuZn4WpagIAn49hYNMZSjU/ZFyFdUIoLBgpgzHXzPhJyHX099q+2mH3DZvYm57VO1
         Bcjg09ujRw+zkJc+xX2X1lK3YPqxHFsVQyiVO1FatbinQjSsJp3YdKvE0mQf458lAvE9
         wd8DJ7NRV0sceXZ00/ygrtg/KG3YUFYvtuevecb6S3kkE70WV52IZcB+F0L2nOxHpFmO
         PFvOj2hidtebFdnWMIyQ49xXUq3O1BOfp1V8fwLlYIeEu8O92nHK4XLnLeOz9GBhQPWL
         LUC4DfHhzUXAy2u9ICG+oHDvkCVBKulynQ/xPhfWCIn0k/SV9EaeZ7jPpCwZZbu/fU+L
         ctUw==
X-Gm-Message-State: AOAM5318DLSCgVRD7inIO8/1VKnfJYzhn0Vn+onkhVb508cuVYcB+dL+
        1gOcm+qY5jbAbJEJhP89jTs=
X-Google-Smtp-Source: ABdhPJwGO/7Iq+BmdzJ4PpOIxZuoSlejYAADJkdbMtQDjpHquFlMxJiDBs2BDDHDfF88d7fV7xZ03Q==
X-Received: by 2002:ac2:44cd:: with SMTP id d13mr5970328lfm.13.1592712024386;
        Sat, 20 Jun 2020 21:00:24 -0700 (PDT)
Received: from dimatab (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id b25sm1977654ljo.16.2020.06.20.21.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 21:00:24 -0700 (PDT)
Date:   Sun, 21 Jun 2020 07:00:15 +0300
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH v7 31/36] staging: tegra-vde: fix common struct sg_table
 related issues
Message-ID: <20200621070015.0cf833ab@dimatab>
In-Reply-To: <20200619103636.11974-32-m.szyprowski@samsung.com>
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
        <CGME20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa@eucas1p1.samsung.com>
        <20200619103636.11974-32-m.szyprowski@samsung.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

=D0=92 Fri, 19 Jun 2020 12:36:31 +0200
Marek Szyprowski <m.szyprowski@samsung.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg()
> function returns the number of the created entries in the DMA address
> space. However the subsequent calls to the
> dma_sync_sg_for_{device,cpu}() and dma_unmap_sg must be called with
> the original number of the entries passed to the dma_map_sg().
>=20
> struct sg_table is a common structure used for describing a
> non-contiguous memory buffer, used commonly in the DRM and graphics
> subsystems. It consists of a scatterlist with memory pages and DMA
> addresses (sgl entry), as well as the number of scatterlist entries:
> CPU pages (orig_nents entry) and DMA mapped pages (nents entry).
>=20
> It turned out that it was a common mistake to misuse nents and
> orig_nents entries, calling DMA-mapping functions with a wrong number
> of entries or ignoring the number of mapped entries returned by the
> dma_map_sg() function.
>=20
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-vde/iommu.c
> b/drivers/staging/media/tegra-vde/iommu.c index
> 6af863d92123..adf8dc7ee25c 100644 ---
> a/drivers/staging/media/tegra-vde/iommu.c +++
> b/drivers/staging/media/tegra-vde/iommu.c @@ -36,8 +36,8 @@ int
> tegra_vde_iommu_map(struct tegra_vde *vde,=20
>  	addr =3D iova_dma_addr(&vde->iova, iova);
> =20
> -	size =3D iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
> -			    IOMMU_READ | IOMMU_WRITE);
> +	size =3D iommu_map_sgtable(vde->domain, addr, sgt,
> +				 IOMMU_READ | IOMMU_WRITE);
>  	if (!size) {
>  		__free_iova(&vde->iova, iova);
>  		return -ENXIO;

Ahh, I saw the build failure report. You're changing the DMA API in
this series, while DMA API isn't used by this driver, it uses IOMMU
API. Hence there is no need to touch this code. Similar problem in the
host1x driver patch.
