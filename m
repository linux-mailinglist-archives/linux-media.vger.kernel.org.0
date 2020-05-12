Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B38E1CF0A8
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbgELJB6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:01:58 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34572 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729634AbgELJBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:01:33 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200512090130euoutp01d2ab79b0adbcb55009b4db208c532b09~OPF128rb42635826358euoutp01Y
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 09:01:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200512090130euoutp01d2ab79b0adbcb55009b4db208c532b09~OPF128rb42635826358euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589274090;
        bh=iwqRA9IvBA5qQavTtN7IR44wij+dBMBZyJPEuCzIDiE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b2ll6vqMSYmUcasvZ7VDmEXKlVWs8C+0jIarYXcSX/ot50IHeukwvnvpbPWXfzeQR
         bL2jCAkimTsh2szqRK6D9YhNkuey3uVV0cMo5nWN9nT0812r4lr3C4eI/f9FntFE77
         a49wlkFSmsGPPcqkE8mEpaHNqsmH48+H1WCV9YZQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200512090130eucas1p2897fb3e554831018d8d3e374c3c0d8e3~OPF1bW0cU2669826698eucas1p2q;
        Tue, 12 May 2020 09:01:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id EA.32.60679.AE56ABE5; Tue, 12
        May 2020 10:01:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401~OPF1K2gSn0961809618eucas1p2x;
        Tue, 12 May 2020 09:01:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200512090129eusmtrp2483d9a5cf050f3efa891592bc516305d~OPF1KE-1n0472704727eusmtrp2b;
        Tue, 12 May 2020 09:01:29 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-e5-5eba65eab4c4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B2.55.08375.9E56ABE5; Tue, 12
        May 2020 10:01:29 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200512090129eusmtip182420fa16f115009ac06b2958ce7d00e~OPF0lpsRC1352513525eusmtip1S;
        Tue, 12 May 2020 09:01:29 +0000 (GMT)
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
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 37/38] media: pci: fix common ALSA DMA-mapping related
 codes
Date:   Tue, 12 May 2020 11:00:57 +0200
Message-Id: <20200512090058.14910-37-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSaUhUURiGO3OXuS5j11HwaJIwaaCQW0E3FMmIuj/6kS2EQdaYN5Wc0WZc
        MqRGcx0X0sCN0ElEc0tnNJcp05F0UtPcMMXd8YcKmjZqaKI53sn+Pd/7vd95z/k4BMJvw+yI
        UHEkIxELwwS4KdrYtf39zDKjDnCvmSaozP5uDqXMr8Wo/cZshBrZ/IlTFVWdHGqwYAqlFG1e
        1MbIHIdS6UYxalj9Bqcy6j5gVM2XKS5VptrlUJq1BeyiBV1dVA3o1i0FSqsq03C6aWsWo2fS
        tRy6vvQFPbGnQ+jXY+WA/jguw+mshkpA61Un6Z5NPfe6+V1T7yAmLDSakbj5PDANmdBrsAg5
        fJquLERkYN1aDggCkudg67ijHJgSfPIdgD05kwhbbADYVbZoLPQAZm+lAjkwOZzQtSYBtlEO
        4PQnBXY0UiJbPHThpAeUr8hxA1uTSQB+zTQ3mBAyC4H1WfmHJivSD1bMpKEGRkkn+Kt3iWNg
        HukD1+V6hI1zgFV17YdscqDPFO+irD7Eha2TgSxfhoNKBZdlK7isbTCyPdxvKeYYgiH5EsC5
        /houW2QAOJyQb3yQF5zs38EN60BIZ1irdmM34wuXq2+zaAHHViwNZuQAcxrzEFbmwdRkPnvG
        aViofX+UqhkYMt6ehqvjjcZldQKo1/1BXgGHwv9ZCgAqgQ0TJRUFM1JPMRPjKhWKpFHiYNeH
        4SIVOPhWvXvajWag3g3sACQBBOY8d/eWAD4mjJbGijoAJBCBNS8x9EDiBQljnzGS8PuSqDBG
        2gFOEKjAhne2ZOkenwwWRjKPGSaCkfzrcggTOxmIk0WcP24Vovq2cIyfa/sk4bdNZF7KjSJd
        fptj+8C2WXOi02pf3C2ZpUv8zDVuclmpd5ZaQ8c/GnW+MjVBXvJP2UFK5ufRcovn/KvlyuSE
        PlWuL7z5WTsrrlGrF8HatJlfTIg/Xv2221PnWrB2qufOBXtsd6NjtEnkQ9v+2CIFqDRE6OGC
        SKTCv8NFiCtSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xu7ovU3fFGSy7YGzRe+4kk8XGGetZ
        Lf5vm8hsceXrezaLlauPMllcnHmXxWLBfmuLL1ceMllsenyN1eLyrjlsFj0btrJarD1yl91i
        2aY/TBYHPzxhdeDzWDNvDaPH3m8LWDw2repk89j+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
        u282sHn0bVnF6PF5k5zHqa+f2QN4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
        jEyV9O1sUlJzMstSi/TtEvQybn8+yFrQJVHRvXEWcwPjR5EuRk4OCQETicd7Wxm7GLk4hASW
        Mkp0v5rAApGQkTg5rYEVwhaW+HOtiw2i6BOjxJ2z98CK2AQMJbreQiREBDoZJaZ1f2QHcZgF
        pjFLLGx8zgZSJSzgL7HmeA8TiM0ioCrx6fRLMJtXwE7iY9dnZogV8hKrNxwAszmB4vfn/wHb
        ICRQKPHo6luWCYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRG0LZjPzfvYLy0MfgQ
        owAHoxIPb4fRzjgh1sSy4srcQ4wSHMxKIrwtmUAh3pTEyqrUovz4otKc1OJDjKZAR01klhJN
        zgdGd15JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkZ9vWJFyWb3
        iMudHjO2Ltn8zmP3ogXLczyLpflsTvEevzptkR3DpTnOUrtb7i/LfDXrzN8pdpsntd7fJTn7
        bb1Rc6/jMytxp2dMW3bVRu++WdQx9+vK7Bdlm87fe32nkH+TdFpOb4Vl43zDqE23NQJ2Hncs
        +jTPoTb9ttdhs4UGOqYrLZfvShFSYinOSDTUYi4qTgQAgDAZQ7YCAAA=
X-CMS-MailID: 20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
        <20200512090058.14910-1-m.szyprowski@samsung.com>
        <CGME20200512090129eucas1p24fa7e83acb8cde494f71ca5694279401@eucas1p2.samsung.com>
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
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

