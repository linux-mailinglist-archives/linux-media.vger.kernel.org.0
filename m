Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBD31184621
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgCMLmF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:42:05 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33254 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMLmF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:42:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBg2ra122289;
        Fri, 13 Mar 2020 06:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099722;
        bh=0qf+vaC7YRk/8RZPdo0XhMtwK1og/yfMHDkY54cNcik=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fUz4GtmC+IdVEDS0/kHRuaQnEYl+M8lRZYDQWeRH5blySfyMvXfZD9nEcjNjzZCp0
         sWUNDbOvMUPmXz/A7j4RwRBuE+NPC+GW7JqpxuDKjhs2huCdua2UDnW/gwerJVCTtt
         TFDaIW2NH5b/V7+h6KH27g09qw+SjaM8/XUBU4AA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBg2ef120542
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:42:02 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:42:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:42:02 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcow044014;
        Fri, 13 Mar 2020 06:42:00 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 14/16] media: ti-vpe: cal: improve wait for CIO resetdone
Date:   Fri, 13 Mar 2020 13:41:19 +0200
Message-ID: <20200313114121.32182-14-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313114121.32182-1-tomi.valkeinen@ti.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sometimes waiting for ComplexIO resetdone timeouts. Testing shows that
sometimes we need to wait more than what the current code does. It is
not clear how long this wait can be, but it is based on how quickly the
sensor provides a valid clock, and how quickly CAL syncs to it.

Change the code to make it more obvious how long we'll wait, and set a
wider range for usleep_range. Increase the timeout to 750ms.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 319312770eea..929f9b3ca4f9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -824,20 +824,21 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 
 static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
 {
-	int i;
+	unsigned long timeout;
 
-	for (i = 0; i < 250; i++) {
+	timeout = jiffies + msecs_to_jiffies(750);
+	while (time_before(jiffies, timeout)) {
 		if (reg_read_field(ctx->dev,
 				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
 		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
 			break;
-		usleep_range(1000, 1100);
+		usleep_range(500, 5000);
 	}
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done (%d) %s\n",
+
+	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done\n",
 		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
-		(i >= 250) ? "(timeout)" : "");
+		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
 
 	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

