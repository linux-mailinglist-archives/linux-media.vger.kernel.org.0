Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627712DF4A6
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 10:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbgLTJeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 04:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727258AbgLTJeO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 04:34:14 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DBAC061257
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 01:32:51 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id h16so6740426edt.7
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 01:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6aeKehIdQ3xcJ7hMUC4Ib4NuGjCL36W4Z1hVfxcOU/w=;
        b=AKMIpW0t/uOojgm3AC0fIqDChEHOQJp3IGk02LFscyCN8TyKCv6Gd/MwhcCsKfLSLA
         4eY1vGAWnuBrPs0pHHeraBgoDBT6gy97vHve1DoV6Tkbid/C3qlD0Fevwh35Eb9k+0Vr
         L7Q2DDOUylBLELF+kDHhy32M/TlIhYpjl5uprRs7JazqJ2RtdzxZCIh3w/vs/3c1FzYu
         q3rnBdPyCZnV4lSZK7plEqKtppcDfdjd8BKc6ragOGBoqfVfAhwu5AHhw8XLDOKueT90
         AcyoEnL6pOIyWRC/MB2jFtfLibw0e5Mu9diVYT7RExfPJ+h1S4Kedh/eV3/y1zXCujGs
         n4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6aeKehIdQ3xcJ7hMUC4Ib4NuGjCL36W4Z1hVfxcOU/w=;
        b=hKuWwen2SK64Po7jSjiqwaGXdeKPV4Ugt7LUWtfjR0Qh3wiZdrhgDs4qsAbjB0i9O6
         XcfxHENKSld7gq+y8qtMdz8Mw+2AhCHRGL8OHFIemWCil9TfV+a5TDr/zzZrcC+6lB0L
         FgjqRJ1Ud+5TeqLGRVuaET1P8KkUh1w4Vy2UUoSkcFN2z1/4xKNRtfWAhWzGUWd3gkvP
         C8uy6iiTmRw427s4Depu5MbmxL2hj1UUpqg4YYJ+Mm8Ckam2txiti72q+CqZcXK8NZZH
         sPOyXcKVQfTaPsWiBMk6KVtO9uVd6todeasx+z5FvbKJCjn1r1lVTU17AZRmEF8gJ0Ri
         XD7g==
X-Gm-Message-State: AOAM5302xOVTwSbDyVTFhl+xIiOkPixl3usm8LtPK20TB6sEZRkW8XOG
        mBil78VJGJ+XqJuTCWLJ5jZU3wz4CxLlIsK3
X-Google-Smtp-Source: ABdhPJzzREjzhchYCHTThWuix1wKQGYXdzMrIEvGVcAySZtt6PpnMDYjf2ecxImdEjoXcSTTFmKk+Q==
X-Received: by 2002:a05:6402:17cb:: with SMTP id s11mr11401957edy.119.1608456770484;
        Sun, 20 Dec 2020 01:32:50 -0800 (PST)
Received: from localhost.localdomain (hst-221-118.medicom.bg. [84.238.221.118])
        by smtp.gmail.com with ESMTPSA id z12sm7769814ejr.17.2020.12.20.01.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 01:32:50 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     vgarodia@codeaurora.org, acourbot@chromium.org,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/5] venus: vdec: Fix non reliable setting of LAST flag
Date:   Sun, 20 Dec 2020 11:31:26 +0200
Message-Id: <20201220093130.10177-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
References: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In real use of dynamic-resolution-change it is observed that the
LAST buffer flag (which marks the last decoded buffer with the
resolution before the resolution-change event) is not reliably set.

