Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A620D20A53A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 20:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406314AbgFYSu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 14:50:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39770 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390875AbgFYSu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 14:50:28 -0400
Received: from localhost.localdomain (p200300cb8737cf00e4140a231ed1025d.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e414:a23:1ed1:25d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E49F62A5753;
        Thu, 25 Jun 2020 19:50:26 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 3/4] media: staging: rkisp1: replace two identical macros with one
Date:   Thu, 25 Jun 2020 20:50:16 +0200
Message-Id: <20200625185017.16493-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
References: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The two macros RKISP1_CIF_ISP_LSC_{GRAD/SIZE}_TBL_SIZE have
the same value which is the number of sectors in the grads
and size parameters. Therefore there is no need for two
different macros. Replace them with one macro
RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE. Also use the macro
when iterating the arries instead of hardcoded '4'.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c      |  2 +-
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 5be57426d940..ea55532ab797 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -267,7 +267,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
 				RKISP1_CIF_ISP_LSC_CTRL_ENA);
 	rkisp1_lsc_correct_matrix_config(params, arg);
 
-	for (i = 0; i < 4; i++) {
+	for (i = 0; i < RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE / 2; i++) {
 		/* program x size tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_size_tbl[i * 2],
 						    arg->x_size_tbl[i * 2 + 1]);
diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index d8a8e4457aa4..bca2e805c0f5 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -82,8 +82,8 @@
 /*
  * Lens shade correction
  */
-#define RKISP1_CIF_ISP_LSC_GRAD_TBL_SIZE           8
-#define RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE           8
+#define RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE        8
+
 /*
  * The following matches the tuning process,
  * not the max capabilities of the chip.
@@ -279,11 +279,11 @@ struct rkisp1_cif_isp_lsc_config {
 	__u32 gb_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
 	__u32 b_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
 
-	__u32 x_grad_tbl[RKISP1_CIF_ISP_LSC_GRAD_TBL_SIZE];
-	__u32 y_grad_tbl[RKISP1_CIF_ISP_LSC_GRAD_TBL_SIZE];
+	__u32 x_grad_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
+	__u32 y_grad_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
 
-	__u32 x_size_tbl[RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE];
-	__u32 y_size_tbl[RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE];
+	__u32 x_size_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
+	__u32 y_size_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
 } __packed;
 
 /**
-- 
2.17.1

