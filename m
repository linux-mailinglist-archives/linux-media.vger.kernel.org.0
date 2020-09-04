Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359B325DA44
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 15:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbgIDNp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 09:45:57 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44857 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730603AbgIDNpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 09:45:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200904133510euoutp015075da45a92cadbde69d3df8d9f1aa5a~xmAnQxfJd0722007220euoutp012
        for <linux-media@vger.kernel.org>; Fri,  4 Sep 2020 13:35:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200904133510euoutp015075da45a92cadbde69d3df8d9f1aa5a~xmAnQxfJd0722007220euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599226510;
        bh=RMBhG1Fw6ugPclokWBJRv00vV8Qg1yQmDHqJxe7Y93k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JnsJHIvJ14KDYKyIL1Dr/ONtKvyk8jkOOz9T4w2lvn0YJJP5s9Rtx9l4cLDRqIdSh
         tI0zmuIf977RQePz8KBn9sUanuk3o7k2CpJs/5Mo415/Ek6Il1ppiGnDYHWtfvGNGT
         bx+X/q5XfS/cd6sFrsQzEHSrMOgDshPhjlcLp1ps=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200904133510eucas1p2a61898879ab691c1491ec0b92ef46df1~xmAm3V--U1446414464eucas1p2Z;
        Fri,  4 Sep 2020 13:35:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 5B.11.06456.E82425F5; Fri,  4
        Sep 2020 14:35:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200904133509eucas1p136b805a5927a29ab3f3478b3bfdac6c0~xmAmmIfKb0118801188eucas1p19;
        Fri,  4 Sep 2020 13:35:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200904133509eusmtrp2e514c4dcdedcc93a0f9e6f04729fd216~xmAmlWv1c0977009770eusmtrp2Y;
        Fri,  4 Sep 2020 13:35:09 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-61-5f52428e7526
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 11.B0.06017.D82425F5; Fri,  4
        Sep 2020 14:35:09 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200904133509eusmtip13165c75798c7c2d70bacbdba98b7f12a~xmAlxRgXz1624216242eusmtip1u;
        Fri,  4 Sep 2020 13:35:08 +0000 (GMT)
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
        Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v10 26/30] staging: tegra-vde: fix common struct sg_table
 related issues
