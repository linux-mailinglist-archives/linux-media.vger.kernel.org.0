Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5DFE59675B
	for <lists+linux-media@lfdr.de>; Wed, 17 Aug 2022 04:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238123AbiHQCTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 22:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237611AbiHQCTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 22:19:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1584876BB
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 19:19:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2270E49C;
        Wed, 17 Aug 2022 04:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660702746;
        bh=UgBFpceUKYINrF0hnK0qCTKp04e7QXz354ww3hAKJV4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wUbs5oONblMC/bO+XYB9ilSSUE0/KzX6EEJQcqBOTQA9DO6HBFFE6KkIlm42KGVQm
         rl2W/4rkhyF/E2KBkaOUEzS9Jbkn89A0QzIT6HO5v8bEFG7H8puZAPlPBqyLrDT+ws
         SWMAof9Bzoz7bNJ7CswbZZYXHrtXGyYFcMAFDuwI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: [PATCH 1/5] media: rkisp1: Clean up LSC configuration code
Date:   Wed, 17 Aug 2022 05:18:46 +0300
Message-Id: <20220817021850.20460-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clean up the LSC configuration code to improve its readability by
shortening lines, using extra local variables and renaming long
variables. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 199 ++++++++----------
 1 file changed, 86 insertions(+), 113 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 246a6faa1fc1..fbbaf5505291 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -198,149 +198,129 @@ static void
 rkisp1_lsc_matrix_config_v10(struct rkisp1_params *params,
 			     const struct rkisp1_cif_isp_lsc_config *pconfig)
 {
-	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
+	struct rkisp1_device *rkisp1 = params->rkisp1;
+	unsigned int lsc_status, sram_addr, lsc_table_sel, i, j;
 
-	isp_lsc_status = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
+	lsc_status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
 
 	/* RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153 = ( 17 * 18 ) >> 1 */
-	sram_addr = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
+	sram_addr = lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE ?
 		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
 		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
 
 	/* program data tables (table size is 9 * 17 = 153) */
 	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
+		const __u16 *r_tbl = pconfig->r_data_tbl[i];
+		const __u16 *gr_tbl = pconfig->gr_data_tbl[i];
+		const __u16 *gb_tbl = pconfig->gb_data_tbl[i];
+		const __u16 *b_tbl = pconfig->b_data_tbl[i];
+
 		/*
 		 * 17 sectors with 2 values in one DWORD = 9
 		 * DWORDs (2nd value of last DWORD unused)
 		 */
 		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j],
-								 pconfig->r_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA, data);
-
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j],
-								 pconfig->gr_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA, data);
-
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j],
-								 pconfig->gb_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA, data);
-
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j],
-								 pconfig->b_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA, data);
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(
+					r_tbl[j], r_tbl[j + 1]));
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(
+					gr_tbl[j], gr_tbl[j + 1]));
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(
+					gb_tbl[j], gb_tbl[j + 1]));
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(
+					b_tbl[j], b_tbl[j + 1]));
 		}
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
-			     data);
 
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
-			     data);
-
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
-			     data);
-
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
-			     data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(r_tbl[j], 0));
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(gr_tbl[j], 0));
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(gb_tbl[j], 0));
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(b_tbl[j], 0));
 	}
