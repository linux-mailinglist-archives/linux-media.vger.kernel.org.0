Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A34D184616
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgCMLlt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:41:49 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48702 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgCMLlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:41:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfjeO123434;
        Fri, 13 Mar 2020 06:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099705;
        bh=yimsxmb11KsAN8TinOtJPb9i7ZSt2cVpWmOVh/qfbUg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Bp8J830aggWFtAL+BANv4Th04S1MCA1UEyKD4aVj804XWSTrTiwb2f0E8xcMwrlCy
         CIxHU4FXZiCFC5pXQYzHqDoaq5t6b3v1x/QkzXniU4ebG1rrrWPxVlmRHLlzojvPZz
         p+vRTpt5POtdUiSpZs0ZynZr+ZJpX02JJY9veq18=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBfj4h010626
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:41:45 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:45 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcom044014;
        Fri, 13 Mar 2020 06:41:44 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 04/16] media: ti-vpe: cal: print errors on timeouts
Date:   Fri, 13 Mar 2020 13:41:09 +0200
Message-ID: <20200313114121.32182-4-tomi.valkeinen@ti.com>
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

The driver does not print any errors on ComplexIO reset timeout or when
waiting for stop-state, making it difficult to debug and notice
problems.

Add error prints for these cases.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index f6ce0558752a..1499d443f414 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -842,6 +842,11 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
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
@@ -855,6 +860,9 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
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

