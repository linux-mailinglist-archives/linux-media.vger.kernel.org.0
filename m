Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB2844E8E5
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbhKLOdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:33:10 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24737 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235334AbhKLOdE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727413; x=1668263413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kICjwcYgnlN/vC0Y/CALYqqZD73fHuSRwpC4LyuLypo=;
  b=S4x5tToHCgE+/2v6EJGPEYHPNq3J3duIO7tImVrU7JrMJRNBWxNeI5X7
   4wFnf1ysJiLEK4DmMQojO4esJcIJhlcIiiHKBZSqYJTJ5Cg43CBntHcje
   3fLMxHgV5Mlwj3IhdyjlYCf4MaQIm6KgrZzhABlZqFGY/nQ1Z0OoB/GKl
   XzwtaRrvbZz5rCuN3QLbjTbQeDN0YxB+HdzgjO3t8r+NCdVIkDZTt3+UB
   MUjLP9ciUxDzpMdTd80KHpDd42idP1+/6ZJJh7soDEDLxPfdKAZl+bCyQ
   3NwLWXU4mmYWSGXnKrlYtkYqy2A5x8wm4sXXHqcDudwhC5zvstnOdQFOO
   Q==;
IronPort-SDR: 5M2yRorfdZztsfLnbRi5nKiinPSu66QcXaoqj05dnOuMIBTB6wjws//sOtvY3pKPp/a3AW3hPl
 E/tnhQnaEL72asOY9ur5nwdyd1Lwf5px5XQyUGu2wO7RC0qgnBwHvUuAQaz1dfg/v0S63vOJk1
 tnPoCQ3Q6vGrLtyabhXFIlU9oc8hsjYkkw3V9a+UMWBmKyHJ+5xZ8Zv/PjrQLACYuZ6YYKQcZb
 rxfGneNSPIQphPDjidDDlZDpYSfOTDxW4gXWdlk9EoaaWsUWDdKd9AKKRCa7I+v4/aSJQcf74f
 baEXWFN3pnnuWMKUMpqHW+q2
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="76260969"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:30:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:30:12 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:30:04 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 20/25] media: atmel: atmel-isc-base: add wb debug messages
Date:   Fri, 12 Nov 2021 16:25:04 +0200
Message-ID: <20211112142509.2230884-21-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add debug messages that make it easier to debug white balance algorithm.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 53cac1aac0fd..f1f1019f9d82 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1329,10 +1329,15 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 
 	if (!*min)
 		*min = 1;
+
+	v4l2_dbg(1, debug, &isc->v4l2_dev,
+		 "isc wb: hist_id %u, hist_count %u",
+		 ctrls->hist_id, *hist_count);
 }
 
 static void isc_wb_update(struct isc_ctrls *ctrls)
 {
+	struct isc_device *isc = container_of(ctrls, struct isc_device, ctrls);
 	u32 *hist_count = &ctrls->hist_count[0];
 	u32 c, offset[4];
 	u64 avg = 0;
@@ -1349,6 +1354,9 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		(u64)hist_count[ISC_HIS_CFG_MODE_GB];
 	avg >>= 1;
 
+	v4l2_dbg(1, debug, &isc->v4l2_dev,
+		 "isc wb: green components average %llu\n", avg);
+
 	/* Green histogram is null, nothing to do */
 	if (!avg)
 		return;
@@ -1401,9 +1409,15 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		else
 			gw_gain[c] = 1 << 9;
 
+		v4l2_dbg(1, debug, &isc->v4l2_dev,
+			 "isc wb: component %d, s_gain %u, gw_gain %u\n",
+			 c, s_gain[c], gw_gain[c]);
 		/* multiply both gains and adjust for decimals */
 		ctrls->gain[c] = s_gain[c] * gw_gain[c];
 		ctrls->gain[c] >>= 9;
+		v4l2_dbg(1, debug, &isc->v4l2_dev,
+			 "isc wb: component %d, final gain %u\n",
+			 c, ctrls->gain[c]);
 	}
 }
 
@@ -1423,6 +1437,10 @@ static void isc_awb_work(struct work_struct *w)
 		return;
 
 	isc_hist_count(isc, &min, &max);
+
+	v4l2_dbg(1, debug, &isc->v4l2_dev,
+		 "isc wb mode %d: hist min %u , max %u\n", hist_id, min, max);
+
 	ctrls->hist_minmax[hist_id][HIST_MIN_INDEX] = min;
 	ctrls->hist_minmax[hist_id][HIST_MAX_INDEX] = max;
 
-- 
2.25.1

