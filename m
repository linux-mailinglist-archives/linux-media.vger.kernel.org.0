Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E6120A538
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 20:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406005AbgFYSu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 14:50:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39756 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390871AbgFYSu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 14:50:28 -0400
Received: from localhost.localdomain (p200300cb8737cf00e4140a231ed1025d.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e414:a23:1ed1:25d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 78C492A5742;
        Thu, 25 Jun 2020 19:50:26 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 2/4] media: staging: rkisp1: set "*_data_tbl" fields in rkisp1_cif_isp_lsc_config as 2D arries
Date:   Thu, 25 Jun 2020 20:50:15 +0200
Message-Id: <20200625185017.16493-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
References: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the fields '*_data_tbl' in the struct
'rkisp1_cif_isp_lsc_config' are one dimensional arries
of size 290. The entries are accessed in a nested
loop by summing two indexes for the rows and columns.
Therefore it fits better to define the arries as two
dimensional arries of size 17x17.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c  | 30 +++++++++----------
 drivers/staging/media/rkisp1/rkisp1-regs.h    |  1 -
 .../staging/media/rkisp1/uapi/rkisp1-config.h | 11 ++++---
 3 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 5169b02731f1..5be57426d940 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -206,47 +206,45 @@ rkisp1_lsc_correct_matrix_config(struct rkisp1_params *params,
 		     RKISP1_CIF_ISP_LSC_B_TABLE_ADDR);
 
 	/* program data tables (table size is 9 * 17 = 153) */
-	for (i = 0;
-	     i < RKISP1_CIF_ISP_LSC_SECTORS_MAX * RKISP1_CIF_ISP_LSC_SECTORS_MAX;
-	     i += RKISP1_CIF_ISP_LSC_SECTORS_MAX) {
+	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
 		/*
 		 * 17 sectors with 2 values in one DWORD = 9
 		 * DWORDs (2nd value of last DWORD unused)
 		 */
-		for (j = 0; j < RKISP1_CIF_ISP_LSC_SECTORS_MAX - 1; j += 2) {
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->r_data_tbl[i + j],
-							     pconfig->r_data_tbl[i + j + 1]);
+		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
+			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->r_data_tbl[i][j],
+							     pconfig->r_data_tbl[i][j + 1]);
 			rkisp1_write(params->rkisp1, data,
 				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
 
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gr_data_tbl[i + j],
-							     pconfig->gr_data_tbl[i + j + 1]);
+			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gr_data_tbl[i][j],
+							     pconfig->gr_data_tbl[i][j + 1]);
 			rkisp1_write(params->rkisp1, data,
 				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
 
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gb_data_tbl[i + j],
-							     pconfig->gb_data_tbl[i + j + 1]);
+			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gb_data_tbl[i][j],
+							     pconfig->gb_data_tbl[i][j + 1]);
 			rkisp1_write(params->rkisp1, data,
 				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
 
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->b_data_tbl[i + j],
-							     pconfig->b_data_tbl[i + j + 1]);
+			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->b_data_tbl[i][j],
+							     pconfig->b_data_tbl[i][j + 1]);
 			rkisp1_write(params->rkisp1, data,
 				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
 		}
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->r_data_tbl[i + j], 0);
+		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->r_data_tbl[i][j], 0);
 		rkisp1_write(params->rkisp1, data,
 			     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
 
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gr_data_tbl[i + j], 0);
+		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gr_data_tbl[i][j], 0);
 		rkisp1_write(params->rkisp1, data,
 			     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
 
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gb_data_tbl[i + j], 0);
+		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gb_data_tbl[i][j], 0);
 		rkisp1_write(params->rkisp1, data,
 			     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
 
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->b_data_tbl[i + j], 0);
+		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->b_data_tbl[i][j], 0);
 		rkisp1_write(params->rkisp1, data,
 			     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
 	}
diff --git a/drivers/staging/media/rkisp1/rkisp1-regs.h b/drivers/staging/media/rkisp1/rkisp1-regs.h
index 46018f435b6f..6667147149be 100644
--- a/drivers/staging/media/rkisp1/rkisp1-regs.h
+++ b/drivers/staging/media/rkisp1/rkisp1-regs.h
@@ -476,7 +476,6 @@
 #define RKISP1_CIF_ISP_LSC_SECT_SIZE_RESERVED		0xFC00FC00
 #define RKISP1_CIF_ISP_LSC_GRAD_RESERVED		0xF000F000
 #define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED		0xF000F000
-#define RKISP1_CIF_ISP_LSC_SECTORS_MAX			17
 #define RKISP1_CIF_ISP_LSC_TABLE_DATA(v0, v1)     \
 	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 12))
 #define RKISP1_CIF_ISP_LSC_SECT_SIZE(v0, v1)      \
diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index 7331bacf7dfd..d8a8e4457aa4 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -87,9 +87,8 @@
 /*
  * The following matches the tuning process,
  * not the max capabilities of the chip.
- * Last value unused.
  */
-#define	RKISP1_CIF_ISP_LSC_DATA_TBL_SIZE           290
+#define RKISP1_CIF_ISP_LSC_SAMPLES_MAX             17
 
 /*
  * Histogram calculation
@@ -275,10 +274,10 @@ struct rkisp1_cif_isp_sdg_config {
  * refer to REF_01 for details
  */
 struct rkisp1_cif_isp_lsc_config {
-	__u32 r_data_tbl[RKISP1_CIF_ISP_LSC_DATA_TBL_SIZE];
-	__u32 gr_data_tbl[RKISP1_CIF_ISP_LSC_DATA_TBL_SIZE];
-	__u32 gb_data_tbl[RKISP1_CIF_ISP_LSC_DATA_TBL_SIZE];
-	__u32 b_data_tbl[RKISP1_CIF_ISP_LSC_DATA_TBL_SIZE];
+	__u32 r_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
+	__u32 gr_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
+	__u32 gb_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
+	__u32 b_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
 
 	__u32 x_grad_tbl[RKISP1_CIF_ISP_LSC_GRAD_TBL_SIZE];
 	__u32 y_grad_tbl[RKISP1_CIF_ISP_LSC_GRAD_TBL_SIZE];
-- 
2.17.1

