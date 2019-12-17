Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 298E7122906
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 11:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfLQKjM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 05:39:12 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48926 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfLQKjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 05:39:12 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHAdA4Z078554;
        Tue, 17 Dec 2019 04:39:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576579150;
        bh=L+n8eG++qBCc548Y3EO87ASj7TEZ4gDHxdGRNi6ufvI=;
        h=From:To:CC:Subject:Date;
        b=nFDJ70bLHp4TP5ekquuuilLfCXXBYFAsx0jNrnAWr/FNxNfi5iH+jZ7941j0EZLtn
         6jiJx5VEIENB5o0jGVSD3DLNPz7a2TAZLiVDMrb11so4BmHrDxjP/q3McUgM/jUQzR
         Trlq7PfXXVbXpW58zaAQci+spShFAx5zxViLafqI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHAdAwb128013
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 04:39:10 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 04:39:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 04:39:09 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHAd7Uv024500;
        Tue, 17 Dec 2019 04:39:08 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>
CC:     <vkoul@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: pxa_camera: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Tue, 17 Dec 2019 12:39:23 +0200
Message-ID: <20191217103923.23066-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
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
 drivers/media/platform/pxa_camera.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 43ae645d866b..321dee9ca81c 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2440,23 +2440,23 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	pcdev->base = base;
 
 	/* request dma */
-	pcdev->dma_chans[0] = dma_request_slave_channel(&pdev->dev, "CI_Y");
-	if (!pcdev->dma_chans[0]) {
+	pcdev->dma_chans[0] = dma_request_chan(&pdev->dev, "CI_Y");
+	if (IS_ERR(pcdev->dma_chans[0])) {
 		dev_err(&pdev->dev, "Can't request DMA for Y\n");
-		return -ENODEV;
+		return PTR_ERR(pcdev->dma_chans[0]);
 	}
 
-	pcdev->dma_chans[1] = dma_request_slave_channel(&pdev->dev, "CI_U");
-	if (!pcdev->dma_chans[1]) {
-		dev_err(&pdev->dev, "Can't request DMA for Y\n");
-		err = -ENODEV;
+	pcdev->dma_chans[1] = dma_request_chan(&pdev->dev, "CI_U");
+	if (IS_ERR(pcdev->dma_chans[1])) {
+		dev_err(&pdev->dev, "Can't request DMA for U\n");
+		err = PTR_ERR(pcdev->dma_chans[1]);
 		goto exit_free_dma_y;
 	}
 
-	pcdev->dma_chans[2] = dma_request_slave_channel(&pdev->dev, "CI_V");
-	if (!pcdev->dma_chans[2]) {
+	pcdev->dma_chans[2] = dma_request_chan(&pdev->dev, "CI_V");
+	if (IS_ERR(pcdev->dma_chans[2])) {
 		dev_err(&pdev->dev, "Can't request DMA for V\n");
-		err = -ENODEV;
+		err = PTR_ERR(pcdev->dma_chans[2]);
 		goto exit_free_dma_u;
 	}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

