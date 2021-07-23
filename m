Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870623D3553
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 09:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbhGWGv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 02:51:59 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43372 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233339AbhGWGv7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 02:51:59 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m6pfX-0003dj-KN; Fri, 23 Jul 2021 09:32:27 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v7 06/10] media: rockchip: rkisp1: make some isp-stats functions variable
Date:   Fri, 23 Jul 2021 09:32:17 +0200
Message-Id: <20210723073221.1276358-7-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210723073221.1276358-1-heiko@sntech.de>
References: <20210723073221.1276358-1-heiko@sntech.de>
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
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h | 11 +++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  | 14 +++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index b285ce9feb35..bb277cd79aa6 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -236,6 +236,16 @@ struct rkisp1_capture {
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
 /*
  * struct rkisp1_stats - ISP Statistics device
  *
@@ -248,6 +258,7 @@ struct rkisp1_capture {
 struct rkisp1_stats {
 	struct rkisp1_vdev_node vnode;
 	struct rkisp1_device *rkisp1;
+	const struct rkisp1_stats_ops *ops;
 
 	spinlock_t lock; /* locks the buffers list 'stats' */
 	struct list_head stat;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index c1d07a2e8839..e5743efecd1c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -287,6 +287,12 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
 	}
 }
 
+static const struct rkisp1_stats_ops rkisp1_stats_ops = {
+	.get_awb_meas = rkisp1_stats_get_awb_meas,
+	.get_aec_meas = rkisp1_stats_get_aec_meas,
+	.get_hst_meas = rkisp1_stats_get_hst_meas,
+};
+
 static void
 rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
 {
@@ -309,18 +315,18 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
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
@@ -354,6 +360,8 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
 		V4L2_META_FMT_RK_ISP1_STAT_3A;
 	stats->vdev_fmt.fmt.meta.buffersize =
 		sizeof(struct rkisp1_stat_buffer);
+
+	stats->ops = &rkisp1_stats_ops;
 }
 
 int rkisp1_stats_register(struct rkisp1_device *rkisp1)
-- 
2.29.2