Fix this by set the LAST buffer flag on next queued capture buffer
after the resolution-change event.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h    |  5 +--
 drivers/media/platform/qcom/venus/helpers.c |  6 +++
 drivers/media/platform/qcom/venus/vdec.c    | 45 ++++++++++++---------
 3 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index f03ed427accd..db0e6738281e 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -285,7 +285,6 @@ enum venus_dec_state {
 	VENUS_DEC_STATE_DRAIN		= 5,
 	VENUS_DEC_STATE_DECODING	= 6,
 	VENUS_DEC_STATE_DRC		= 7,
-	VENUS_DEC_STATE_DRC_FLUSH_DONE	= 8,
 };
 
 struct venus_ts_metadata {
@@ -350,7 +349,7 @@ struct venus_ts_metadata {
  * @priv:	a private for HFI operations callbacks
  * @session_type:	the type of the session (decoder or encoder)
  * @hprop:	a union used as a holder by get property
- * @last_buf:	last capture buffer for dynamic-resoluton-change
+ * @next_buf_last: a flag to mark next queued capture buffer as last
  */
 struct venus_inst {
 	struct list_head list;
@@ -413,7 +412,7 @@ struct venus_inst {
 	union hfi_get_property hprop;
 	unsigned int core_acquired: 1;
 	unsigned int bit_depth;
-	struct vb2_buffer *last_buf;
+	bool next_buf_last;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 50439eb1ffea..5ca3920237c5 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1347,6 +1347,12 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 
+	/* Skip processing queued capture buffers after LAST flag */
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC &&
+	    V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
+	    inst->codec_state == VENUS_DEC_STATE_DRC)
+		goto unlock;
+
 	cache_payload(inst, vb);
 
 	if (inst->session_type == VIDC_SESSION_TYPE_ENC &&
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 8488411204c3..eb94e167e282 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -917,10 +917,6 @@ static int vdec_start_capture(struct venus_inst *inst)
 		return 0;
 
 reconfigure:
-	ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
-	if (ret)
-		return ret;
-
 	ret = vdec_output_conf(inst);
 	if (ret)
 		return ret;
@@ -948,6 +944,8 @@ static int vdec_start_capture(struct venus_inst *inst)
 
 	venus_pm_load_scale(inst);
 
+	inst->next_buf_last = false;
+
 	ret = hfi_session_continue(inst);
 	if (ret)
 		goto free_dpb_bufs;
@@ -988,6 +986,7 @@ static int vdec_start_output(struct venus_inst *inst)
 	venus_helper_init_instance(inst);
 	inst->sequence_out = 0;
 	inst->reconfig = false;
+	inst->next_buf_last = false;
 
 	ret = vdec_set_properties(inst);
 	if (ret)
@@ -1081,9 +1080,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
 		inst->codec_state = VENUS_DEC_STATE_STOPPED;
 		break;
 	case VENUS_DEC_STATE_DRC:
-		WARN_ON(1);
-		fallthrough;
-	case VENUS_DEC_STATE_DRC_FLUSH_DONE:
+		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
 		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
 		venus_helper_free_dpb_bufs(inst);
 		break;
@@ -1207,9 +1204,28 @@ static void vdec_buf_cleanup(struct vb2_buffer *vb)
 static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	static const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };
 
 	vdec_pm_get_put(inst);
 
+	mutex_lock(&inst->lock);
+
+	if (inst->next_buf_last && V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
+	    inst->codec_state == VENUS_DEC_STATE_DRC) {
+		vbuf->flags |= V4L2_BUF_FLAG_LAST;
+		vbuf->sequence = inst->sequence_cap++;
+		vbuf->field = V4L2_FIELD_NONE;
+		vb2_set_plane_payload(vb, 0, 0);
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+		v4l2_event_queue_fh(&inst->fh, &eos);
+		inst->next_buf_last = false;
+		mutex_unlock(&inst->lock);
+		return;
+	}
+
+	mutex_unlock(&inst->lock);
+
 	venus_helper_vb2_buf_queue(vb);
 }
 
@@ -1253,13 +1269,6 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 		vb->timestamp = timestamp_us * NSEC_PER_USEC;
 		vbuf->sequence = inst->sequence_cap++;
 
-		if (inst->last_buf == vb) {
-			inst->last_buf = NULL;
-			vbuf->flags |= V4L2_BUF_FLAG_LAST;
-			vb2_set_plane_payload(vb, 0, 0);
-			vb->timestamp = 0;
-		}
-
 		if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
 			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
 
@@ -1359,12 +1368,9 @@ static void vdec_event_change(struct venus_inst *inst,
 	 */
 
 	if (!sufficient && inst->codec_state == VENUS_DEC_STATE_DRC) {
-		struct vb2_v4l2_buffer *last;
 		int ret;
 
-		last = v4l2_m2m_last_dst_buf(inst->m2m_ctx);
-		if (last)
-			inst->last_buf = &last->vb2_buf;
+		inst->next_buf_last = true;
 
 		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
 		if (ret)
@@ -1413,8 +1419,7 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
 
 static void vdec_flush_done(struct venus_inst *inst)
 {
-	if (inst->codec_state == VENUS_DEC_STATE_DRC)
-		inst->codec_state = VENUS_DEC_STATE_DRC_FLUSH_DONE;
+	dev_dbg(inst->core->dev_dec, VDBGH "flush done\n");
 }
 
 static const struct hfi_inst_ops vdec_hfi_ops = {
-- 
2.17.1

