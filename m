Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 457481927FB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbgCYMQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:12 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43364 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCG9Wm097347;
        Wed, 25 Mar 2020 07:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138569;
        bh=2JiTup49IJbSGt6VyiAb3VnmHNVX9IllDqM99eaLQY4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CIBzX+5L3T6OcDbBuDVk8z6Xb0A/3MhhY64btozq1zYAL7Ri33mAGa9kxoVZkr75P
         dAe5fvPhEaUQvDDtgekXrYVfbKpBsNEDPO92u22TZZbBKcbqWmIZJBQvHE5h/3YWgy
         2+UDx7NsKiPQTk+eQgABXVNWXO6Nwtjhvw1Y7ZCs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCG9bW014129
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:16:09 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:09 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm59085323;
        Wed, 25 Mar 2020 07:16:07 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 10/19] media: ti-vpe: cal: remove useless IRQ defines
Date:   Wed, 25 Mar 2020 14:15:01 +0200
Message-ID: <20200325121510.25923-11-tomi.valkeinen@ti.com>
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

Remove a bunch of IRQ defines, of which only CAL_HL_IRQ_ENABLE and
CAL_HL_IRQ_CLEAR are used, and these defines only end up obfuscating
code.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 8 ++++----
 drivers/media/platform/ti-vpe/cal_regs.h | 6 ------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 101efe3a1045..e35565fc4bed 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -701,11 +701,11 @@ static void enable_irqs(struct cal_ctx *ctx)
 
 	/* Enable IRQ_WDMA_END 0/1 */
 	val = 0;
-	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
+	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
 	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), val);
 	/* Enable IRQ_WDMA_START 0/1 */
 	val = 0;
-	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
+	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
 	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(3), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
 	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0xFF000000);
@@ -723,11 +723,11 @@ static void disable_irqs(struct cal_ctx *ctx)
 
 	/* Disable IRQ_WDMA_END 0/1 */
 	val = 0;
-	set_field(&val, CAL_HL_IRQ_CLEAR, CAL_HL_IRQ_MASK(ctx->csi2_port));
+	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
 	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(2), val);
 	/* Disable IRQ_WDMA_START 0/1 */
 	val = 0;
-	set_field(&val, CAL_HL_IRQ_CLEAR, CAL_HL_IRQ_MASK(ctx->csi2_port));
+	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
 	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(3), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
 	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0);
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index 3b3150aaf343..6a235abc25b1 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -142,12 +142,6 @@
 #define CAL_HL_IRQ_EOI_LINE_NUMBER_EOI0			0
 
 #define CAL_HL_IRQ_MASK(m)			BIT((m) - 1)
-#define CAL_HL_IRQ_NOACTION				0x0
-#define CAL_HL_IRQ_ENABLE				0x1
-#define CAL_HL_IRQ_CLEAR				0x1
-#define CAL_HL_IRQ_DISABLED				0x0
-#define CAL_HL_IRQ_ENABLED				0x1
-#define CAL_HL_IRQ_PENDING				0x1
 
 #define CAL_HL_IRQ_OCPO_ERR_MASK		BIT(6)
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

