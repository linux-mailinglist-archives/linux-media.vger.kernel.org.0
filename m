Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3A620AE89
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgFZIvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgFZIvv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:51:51 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D52BC08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:51:51 -0700 (PDT)
Received: from localhost.localdomain (p200300cb8737cf00e1b48557745ca459.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e1b4:8557:745c:a459])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A7B1E2A59B0;
        Fri, 26 Jun 2020 09:51:49 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v2 1/4] media: staging: rkisp1: use a macro for the statistics flags mask
Date:   Fri, 26 Jun 2020 10:51:38 +0200
Message-Id: <20200626085141.7646-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626085141.7646-1-dafna.hirschfeld@collabora.com>
References: <20200626085141.7646-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mask of the ready statistics flags is used in
several places in the code using bitwise-or.
Use a macro for that to make the code more readable.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h |  4 ++++
 drivers/staging/media/rkisp1/rkisp1-isp.c    |  5 +----
 drivers/staging/media/rkisp1/rkisp1-stats.c  | 14 +++-----------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 0c4fe503adc9..d2c669091fae 100644
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
index 6763379d6a65..47ea7cd999eb 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -1138,10 +1138,7 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
 
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
index 0616793ae395..b19a6d9cdd4d 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -396,26 +396,18 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	struct rkisp1_isp_readout_work *work;
 	unsigned int isp_mis_tmp = 0;
-	u32 val;
 
 	spin_lock(&stats->irq_lock);
 
-	val = RKISP1_CIF_ISP_AWB_DONE | RKISP1_CIF_ISP_AFM_FIN |
-	      RKISP1_CIF_ISP_EXP_END | RKISP1_CIF_ISP_HIST_MEASURE_RDY;
-	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_ICR);
+	rkisp1_write(rkisp1, RKISP1_STATS_MEAS_MASK, RKISP1_CIF_ISP_ICR);
 
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

