Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D27427B22F
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgI1QpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgI1Qo7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:44:59 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82737C0613D0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:44:58 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w1so2113513edr.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vCrCOuKF54mJwr9lBbJX2s9NMzS+YPosoi7yr81uyOQ=;
        b=q+r+9RW4KfO6h7wzZK3YbNglxI9qZlRaGK7V/C3TNNVrzT9x2bVFbZi+NprmtQER5I
         gZwDZ3An94VPEMiJ1wZ2TrHgtjXTPBdKy4VH3MT/dHQyzSTqX942LQhsKxr8A3wb2OZB
         5ia71BXBvJrjXLWxgpXhhMOpl7lJGQxNgzcZpu568t9bCTqJI3BHVjxvwGgNo2Dlxrig
         7oQg850GBoEYvnoUO+wsMFXT2D/LKZOQxdAHeUJy7S1u84JGyxeSzHPALHknBmVdS9tX
         Vds+GmOSOCjhzabVKggA3F3jCRfP/hM7NgHzjTYYoTS3hI8iUhQWJ7mp2+dv3wXu9yLX
         xjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vCrCOuKF54mJwr9lBbJX2s9NMzS+YPosoi7yr81uyOQ=;
        b=PKcQM01A+tNr8M6s8gFbjESvo+/5z/EgqhZnSy+cEAGjjSzRYeVhomM8EEyNbqxMO9
         Z/MQBAdVzWY6W2ANhRX2NA9DZpHMNAxal9soeHhllXXhLFQ6EqAevN9rMfgsXUblymqr
         +ZK4BjgOdpEWVpLmUxrZ7jPWfBvri17lVeWtv5hYzy2MemVeA8mg3r2g1wMu138WacNt
         VaP7dKlKxNY12y1X/cq4jxyxTC+OrkwVNklr6/lZSw0K1SutNHF15aKSmMik3E72JqxC
         qTsp3nwZ87166knTrl1fy1WSOfI4dzsBV53sbKiUIpFzS9hdtqhV0VmpDVDbTAUZpDhq
         ePbg==
X-Gm-Message-State: AOAM532l7+LENsaErJx8877wY7cd1hNKhi4dIaXZFG9Dm0piehOQiONo
        D8hAu1Qj83W9rETjWQ7ktxVyFFBF1JsszcWw
X-Google-Smtp-Source: ABdhPJx4oek9IVKTvdsvad7NHvBClhcg9RKrvYZggDX853RgqSAPBqxQku7WqtO0KBlm2dMLseoTmA==
X-Received: by 2002:aa7:d043:: with SMTP id n3mr2626502edo.243.1601311496944;
        Mon, 28 Sep 2020 09:44:56 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id nh1sm1912594ejb.21.2020.09.28.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:44:56 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/3] venus: vdec: Fix non reliable setting of LAST flag
Date:   Mon, 28 Sep 2020 19:44:29 +0300
Message-Id: <20200928164431.21884-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
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
 drivers/media/platform/qcom/venus/core.h    |  5 +-
 drivers/media/platform/qcom/venus/helpers.c |  6 +++
 drivers/media/platform/qcom/venus/vdec.c    | 52 ++++++++++++---------
 3 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7b79a33dc9d6..e30eeaf0ada9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -274,7 +274,6 @@ enum venus_dec_state {
 	VENUS_DEC_STATE_DRAIN		= 5,
 	VENUS_DEC_STATE_DECODING	= 6,
 	VENUS_DEC_STATE_DRC		= 7,
-	VENUS_DEC_STATE_DRC_FLUSH_DONE	= 8,
 };
 
 struct venus_ts_metadata {
@@ -339,7 +338,7 @@ struct venus_ts_metadata {
  * @priv:	a private for HFI operations callbacks
  * @session_type:	the type of the session (decoder or encoder)
  * @hprop:	a union used as a holder by get property
- * @last_buf:	last capture buffer for dynamic-resoluton-change
+ * @next_buf_last: a flag to mark next queued capture buffer as last
  */
 struct venus_inst {
 	struct list_head list;
@@ -401,7 +400,7 @@ struct venus_inst {
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
index ea13170a6a2c..c11bdf3ca21b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -914,10 +914,6 @@ static int vdec_start_capture(struct venus_inst *inst)
 		return 0;
 
 reconfigure:
-	ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
-	if (ret)
-		return ret;
-
 	ret = vdec_output_conf(inst);
 	if (ret)
 		return ret;
@@ -954,6 +950,7 @@ static int vdec_start_capture(struct venus_inst *inst)
 	inst->streamon_cap = 1;
 	inst->sequence_cap = 0;
 	inst->reconfig = false;
+	inst->next_buf_last = false;
 
 	return 0;
 
@@ -985,6 +982,7 @@ static int vdec_start_output(struct venus_inst *inst)
 	venus_helper_init_instance(inst);
 	inst->sequence_out = 0;
 	inst->reconfig = false;
+	inst->next_buf_last = false;
 
 	ret = vdec_set_properties(inst);
 	if (ret)
@@ -1078,9 +1076,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
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
@@ -1204,9 +1200,28 @@ static void vdec_buf_cleanup(struct vb2_buffer *vb)
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
 
@@ -1250,13 +1265,6 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
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
 
@@ -1344,13 +1352,14 @@ static void vdec_event_change(struct venus_inst *inst,
 		struct vb2_v4l2_buffer *last;
 		int ret;
 
-		last = v4l2_m2m_last_dst_buf(inst->m2m_ctx);
-		if (last)
-			inst->last_buf = &last->vb2_buf;
+		inst->next_buf_last = true;
 
-		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
-		if (ret)
-			dev_dbg(dev, VDBGH "flush output error %d\n", ret);
+		last = v4l2_m2m_last_dst_buf(inst->m2m_ctx);
+		if (last) {
+			ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
+			if (ret)
+				dev_dbg(dev, VDBGH "flush output error %d\n", ret);
+		}
 	}
 
 	inst->reconfig = true;
@@ -1395,8 +1404,7 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
 
 static void vdec_flush_done(struct venus_inst *inst)
 {
-	if (inst->codec_state == VENUS_DEC_STATE_DRC)
-		inst->codec_state = VENUS_DEC_STATE_DRC_FLUSH_DONE;
+	dev_dbg(inst->core->dev_dec, VDBGH "flush done\n");
 }
 
 static const struct hfi_inst_ops vdec_hfi_ops = {
-- 
2.17.1

