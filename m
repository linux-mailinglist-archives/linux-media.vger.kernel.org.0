Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2375312290E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 11:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfLQKlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 05:41:37 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60380 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfLQKlh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 05:41:37 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHAfNk5114661;
        Tue, 17 Dec 2019 04:41:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576579283;
        bh=6kGmIjNfHqdZqSSE4L9c9Vu8ITPfcmfBO4lOVpn5rIo=;
        h=From:To:CC:Subject:Date;
        b=DM7GS2seHa5rf/EfwTB+fD3tjq47Ud8WDX5NkT62OavFHE5zixnKBANet9d02Y2kV
         VkoRqRTjo9nbiR309GNIzbCAHNcJD58Ns39eUR0ECYzJoQ65vTjqnI6rwcpMuZ8hU9
         KNttiuzYataLDZ6231gcQdD5wH8Lg7Yx3RxkLgr8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHAfN5x052907
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 04:41:23 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 04:41:22 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 04:41:22 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHAfJta008859;
        Tue, 17 Dec 2019 04:41:20 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>, <hugues.fruchet@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
CC:     <vkoul@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] media: stm32-dcmi: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Tue, 17 Dec 2019 12:41:35 +0200
Message-ID: <20191217104135.23554-1-peter.ujfalusi@ti.com>
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
 drivers/media/platform/stm32/stm32-dcmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 9392e3409fba..55351872b0c7 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1910,10 +1910,10 @@ static int dcmi_probe(struct platform_device *pdev)
 		return PTR_ERR(mclk);
 	}
 
-	chan = dma_request_slave_channel(&pdev->dev, "tx");
-	if (!chan) {
+	chan = dma_request_chan(&pdev->dev, "tx");
+	if (IS_ERR(chan)) {
 		dev_info(&pdev->dev, "Unable to request DMA channel, defer probing\n");
-		return -EPROBE_DEFER;
+		return PTR_ERR(chan);
 	}
 
 	spin_lock_init(&dcmi->irqlock);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

