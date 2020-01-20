Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE909142B3D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 13:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgATMrX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 07:47:23 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53706 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgATMrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 07:47:23 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KClIfr088158;
        Mon, 20 Jan 2020 06:47:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579524438;
        bh=2A6e1QfOAnQP0e5DrD7ehIPgznhqyFIlLeh09JCEdHY=;
        h=From:To:CC:Subject:Date;
        b=NtGhW17ikRrNF2oTeG9Z+DZFdqXf3/Nh/aEPz9bIpYANdvii2mE6SSKZajT5bazjy
         uDWBs+76cBtdVqv7etjRpe0GUZMu3C7z8Uq9brD5HTdJNF4dAmYS2DgyJwLpUnTA2w
         bkc7jh98kDgfg+EMWmiix2tLnvG3VBuAecMDMeDI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KClHie129082
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jan 2020 06:47:18 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 06:47:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 06:47:16 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KClETI003194;
        Mon, 20 Jan 2020 06:47:14 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>, <rashanmu@gmail.com>, <geert@linux-m68k.org>
CC:     <vkoul@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Mon, 20 Jan 2020 14:47:54 +0200
Message-ID: <20200120124754.26826-1-peter.ujfalusi@ti.com>
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

Changes since v2:
- Use %pe to print error name using the ch->dmach pointer
- Set ch->dmach to NULL in case of error

Changes since v1:
- Do not print error in case of EPROBE_DEFER
- Added Reviewed-by from Geert

Regards,
Peter

 drivers/media/platform/rcar_drif.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 0f267a237b42..3d2451ac347d 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -275,10 +275,14 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
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
+					  "ch%u: dma channel req failed: %pe\n",
+					  i, ch->dmach);
+			ch->dmach = NULL;
 			goto dmach_error;
 		}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