-	isp_lsc_table_sel = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
-			    RKISP1_CIF_ISP_LSC_TABLE_0 :
-			    RKISP1_CIF_ISP_LSC_TABLE_1;
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL,
-		     isp_lsc_table_sel);
+
+	lsc_table_sel = lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE ?
+			RKISP1_CIF_ISP_LSC_TABLE_0 : RKISP1_CIF_ISP_LSC_TABLE_1;
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL, lsc_table_sel);
 }
 
 static void
 rkisp1_lsc_matrix_config_v12(struct rkisp1_params *params,
 			     const struct rkisp1_cif_isp_lsc_config *pconfig)
 {
-	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
+	struct rkisp1_device *rkisp1 = params->rkisp1;
+	unsigned int lsc_status, sram_addr, lsc_table_sel, i, j;
 
-	isp_lsc_status = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
+	lsc_status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
 
 	/* RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153 = ( 17 * 18 ) >> 1 */
-	sram_addr = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
-		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
-		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
+	sram_addr = lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE ?
+		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
+		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
 
 	/* program data tables (table size is 9 * 17 = 153) */
 	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
+		const __u16 *r_tbl = pconfig->r_data_tbl[i];
+		const __u16 *gr_tbl = pconfig->gr_data_tbl[i];
+		const __u16 *gb_tbl = pconfig->gb_data_tbl[i];
+		const __u16 *b_tbl = pconfig->b_data_tbl[i];
+
 		/*
 		 * 17 sectors with 2 values in one DWORD = 9
 		 * DWORDs (2nd value of last DWORD unused)
 		 */
 		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
-					pconfig->r_data_tbl[i][j],
-					pconfig->r_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA, data);
-
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
-					pconfig->gr_data_tbl[i][j],
-					pconfig->gr_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA, data);
-
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
-					pconfig->gb_data_tbl[i][j],
-					pconfig->gb_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA, data);
-
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
-					pconfig->b_data_tbl[i][j],
-					pconfig->b_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA, data);
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
+					r_tbl[j], r_tbl[j + 1]));
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
+					gr_tbl[j], gr_tbl[j + 1]));
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
+					gb_tbl[j], gb_tbl[j + 1]));
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
+					b_tbl[j], b_tbl[j + 1]));
 		}
 
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->r_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
-			     data);
-
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gr_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
-			     data);
-
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gb_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
-			     data);
-
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->b_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
-			     data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(r_tbl[j], 0));
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(gr_tbl[j], 0));
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(gb_tbl[j], 0));
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(b_tbl[j], 0));
 	}
-	isp_lsc_table_sel = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
-			    RKISP1_CIF_ISP_LSC_TABLE_0 :
-			    RKISP1_CIF_ISP_LSC_TABLE_1;
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL,
-		     isp_lsc_table_sel);
+
+	lsc_table_sel = lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE ?
+			RKISP1_CIF_ISP_LSC_TABLE_0 : RKISP1_CIF_ISP_LSC_TABLE_1;
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL, lsc_table_sel);
 }
 
 static void rkisp1_lsc_config(struct rkisp1_params *params,
 			      const struct rkisp1_cif_isp_lsc_config *arg)
 {
+	struct rkisp1_device *rkisp1 = params->rkisp1;
 	unsigned int i, data;
 	u32 lsc_ctrl;
 
 	/* To config must be off , store the current status firstly */
-	lsc_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_CTRL);
+	lsc_ctrl = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_CTRL);
 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
 				RKISP1_CIF_ISP_LSC_CTRL_ENA);
 	params->ops->lsc_matrix_config(params, arg);
@@ -349,38 +329,31 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
 		/* program x size tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_size_tbl[i * 2],
 						    arg->x_size_tbl[i * 2 + 1]);
-		rkisp1_write(params->rkisp1,
-			     RKISP1_CIF_ISP_LSC_XSIZE_01 + i * 4, data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE_01 + i * 4, data);
 
 		/* program x grad tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_grad_tbl[i * 2],
 						    arg->x_grad_tbl[i * 2 + 1]);
-		rkisp1_write(params->rkisp1,
-			     RKISP1_CIF_ISP_LSC_XGRAD_01 + i * 4, data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD_01 + i * 4, data);
 
 		/* program y size tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_size_tbl[i * 2],
 						    arg->y_size_tbl[i * 2 + 1]);
-		rkisp1_write(params->rkisp1,
-			     RKISP1_CIF_ISP_LSC_YSIZE_01 + i * 4, data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE_01 + i * 4, data);
 
 		/* program y grad tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_grad_tbl[i * 2],
 						    arg->y_grad_tbl[i * 2 + 1]);
-		rkisp1_write(params->rkisp1,
-			     RKISP1_CIF_ISP_LSC_YGRAD_01 + i * 4, data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD_01 + i * 4, data);
 	}
 
 	/* restore the lsc ctrl status */
-	if (lsc_ctrl & RKISP1_CIF_ISP_LSC_CTRL_ENA) {
-		rkisp1_param_set_bits(params,
-				      RKISP1_CIF_ISP_LSC_CTRL,
+	if (lsc_ctrl & RKISP1_CIF_ISP_LSC_CTRL_ENA)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
 				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
-	} else {
-		rkisp1_param_clear_bits(params,
-					RKISP1_CIF_ISP_LSC_CTRL,
+	else
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
 					RKISP1_CIF_ISP_LSC_CTRL_ENA);
-	}
 }
 
 /* ISP Filtering function */
-- 
Regards,

Laurent Pinchart

