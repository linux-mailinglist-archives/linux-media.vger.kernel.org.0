Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A49C1927F8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbgCYMQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41802 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:06 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCG4tv062599;
        Wed, 25 Mar 2020 07:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138564;
        bh=cZJwp65vYohd5HAxMGhETHbv8wxpd9PR332Sr1BuADA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FAoiiMci5cVAGY8GAaCOV1sGsIxO7uBF3zS87ltJioo5vidnzDhFREob8ENwto//4
         S59aOBQHXJcqd8QHlTEm1fKGZZYU+6msFPhSQNQEgYbdEyr3rIy1ZC+ZydkJJGqsDE
         P444Nm21iyBjiIXAcob/FrNFQ6j0PB1zfNzm5pEY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCG4QV003387;
        Wed, 25 Mar 2020 07:16:04 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:03 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm56085323;
        Wed, 25 Mar 2020 07:16:02 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 07/19] media: ti-vpe: cal: print errors on timeouts
Date:   Wed, 25 Mar 2020 14:14:58 +0200
Message-ID: <20200325121510.25923-8-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325121510.25923-1-tomi.valkeinen@ti.com>
References: <20200325121510.25923-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver does not print any errors on ComplexIO reset timeout or when
waiting for stop-state, making it difficult to debug and notice
problems.

Add error prints for these cases.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 838215a3f230..9bfe83fdd76e 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -839,10 +839,11 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 			break;
 		usleep_range(1000, 1100);
 	}
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done (%d) %s\n",
-		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
-		(i >= 250) ? "(timeout)" : "");
+
+	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
+			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
+		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
 
 	/* 4. G. Wait for all enabled lane to reach stop state */
 	for (i = 0; i < 10; i++) {
@@ -853,10 +854,10 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 			break;
 		usleep_range(1000, 1100);
 	}
-	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop State Reached %s\n",
-		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
-		(i >= 10) ? "(timeout)" : "");
+
+	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
+			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
+		ctx_err(ctx, "Timeout waiting for stop state\n");
 
 	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
 		(ctx->csi2_port - 1), reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

