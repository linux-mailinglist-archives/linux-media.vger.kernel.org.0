Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E001CF3FC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 14:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729569AbgELMGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 08:06:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35068 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgELMGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 08:06:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 6E0EC2A20CA
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/5] media: staging: rkisp1: use a macro for the statistics flags mask
Date:   Tue, 12 May 2020 14:05:19 +0200
Message-Id: <20200512120522.25960-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
References: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mask of the ready statistics flags is used in
several places in the code using bitwise-or.
Use a macro for that to make the code more readable.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h |  4 ++++
 drivers/staging/media/rkisp1/rkisp1-isp.c    |  5 +----
 drivers/staging/media/rkisp1/rkisp1-stats.c  | 12 +++---------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 33dffe21c769..c0ab16c6b3db 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -42,6 +42,10 @@
 
 #define RKISP1_MAX_BUS_CLK	8
 
+#define RKISP1_STATS_MEAS_MASK		(RKISP1_CIF_ISP_AWB_DONE |	\
+					 RKISP1_CIF_ISP_AFM_FIN |	\
+					 RKISP1_CIF_ISP_EXP_END |	\
+					 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
 enum rkisp1_rsz_pad {
 	RKISP1_RSZ_PAD_SINK,
 	RKISP1_RSZ_PAD_SRC,
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 19ab0ed323aa..49b47e1734b0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -1137,10 +1137,7 @@ irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1)
 
 		/* New frame from the sensor received */
 		isp_ris = rkisp1_read(rkisp1, RKISP1_CIF_ISP_RIS);
-		if (isp_ris & (RKISP1_CIF_ISP_AWB_DONE |
-			       RKISP1_CIF_ISP_AFM_FIN |
-			       RKISP1_CIF_ISP_EXP_END |
-			       RKISP1_CIF_ISP_HIST_MEASURE_RDY))
+		if (isp_ris & RKISP1_STATS_MEAS_MASK)
 			rkisp1_stats_isr(&rkisp1->stats, isp_ris);
 	}
 
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 6dfcbdc3deb8..12998db955e6 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -407,22 +407,16 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 
 	spin_lock(&stats->irq_lock);
 
-	val = RKISP1_CIF_ISP_AWB_DONE | RKISP1_CIF_ISP_AFM_FIN |
-	      RKISP1_CIF_ISP_EXP_END | RKISP1_CIF_ISP_HIST_MEASURE_RDY;
+	val = RKISP1_STATS_MEAS_MASK;
 	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_ICR);
 
 	isp_mis_tmp = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
-	if (isp_mis_tmp &
-	    (RKISP1_CIF_ISP_AWB_DONE | RKISP1_CIF_ISP_AFM_FIN |
-	     RKISP1_CIF_ISP_EXP_END | RKISP1_CIF_ISP_HIST_MEASURE_RDY))
+	if (isp_mis_tmp & RKISP1_STATS_MEAS_MASK)
 		rkisp1->debug.stats_error++;
 
 	if (!stats->is_streaming)
 		goto unlock;
-	if (isp_ris & (RKISP1_CIF_ISP_AWB_DONE |
-		       RKISP1_CIF_ISP_AFM_FIN |
-		       RKISP1_CIF_ISP_EXP_END |
-		       RKISP1_CIF_ISP_HIST_MEASURE_RDY)) {
+	if (isp_ris & RKISP1_STATS_MEAS_MASK) {
 		work = kzalloc(sizeof(*work), GFP_ATOMIC);
 		if (work) {
 			INIT_WORK(&work->work,
-- 
2.17.1

