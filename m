Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC0F1C511B
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 10:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgEEIrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 04:47:31 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52056 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728702AbgEEIqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 04:46:36 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200505084635euoutp02b6c65b3819fb9ce0222fd3f71c293c93~MFX0P6Tyy2638126381euoutp02U
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 08:46:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200505084635euoutp02b6c65b3819fb9ce0222fd3f71c293c93~MFX0P6Tyy2638126381euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1588668395;
        bh=B21ieA9YMhUmpiZXxj4FSZPViD0ahaYsrF+5TUs6jmo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aN+n9AU0VoTdy0wLfZkU2wII1OVNcc+cenIlZU+s0RwUN/ecsTBUtn5NBHgVOI8mP
         d6VPBl66sy37JwE17ywyjCTX9Zgm4s4M0sblV/LuwHXf4YDqMU85pVH/KFfdjusOcY
         7PBHznx6MJLhE+YeYZniPPmL5FwjJ0mLsiButzvk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200505084634eucas1p2f13263895e2ba3729986bd6357ca169d~MFXz1gw1L2338223382eucas1p2F;
        Tue,  5 May 2020 08:46:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 90.42.60679.AE721BE5; Tue,  5
        May 2020 09:46:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200505084634eucas1p1e0ea160dd77afbf6d2f7e6154ded40d0~MFXzSEDHK2423624236eucas1p18;
        Tue,  5 May 2020 08:46:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200505084634eusmtrp126aba354bba07622efd7ab30120ded8d~MFXzRS61A0942309423eusmtrp1j;
        Tue,  5 May 2020 08:46:34 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-4a-5eb127eab0cc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 4D.21.07950.AE721BE5; Tue,  5
        May 2020 09:46:34 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200505084633eusmtip1d32281152fa44131a67ab45c0c0a5134~MFXyomUX20309503095eusmtip1w;
        Tue,  5 May 2020 08:46:33 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 18/25] drm: rcar-du: fix common struct sg_table related
 issues