Date:   Fri,  4 Sep 2020 15:17:07 +0200
Message-Id: <20200904131711.12950-27-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe1CMURjGne+2X42tz5bpTEzGzjCYEU3GHJNxm5o5adz6g9zK4puK3WV2
        VRiXtQktpXVJs0N2lkQbsSpKhcJis7oxbiHrkkuxFSoU2xn893uf93nmmfPO4WnZOzaQT1Rv
        EDVqhVLOeTOlt3qc4zNnRcdNvH+SRxnOOxS6kFPEov5SI40qanslyOp2AdT09TOHUk8UceiM
        9SaFzFfD0E6ThUFdTS0Usrkesqix/CiH9p0vYVF6l4lDZ280S9Ap208KXf/ymkU95bnMDD9c
        mFsI8POqGgZXfjMzuMzULMG2gnQOX/r2ksVXjxVK8Iu9dgpfPLkdP+1z0fjgo3yArzzWcTgj
        tZ3DmcUFAHfagub7LvGeulpUJiaLmgnTVngn1GUW0evf+m7U5S3VgVypAfA8FCbBi23LDMCb
        lwmnAcxy1EvI0AVgf3MLRYZOAI0/LIwBeA0k7qbVc2SRD+DO3hruX6QkrVricXFCCDS0GTgP
        +wtpAN7OGOxhWqhlYG13qIf9hCUw+9WzAQ8jjIJu/ceBBqkwDZrffOZI2whoPX+N9rDXH70k
        5zXrKYNCBg8Pt9ooYgqHO9y/WMJ+8IO9WEJ4OOwvO06RQCqALc6zEjLsA7BRnwOIKww+c/Zy
        nnPQwlhYVD6ByDOhw6pnyZV84KO2IeQBPvBA6RGayFK4Z5eMuEdDk/3cv9rrdQ00YQyfXHbR
        5EBGAMstDXQWGGH6X2YGoAAEiElaVbyoDVGLKcFahUqbpI4PXrVOZQN/vp+jz95xGXxtWFkN
        BB7IB0sHTY+Ok7GKZO0mVTWAPC33l86654iVSVcrNm0WNeviNElKUVsNhvGMPEAaanm/XCbE
        KzaIa0Vxvaj5u6V4r0AdCFIvjtYcqDnKran0PdzYvXb/p9DgKZFzXG6KfnB3S0SYT5lxpWkM
        nfcraor+2JBt85zuBebevB227Ao+X9/ZE7k1scOoVEmHvREClseOrQr6NJsfKtp+XosNPPjg
        e8qhha09MRHFj9tjBN3u9mURtxZtnxyuxAnZI+vuWOduvXA7Ss5oExQh42iNVvEbWv2ynnoD
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7q9TkHxBt0fjC16z51kstg4Yz2r
        xf9tE5kt9pz5xW6x+uNjRosrX9+zWTQvXs9msXL1USaLBfutLVpmLWKx+HLlIZPFpsfXWC0u
        75rDZtGzYSurReeXWWwWa4/cZbdYtukPk8XBD09YLX7umsfiIOyxZt4aRo97+w6zeOz9toDF
        Y+esu+wem1Z1snls//aA1WP/3DXsHve7jzN5bF5S73H732Nmj8k3ljN67L7ZwObR2/yOzaNv
        yypGj8+b5AL4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstS
        i/TtEvQyLvStZy54xl/RsDS6gXEebxcjJ4eEgInEqdaLbF2MXBxCAksZJXb1L2OFSMhInJzW
        AGULS/y51gVV9IlRYv/UdhaQBJuAoUTXW4iEiEAno8S07o/sIA6zwA0WiblbPrCDVAkLREgc
        u9rPBGKzCKhKfGx6DdbNK2AnseDpezaIFfISqzccYAaxOYHiW2c8AVstJGAr8WHOYpYJjHwL
        GBlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBMbjtmM/t+xg7HoXfIhRgINRiYeXwT4oXog1
        say4MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BjprILCWanA9MFXkl8YamhuYW
        lobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhiXb/7zZrmDi7L0x2+bww545Vnr
        CltfPu334hhzxJQPG4oZuHzOSUeyPJrotbW98PLZXY2Jd/Ib+O8W1s6PZ+bznM6jw2r5JGBa
        kZfYMoP7WZz7NazNmeVXZahl3PO79ClX4urMS6tqDR4JHZsd/CIl/Juj+t3yC/U9mU2a77a1
        iO+K+/Y4q1CJpTgj0VCLuag4EQAfbtMv3QIAAA==
X-CMS-MailID: 20200904133509eucas1p136b805a5927a29ab3f3478b3bfdac6c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200904133509eucas1p136b805a5927a29ab3f3478b3bfdac6c0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133509eucas1p136b805a5927a29ab3f3478b3bfdac6c0
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
        <CGME20200904133509eucas1p136b805a5927a29ab3f3478b3bfdac6c0@eucas1p1.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
index 6af863d92123..adf8dc7ee25c 100644
--- a/drivers/staging/media/tegra-vde/iommu.c
+++ b/drivers/staging/media/tegra-vde/iommu.c
@@ -36,8 +36,8 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
 
 	addr = iova_dma_addr(&vde->iova, iova);
 
-	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
-			    IOMMU_READ | IOMMU_WRITE);
+	size = iommu_map_sgtable(vde->domain, addr, sgt,
+				 IOMMU_READ | IOMMU_WRITE);
 	if (!size) {
 		__free_iova(&vde->iova, iova);
 		return -ENXIO;
-- 
2.17.1

