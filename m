Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EA31D1569
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 15:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388254AbgEMNdo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 09:33:44 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59096 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388134AbgEMNd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 09:33:27 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200513133325euoutp018c6e83a18992853809dc2695ce0e96eb~OmcieFbwD2196121961euoutp01B
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 13:33:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200513133325euoutp018c6e83a18992853809dc2695ce0e96eb~OmcieFbwD2196121961euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589376805;
        bh=vazhLbBFeBfCMmXGmU9SyqWVzV61/EYfNXSyQFwWX60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t6OWEL3oAAP6MKLigohfRj18mA1iVSeQ2UvOkZufhp2vXEiakv/co/1SEyhZN4ZGV
         jJ4aJJr+Dwval3uY7V9/mvgOVhhMrGhE608ey5Quc9+/ER1TMYiL7euED8NxNNb0m+
         ktp9wjSs4UhLuR7c2FMohGvSKWq0ctdjj488BkdU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200513133324eucas1p2ee28c7c8b40096d69e61ccb40869df42~Omch_6t3M0359403594eucas1p23;
        Wed, 13 May 2020 13:33:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B5.E8.60698.427FBBE5; Wed, 13
        May 2020 14:33:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200513133324eucas1p25dc380046c516ca8f07677ed14f93e63~Omchmc1d82378623786eucas1p2K;
        Wed, 13 May 2020 13:33:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200513133324eusmtrp2b236c8e390a3dcbb4effa40b7a2b4706~Omchld4Np1338613386eusmtrp2x;
        Wed, 13 May 2020 13:33:24 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-09-5ebbf724383e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C8.2A.08375.427FBBE5; Wed, 13
        May 2020 14:33:24 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200513133323eusmtip151829cf8f1691cbe8793eb3d45b0170f~Omcg8hyPy3222032220eusmtip1I;
        Wed, 13 May 2020 13:33:23 +0000 (GMT)
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
        linux-media@vger.kernel.org
Subject: [PATCH v5 37/38] media: pci: fix common ALSA DMA-mapping related
 codes
