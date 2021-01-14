Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D53A2F6EFF
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 00:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730942AbhANXex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 18:34:53 -0500
Received: from gloria.sntech.de ([185.11.138.130]:53498 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730755AbhANXew (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 18:34:52 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.sntech)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l0C81-0001lf-Ul; Fri, 15 Jan 2021 00:34:09 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, heiko@sntech.de,
        tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v2 2/2] media: rockchip: rkisp1: extend uapi array sizes
Date:   Fri, 15 Jan 2021 00:33:42 +0100
Message-Id: <20210114233345.160223-3-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114233345.160223-1-heiko@sntech.de>
References: <20210114233345.160223-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Later variants of the rkisp1 block use more entries in some arrays:

RKISP1_CIF_ISP_AE_MEAN_MAX                 25 -> 81
RKISP1_CIF_ISP_HIST_BIN_N_MAX              16 -> 32
RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17 -> 34
RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28 -> 81

and we can still extend the uapi during the 5.11-rc cycle, so do that
now to be on the safe side.

V10 and V11 only need the smaller sizes, while V12 and V13 needed
the larger sizes.

When adding the bigger sizes make sure, values filled from hardware
values and transmitted to userspace don't leak kernel data by zeroing
them beforehand.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  2 +-
 .../platform/rockchip/rkisp1/rkisp1-stats.c   | 10 ++++--
 include/uapi/linux/rkisp1-config.h            | 36 ++++++++++++++++---
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 6af4d551ffb5..fa47fe2a02d0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -391,7 +391,7 @@ static void rkisp1_goc_config(struct rkisp1_params *params,
 				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
 	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE);
 
-	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES; i++)
+	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
 		rkisp1_write(params->rkisp1, arg->gamma_y[i],
 			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0 + i * 4);
 }
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index 3ddab8fa8f2d..25d10919bc25 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -202,8 +202,11 @@ static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	unsigned int i;
 
+	/* the global max can be bigger than the version-specific one */
+	memset(pbuf->params.ae.exp_mean, 0, RKISP1_CIF_ISP_AE_MEAN_MAX);
+
 	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
-	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX; i++)
+	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX_V10; i++)
 		pbuf->params.ae.exp_mean[i] =
 			(u8)rkisp1_read(rkisp1,
 					RKISP1_CIF_ISP_EXP_MEAN_00 + i * 4);
@@ -232,8 +235,11 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	unsigned int i;
 
+	/* the global max can be bigger then the version-specific one */
+	memset(pbuf->params.hist.hist_bins, 0, RKISP1_CIF_ISP_HIST_BIN_N_MAX);
+
 	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
-	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
+	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10; i++)
 		pbuf->params.hist.hist_bins[i] =
 			(u8)rkisp1_read(rkisp1,
 					RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index bad46aadf838..aa4ace7264d3 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -49,8 +49,14 @@
 #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
 #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
 
-#define RKISP1_CIF_ISP_AE_MEAN_MAX              25
-#define RKISP1_CIF_ISP_HIST_BIN_N_MAX           16
+#define RKISP1_CIF_ISP_AE_MEAN_MAX_V10		25
+#define RKISP1_CIF_ISP_AE_MEAN_MAX_V12		81
+#define RKISP1_CIF_ISP_AE_MEAN_MAX		RKISP1_CIF_ISP_AE_MEAN_MAX_V12
+
+#define RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10	16
+#define RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12	32
+#define RKISP1_CIF_ISP_HIST_BIN_N_MAX		RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12
+
 #define RKISP1_CIF_ISP_AFM_MAX_WINDOWS          3
 #define RKISP1_CIF_ISP_DEGAMMA_CURVE_SIZE       17
 
@@ -86,7 +92,9 @@
  * Gamma out
  */
 /* Maximum number of color samples supported */
-#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17
+#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10   17
+#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12   34
+#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12
 
 /*
  * Lens shade correction
@@ -103,7 +111,9 @@
  * Histogram calculation
  */
 /* Last 3 values unused. */
-#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
+#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10 28
+#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12 81
+#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE     RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12
 
 /*
  * Defect Pixel Cluster Correction
@@ -517,6 +527,10 @@ enum rkisp1_cif_isp_goc_mode {
  *
  * @mode: goc mode (from enum rkisp1_cif_isp_goc_mode)
  * @gamma_y: gamma out curve y-axis for all color components
+ *
+ * The number of entries is dependent on the hw_revision,
+ * see RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10 vs _V12 and the
+ * global maximum is the bigger of the two.
  */
 struct rkisp1_cif_isp_goc_config {
 	__u32 mode;
@@ -531,6 +545,10 @@ struct rkisp1_cif_isp_goc_config {
  *			  skipped
  * @meas_window: coordinates of the measure window
  * @hist_weight: weighting factor for sub-windows
+ *
+ * The number of entries of weighting factors is dependent on the hw_revision,
+ * see RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10 vs _V12 and the
+ * global maximum is the bigger of the two.
  */
 struct rkisp1_cif_isp_hst_config {
 	__u32 mode;
@@ -818,7 +836,11 @@ struct rkisp1_cif_isp_bls_meas_val {
  * @exp_mean: Mean luminance value of block xx
  * @bls_val:  BLS measured values
  *
- * Image is divided into 5x5 blocks.
+ * The number of entries is dependent on the hw_revision,
+ * see RKISP1_CIF_ISP_AE_MEAN_MAX_V10 vs _V12 and the
+ * global maximum is the bigger of the two.
+ *
+ * Image is divided into 5x5 blocks on V10 and 9x9 blocks on V12.
  */
 struct rkisp1_cif_isp_ae_stat {
 	__u8 exp_mean[RKISP1_CIF_ISP_AE_MEAN_MAX];
@@ -855,6 +877,10 @@ struct rkisp1_cif_isp_af_stat {
  *
  * Measurement window divided into 25 sub-windows, set
  * with ISP_HIST_XXX
+ *
+ * The number of entries is dependent on the hw_revision,
+ * see RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10 vs _V12 and the
+ * global maximum is the bigger of the two.
  */
 struct rkisp1_cif_isp_hist_stat {
 	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
-- 
2.29.2

