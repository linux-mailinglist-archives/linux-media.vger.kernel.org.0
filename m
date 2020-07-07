Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE03E2174BE
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 19:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgGGRI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 13:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgGGRI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 13:08:57 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED221C08C5DC
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 10:08:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 72AD22A236F
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 1/2] media: staging: rkisp1: replace 9 coeff* fields with a 3x3 array
Date:   Tue,  7 Jul 2020 19:08:44 +0200
Message-Id: <20200707170845.28845-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707170845.28845-1-dafna.hirschfeld@collabora.com>
References: <20200707170845.28845-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct rkisp1_cif_isp_ctk_config has 9 fields 'coeff*' for the
3x3 color correction matrix. Replace these fields with one 3x3
array coeff[3][3] and document the field.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c      | 15 ++++++---------
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 14 ++++----------
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 797e79de659c..00b102eb67b6 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -402,15 +402,12 @@ static void rkisp1_goc_config(struct rkisp1_params *params,
 static void rkisp1_ctk_config(struct rkisp1_params *params,
 			      const struct rkisp1_cif_isp_ctk_config *arg)
 {
-	rkisp1_write(params->rkisp1, arg->coeff0, RKISP1_CIF_ISP_CT_COEFF_0);
-	rkisp1_write(params->rkisp1, arg->coeff1, RKISP1_CIF_ISP_CT_COEFF_1);
-	rkisp1_write(params->rkisp1, arg->coeff2, RKISP1_CIF_ISP_CT_COEFF_2);
-	rkisp1_write(params->rkisp1, arg->coeff3, RKISP1_CIF_ISP_CT_COEFF_3);
-	rkisp1_write(params->rkisp1, arg->coeff4, RKISP1_CIF_ISP_CT_COEFF_4);
-	rkisp1_write(params->rkisp1, arg->coeff5, RKISP1_CIF_ISP_CT_COEFF_5);
-	rkisp1_write(params->rkisp1, arg->coeff6, RKISP1_CIF_ISP_CT_COEFF_6);
-	rkisp1_write(params->rkisp1, arg->coeff7, RKISP1_CIF_ISP_CT_COEFF_7);
-	rkisp1_write(params->rkisp1, arg->coeff8, RKISP1_CIF_ISP_CT_COEFF_8);
+	unsigned int i, j, k = 0;
+
+	for (i = 0; i < 3; i++)
+		for (j = 0; j < 3; j++)
+			rkisp1_write(params->rkisp1, arg->coeff[i][j],
+				     RKISP1_CIF_ISP_CT_COEFF_0 + 4 * k++);
 	rkisp1_write(params->rkisp1, arg->ct_offset_r,
 		     RKISP1_CIF_ISP_CT_OFFSET_R);
 	rkisp1_write(params->rkisp1, arg->ct_offset_g,
diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index ca0d031b14ac..a01711a668da 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -417,19 +417,13 @@ struct rkisp1_cif_isp_bdm_config {
 /**
  * struct rkisp1_cif_isp_ctk_config - Configuration used by Cross Talk correction
  *
- * @coeff: color correction matrix
+ * @coeff: color correction matrix. Values are 11-bit signed fixed-point numbers with 4 bit integer
+ *		and 7 bit fractional part, ranging from -8 (0x400) to +7.992 (0x3FF). 0 is
+ *		represented by 0x000 and a coefficient value of 1 as 0x080.
  * @ct_offset_b: offset for the crosstalk correction matrix
  */
 struct rkisp1_cif_isp_ctk_config {
-	__u16 coeff0;
-	__u16 coeff1;
-	__u16 coeff2;
-	__u16 coeff3;
-	__u16 coeff4;
-	__u16 coeff5;
-	__u16 coeff6;
-	__u16 coeff7;
-	__u16 coeff8;
+	__u16 coeff[3][3];
 	__u16 ct_offset_r;
 	__u16 ct_offset_g;
 	__u16 ct_offset_b;
-- 
2.17.1

