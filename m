Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007E925274B
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 08:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgHZGgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 02:36:53 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39934 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbgHZGgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 02:36:31 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200826063630euoutp0268c170d823d5f5fece60e40676cea390~uvffdrrLw1443214432euoutp02g
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2020 06:36:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200826063630euoutp0268c170d823d5f5fece60e40676cea390~uvffdrrLw1443214432euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1598423790;
        bh=kbdu9i1ky3V53J/j8HYin75jAIlE4fk1hTbkVYKJ63U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nGc3wybVYMV5ZlFp86ZmA2JYYoNeCoOwaHUs/asIVUqhm0lFkgM7/1tA5+iVfQwN9
         Tf6Gb1zIlpI4PbwBEspqEkhYub3N8T7rPzEzIgbVNz4ONA9uLiJ1+c/DggNXDamZ74
         vwDVnyxsT4ZESoLqWMNuJ8xTOj00zVJDQtCgPau0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200826063629eucas1p17af18485cd101f2dbde76a07e3777e70~uvffKiKSZ1612416124eucas1p19;
        Wed, 26 Aug 2020 06:36:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 26.DD.05997.DE2064F5; Wed, 26
        Aug 2020 07:36:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200826063629eucas1p1a3c9c93e281b4c432a6d9940e734e3c4~uvferOOJK1612416124eucas1p18;
        Wed, 26 Aug 2020 06:36:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200826063629eusmtrp2b4efaa81707a94d9995acc3a8a6bc40b~uvfeqaKXz0466204662eusmtrp2e;
        Wed, 26 Aug 2020 06:36:29 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-61-5f4602ed2f4f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D4.F0.06314.DE2064F5; Wed, 26
        Aug 2020 07:36:29 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200826063545eusmtip2c8c042b88f2793200ec3eeb737bb4947~uve2bH14Z0302303023eusmtip23;
        Wed, 26 Aug 2020 06:35:45 +0000 (GMT)
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
Subject: [PATCH v9 31/32] media: pci: fix common ALSA DMA-mapping related
 codes
Date:   Wed, 26 Aug 2020 08:33:15 +0200
Message-Id: <20200826063316.23486-32-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSfSxVYRzuPeeec4+Py3EpbxjrtrTaIqntLGVp1PmnLVurVaRbzpDr6x5X
        UZs70rg+umpFZtxhlO8urnw0H4ubyc0waVh0rYaMRlTsynHQf8/v+Xif3357CVTciDkQYZGx
        jDxSKpPg5gJd9x/DkTnkXNDRZ8kHqUxDD0K9zq3BqHVdNkoN/ZrHqVcVXQilafOiloYmEUpr
        HMaoweZ8nMqobcCoqnfjQqpUu4ZQHQtT2BkRXVlQCei3yxoBrS1Pw+nG5QmM/pKuR+i6kkR6
        1GRE6acjZYBu+azE6az6ckAvap0vWlwzPxXMyMLiGLm7903z0G85TVj0jz33GmZNqBJM26qA
        GQHJ41CpH8JVwJwQky8BXF6tEvDDEoClq/lbyiKA+t8v8O3IQOs6wgtlAFa31YGdSGqGDuFc
        OOkBVXOqzYQdmQLg+0xLzoSSRgRqaoY3BVvSH84PfAQcFpAHoCGlXqgCBCEiveHDoli+zQVW
        1LajHDbboPXpjzdXgmS3EK5MtWO8yRcWlCRtrWcLZ/TcOxx2gutNhQgfSAZw0lAl5IcMAAeT
        cgHv8oJjhr8414ySh2BNsztP+8D2pUKUoyFpBUfmbDga3YBPdDlbtAimPhLzbleYp6/eqe3o
        H0B5TMO+ohaUP1A2gI2j34Vq4JL3v0wDQDmwZxRsRAjDHotk7rqx0ghWERnidjsqQgs2vlOv
        Sb/0BjSv3eoEJAEkliIN7hckxqRxbHxEJ4AEKrETne3rvSEWBUvjExh5VJBcIWPYTuBICCT2
        Is+i6UAxGSKNZcIZJpqRb6sIYeagBBXrar8sSzb8euK8Z1V2jIVHoOz0/qxLivgLeZQ6wzr3
        qk/2A7fWtMQTX2cTY8YznXblBhiTouj7GhA6O9ai6+gvWThZbCNbvjwx47zS3VE5u7vTb6+s
        zGra9Xm9MHCk2PHnJ2W6T5R/m0k95dsVcN434YO/bljVbbLucU67su+ORMCGSj0Oo3JW+g8n
        lyXDSgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xe7pvmdziDbZt5LToPXeSyWLjjPWs
        Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZtGzYSurxdojd9ktlm36w2Rx
        8MMTVgdejzXz1jB67P22gMVj06pONo/t3x6wetzvPs7ksXlJvcftf4+ZPSbfWM7osftmA5tH
        35ZVjB6fN8kFcEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSW
        pRbp2yXoZTybvpO14I1YxdbX/5gbGF8KdzFyckgImEhc2vOfqYuRi0NIYCmjxI1TF5ghEjIS
        J6c1sELYwhJ/rnWxgdhCAp8YJdZ+8QGx2QQMJbregsS5OEQEOhklpnV/ZAdxmAVeM0m07loD
        1iEs4C+xeu5dJhCbRUBV4lzrFqAiDg5eATuJlkUlEAvkJVZvOAC2mBMofLy7H2qZrcTptTOY
        JzDyLWBkWMUoklpanJueW2yoV5yYW1yal66XnJ+7iREYKduO/dy8g/HSxuBDjAIcjEo8vAvY
        XOOFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOimicxSosn5wCjOK4k3
        NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAyCuRkxr7+nLGsulVa0Wd
        eV8GF1oqWc297hDKNGfCf8M456OBWSqNB6KWyehcli/IYzkpUPq3XeDaxN+sD1TSuotrr8bM
        4fjM9e7yisCmkKXZHFfLD+6bHHd7ezGv4my7WU9+9il1Oa1sjL/9cppaLlenuvfe0CmbRbh7
        7DKUNX/YLr/+fW+lEktxRqKhFnNRcSIAu19n2aoCAAA=
X-CMS-MailID: 20200826063629eucas1p1a3c9c93e281b4c432a6d9940e734e3c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200826063629eucas1p1a3c9c93e281b4c432a6d9940e734e3c4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063629eucas1p1a3c9c93e281b4c432a6d9940e734e3c4
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
        <CGME20200826063629eucas1p1a3c9c93e281b4c432a6d9940e734e3c4@eucas1p1.samsung.com>
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
 drivers/media/pci/cx23885/cx23885-alsa.c | 2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c | 2 +-
 drivers/media/pci/cx88/cx88-alsa.c       | 2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index df44ed7393a0..3f366e4e4685 100644
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
index 301616426d8a..c40304d33776 100644
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
index 7d7aceecc985..3c6fe6ceb0b7 100644
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
index 544ca57eee75..398c47ff473d 100644
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
2.17.1

