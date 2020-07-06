Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B2C215EB7
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbgGFSii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729980AbgGFSih (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8588E197C;
        Mon,  6 Jul 2020 20:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060694;
        bh=XYpHObCxH78AkEwfW2qPtnVqceHwh8+viOl727xpJIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kme43I8qywJrf8ZKatF6X5HYiEg4CVTybFRmbZugOg1zhi41NkW+Yb/w7+URPUPrw
         NwRTFqZKTHENdS5bmtFtxtK5Nat4sJ/zEHrK6g3AW6no8u/8OUlgxM++xhCyuTM5v9
         xjDcFz8x9aIY9iWzfffeQEHt4zgWtmCre86zvnns=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 071/108] media: ti-vpe: cal: Print revision and hwinfo in a more readable format
Date:   Mon,  6 Jul 2020 21:36:32 +0300
Message-Id: <20200706183709.12238-72-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print the hardware revision in the X.Y.R format, which is more readable
that the 32-bit hex value. For the hardware info register, only print
its value if it doesn't contain what we expect.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index fca591a94aca..ec52cb7f3039 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2342,21 +2342,36 @@ static const struct of_device_id cal_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, cal_of_match);
 
-/*
- * Get Revision and HW info
- */
+/* Get hardware revision and info. */
+
+#define CAL_HL_HWINFO_VALUE		0xa3c90469
+
 static void cal_get_hwinfo(struct cal_dev *cal)
 {
 	u32 revision;
 	u32 hwinfo;
 
 	revision = reg_read(cal, CAL_HL_REVISION);
-	cal_dbg(3, cal, "CAL_HL_REVISION = 0x%08x (expecting 0x40000200)\n",
-		revision);
+	switch (FIELD_GET(CAL_HL_REVISION_SCHEME_MASK, revision)) {
+	case CAL_HL_REVISION_SCHEME_H08:
+		cal_dbg(3, cal, "CAL HW revision %lu.%lu.%lu (0x%08x)\n",
+			FIELD_GET(CAL_HL_REVISION_MAJOR_MASK, revision),
+			FIELD_GET(CAL_HL_REVISION_MINOR_MASK, revision),
+			FIELD_GET(CAL_HL_REVISION_RTL_MASK, revision),
+			revision);
+		break;
+
+	case CAL_HL_REVISION_SCHEME_LEGACY:
+	default:
+		cal_info(cal, "Unexpected CAL HW revision 0x%08x\n",
+			 revision);
+		break;
+	}
 
 	hwinfo = reg_read(cal, CAL_HL_HWINFO);
-	cal_dbg(3, cal, "CAL_HL_HWINFO = 0x%08x (expecting 0xA3C90469)\n",
-		hwinfo);
+	if (hwinfo != CAL_HL_HWINFO_VALUE)
+		cal_info(cal, "CAL_HL_HWINFO = 0x%08x, expected 0x%08x\n",
+			 hwinfo, CAL_HL_HWINFO_VALUE);
 }
 
 static int cal_probe(struct platform_device *pdev)
-- 
Regards,

Laurent Pinchart