Date:   Tue,  5 May 2020 10:46:07 +0200
Message-Id: <20200505084614.30424-18-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0hTYRztu3f37ipOrtP0Q0Nr9CAhTY24spIkqUsFCv1RCGlLr1N0Uza1
        VKJhKs5H+CCbFmHh++18lE7xgTZNGuELLR/TWaDhI2emIprzqv13fud3zu8cPj4C5fdh9kSY
        NJqRSUURAtyc0/xpU3dh4Vx9wMX83ctUpq4foepVtRi125yNUsN/lnGqvLIXoQo7hNTqaDqg
        lNlFXGpteAah1IZRjBpqfYNTGXVNGNU0v4RQ1T2TXKpEvY1QXStz2DWSrnpbBej29UIO/To1
        H6PVFUqc/rCux+jpdC1CNxQ9o7/vGFA6d6wU0JpxBU6/aKwAtFHt6Gfhb34lmIkIi2Vkrl4P
        zUNbNLeipsknwzlCBcizTANmBCQvwaSsUk4aMCf4ZBmAZQ3JODusAdhXn4yygxHA3hINfmjp
        L9cfLEoBLFhqw44sFd9SuSYVTrrBtMW0fYcNmbx3K9PCJELJbRQm/TLdJQhr8i5sf+lgghzy
        DGxJSTDJeaQX1I02ImyYE6ys60RN2GyPNwxO7NeD5BQXGhNrDhr5wE717AG2hgvaRi6LT8CB
        3AwOa3gO4IyumssOGQAOJaoAqxLCCd0WbmqBkudhbasrS3vDlVnVPg1JSzi2aGWi0T2Y0/wK
        ZWkeTE3hs+qzsEBbcxTb9XUQZTEN9fofgH2fXgCLN5XcLOBU8D+sEIAKYMfEyCViRu4uZR67
        yEUSeYxU7BIUKVGDvf81sKNd+whatx91A5IAAgvefWNtAB8TxcrjJN0AEqjAhleyURfA5wWL
        4uIZWWSgLCaCkXcDB4IjsON5vJ9/wCfFomgmnGGiGNnhFiHM7BWgSD+y4uPhu5TTjt5715eU
        P1Ta/cVqcHq5JyTcc+TOcc0NR7/PsqncBJWz61OlU+DVk6ktUVnt7prQ28U1bTvW173H8m7a
        i4OmV1ulc6ij0HemJyFjpuFnwVAAlM7ZbJ3KmTS62P6WbZxGbBVSjZUz8BQf84fxIVmgwzCu
        dfor4MhDRW7OqEwu+gcVeaL4WwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7qv1DfGGay6I2LRe+4kk8XGGetZ
        Lf5vm8hsceXrezaLlauPMlks2G9t8elaN6NF58Ql7BZfrjxkstj0+BqrxeVdc9gsejZsZbXY
        +vIdk8XaI3fZLZZt+sNkcfDDE1YHAY8189Yweuz9toDFY3bHTFaPTas62Ty2f3vA6nG/+ziT
        x+Yl9R63/z1m9ph8Yzmjx+6bDWwefVtWMXp83iQXwBOlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hp
        oWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl7Fzt1fBfYGKK5OsGxin8XUxcnJICJhInFz5
        gBnEFhJYyihxdz43RFxG4uS0BlYIW1jiz7Uuti5GLqCaT4wSd87eYQNJsAkYSnS9hUiICHQy
        Skzr/sgO4jALtLBILO25DtYuLBAosa/7BJDNwcEioCqxs60aJMwrYCdx7toWJogN8hKrNxwA
        u4ITKP74EsQCIYFCiQ/nv7NOYORbwMiwilEktbQ4Nz232EivODG3uDQvXS85P3cTIzCath37
        uWUHY9e74EOMAhyMSjy8G76ujxNiTSwrrsw9xCjBwawkwrvsx4Y4Id6UxMqq1KL8+KLSnNTi
        Q4ymQDdNZJYSTc4HRnpeSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5O
        qQbGa+t5C1pub5nEF8C18XKowK6j8Z3vvzgrnmne6rw3UzLh0Prw/tV+c6a4zbpyoeyix9t1
        zVMcZicGHdw2JXjv5Hm2e6s+7n2jVOWZGXT41y7X/8b/eVOPftp2/sry255/tK0mKv47XZX9
        YW97tP4Ei6PvhJZ3TYya/npHk19fuHloichtzzlb25RYijMSDbWYi4oTAS4gPqG8AgAA
X-CMS-MailID: 20200505084634eucas1p1e0ea160dd77afbf6d2f7e6154ded40d0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200505084634eucas1p1e0ea160dd77afbf6d2f7e6154ded40d0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084634eucas1p1e0ea160dd77afbf6d2f7e6154ded40d0
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
        <20200505084614.30424-1-m.szyprowski@samsung.com>
        <CGME20200505084634eucas1p1e0ea160dd77afbf6d2f7e6154ded40d0@eucas1p1.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. A common mistake was to ignore a result
of the dma_map_sg function and don't use the sg_table->orig_nents at all.

To avoid such issues, lets use common dma-mapping wrappers operating
directly on the struct sg_table objects and adjust references to the
nents and orig_nents respectively.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/media/platform/vsp1/vsp1_drm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index a4a45d6..8a2624b 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -912,8 +912,9 @@ int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt)
 	 * skip cache sync. This will need to be revisited when support for
 	 * non-coherent buffers will be added to the DU driver.
 	 */
-	return dma_map_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
-				DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
+	return dma_map_sgtable_attrs(vsp1->bus_master, sgt, DMA_TO_DEVICE,
+				     DMA_ATTR_SKIP_CPU_SYNC);
+	return sgt->nents;
 }
 EXPORT_SYMBOL_GPL(vsp1_du_map_sg);
 
@@ -921,8 +922,8 @@ void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 
-	dma_unmap_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
-			   DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable_attrs(vsp1->bus_master, sgt, DMA_TO_DEVICE,
+				DMA_ATTR_SKIP_CPU_SYNC);
 }
 EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
 
-- 
1.9.1

