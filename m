Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301871CC266
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 17:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgEIP3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 11:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgEIP3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 11:29:25 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC5FC061A0C
        for <linux-media@vger.kernel.org>; Sat,  9 May 2020 08:29:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 645A0260E88
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     helen.koike@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, dafna3@gmail.com, kernel@collabora.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/2] media: staging: rkisp1: stats: don't set stats flags in rkisp1_stats_send_measurement
Date:   Sat,  9 May 2020 17:29:04 +0200
Message-Id: <20200509152904.26348-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200509152904.26348-1-dafna.hirschfeld@collabora.com>
References: <20200509152904.26348-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The flags that indicate which statistics are read are already
set in the functions that read them so there is no need to
set them in the function rkisp1_stats_send_measurement.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-stats.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 8351bda0be03..0616793ae395 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -356,26 +356,19 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
 	cur_stat_buf =
 		(struct rkisp1_stat_buffer *)(cur_buf->vaddr[0]);
 
-	if (meas_work->isp_ris & RKISP1_CIF_ISP_AWB_DONE) {
+	if (meas_work->isp_ris & RKISP1_CIF_ISP_AWB_DONE)
 		rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
-		cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
-	}
 
-	if (meas_work->isp_ris & RKISP1_CIF_ISP_AFM_FIN) {
+	if (meas_work->isp_ris & RKISP1_CIF_ISP_AFM_FIN)
 		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
-		cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AFM_FIN;
-	}
 
 	if (meas_work->isp_ris & RKISP1_CIF_ISP_EXP_END) {
 		rkisp1_stats_get_aec_meas(stats, cur_stat_buf);
 		rkisp1_stats_get_bls_meas(stats, cur_stat_buf);
-		cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
 	}
 
-	if (meas_work->isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY) {
+	if (meas_work->isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY)
 		rkisp1_stats_get_hst_meas(stats, cur_stat_buf);
-		cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
-	}
 
 	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
 			      sizeof(struct rkisp1_stat_buffer));
-- 
2.17.1

