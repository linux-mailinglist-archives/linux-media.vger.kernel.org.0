Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 726021A2B46
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 23:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbgDHVeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 17:34:24 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44832 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730798AbgDHVeR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 17:34:17 -0400
Received: by mail-lf1-f66.google.com with SMTP id 131so6282877lfh.11
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 14:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AXEwq2LfKZq9jZegx8V3cfaW46VWP+fA7RcQ4zX+6AI=;
        b=jPAP4pptlrc6Q8aApSXno0wjC5irSo2RhU/NlN8d93U02X4zOIZYKkmlqTIvOS1QS3
         1bzshkxkMLXILtyf5A4SpmirLLL/IAYw50MT8vo88yVZVP8s3wMOdRqR6Cq85I/MRgPO
         ZiOX9GjI2c3WP25YxIgl5Z5xPJKjICKijoiO85WKO8mxv59Fe47KtWMww8OwfUXy5vD8
         yCw7Oa5pz3yMprnXQr2B4U++0wGYM06NFK5uRdLavEgdOLL5+ufiMbtv8/U5T0KpgMLv
         eYpdT7Pi+n8538PeSs2WAPcBXVpAiYKvp14CRJYbn7QxD7g0Iy45ZsHGDuq5pOKNE4cQ
         Vb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AXEwq2LfKZq9jZegx8V3cfaW46VWP+fA7RcQ4zX+6AI=;
        b=boSaeboWQFXhwSMlmPNgZUEJIGxjD/mYKvIN6hBlcrsPSbq7DvVuV1f9ucXRZCaLAh
         bGr73KkJms9Twf1U3YdsV+aUghMrSwkRW/l96QNjeBgy1BWhMSOZFFyQe+gI/t4sTK20
         9IuaM91n/7jMRuAMEAb1e8PUDPytY6UrpLafNh3MJX7jCACbYs+pLx1o6F/tuDzSSCGq
         u6Io2voSu1WlWhdxurrzywhbFp/X3q3Utx8X2seE+sEBnJ7PCsPcGDDaF6I+qw+Fwt3t
         HmWB1a8nZSEAizKNMAtPDObZ/nyaMpyoOY22wxopTq2tprd6nwMaElkK6UirIUfA2ReB
         uDCQ==
X-Gm-Message-State: AGi0PubItjSZlnzaNgQLiXWLG6FygZEati3MnULoxi/zn0qK/UfCzF5R
        Z1gnZ4oOA+06JpbYracaYz4yRoP2uAQ=
X-Google-Smtp-Source: APiQypLFJs1t1iNw8j6sA8tRaEtZ7232JHvqALlP5aaWya5C1Se9P8Y3p+5jI4WkgT3K8YXTUzruAw==
X-Received: by 2002:a19:7615:: with SMTP id c21mr5612680lff.24.1586381654421;
        Wed, 08 Apr 2020 14:34:14 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id t6sm15746688lfb.55.2020.04.08.14.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:34:13 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 7/7] venus: Mark last capture buffer
Date:   Thu,  9 Apr 2020 00:33:30 +0300
Message-Id: <20200408213330.27665-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
References: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to stateful Codec API the decoder will process all
remaining buffers from before the source change event in
dynamic-resolution-change state and mark the last buffer with
V4L2_BUF_FLAG_LAST.

In Venus case the firmware doesn't mark that last buffer and
some mechanism have to be created in v4l decoder driver.
Fortunately the firmware interface (HFI) claims that the
decoder output buffers will be returned to v4l decoder
driver before it send the insufficient event.

