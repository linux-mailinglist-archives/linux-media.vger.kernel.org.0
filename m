Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFC3E12290A
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 11:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfLQKkP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 05:40:15 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60208 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfLQKkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 05:40:15 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHAeCwB114330;
        Tue, 17 Dec 2019 04:40:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576579212;
        bh=V1JmF9ix8iZEnPqA63zPzUT60yfRxIKuz/XAj8YrYlc=;
        h=From:To:CC:Subject:Date;
        b=TVVQSbuxj1fHsYHgf5JSJI3T7lG3NKaVLOPPTcdJJ5R9AjdN6NCzM1LeUYeztNx5W
         IwWSNCz77Eftgk3ZZWskPyG0Z3lLrO36VDT6intt1iLxGauVmw5ULMLT/3+tjy8SxR
         jssdOyC42JcmXxiYwdmrXAD+jTG8tY0tDvHU86I4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHAeCjv050933
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 04:40:12 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 04:40:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 04:40:12 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHAeALb006727;
        Tue, 17 Dec 2019 04:40:10 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>, <rashanmu@gmail.com>
CC:     <vkoul@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Tue, 17 Dec 2019 12:40:25 +0200
Message-ID: <20191217104025.23318-1-peter.ujfalusi@ti.com>
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
 drivers/media/platform/rcar_drif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 0f267a237b42..02ee0e2a09e9 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -275,10 +275,10 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
 	for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
 		struct rcar_drif *ch = sdr->ch[i];
 
-		ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
-		if (!ch->dmach) {
+		ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
+		if (IS_ERR(ch->dmach)) {
 			rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
-			ret = -ENODEV;
+			ret = PTR_ERR(ch->dmach);
 			goto dmach_error;
 		}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

