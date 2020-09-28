Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9D927B6C9
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 23:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgI1VDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 17:03:19 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:42649 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgI1VDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 17:03:19 -0400
X-Halon-ID: 020c362d-01ce-11eb-99bd-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 020c362d-01ce-11eb-99bd-005056917a89;
        Mon, 28 Sep 2020 23:03:14 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH v2] staging: rkisp1: uapi: Do not use BIT() macro
Date:   Mon, 28 Sep 2020 23:02:50 +0200
Message-Id: <20200928210250.4085465-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The BIT() macro is not available to uAPI headers, replace the few usages
of it by open coding it.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Acked-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
* Changes since v1
- Use (1U << N) instead of (1 << N) as suggested by Kieran.
---
 .../staging/media/rkisp1/uapi/rkisp1-config.h | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index f202182349b4040f..432cb6be55b4706f 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -14,41 +14,41 @@
 #define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
 
 /* Defect Pixel Cluster Detection */
-#define RKISP1_CIF_ISP_MODULE_DPCC		BIT(0)
+#define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
 /* Black Level Subtraction */
-#define RKISP1_CIF_ISP_MODULE_BLS		BIT(1)
+#define RKISP1_CIF_ISP_MODULE_BLS		(1U << 1)
 /* Sensor De-gamma */
-#define RKISP1_CIF_ISP_MODULE_SDG		BIT(2)
+#define RKISP1_CIF_ISP_MODULE_SDG		(1U << 2)
 /* Histogram */
-#define RKISP1_CIF_ISP_MODULE_HST		BIT(3)
+#define RKISP1_CIF_ISP_MODULE_HST		(1U << 3)
 /* Lens Shade Control */
-#define RKISP1_CIF_ISP_MODULE_LSC		BIT(4)
+#define RKISP1_CIF_ISP_MODULE_LSC		(1U << 4)
 /* Auto White Balance Gain */
-#define RKISP1_CIF_ISP_MODULE_AWB_GAIN		BIT(5)
+#define RKISP1_CIF_ISP_MODULE_AWB_GAIN		(1U << 5)
 /* Filter */
-#define RKISP1_CIF_ISP_MODULE_FLT		BIT(6)
+#define RKISP1_CIF_ISP_MODULE_FLT		(1U << 6)
 /* Bayer Demosaic */
-#define RKISP1_CIF_ISP_MODULE_BDM		BIT(7)
+#define RKISP1_CIF_ISP_MODULE_BDM		(1U << 7)
 /* Cross Talk */
-#define RKISP1_CIF_ISP_MODULE_CTK		BIT(8)
+#define RKISP1_CIF_ISP_MODULE_CTK		(1U << 8)
 /* Gamma Out Curve */
-#define RKISP1_CIF_ISP_MODULE_GOC		BIT(9)
+#define RKISP1_CIF_ISP_MODULE_GOC		(1U << 9)
 /* Color Processing */
-#define RKISP1_CIF_ISP_MODULE_CPROC		BIT(10)
+#define RKISP1_CIF_ISP_MODULE_CPROC		(1U << 10)
 /* Auto Focus Control */
-#define RKISP1_CIF_ISP_MODULE_AFC		BIT(11)
+#define RKISP1_CIF_ISP_MODULE_AFC		(1U << 11)
 /* Auto White Balancing */
-#define RKISP1_CIF_ISP_MODULE_AWB		BIT(12)
+#define RKISP1_CIF_ISP_MODULE_AWB		(1U << 12)
 /* Image Effect */
-#define RKISP1_CIF_ISP_MODULE_IE		BIT(13)
+#define RKISP1_CIF_ISP_MODULE_IE		(1U << 13)
 /* Auto Exposure Control */
-#define RKISP1_CIF_ISP_MODULE_AEC		BIT(14)
+#define RKISP1_CIF_ISP_MODULE_AEC		(1U << 14)
 /* Wide Dynamic Range */
-#define RKISP1_CIF_ISP_MODULE_WDR		BIT(15)
+#define RKISP1_CIF_ISP_MODULE_WDR		(1U << 15)
 /* Denoise Pre-Filter */
-#define RKISP1_CIF_ISP_MODULE_DPF		BIT(16)
+#define RKISP1_CIF_ISP_MODULE_DPF		(1U << 16)
 /* Denoise Pre-Filter Strength */
-#define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	BIT(17)
+#define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	(1U << 17)
 
 #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
 #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
@@ -123,10 +123,10 @@
 /*
  * Measurement types
  */
-#define RKISP1_CIF_ISP_STAT_AWB           BIT(0)
-#define RKISP1_CIF_ISP_STAT_AUTOEXP       BIT(1)
-#define RKISP1_CIF_ISP_STAT_AFM           BIT(2)
-#define RKISP1_CIF_ISP_STAT_HIST          BIT(3)
+#define RKISP1_CIF_ISP_STAT_AWB           (1U << 0)
+#define RKISP1_CIF_ISP_STAT_AUTOEXP       (1U << 1)
+#define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
+#define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
 
 enum rkisp1_cif_isp_histogram_mode {
 	RKISP1_CIF_ISP_HISTOGRAM_MODE_DISABLE,
-- 
2.28.0

