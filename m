Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29597142AF8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 13:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgATMf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 07:35:59 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56054 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATMf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 07:35:59 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KCZsje062199;
        Mon, 20 Jan 2020 06:35:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579523754;
        bh=m+zTuRnfuAntSFFi0NvmMn8KC9SHkTO7IO7+B4/ZUJo=;
        h=From:To:CC:Subject:Date;
        b=ahlzDhBQT2oRSfOHOMYboJUmnydPvx2wVToARkTASScwgTaMyRTz3SVZRC0Nyxh6R
         fHDHdURuwYyiweARqvkuIIHHgFg5KvWG+uhGo88nGi8nO7oMVfcpzv91Hbg+OdAa94
         tISmyuy/2sZEQFLJIBtzKv1WBzXIQUlNdUtDeSbE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KCZsFA113501
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jan 2020 06:35:54 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 06:35:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 06:35:53 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KCZp1f027202;
        Mon, 20 Jan 2020 06:35:51 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>, <rashanmu@gmail.com>, <geert@linux-m68k.org>
CC:     <vkoul@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Mon, 20 Jan 2020 14:36:31 +0200
Message-ID: <20200120123631.24799-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.0
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi,

Changes since v1:
- Do not print error in case of EPROBE_DEFER
- Added Reviewed-by from Geert

Regards,
Peter

 drivers/media/platform/rcar_drif.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 0f267a237b42..33251f4bf181 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -275,10 +275,13 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
 	for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
 		struct rcar_drif *ch = sdr->ch[i];
 
-		ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
-		if (!ch->dmach) {
-			rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
-			ret = -ENODEV;
+		ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
+		if (IS_ERR(ch->dmach)) {
+			ret = PTR_ERR(ch->dmach);
+			if (ret != -EPROBE_DEFER)
+				rdrif_err(sdr,
+					  "ch%u: dma channel req failed (%d)\n",
+					  i, ret);
 			goto dmach_error;
 		}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

