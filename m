Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBA6213253C
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 12:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgAGLwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 06:52:35 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56816 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgAGLwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 06:52:34 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007BqQfX107802;
        Tue, 7 Jan 2020 05:52:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578397946;
        bh=/n4geygpYCmBAVJrP9D1RQbQETJykF2u108T2+FxKjo=;
        h=From:To:CC:Subject:Date;
        b=k1hPWFn6Big/lJzkUmgjckDkEW991k2QpC99O9QgyWtsoPb+JaMppYnRlpripLn0d
         bCHEKKXWPcJmzmBFEB2Ou3z1Ww6EWS072RLr3LCLssn0y3WQGW6R6UCtxjkks4o/+G
         aEa+yFQvlyufbZohD2/5B8bIiqdATpZu1j99Fv9E=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007BqQsW048276
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 05:52:26 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 05:52:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 05:52:25 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007BqMQ7067156;
        Tue, 7 Jan 2020 05:52:23 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>, <hugues.fruchet@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
CC:     <vkoul@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2] media: stm32-dcmi: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Tue, 7 Jan 2020 13:52:53 +0200
Message-ID: <20200107115253.8351-1-peter.ujfalusi@ti.com>
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
- Do not print error for EPROBE_DEFER

Regards,
Peter

 drivers/media/platform/stm32/stm32-dcmi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 9392e3409fba..b63ff8d636ce 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1910,10 +1910,13 @@ static int dcmi_probe(struct platform_device *pdev)
 		return PTR_ERR(mclk);
 	}
 
-	chan = dma_request_slave_channel(&pdev->dev, "tx");
-	if (!chan) {
-		dev_info(&pdev->dev, "Unable to request DMA channel, defer probing\n");
-		return -EPROBE_DEFER;
+	chan = dma_request_chan(&pdev->dev, "tx");
+	if (IS_ERR(chan)) {
+		ret = PTR_ERR(chan);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Failed to request DMA channel: %d\n", ret);
+		return ret;
 	}
 
 	spin_lock_init(&dcmi->irqlock);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