Date:   Wed, 13 May 2020 15:32:44 +0200
Message-Id: <20200513133245.6408-37-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHec/Zzs6Ws+OUfLVIGyolpJkWJzRLiDj4IYyKIMiaeVDJW5uz
        LEJJvM0L5SDFpEQky6nTOaepectbWktU5t3mJS3FlKZWMrVtp+zb73me//99Lrw4KqhlO+IR
        0XG0OFoUKcR4LE3X709HXX42Bh+rSjlBZmvfI2R1vpJN7mieoOTQ+gpGvlZ0ImRRiy+5NjSN
        kKpZHZscbCjEyKyqWjZZ0THJIV+qjAjZtjrHPsunyp+XA+rtRhGLUpVlYFTdhp5Nfc7sRqia
        kkRqfHsWpeQjpYBqHE3CqBx1GaAMqoNBe67x/ELpyIh4Wuzpf5MX3jsyh8VmwnstW/NYEvhh
        JwNcHBI+8ItBgcoADxcQrwDMny5mMcEagOrRJsysEhAGAJcWEmUAtziy5JcYTSmAX4u3sF1D
        yXK7xYARXlC2LLOwHZECYE+2lVmEErMILFLqLAVb4iLMq5YjZmYRrvBZRgnLzHziNMxsamAx
        8zlBRVUramauKb840WIZDxJdHDgw2YMxonOwV9b012ALF7vVHIYPwJ03LxDGkAzgtLaCwwRZ
        AA4+ygeMyhdOaDcx83IocQQqGzyZPQOgtk7IoDUcWbYxi1ET5mryUCbNh+mpAuYNN1jQXbnb
        ta1/AGWYgjtpExzmQO8ATM6oxx4Dp4L/vYoAKAP2tFQSFUZLvKPpux4SUZREGh3mcSsmSgVM
        n6lvu3u9HjQbQ9oBgQOhFV8/3BgsYIviJQlR7QDiqNCOf0FpSvFDRQn3aXHMDbE0kpa0g/04
        S2jP9y7+dl1AhIni6Ns0HUuL/1URnOuYBNxOVp26Iw3J3Vr12Rfkr3G2XnCChvnQyDNDe/Uz
        6X3GskCRTh9ojdpTlc0prTUP3cZSrziUfyBt6MNuvVZqbyN7fpRyVRSGj4ypY1bwQ5tyTkCn
        Ytzv/K/htAfuWTLfZK8Z5XdnTYcu9riiIoe3eXmpeHtqqp979eO4i/NTByFLEi7yckfFEtEf
        1Huf3kgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xu7oq33fHGaydImPRe+4kk8XGGetZ
        Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzaJnw1ZWi7VH7rJbLNv0h8ni
        4IcnrA68HmvmrWH02PttAYvHplWdbB7bvz1g9bjffZzJY/OSeo/b/x4ze0y+sZzRY/fNBjaP
        vi2rGD0+b5IL4I7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcks
        Sy3St0vQyzh14wlbQbdExf6/z9gaGD+JdDFycEgImEj0TA7uYuTiEBJYyihx8c5dpi5GTqC4
        jMTJaQ2sELawxJ9rXWwQRZ8YJX69OcoOkmATMJToeguREBHoZJSY1v2RHcRhFnjNJNG6aw0b
        SJWwgL/E7zPNYKNYBFQlZncuYQGxeQVsJbr37GKBWCEvsXrDAWYQmxMo/urOfrC4kEC+xN7F
        +9gmMPItYGRYxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERgr24793LyD8dLG4EOMAhyMSjy8
        Frd2xwmxJpYVV+YeYpTgYFYS4fVbDxTiTUmsrEotyo8vKs1JLT7EaAp01ERmKdHkfGAc55XE
        G5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYGzY9lF2VW8iE9fRN0vl
        X9WZZWmXbApdP5uj+duFm3s6+VT3ht46n5M5zdQ4/3JIgvv3wmmnrVrmy0j5bdV3PflgbkdN
        4gMhyVmRWZu2FSyYIDJ97R6pzsPePRyK3RfnL2lQEF+YZ1e5ROWpxWKVSXwdy/2v28XkPrdi
        9TYKPntQJuNvc4SUtRJLcUaioRZzUXEiALcYtIOrAgAA
X-CMS-MailID: 20200513133324eucas1p25dc380046c516ca8f07677ed14f93e63
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200513133324eucas1p25dc380046c516ca8f07677ed14f93e63
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133324eucas1p25dc380046c516ca8f07677ed14f93e63
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
        <20200513133245.6408-1-m.szyprowski@samsung.com>
        <CGME20200513133324eucas1p25dc380046c516ca8f07677ed14f93e63@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/media/pci/cx23885/cx23885-alsa.c | 2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c | 2 +-
 drivers/media/pci/cx88/cx88-alsa.c       | 2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index df44ed7..3f366e4 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -129,7 +129,7 @@ static int cx23885_alsa_dma_unmap(struct cx23885_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, PCI_DMA_FROMDEVICE);
 	buf->sglen = 0;
 	return 0;
 }
diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index 3016164..c40304d 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -193,7 +193,7 @@ static int cx25821_alsa_dma_unmap(struct cx25821_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages, PCI_DMA_FROMDEVICE);
 	buf->sglen = 0;
 	return 0;
 }
diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index 7d7acee..3c6fe6c 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -332,7 +332,7 @@ static int cx88_alsa_dma_unmap(struct cx88_audio_dev *dev)
 	if (!buf->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->sglen,
+	dma_unmap_sg(&dev->pci->dev, buf->sglist, buf->nr_pages,
 		     PCI_DMA_FROMDEVICE);
 	buf->sglen = 0;
 	return 0;
diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index 544ca57..398c47f 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -313,7 +313,7 @@ static int saa7134_alsa_dma_unmap(struct saa7134_dev *dev)
 	if (!dma->sglen)
 		return 0;
 
-	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->sglen, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&dev->pci->dev, dma->sglist, dma->nr_pages, PCI_DMA_FROMDEVICE);
 	dma->sglen = 0;
 	return 0;
 }
-- 
1.9.1

