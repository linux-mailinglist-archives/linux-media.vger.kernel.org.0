Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD0EA18AD97
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgCSHvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:51:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52708 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgCSHvI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:51:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7p5SL083785;
        Thu, 19 Mar 2020 02:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604265;
        bh=QuIub1FQ7tXBentp7udzjG7l3KORnYM7Pl/0EtOndSg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ey3uiVDZX6BATmvjGsyi+iosfsIVLzOmpPct3stdo6zoDueO6lnQvgzWX7vpX0eAJ
         q9cKoxr8OJPKjQdIUJS96cDI8IWMECBmwOKP2vYQxt9kwM/D8sjhz9ZSB5I2nev2+3
         MxJP6ualB4MFy9rJc7V61no/nwt0HzXiM0IRy1RA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7p4m9036417
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:51:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:51:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:51:03 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqt047151;
        Thu, 19 Mar 2020 02:51:02 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 16/19] media: ti-vpe: cal: move code to separate functions
Date:   Thu, 19 Mar 2020 09:50:20 +0200
Message-ID: <20200319075023.22151-17-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319075023.22151-1-tomi.valkeinen@ti.com>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
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
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 38 ++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b1b9616b12b6..ed68ad58121e 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -823,20 +823,10 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	csi2_cio_power(ctx, true);
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
@@ -855,7 +845,12 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
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
@@ -867,9 +862,28 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
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

