Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54366217545
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 19:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgGGRec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 13:34:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35264 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbgGGReb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 13:34:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D83D52A077A
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH] media: staging: rkisp1: comment each define (RKISP1_CIF_ISP_MODULE_*), explaining what the abbreviation means
Date:   Tue,  7 Jul 2020 19:34:13 +0200
Message-Id: <20200707173413.13977-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add one line comment before each module
define 'RKISP1_CIF_ISP_MODULE_*' explaining what the
abbreviation means.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../staging/media/rkisp1/uapi/rkisp1-config.h  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index 57f5035d62a4..b2923b2833d3 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -18,23 +18,41 @@
 #define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
 
+/* Defect Pixel Cluster Detection */
 #define RKISP1_CIF_ISP_MODULE_DPCC		BIT(0)
+/* Black Level Subtraction */
 #define RKISP1_CIF_ISP_MODULE_BLS		BIT(1)
+/* Sensor De-gamma */
 #define RKISP1_CIF_ISP_MODULE_SDG		BIT(2)
+/* Histogram */
 #define RKISP1_CIF_ISP_MODULE_HST		BIT(3)
+/* Lens Shade Control */
 #define RKISP1_CIF_ISP_MODULE_LSC		BIT(4)
+/* Auto White Balance Gain */
 #define RKISP1_CIF_ISP_MODULE_AWB_GAIN		BIT(5)
+/* Filter */
 #define RKISP1_CIF_ISP_MODULE_FLT		BIT(6)
+/* Bayer Demosaic */
 #define RKISP1_CIF_ISP_MODULE_BDM		BIT(7)
+/* Cross Talk */
 #define RKISP1_CIF_ISP_MODULE_CTK		BIT(8)
+/* Gamma Out Curve */
 #define RKISP1_CIF_ISP_MODULE_GOC		BIT(9)
+/* Color Processing */
 #define RKISP1_CIF_ISP_MODULE_CPROC		BIT(10)
+/* Auto Focus Control */
 #define RKISP1_CIF_ISP_MODULE_AFC		BIT(11)
+/* Auto White Balancing */
 #define RKISP1_CIF_ISP_MODULE_AWB		BIT(12)
+/* Image Effect */
 #define RKISP1_CIF_ISP_MODULE_IE		BIT(13)
+/* Auto Exposure Control */
 #define RKISP1_CIF_ISP_MODULE_AEC		BIT(14)
+/* Wide Dynamic Range */
 #define RKISP1_CIF_ISP_MODULE_WDR		BIT(15)
+/* Denoise Pre-Filter */
 #define RKISP1_CIF_ISP_MODULE_DPF		BIT(16)
+/* Denoise Pre-Filter Strength */
 #define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	BIT(17)
 
 #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
-- 
2.17.1

