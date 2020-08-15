Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9DD245381
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 00:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729723AbgHOWC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 18:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728718AbgHOVvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:24 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0897BC08E834
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:37:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id B756B29A7CE
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 01/14] media: staging: rkisp1: call params isr only upon frame out
Date:   Sat, 15 Aug 2020 12:37:21 +0200
Message-Id: <20200815103734.31153-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the params isr is called and then returned when
isp-frame interrupt is not set. This condition is already
tested in the isp's isr so move the call under the condition
in the isp's isr.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h |  2 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c    | 12 ++++----
 drivers/staging/media/rkisp1/rkisp1-params.c | 29 +++++++++-----------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 3dc51d703f73..29eaadc58489 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -313,7 +313,7 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1);
 void rkisp1_mipi_isr(struct rkisp1_device *rkisp1);
 void rkisp1_capture_isr(struct rkisp1_device *rkisp1);
 void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris);
-void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis);
+void rkisp1_params_isr(struct rkisp1_device *rkisp1);
 
 int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1);
 void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1);
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 6ec1e9816e9f..ad2ece78abbf 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -1141,12 +1141,12 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
 		isp_ris = rkisp1_read(rkisp1, RKISP1_CIF_ISP_RIS);
 		if (isp_ris & RKISP1_STATS_MEAS_MASK)
 			rkisp1_stats_isr(&rkisp1->stats, isp_ris);
+		/*
+		 * Then update changed configs. Some of them involve
+		 * lot of register writes. Do those only one per frame.
+		 * Do the updates in the order of the processing flow.
+		 */
+		rkisp1_params_isr(rkisp1);
 	}
 
-	/*
-	 * Then update changed configs. Some of them involve
-	 * lot of register writes. Do those only one per frame.
-	 * Do the updates in the order of the processing flow.
-	 */
-	rkisp1_params_isr(rkisp1, status);
 }
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 797e79de659c..6d69df36c495 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1193,12 +1193,13 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
 	}
 }
 
-void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis)
+void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 {
 	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
 	struct rkisp1_params *params = &rkisp1->params;
 	struct rkisp1_params_cfg *new_params;
 	struct rkisp1_buffer *cur_buf = NULL;
+	u32 isp_ctrl;
 
 	spin_lock(&params->config_lock);
 	if (!params->is_streaming) {
@@ -1217,24 +1218,20 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis)
 
 	new_params = (struct rkisp1_params_cfg *)(cur_buf->vaddr[0]);
 
-	if (isp_mis & RKISP1_CIF_ISP_FRAME) {
-		u32 isp_ctrl;
+	rkisp1_isp_isr_other_config(params, new_params);
+	rkisp1_isp_isr_meas_config(params, new_params);
 
-		rkisp1_isp_isr_other_config(params, new_params);
-		rkisp1_isp_isr_meas_config(params, new_params);
+	/* update shadow register immediately */
+	isp_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_CTRL);
+	isp_ctrl |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD;
+	rkisp1_write(params->rkisp1, isp_ctrl, RKISP1_CIF_ISP_CTRL);
 
-		/* update shadow register immediately */
-		isp_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_CTRL);
-		isp_ctrl |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD;
-		rkisp1_write(params->rkisp1, isp_ctrl, RKISP1_CIF_ISP_CTRL);
-
-		spin_lock(&params->config_lock);
-		list_del(&cur_buf->queue);
-		spin_unlock(&params->config_lock);
+	spin_lock(&params->config_lock);
+	list_del(&cur_buf->queue);
+	spin_unlock(&params->config_lock);
 
-		cur_buf->vb.sequence = frame_sequence;
-		vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
-	}
+	cur_buf->vb.sequence = frame_sequence;
+	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 }
 
 static const struct rkisp1_cif_isp_awb_meas_config rkisp1_awb_params_default_config = {
-- 
2.17.1

