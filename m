Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9767D18AD87
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgCSHux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:53 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40554 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgCSHux (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:53 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7omMX123759;
        Thu, 19 Mar 2020 02:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604248;
        bh=6r+lXAe1oJNbFgzO5QTQlBz+chqnz1NhWKFPn8NHLt8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qbThSh44Wr9NJR7UGVx8iAFBm16A52YvC6/v8li9WiAfOpyTSj216xE3IrlAbFWm/
         dN2sI/zOMMd1acAXJA33HfVIZXhtLq8AlkdKdvVNEZ5eYYoVg2iEq9PywfPfHNUPAj
         LwR9nNRS6vpkh5Vuzdmi7dCuLH2Ot6vYV3FhwDcM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7omHQ035686
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:50:48 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:47 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqk047151;
        Thu, 19 Mar 2020 02:50:46 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 07/19] media: ti-vpe: cal: print errors on timeouts
Date:   Thu, 19 Mar 2020 09:50:11 +0200
Message-ID: <20200319075023.22151-8-tomi.valkeinen@ti.com>
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

The driver does not print any errors on ComplexIO reset timeout or when
waiting for stop-state, making it difficult to debug and notice
problems.

Add error prints for these cases.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 838215a3f230..b070c56f8d80 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -844,6 +844,11 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
 		(i >= 250) ? "(timeout)" : "");
 
+	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
+			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
+		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
+
 	/* 4. G. Wait for all enabled lane to reach stop state */
 	for (i = 0; i < 10; i++) {
 		if (reg_read_field(ctx->dev,
@@ -857,6 +862,9 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 		ctx->csi2_port,
 		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
 		(i >= 10) ? "(timeout)" : "");
+	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
+			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
+		ctx_err(ctx, "Timeout waiting for stop state\n");
 
 	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
 		(ctx->csi2_port - 1), reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

