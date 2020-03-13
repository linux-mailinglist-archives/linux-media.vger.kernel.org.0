Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6DDC184620
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgCMLmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:42:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33244 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMLmD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:42:03 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBg06k122281;
        Fri, 13 Mar 2020 06:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099720;
        bh=gzTdDW/NZ+Sc7Kzx+Pnq28yBni1fS9W62YXvMJGtDts=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BFE3jd3CmwyV/gYuG3xBbLHByGOuxNbm62ddBXuRDXAldktDUKL77mAiVeQxSR+B9
         yPjcG89mLiSG4DUyJB26LLQGg0CaOo59CmKHlzlwIqVVtzdS8iNTWFVtNZYGKy7PPQ
         pJZmR0pmcnQCtakKPPJUGIUSrBbFP6Qf4QRmQObk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBg0d5074718
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:42:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:42:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:42:00 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcov044014;
        Fri, 13 Mar 2020 06:41:59 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 13/16] media: ti-vpe: cal: move code to separate functions
Date:   Fri, 13 Mar 2020 13:41:18 +0200
Message-ID: <20200313114121.32182-13-tomi.valkeinen@ti.com>
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

To make csi2_wait_for_phy() more readable, move code to separate
functions.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 38 ++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 64ea92dbfac5..319312770eea 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -822,20 +822,10 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	csi2_cio_pwr(ctx, true);
 }
 
-static void csi2_wait_for_phy(struct cal_ctx *ctx)
+static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
 {
 	int i;
 
-	/* Steps
-	 *  2. Wait for completion of reset
-	 *          Note if the external sensor is not sending byte clock,
-	 *          the reset will timeout
-	 *  4.Force FORCERXMODE
-	 *      G. Wait for all enabled lane to reach stop state
-	 *      H. Disable pull down using pad control
-	 */
-
-	/* 2. Wait for reset completion */
 	for (i = 0; i < 250; i++) {
 		if (reg_read_field(ctx->dev,
 				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
@@ -854,7 +844,12 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
 		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
 
-	/* 4. G. Wait for all enabled lane to reach stop state */
+}
+
+static void csi2_wait_stop_state(struct cal_ctx *ctx)
+{
+	int i;
+
 	for (i = 0; i < 10; i++) {
 		if (reg_read_field(ctx->dev,
 				   CAL_CSI2_TIMING(ctx->csi2_port),
@@ -866,9 +861,28 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 		ctx->csi2_port,
 		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
 		(i >= 10) ? "(timeout)" : "");
+
 	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
 			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
 		ctx_err(ctx, "Timeout waiting for stop state\n");
+}
+
+static void csi2_wait_for_phy(struct cal_ctx *ctx)
+{
+	/* Steps
+	 *  2. Wait for completion of reset
+	 *          Note if the external sensor is not sending byte clock,
+	 *          the reset will timeout
+	 *  4.Force FORCERXMODE
+	 *      G. Wait for all enabled lane to reach stop state
+	 *      H. Disable pull down using pad control
+	 */
+
+	/* 2. Wait for reset completion */
+	csi2_wait_complexio_reset(ctx);
+
+	/* 4. G. Wait for all enabled lane to reach stop state */
+	csi2_wait_stop_state(ctx);
 
 	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
 		(ctx->csi2_port - 1), reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

