Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7724A2EF83C
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 20:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbhAHTea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 14:34:30 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59470 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728883AbhAHTe2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 14:34:28 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kxxVy-0004Zr-3t; Fri, 08 Jan 2021 20:33:38 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH RFC 09/11] media: rockchip: rkisp1: make some isp-stats functions variable
Date:   Fri,  8 Jan 2021 20:33:09 +0100
Message-Id: <20210108193311.3423236-10-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108193311.3423236-1-heiko@sntech.de>
References: <20210108193311.3423236-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The isp block evolved in subsequent socs, so some functions
will behave differently on newer variants.

Therefore make it possible to override the needed stats functions.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  | 17 +++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-stats.c   | 24 +++++++++++++++----
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 4034a05ef9d2..be0ae02165c9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -240,6 +240,21 @@ struct rkisp1_capture {
 	} pix;
 };
 
+struct rkisp1_stats;
+struct rkisp1_stats_ops {
+	void (*get_awb_meas)(struct rkisp1_stats *stats,
+			     struct rkisp1_stat_buffer *pbuf);
+	void (*get_aec_meas)(struct rkisp1_stats *stats,
+			     struct rkisp1_stat_buffer *pbuf);
+	void (*get_hst_meas)(struct rkisp1_stats *stats,
+			     struct rkisp1_stat_buffer *pbuf);
+};
+
+struct rkisp1_stats_config {
+	const int ae_mean_max;
+	const int hist_bin_n_max;
+};
+
 /*
  * struct rkisp1_stats - ISP Statistics device
  *
@@ -252,6 +267,8 @@ struct rkisp1_capture {
 struct rkisp1_stats {
 	struct rkisp1_vdev_node vnode;
 	struct rkisp1_device *rkisp1;
+	struct rkisp1_stats_ops *ops;
+	struct rkisp1_stats_config *config;
 
 	spinlock_t lock; /* locks the buffers list 'stats' */
 	struct list_head stat;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index 3ddab8fa8f2d..7136292039f6 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -203,7 +203,7 @@ static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
 	unsigned int i;
 
 	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
-	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX; i++)
+	for (i = 0; i < stats->config->ae_mean_max; i++)
 		pbuf->params.ae.exp_mean[i] =
 			(u8)rkisp1_read(rkisp1,
 					RKISP1_CIF_ISP_EXP_MEAN_00 + i * 4);
@@ -233,7 +233,7 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
 	unsigned int i;
 
 	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
-	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
+	for (i = 0; i < stats->config->hist_bin_n_max; i++)
 		pbuf->params.hist.hist_bins[i] =
 			(u8)rkisp1_read(rkisp1,
 					RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
@@ -286,6 +286,17 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
 	}
 }
 
+static struct rkisp1_stats_ops rkisp1_stats_ops = {
+	.get_awb_meas = rkisp1_stats_get_awb_meas,
+	.get_aec_meas = rkisp1_stats_get_aec_meas,
+	.get_hst_meas = rkisp1_stats_get_hst_meas,
+};
+
+static struct rkisp1_stats_config rkisp1_stats_config = {
+	.ae_mean_max = 25,
+	.hist_bin_n_max = 16,
+};
+
 static void
 rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
 {
@@ -308,18 +319,18 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
 		(struct rkisp1_stat_buffer *)(cur_buf->vaddr);
 
 	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE)
-		rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
+		stats->ops->get_awb_meas(stats, cur_stat_buf);
 
 	if (isp_ris & RKISP1_CIF_ISP_AFM_FIN)
 		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
 
 	if (isp_ris & RKISP1_CIF_ISP_EXP_END) {
-		rkisp1_stats_get_aec_meas(stats, cur_stat_buf);
+		stats->ops->get_aec_meas(stats, cur_stat_buf);
 		rkisp1_stats_get_bls_meas(stats, cur_stat_buf);
 	}
 
 	if (isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY)
-		rkisp1_stats_get_hst_meas(stats, cur_stat_buf);
+		stats->ops->get_hst_meas(stats, cur_stat_buf);
 
 	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
 			      sizeof(struct rkisp1_stat_buffer));
@@ -353,6 +364,9 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
 		V4L2_META_FMT_RK_ISP1_STAT_3A;
 	stats->vdev_fmt.fmt.meta.buffersize =
 		sizeof(struct rkisp1_stat_buffer);
+
+	stats->ops = &rkisp1_stats_ops;
+	stats->config = &rkisp1_stats_config;
 }
 
 int rkisp1_stats_register(struct rkisp1_device *rkisp1)
-- 
2.29.2

