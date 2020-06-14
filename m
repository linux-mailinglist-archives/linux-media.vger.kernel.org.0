Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829B91F8BAD
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgFOABc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgFOAB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:29 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70E8F215D;
        Mon, 15 Jun 2020 02:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179242;
        bh=SSNXdeDeKCP4JLx9739v4fc03kW9ML6g9/gJbQ3/tf4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K1iQLUQ5VKUSIy0ha3NB3N2u1MCYBLH4ONP5RRaZ2IYsb7W6Flx8cQ+mgKztnGxkJ
         9BM+2uVjpeBCwJYmU/AtWcs7FULBGrTxnA6wummU/dnlO/QCL8L+cBbAvkXTzJ3Sfv
         bc9rPC3zagdJ5RNhVmMJpgd0DKFHQUfqjFmvmjnY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 070/107] media: ti-vpe: cal: Print revision and hwinfo in a more readable format
Date:   Mon, 15 Jun 2020 02:59:07 +0300
Message-Id: <20200614235944.17716-71-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 33a985300045..4a1f76b12130 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2331,21 +2331,36 @@ static const struct of_device_id cal_of_match[] = {
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
 
 static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
-- 
Regards,

Laurent Pinchart

