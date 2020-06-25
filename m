Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC5320A539
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 20:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406321AbgFYSu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 14:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405858AbgFYSu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 14:50:29 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0462C08C5C1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 11:50:28 -0700 (PDT)
Received: from localhost.localdomain (p200300cb8737cf00e4140a231ed1025d.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e414:a23:1ed1:25d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5A90B2A5797;
        Thu, 25 Jun 2020 19:50:27 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 4/4] media: staging: rkisp1: change type of fields in 'rkisp1_cif_isp_lsc_config' from u32 to u16
Date:   Thu, 25 Jun 2020 20:50:17 +0200
Message-Id: <20200625185017.16493-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
References: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fields in struct 'rkisp1_cif_isp_lsc_config' need to hold
values of 12 bits, therefore it is enough to declare them as u16.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../staging/media/rkisp1/uapi/rkisp1-config.h    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index bca2e805c0f5..c032c8403f17 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -274,16 +274,16 @@ struct rkisp1_cif_isp_sdg_config {
  * refer to REF_01 for details
  */
 struct rkisp1_cif_isp_lsc_config {
-	__u32 r_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
-	__u32 gr_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
-	__u32 gb_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
-	__u32 b_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
+	__u16 r_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
+	__u16 gr_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
+	__u16 gb_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
+	__u16 b_data_tbl[RKISP1_CIF_ISP_LSC_SAMPLES_MAX][RKISP1_CIF_ISP_LSC_SAMPLES_MAX];
 
-	__u32 x_grad_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
-	__u32 y_grad_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
+	__u16 x_grad_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
+	__u16 y_grad_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
 
-	__u32 x_size_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
-	__u32 y_size_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
+	__u16 x_size_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
+	__u16 y_size_tbl[RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE];
 } __packed;
 
 /**
-- 
2.17.1

