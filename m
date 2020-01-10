Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDA113681C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 08:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgAJHQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 02:16:27 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34774 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgAJHQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 02:16:26 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00A7GJU9065583;
        Fri, 10 Jan 2020 01:16:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578640580;
        bh=UWIUrIeOJUT2Q2yeIt+pWgbb4LHnPensbV2MqiTfZMM=;
        h=From:To:CC:Subject:Date;
        b=bQlZmhQrmViX1z/HFnsdkM7/zZcRGYkXRK4dkI5OmO0/buvnyELkrVZeY56xAr/cB
         XeJHWR3iaZu08h6lDbCaAtNdupAO4mj6VchnKXlxwxdCtLlU2/l1HDX0RWDjTCcwMF
         hQMzBpHqxXjRG5Z8ZeuYJqM6JNyX3g/RxtA6iFxo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00A7GJsq048158;
        Fri, 10 Jan 2020 01:16:19 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 10
 Jan 2020 01:16:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 10 Jan 2020 01:16:18 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00A7GG4A041868;
        Fri, 10 Jan 2020 01:16:16 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>, <hyun.kwon@xilinx.com>,
        <laurent.pinchart@ideasonboard.com>
CC:     <vkoul@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <michal.simek@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2] media: xilinx: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Fri, 10 Jan 2020 09:16:48 +0200
Message-ID: <20200110071648.15690-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

By using dma_request_chan() directly the driver can support deferred
probing against DMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
Hi,

Changes since v1:
- Fix cleanup path when DMA request failed as suggested by Laurent
- Print error only in case when the error is not EPROBE_DEFER

Regards,
Peter

 drivers/media/platform/xilinx/xilinx-dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index b211380a11f2..3bb54a4db6a4 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -725,10 +725,11 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
 
 	/* ... and the DMA channel. */
 	snprintf(name, sizeof(name), "port%u", port);
-	dma->dma = dma_request_slave_channel(dma->xdev->dev, name);
-	if (dma->dma == NULL) {
-		dev_err(dma->xdev->dev, "no VDMA channel found\n");
-		ret = -ENODEV;
+	dma->dma = dma_request_chan(dma->xdev->dev, name);
+	if (IS_ERR(dma->dma)) {
+		ret = PTR_ERR(dma->dma);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dma->xdev->dev, "no VDMA channel found\n");
 		goto error;
 	}
 
@@ -752,7 +753,7 @@ void xvip_dma_cleanup(struct xvip_dma *dma)
 	if (video_is_registered(&dma->video))
 		video_unregister_device(&dma->video);
 
-	if (dma->dma)
+	if (!IS_ERR_OR_NULL(dma->dma))
 		dma_release_channel(dma->dma);
 
 	media_entity_cleanup(&dma->video.entity);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