In order to do that we save last queued in the driver capture
buffer in the event_notify and issue flush on output firmware
buffers queue. Once the saved buffer is returned (as a result of
flush command) we mark it as LAST. For all that possible we
extend HFI flush command with one more argument and one more
flush_done HFI driver callback.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h     |  5 ++-
 drivers/media/platform/qcom/venus/hfi.c      | 10 +++--
 drivers/media/platform/qcom/venus/hfi.h      |  3 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c |  2 +
 drivers/media/platform/qcom/venus/vdec.c     | 45 +++++++++++++++++---
 5 files changed, 54 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 3ab644a39786..7118612673c9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -261,7 +261,8 @@ enum venus_dec_state {
 	VENUS_DEC_STATE_SEEK		= 4,
 	VENUS_DEC_STATE_DRAIN		= 5,
 	VENUS_DEC_STATE_DECODING	= 6,
-	VENUS_DEC_STATE_DRC		= 7
+	VENUS_DEC_STATE_DRC		= 7,
+	VENUS_DEC_STATE_DRC_FLUSH_DONE	= 8,
 };
 
 struct venus_ts_metadata {
@@ -326,6 +327,7 @@ struct venus_ts_metadata {
  * @priv:	a private for HFI operations callbacks
  * @session_type:	the type of the session (decoder or encoder)
  * @hprop:	a union used as a holder by get property
+ * @last_buf:	last capture buffer for dynamic-resoluton-change
  */
 struct venus_inst {
 	struct list_head list;
@@ -387,6 +389,7 @@ struct venus_inst {
 	union hfi_get_property hprop;
 	unsigned int core_acquired: 1;
 	unsigned int bit_depth;
+	struct vb2_buffer *last_buf;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 3d8b1284d1f3..a211eb93e0f9 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -382,7 +382,7 @@ int hfi_session_unload_res(struct venus_inst *inst)
 }
 EXPORT_SYMBOL_GPL(hfi_session_unload_res);
 
-int hfi_session_flush(struct venus_inst *inst, u32 type)
+int hfi_session_flush(struct venus_inst *inst, u32 type, bool block)
 {
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
@@ -393,9 +393,11 @@ int hfi_session_flush(struct venus_inst *inst, u32 type)
 	if (ret)
 		return ret;
 
-	ret = wait_session_msg(inst);
-	if (ret)
-		return ret;
+	if (block) {
+		ret = wait_session_msg(inst);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
index 855822c9f39b..62c315291484 100644
--- a/drivers/media/platform/qcom/venus/hfi.h
+++ b/drivers/media/platform/qcom/venus/hfi.h
@@ -102,6 +102,7 @@ struct hfi_inst_ops {
 			 u32 hfi_flags, u64 timestamp_us);
 	void (*event_notify)(struct venus_inst *inst, u32 event,
 			     struct hfi_event_data *data);
+	void (*flush_done)(struct venus_inst *inst);
 };
 
 struct hfi_ops {
@@ -161,7 +162,7 @@ int hfi_session_continue(struct venus_inst *inst);
 int hfi_session_abort(struct venus_inst *inst);
 int hfi_session_load_res(struct venus_inst *inst);
 int hfi_session_unload_res(struct venus_inst *inst);
-int hfi_session_flush(struct venus_inst *inst, u32 type);
+int hfi_session_flush(struct venus_inst *inst, u32 type, bool block);
 int hfi_session_set_buffers(struct venus_inst *inst,
 			    struct hfi_buffer_desc *bd);
 int hfi_session_unset_buffers(struct venus_inst *inst,
diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 04ef2286efc6..279a9d6fe737 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -439,6 +439,8 @@ static void hfi_session_flush_done(struct venus_core *core,
 
 	inst->error = pkt->error_type;
 	complete(&inst->done);
+	if (inst->ops->flush_done)
+		inst->ops->flush_done(inst);
 }
 
 static void hfi_session_etb_done(struct venus_core *core,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index f23cbd812ef4..527944c822b5 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -906,7 +906,7 @@ static int vdec_start_capture(struct venus_inst *inst)
 		return 0;
 
 reconfigure:
-	ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT);
+	ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
 	if (ret)
 		return ret;
 
@@ -1063,14 +1063,16 @@ static int vdec_stop_capture(struct venus_inst *inst)
 
 	switch (inst->codec_state) {
 	case VENUS_DEC_STATE_DECODING:
-		ret = hfi_session_flush(inst, HFI_FLUSH_ALL);
+		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
 		/* fallthrough */
 	case VENUS_DEC_STATE_DRAIN:
 		vdec_cancel_dst_buffers(inst);
 		inst->codec_state = VENUS_DEC_STATE_STOPPED;
 		break;
 	case VENUS_DEC_STATE_DRC:
-		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT);
+		WARN_ON(1);
+		fallthrough;
+	case VENUS_DEC_STATE_DRC_FLUSH_DONE:
 		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
 		venus_helper_free_dpb_bufs(inst);
 		break;
@@ -1091,12 +1093,12 @@ static int vdec_stop_output(struct venus_inst *inst)
 	case VENUS_DEC_STATE_DECODING:
 	case VENUS_DEC_STATE_DRAIN:
 	case VENUS_DEC_STATE_STOPPED:
-		ret = hfi_session_flush(inst, HFI_FLUSH_ALL);
+		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
 		inst->codec_state = VENUS_DEC_STATE_SEEK;
 		break;
 	case VENUS_DEC_STATE_INIT:
 	case VENUS_DEC_STATE_CAPTURE_SETUP:
-		ret = hfi_session_flush(inst, HFI_FLUSH_INPUT);
+		ret = hfi_session_flush(inst, HFI_FLUSH_INPUT, true);
 		break;
 	default:
 		break;
@@ -1234,6 +1236,13 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 		vb->timestamp = timestamp_us * NSEC_PER_USEC;
 		vbuf->sequence = inst->sequence_cap++;
 
+		if (inst->last_buf == vb) {
+			inst->last_buf = NULL;
+			vbuf->flags |= V4L2_BUF_FLAG_LAST;
+			vb2_set_plane_payload(vb, 0, 0);
+			vb->timestamp = 0;
+		}
+
 		if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
 			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
 
@@ -1311,6 +1320,25 @@ static void vdec_event_change(struct venus_inst *inst,
 		}
 	}
 
+	/*
+	 * The assumption is that the firmware have to return the last buffer
+	 * before this event is received in the v4l2 driver. Also the firmware
+	 * itself doesn't mark the last decoder output buffer with HFI EOS flag.
+	 */
+
+	if (!sufficient && inst->codec_state == VENUS_DEC_STATE_DRC) {
+		struct vb2_v4l2_buffer *last;
+		int ret;
+
+		last = v4l2_m2m_last_dst_buf(inst->m2m_ctx);
+		if (last)
+			inst->last_buf = &last->vb2_buf;
+
+		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
+		if (ret)
+			dev_dbg(dev, "flush output error %d\n", ret);
+	}
+
 	inst->reconfig = true;
 	v4l2_event_queue_fh(&inst->fh, &ev);
 	wake_up(&inst->reconf_wait);
@@ -1351,9 +1379,16 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
 	}
 }
 
+static void vdec_flush_done(struct venus_inst *inst)
+{
+	if (inst->codec_state == VENUS_DEC_STATE_DRC)
+		inst->codec_state = VENUS_DEC_STATE_DRC_FLUSH_DONE;
+}
+
 static const struct hfi_inst_ops vdec_hfi_ops = {
 	.buf_done = vdec_buf_done,
 	.event_notify = vdec_event_notify,
+	.flush_done = vdec_flush_done,
 };
 
 static void vdec_inst_init(struct venus_inst *inst)
-- 
2.17.1

