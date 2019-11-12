Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A95F9322
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbfKLOvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:51:32 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43700 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbfKLOv1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:51:27 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEot98052197;
        Tue, 12 Nov 2019 08:50:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570255;
        bh=fxkl6EobTAT1J+Cb0bAfjajLxzJGK5I9H/BGiUdtKHg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=l9FS/D06V9s7NWL7gxuKkTEeKXfHj3n56JoxHaopGmtX9USGc1oDX4nqH6hmHbLAb
         U82m4QT+2WVeEa1KwY05tpo2kKG44HSh9+ru6uzaDw4Gl8iXz3Ui58PCSS8+QG1gPj
         AdRwElrOT19TsXYxOhKcJ0/TV2iZUYS5VQMIoTUA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEot75058827
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:50:55 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:37 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokeu068428;
        Tue, 12 Nov 2019 08:50:54 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 10/20] media: ti-vpe: cal: Fix pixel processing parameters
Date:   Tue, 12 Nov 2019 08:53:37 -0600
Message-ID: <20191112145347.23519-11-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
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
index 51edc7bc3135..1b4a74f0d751 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -800,13 +800,48 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
 
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

