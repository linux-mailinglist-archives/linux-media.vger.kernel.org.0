Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46AEE18AD8A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgCSHu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37042 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgCSHu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:57 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7osBR085636;
        Thu, 19 Mar 2020 02:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604254;
        bh=giyyWezH+uSF5MJzu5zx6UWfNLBQVusc1WY+XvFs2Js=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dRF+BBjJchNzfdMYeh/+k5yF5LfE5kLGjnXTeORVbRpv6EdQr1YIW5Txmhv8RMyGr
         Az0YRuR9bDEqbo+hme0q30Q3OxiXSnysTDVD7VMFflab2I9yEVuBBg33Mb0EOnvkdr
         IFx2Ah/STXfOOGXWgIP4kEaZ+oNK+DHkaxrJj/nA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7osnP129485
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:50:54 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:53 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqn047151;
        Thu, 19 Mar 2020 02:50:51 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 10/19] media: ti-vpe: cal: remove useless IRQ defines
Date:   Thu, 19 Mar 2020 09:50:14 +0200
Message-ID: <20200319075023.22151-11-tomi.valkeinen@ti.com>
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

Remove a bunch of IRQ defines, of which only CAL_HL_IRQ_ENABLE and
CAL_HL_IRQ_CLEAR are used, and these defines only end up obfuscating
code.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 8 ++++----
 drivers/media/platform/ti-vpe/cal_regs.h | 6 ------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 53072afbaf4e..979f9027a232 100644
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

