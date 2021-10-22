Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57DD437356
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhJVH5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:57:35 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:17446 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232585AbhJVH5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889299; x=1666425299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nWSLtOBP89ZKPr7pkblnuPZXTqOXvF6+GrCCZxMsTgs=;
  b=r11jyMlmtUEOkkLKg0fWbYqfiTLkCFmyuuvkqMegDErOUAS6Uriij+76
   HkEYl7jF80npS79fGDOr5hCrIWWWFrHDp1X07Rtlc6S76623UE+ky2uz1
   Uf1jrMnHjLb9guTSGo62CbItDVqPXovb5Cxo5yN5XdZAqjT0dU3J+uJEv
   3F1DzxcJo0Rjwvkoazo5uJjWBqlqDavjia/CahL2Y84Z/EqJDhXf6l75m
   ir2PSIyo8hReYyqoAahd5PRYuxtbBsTuS+yOuNVYPbNNjZN8sb2Cd2gqx
   ZyasgKLJ2tkMYBYk11kBZYs2mM/irMfCfs8V/z44HdzNZTeCqMXwORAlS
   A==;
IronPort-SDR: E1PSMpB5xUajAd7LRMEcZlOJKma4QnDaxhDfmJMIQabvI5OzcR2lR9N0Jl1GNHlsIvphgLV2bp
 7THor6gDVyfhR6QwPVjOOMrp8n+O7+CCneB5A4U56RJl04Vns4fnDGHyUsNudqJqx/kb8sHfl1
 kWAskcDrDiPvESxTfaRBVsD1gYVN4re3w1HV+m4RoK0W+SI0JxWWmGRTnpsJ3IUbZNtMFP3ZFY
 4Zb8GVFMm2IMzxqUZzMFQ7LewSatm0UpQ/zFFQCcTvhP/Q1cIPm1Ml4yN9FDMj9GKBn3D7Z9TN
 1GxxVsI2KbPfq4OqzN0DK48g
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="136538157"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:58 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:54 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 20/21] media: atmel: atmel-isc-base: add wb debug messages
Date:   Fri, 22 Oct 2021 10:52:46 +0300
Message-ID: <20211022075247.518880-21-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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
index 7ebe0a2d130f..071ac5eec7ec 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1330,10 +1330,15 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 
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
@@ -1350,6 +1355,9 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		(u64)hist_count[ISC_HIS_CFG_MODE_GB];
 	avg >>= 1;
 
+	v4l2_dbg(1, debug, &isc->v4l2_dev,
+		 "isc wb: green components average %llu\n", avg);
+
 	/* Green histogram is null, nothing to do */
 	if (!avg)
 		return;
@@ -1402,9 +1410,15 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
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
 
@@ -1424,6 +1438,10 @@ static void isc_awb_work(struct work_struct *w)
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

