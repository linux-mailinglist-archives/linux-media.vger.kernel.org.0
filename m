Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637521DB4C2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgETNQY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:16:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51004 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETNQY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:16:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KDGIPK075879;
        Wed, 20 May 2020 08:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589980578;
        bh=g5mxtIyMDGJIfjMohatgyirw9qrdm5M7LriXPEsGKOs=;
        h=From:To:CC:Subject:Date;
        b=Rsc7egtCVTnZ9rJ3AC75KqbJbnXiFZortrfw8p98+O/9/rJfiEL+gPjjKKLLZiXwF
         JO8Ts9qbYTbLxlZOUdipIsJNH2Lrk+M+sBd53BrZSFD1519giTdG+BIuS3+ATSMbp8
         LGkFjXBPKgKFpnJZh3FxGILUcx2pa1/hI6WdlMyE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KDGIOC094815;
        Wed, 20 May 2020 08:16:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 08:16:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 08:16:17 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KDGGnl086139;
        Wed, 20 May 2020 08:16:16 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     LKML <linux-kernel@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] media: videobuf2-dma-contig: fix bad kfree in vb2_dma_contig_clear_max_seg_size
Date:   Wed, 20 May 2020 16:15:58 +0300
Message-ID: <20200520131558.23009-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core: platform:
Initialize dma_parms for platform devices") in v5.7-rc5 causes
vb2_dma_contig_clear_max_seg_size() to kfree memory that was not
allocated by vb2_dma_contig_set_max_seg_size().

The assumption in vb2_dma_contig_set_max_seg_size() seems to be that
dev->dma_parms is always NULL when the driver is probed, and the case
where dev->dma_parms has bee initialized by someone else than the driver
(by calling vb2_dma_contig_set_max_seg_size) will cause a failure.

All the current users of these functions are platform devices, which now
always have dma_parms set by the driver core. To fix the issue for v5.7,
make vb2_dma_contig_set_max_seg_size() return an error if dma_parms is
NULL to be on the safe side, and remove the kfree code from
vb2_dma_contig_clear_max_seg_size().

For v5.8 we should remove the two functions and move the
dma_set_max_seg_size() calls into the drivers.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---

Note: I have only fully tested this on linux-next, as the capture driver
I use doesn't support unloading modules in v5.7.

 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index d3a3ee5b597b..24f80b62ef94 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -726,9 +726,8 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_memops);
 int vb2_dma_contig_set_max_seg_size(struct device *dev, unsigned int size)
 {
 	if (!dev->dma_parms) {
-		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
-		if (!dev->dma_parms)
-			return -ENOMEM;
+		dev_err(dev, "Failed to set max_seg_size: dma_parms is NULL\n");
+		return -ENODEV;
 	}
 	if (dma_get_max_seg_size(dev) < size)
 		return dma_set_max_seg_size(dev, size);
@@ -747,8 +746,6 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
  */
 void vb2_dma_contig_clear_max_seg_size(struct device *dev)
 {
-	kfree(dev->dma_parms);
-	dev->dma_parms = NULL;
 }
 EXPORT_SYMBOL_GPL(vb2_dma_contig_clear_max_seg_size);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

