Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F3716FBCE
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 11:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgBZKO0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 05:14:26 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41388 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgBZKO0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 05:14:26 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QAENh5117019;
        Wed, 26 Feb 2020 04:14:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582712063;
        bh=ueUm783d9tNagqYaXHd4baQU0Dbrpd1HLoANaaqTDQQ=;
        h=From:To:CC:Subject:Date;
        b=yDCO7zifAyuOMZ0spzk/qVcIgzOueVYFhOJ3B1GYL1MclVVx2CHuLt/JYA4U1/Exa
         7Klf/tBGtd3Wpq3s81A1zbxmJQi23Jy3Bn7zMx1xH3MmwWmqfW/dqgKDH5RvRD1myi
         KKjv8X8bFxjKNqKhKQu+5RVWNAkzd7+dGFlw3rLM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QAEN44013287;
        Wed, 26 Feb 2020 04:14:23 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 04:14:23 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 04:14:23 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QAELaQ046825;
        Wed, 26 Feb 2020 04:14:21 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <rashanmu@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] media: rcar_drif: Do not print error in case of EPROBE_DEFER for dma channel
Date:   Wed, 26 Feb 2020 12:14:20 +0200
Message-ID: <20200226101420.9066-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the dma channel request error code is EPROBE_DEFER there is no need to
print error message.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
Hi Hans,

the patch updates the v1 "media: rcar_drif: Use dma_request_chan() instead
dma_request_slave_channel()" which got applied to the v3 state.

I have not added the fixes line, but if you think the hash is not going to
change, you can copy this line:
Fixes: 1b5482e0d268 ("media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel()")

Regards,
Peter

 drivers/media/platform/rcar_drif.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 02ee0e2a09e9..3d2451ac347d 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -277,8 +277,12 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
 
 		ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
 		if (IS_ERR(ch->dmach)) {
-			rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
 			ret = PTR_ERR(ch->dmach);
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

