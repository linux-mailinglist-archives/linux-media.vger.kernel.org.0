Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE212DC8C8
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633634AbfJRPdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:33:10 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40702 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410630AbfJRPcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWDSM002679;
        Fri, 18 Oct 2019 10:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412733;
        bh=F50/RQJNOxsnpe90vtLT83eiWsQ06kHCDvs+8O3qD8k=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QxUYLsLxGIGWjQZzSjm+XkKfEzDkjaDaBXY8X1L16m+RciRnKNnoX59SOuMwrNC9a
         LQqQ0biidUQCHn5z+opbxMkPElZvdJEWfcgYGPXSKpkIsrihwCRNFEXQfkKwrTsdk0
         K4qw8PIfBVASb6mEzI9ghX4gBBeneeMyON7v5IS8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFWDnw112849
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:13 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:05 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15N080266;
        Fri, 18 Oct 2019 10:32:13 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 09/19] media: ti-vpe: cal: Fix pixel processing parameters
Date:   Fri, 18 Oct 2019 10:34:27 -0500
Message-ID: <20191018153437.20614-10-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pixel processing unit was hard coded to only handle 8 bits per pixel
from input to output.

We now add handling for 10, 12 and 16 bits per pixel at the source and
setting the in-memory size (i.e. container size) to 16 bits for these 3
cases.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 41 ++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 5cc44c5b0ad8..3c293e263397 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -803,13 +803,48 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
 
 static void pix_proc_config(struct cal_ctx *ctx)
 {
-	u32 val;
+	u32 val, extract, pack;
+
+	switch (ctx->fmt->bpp) {
+	case 8:
+		extract = CAL_PIX_PROC_EXTRACT_B8;
+		pack = CAL_PIX_PROC_PACK_B8;
+		break;
+	case 10:
+		extract = CAL_PIX_PROC_EXTRACT_B10_MIPI;
+		pack = CAL_PIX_PROC_PACK_B16;
+		break;
+	case 12:
+		extract = CAL_PIX_PROC_EXTRACT_B12_MIPI;
+		pack = CAL_PIX_PROC_PACK_B16;
+		break;
+	case 16:
+		extract = CAL_PIX_PROC_EXTRACT_B16_LE;
+		pack = CAL_PIX_PROC_PACK_B16;
+		break;
+	default:
+		/*
+		 * If you see this warning then it means that you added
+		 * some new entry in the cal_formats[] array with a different
+		 * bit per pixel values then the one supported below.
+		 * Either add support for the new bpp value below or adjust
+		 * the new entry to use one of the value below.
+		 *
+		 * Instead of failing here just use 8 bpp as a default.
+		 */
+		dev_warn_once(&ctx->dev->pdev->dev,
+			      "%s:%d:%s: bpp:%d unsupported! Overwritten with 8.\n",
+			      __FILE__, __LINE__, __func__, ctx->fmt->bpp);
+		extract = CAL_PIX_PROC_EXTRACT_B8;
+		pack = CAL_PIX_PROC_PACK_B8;
+		break;
+	}
 
 	val = reg_read(ctx->dev, CAL_PIX_PROC(ctx->csi2_port));
-	set_field(&val, CAL_PIX_PROC_EXTRACT_B8, CAL_PIX_PROC_EXTRACT_MASK);
+	set_field(&val, extract, CAL_PIX_PROC_EXTRACT_MASK);
 	set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
 	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
-	set_field(&val, CAL_PIX_PROC_PACK_B8, CAL_PIX_PROC_PACK_MASK);
+	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
 	set_field(&val, ctx->csi2_port, CAL_PIX_PROC_CPORT_MASK);
 	set_field(&val, CAL_GEN_ENABLE, CAL_PIX_PROC_EN_MASK);
 	reg_write(ctx->dev, CAL_PIX_PROC(ctx->csi2_port), val);
-- 
2.17.1

