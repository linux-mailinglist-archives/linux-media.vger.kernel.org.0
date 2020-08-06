Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D469923DDD5
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbgHFRPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbgHFRFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:05:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B673C061290
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 04:55:47 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 02181299454
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, tfiga@chromium.org
Subject: [PATCH v2 2/4] media: staging: rkisp1: replace 3 fields 'ct_offset_*' with one array
Date:   Thu,  6 Aug 2020 13:50:31 +0200
Message-Id: <20200806115033.32475-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806115033.32475-1-dafna.hirschfeld@collabora.com>
References: <20200806115033.32475-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct rkisp1_cif_isp_ctk_config contains 3 fields
ct_offset_{rgb}. Replace them with one array field 'ct_offset[3].

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c      | 9 +++------
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 6 ++----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 00b102eb67b6..8596ad87a860 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -408,12 +408,9 @@ static void rkisp1_ctk_config(struct rkisp1_params *params,
 		for (j = 0; j < 3; j++)
 			rkisp1_write(params->rkisp1, arg->coeff[i][j],
 				     RKISP1_CIF_ISP_CT_COEFF_0 + 4 * k++);
-	rkisp1_write(params->rkisp1, arg->ct_offset_r,
-		     RKISP1_CIF_ISP_CT_OFFSET_R);
-	rkisp1_write(params->rkisp1, arg->ct_offset_g,
-		     RKISP1_CIF_ISP_CT_OFFSET_G);
-	rkisp1_write(params->rkisp1, arg->ct_offset_b,
-		     RKISP1_CIF_ISP_CT_OFFSET_B);
+	for (i = 0; i < 3; i++)
+		rkisp1_write(params->rkisp1, arg->ct_offset[i],
+			     RKISP1_CIF_ISP_CT_OFFSET_R + i * 4);
 }
 
 static void rkisp1_ctk_enable(struct rkisp1_params *params, bool en)
diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index 790d56ac9310..e89ec359b537 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -420,13 +420,11 @@ struct rkisp1_cif_isp_bdm_config {
  * @coeff: color correction matrix. Values are 11-bit signed fixed-point numbers with 4 bit integer
  *		and 7 bit fractional part, ranging from -8 (0x400) to +7.992 (0x3FF). 0 is
  *		represented by 0x000 and a coefficient value of 1 as 0x080.
- * @ct_offset_b: offset for the crosstalk correction matrix
+ * @ct_offset: Red, Green, Blue offsets for the crosstalk correction matrix
  */
 struct rkisp1_cif_isp_ctk_config {
 	__u16 coeff[3][3];
-	__u16 ct_offset_r;
-	__u16 ct_offset_g;
-	__u16 ct_offset_b;
+	__u16 ct_offset[3];
 } __packed;
 
 enum rkisp1_cif_isp_goc_mode {
-- 
2.17.1

