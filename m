Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEBB345AAF
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 10:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhCWJWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 05:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhCWJWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 05:22:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B8EC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 02:22:21 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:84b5:fd36:ff26:2fc6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1D9B31F453F1;
        Tue, 23 Mar 2021 09:22:19 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com, tfiga@chromium.org
Subject: [PATCH] media: rkisp1: uapi: document which flags/structs relate to statistics config
Date:   Tue, 23 Mar 2021 10:22:11 +0100
Message-Id: <20210323092211.19230-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a documentation to tell which flags and structs are
used to configure the statistics.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 include/uapi/linux/rkisp1-config.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 36e3efb81b01..8d1f8bd192fc 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -15,7 +15,7 @@
 #define RKISP1_CIF_ISP_MODULE_BLS		(1U << 1)
 /* Sensor De-gamma */
 #define RKISP1_CIF_ISP_MODULE_SDG		(1U << 2)
-/* Histogram */
+/* Histogram statistics configuration */
 #define RKISP1_CIF_ISP_MODULE_HST		(1U << 3)
 /* Lens Shade Control */
 #define RKISP1_CIF_ISP_MODULE_LSC		(1U << 4)
@@ -31,13 +31,13 @@
 #define RKISP1_CIF_ISP_MODULE_GOC		(1U << 9)
 /* Color Processing */
 #define RKISP1_CIF_ISP_MODULE_CPROC		(1U << 10)
-/* Auto Focus Control */
+/* Auto Focus Control statistics configuration */
 #define RKISP1_CIF_ISP_MODULE_AFC		(1U << 11)
-/* Auto White Balancing */
+/* Auto White Balancing statistics configuration */
 #define RKISP1_CIF_ISP_MODULE_AWB		(1U << 12)
 /* Image Effect */
 #define RKISP1_CIF_ISP_MODULE_IE		(1U << 13)
-/* Auto Exposure Control */
+/* Auto Exposure Control statistics Configuration */
 #define RKISP1_CIF_ISP_MODULE_AEC		(1U << 14)
 /* Wide Dynamic Range */
 #define RKISP1_CIF_ISP_MODULE_WDR		(1U << 15)
@@ -411,7 +411,7 @@ struct rkisp1_cif_isp_cproc_config {
 };
 
 /**
- * struct rkisp1_cif_isp_awb_meas_config - Configuration used by auto white balance
+ * struct rkisp1_cif_isp_awb_meas_config - Configuration for the AWB statistics
  *
  * @awb_mode: the awb meas mode. From enum rkisp1_cif_isp_awb_mode_type.
  * @awb_wnd: white balance measurement window (in pixels)
@@ -550,7 +550,7 @@ struct rkisp1_cif_isp_goc_config {
 };
 
 /**
- * struct rkisp1_cif_isp_hst_config - Configuration used by Histogram
+ * struct rkisp1_cif_isp_hst_config - Configuration for Histogram statistics
  *
  * @mode: histogram mode (from enum rkisp1_cif_isp_histogram_mode)
  * @histogram_predivider: process every stepsize pixel, all other pixels are
@@ -575,7 +575,7 @@ struct rkisp1_cif_isp_hst_config {
 };
 
 /**
- * struct rkisp1_cif_isp_aec_config - Configuration used by Auto Exposure Control
+ * struct rkisp1_cif_isp_aec_config - Configuration for Auto Exposure statistics
  *
  * @mode: Exposure measure mode (from enum rkisp1_cif_isp_exp_meas_mode)
  * @autostop: stop mode (from enum rkisp1_cif_isp_exp_ctrl_autostop)
@@ -588,7 +588,7 @@ struct rkisp1_cif_isp_aec_config {
 };
 
 /**
- * struct rkisp1_cif_isp_afc_config - Configuration used by Auto Focus Control
+ * struct rkisp1_cif_isp_afc_config - Configuration for the Auto Focus statistics
  *
  * @num_afm_win: max RKISP1_CIF_ISP_AFM_MAX_WINDOWS
  * @afm_win: coordinates of the meas window
-- 
2.17.1

