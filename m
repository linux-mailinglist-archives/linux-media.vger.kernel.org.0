Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A9018AD82
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgCSHun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36966 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgCSHum (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7odFQ085552;
        Thu, 19 Mar 2020 02:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604239;
        bh=0Iqv/XApqFzCGbNeZ5wegYTKVBnhNJ2H+lTeT3ipUy8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Iex+PoyHJgrqVNxxaq+FyurgU0oF7GF4G7aUjq6nBxM5nSgJ9ksg53rmSlzFIOC1h
         3LFg3LTo3HL1LigG+B05VAxXFvyKQuKpXsgZ7Ws4YyBYE+3qqTf66cxC99hhneIfi7
         FXcU7casDy4Llr6ccks6IjVMdFg6mTjSd4CqYOzU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7odoK118739
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:50:39 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:38 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqf047151;
        Thu, 19 Mar 2020 02:50:37 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 02/19] media: ti-vpe: cal: improve enable_irqs
Date:   Thu, 19 Mar 2020 09:50:06 +0200
Message-ID: <20200319075023.22151-3-tomi.valkeinen@ti.com>
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

IRQENABLE_SET registers are (usually) not meant to be read, only written
to. The current driver needlessly uses read-modify-write cycle to enable
IRQ bits.

The read-modify-write has no bad side effects here, but it's still
better to clean this up by only using write.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9dd6de14189b..76d55c76d938 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -706,16 +706,16 @@ static void cal_quickdump_regs(struct cal_dev *dev)
  */
 static void enable_irqs(struct cal_ctx *ctx)
 {
+	u32 val;
+
 	/* Enable IRQ_WDMA_END 0/1 */
-	reg_write_field(ctx->dev,
-			CAL_HL_IRQENABLE_SET(2),
-			CAL_HL_IRQ_ENABLE,
-			CAL_HL_IRQ_MASK(ctx->csi2_port));
+	val = 0;
+	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
+	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), val);
 	/* Enable IRQ_WDMA_START 0/1 */
-	reg_write_field(ctx->dev,
-			CAL_HL_IRQENABLE_SET(3),
-			CAL_HL_IRQ_ENABLE,
-			CAL_HL_IRQ_MASK(ctx->csi2_port));
+	val = 0;
+	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
+	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(3), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
 	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0xFF000000);
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

