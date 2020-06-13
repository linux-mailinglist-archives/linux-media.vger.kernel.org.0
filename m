Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAED1F85C0
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 00:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgFMWjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 18:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgFMWjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 18:39:40 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64419C03E96F
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 15:39:40 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id mb16so13613870ejb.4
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ftlzwdWtANipR1qsJhtVEUlQeP1yP990SuyUBKuypzw=;
        b=SAQV5QkHxmu0dvz0S52q15eszZ4F+u/1AuO1FLEAsPoF75CSFXmNrYUKF0+BJdqPex
         C/iJ/3V/CeemIHckiRgntj1O29/f8kbhBtq124+jNz7s+3sKihb9f4Q3SOLkrJpH1oie
         8hAd44WO/w+kDVFqnUWFI+dx8QFZjDCsCupw5z5a6kZgmghLBVYuq5o7hU0KaF04kYK/
         p+SsDdj+/ZTLQ8F7GeSJJ1nwa9JRZV0dJaZdSNZ+jVoiP3nrLYXyNveacph+W1sZlWY2
         C1gFduYkpmbXpLXTaTduE+zCnI5WiqkUDJeoqZJRIFvtg5Qhu6PCz3WEWUnPls1LvINm
         GGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ftlzwdWtANipR1qsJhtVEUlQeP1yP990SuyUBKuypzw=;
        b=Pvj248nBErs6NKfT7ghl+d4MZPndvLE5usQnPjuYHWzpb09V6hzAh06r6gmwZgY78R
         ZgI/W+WSrJaDT7k3+tVDVwkGz84jVnUwJjGxP/SNR7Z423nnN6OAg/yxd4NYLWEW7J4v
         9IzPq+bupvfXyd1pByJXY62lvvG/JIYPqlgvGJOmQfTaR5BxrCJRPmfCBQk5nOu3PsDQ
         OVv0BqiyUHGM1CNm5npMOd2ZCwCfcTEMZowYimpCPHVSwUilkOz6R0+C86ROI3bgf70T
         0MMK5gqSKMKqR9h8GXYgKllU9gDJjhGPrI5AoEaeyvm9jOBJZ+jY0lpLTM9qnEFT1J7w
         7cxA==
X-Gm-Message-State: AOAM533+zKEEYQzoRR9ytgwGZidndDYZ0UvP+AsD+fvsGu3B/tpffWs6
        3jRHJD6Dmt2AGC/s9Pufa2XJDw==
X-Google-Smtp-Source: ABdhPJy8oGTmKziPLerFwkVklbAvRSxfoaxwCnhPeZB3BJ2V2rriOlW9b2k2CcMjYG3idG9lXgsIFA==
X-Received: by 2002:a17:906:b74f:: with SMTP id fx15mr19080124ejb.289.1592087978944;
        Sat, 13 Jun 2020 15:39:38 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id u3sm5581606edx.25.2020.06.13.15.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 15:39:38 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 2/3] venus: Make debug infrastructure more flexible
Date:   Sun, 14 Jun 2020 01:39:18 +0300
Message-Id: <20200613223919.7038-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here we introduce few debug macros with levels (low, medium and
high) and debug macro for firmware. Enabling the particular level
will be done by dynamic debug.

For example to enable debug messages with low level:
echo 'format "VENUSL" +p' > debugfs/dynamic_debug/control

If you want to enable all levels:
echo 'format "VENUS" +p' > debugfs/dynamic_debug/control

All the features which dynamic debugging provide are preserved.

And finaly all dev_dbg are translated to VDBGX with appropriate
debug levels.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  5 ++
 drivers/media/platform/qcom/venus/helpers.c   |  2 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c  | 30 ++++-----
 drivers/media/platform/qcom/venus/hfi_venus.c | 20 ++++--
 .../media/platform/qcom/venus/pm_helpers.c    |  3 +-
 drivers/media/platform/qcom/venus/vdec.c      | 63 +++++++++++++++++--
 drivers/media/platform/qcom/venus/venc.c      |  4 ++
 7 files changed, 96 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b48782f9aa95..82438f19afba 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -15,6 +15,11 @@
 #include "dbgfs.h"
 #include "hfi.h"
 
+#define VDBGL(fmt, args...)	pr_debug("VENUSL: " fmt, ##args)
+#define VDBGM(fmt, args...)	pr_debug("VENUSM: " fmt, ##args)
+#define VDBGH(fmt, args...)	pr_debug("VENUSH: " fmt, ##args)
+#define VDBGFW(fmt, args...)	pr_debug("VENUSFW: " fmt, ##args)
+
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_PMDOMAINS_NUM_MAX		3
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 0143af7822b2..115a9a2af1d6 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -396,7 +396,7 @@ put_ts_metadata(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	}
 
 	if (slot == -1) {
-		dev_dbg(inst->core->dev, "%s: no free slot\n", __func__);
+		VDBGH("no free slot for timestamp\n");
 		return;
 	}
 
diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 279a9d6fe737..36986d402c96 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -138,10 +138,9 @@ static void event_sys_error(struct venus_core *core, u32 event,
 			    struct hfi_msg_event_notify_pkt *pkt)
 {
 	if (pkt)
-		dev_dbg(core->dev,
-			"sys error (session id:%x, data1:%x, data2:%x)\n",
-			pkt->shdr.session_id, pkt->event_data1,
-			pkt->event_data2);
+		VDBGH("sys error (session id: %x, data1: %x, data2: %x)\n",
+		      pkt->shdr.session_id, pkt->event_data1,
+		      pkt->event_data2);
 
 	core->core_ops->event_notify(core, event);
 }
@@ -152,8 +151,8 @@ event_session_error(struct venus_core *core, struct venus_inst *inst,
 {
 	struct device *dev = core->dev;
 
-	dev_dbg(dev, "session error: event id:%x, session id:%x\n",
-		pkt->event_data1, pkt->shdr.session_id);
+	VDBGH("session error: event id: %x, session id: %x\n",
+	      pkt->event_data1, pkt->shdr.session_id);
 
 	if (!inst)
 		return;
@@ -236,8 +235,7 @@ static void hfi_sys_init_done(struct venus_core *core, struct venus_inst *inst,
 }
 
 static void
-sys_get_prop_image_version(struct device *dev,
-			   struct hfi_msg_sys_property_info_pkt *pkt)
+sys_get_prop_image_version(struct hfi_msg_sys_property_info_pkt *pkt)
 {
 	int req_bytes;
 
@@ -247,26 +245,25 @@ sys_get_prop_image_version(struct device *dev,
 		/* bad packet */
 		return;
 
-	dev_dbg(dev, "F/W version: %s\n", (u8 *)&pkt->data[1]);
+	VDBGL("F/W version: %s\n", (u8 *)&pkt->data[1]);
 }
 
 static void hfi_sys_property_info(struct venus_core *core,
 				  struct venus_inst *inst, void *packet)
 {
 	struct hfi_msg_sys_property_info_pkt *pkt = packet;
-	struct device *dev = core->dev;
 
 	if (!pkt->num_properties) {
-		dev_dbg(dev, "%s: no properties\n", __func__);
+		VDBGM("no properties\n");
 		return;
 	}
 
 	switch (pkt->data[0]) {
 	case HFI_PROPERTY_SYS_IMAGE_VERSION:
-		sys_get_prop_image_version(dev, pkt);
+		sys_get_prop_image_version(pkt);
 		break;
 	default:
-		dev_dbg(dev, "%s: unknown property data\n", __func__);
+		VDBGM("unknown property data\n");
 		break;
 	}
 }
@@ -297,7 +294,7 @@ static void hfi_sys_ping_done(struct venus_core *core, struct venus_inst *inst,
 static void hfi_sys_idle_done(struct venus_core *core, struct venus_inst *inst,
 			      void *packet)
 {
-	dev_dbg(core->dev, "sys idle\n");
+	VDBGL("sys idle\n");
 }
 
 static void hfi_sys_pc_prepare_done(struct venus_core *core,
@@ -305,7 +302,7 @@ static void hfi_sys_pc_prepare_done(struct venus_core *core,
 {
 	struct hfi_msg_sys_pc_prep_done_pkt *pkt = packet;
 
-	dev_dbg(core->dev, "pc prepare done (error %x)\n", pkt->error_type);
+	VDBGL("pc prepare done (error %x)\n", pkt->error_type);
 }
 
 static unsigned int
@@ -387,8 +384,7 @@ static void hfi_session_prop_info(struct venus_core *core,
 	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
 		break;
 	default:
-		dev_dbg(dev, "%s: unknown property id:%x\n", __func__,
-			pkt->data[0]);
+		VDBGH("unknown property id: %x\n", pkt->data[0]);
 		return;
 	}
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 3a04b08ab85a..9aef62f9b59a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -467,7 +467,6 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 
 static u32 venus_hwversion(struct venus_hfi_device *hdev)
 {
-	struct device *dev = hdev->core->dev;
 	u32 ver = venus_readl(hdev, WRAPPER_HW_VERSION);
 	u32 major, minor, step;
 
@@ -477,7 +476,7 @@ static u32 venus_hwversion(struct venus_hfi_device *hdev)
 	minor = minor >> WRAPPER_HW_VERSION_MINOR_VERSION_SHIFT;
 	step = ver & WRAPPER_HW_VERSION_STEP_VERSION_MASK;
 
-	dev_dbg(dev, "venus hw version %x.%x.%x\n", major, minor, step);
+	VDBGL("venus hw version %x.%x.%x\n", major, minor, step);
 
 	return major;
 }
@@ -897,7 +896,6 @@ static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type)
 
 static void venus_flush_debug_queue(struct venus_hfi_device *hdev)
 {
-	struct device *dev = hdev->core->dev;
 	void *packet = hdev->dbg_buf;
 
 	while (!venus_iface_dbgq_read(hdev, packet)) {
@@ -906,7 +904,7 @@ static void venus_flush_debug_queue(struct venus_hfi_device *hdev)
 		if (pkt->hdr.pkt_type != HFI_MSG_SYS_COV) {
 			struct hfi_msg_sys_debug_pkt *pkt = packet;
 
-			dev_dbg(dev, "%s", pkt->msg_data);
+			VDBGFW("%s", pkt->msg_data);
 		}
 	}
 }
@@ -1230,6 +1228,11 @@ static int venus_session_etb(struct venus_inst *inst,
 		ret = -EINVAL;
 	}
 
+	VDBGM("etb: %s: itag: %u, flen: %u, addr: %x\n",
+	      session_type == VIDC_SESSION_TYPE_DEC ? "dec" : "enc",
+	      in_frame->clnt_data, in_frame->filled_len,
+	      in_frame->device_addr);
+
 	return ret;
 }
 
@@ -1244,7 +1247,14 @@ static int venus_session_ftb(struct venus_inst *inst,
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, &pkt);
+	ret = venus_iface_cmdq_write(hdev, &pkt);
+
+	VDBGM("ftb: %s: otag: %u, flen: %u, addr: %x\n",
+	      inst->session_type == VIDC_SESSION_TYPE_DEC ? "dec" : "enc",
+	      out_frame->clnt_data, out_frame->filled_len,
+	      out_frame->device_addr);
+
+	return ret;
 }
 
 static int venus_session_set_buffers(struct venus_inst *inst,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index abf93158857b..ec7394615ef8 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -212,8 +212,7 @@ static int load_scale_bw(struct venus_core *core)
 	}
 	mutex_unlock(&core->lock);
 
-	dev_dbg(core->dev, "total: avg_bw: %u, peak_bw: %u\n",
-		total_avg, total_peak);
+	VDBGL("total: avg_bw: %u, peak_bw: %u\n", total_avg, total_peak);
 
 	return icc_set_bw(core->video_path, total_avg, total_peak);
 }
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7c4c483d5438..7959e452fbf3 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -225,7 +225,7 @@ static int vdec_check_src_change(struct venus_inst *inst)
 
 	if (!(inst->codec_state == VENUS_DEC_STATE_CAPTURE_SETUP) ||
 	    !inst->reconfig)
-		dev_dbg(inst->core->dev, "%s: wrong state\n", __func__);
+		VDBGM("wrong codec state %u\n", inst->codec_state);
 
 done:
 	return 0;
@@ -790,6 +790,10 @@ static int vdec_queue_setup(struct vb2_queue *q,
 	unsigned int in_num, out_num;
 	int ret = 0;
 
+	VDBGM("vb2: queue_setup: %s: begin (codec_state: %u)\n",
+	      V4L2_TYPE_IS_OUTPUT(q->type) ? "out" : "cap",
+	      inst->codec_state);
+
 	if (*num_planes) {
 		unsigned int output_buf_size = venus_helper_get_opb_size(inst);
 
@@ -859,6 +863,10 @@ static int vdec_queue_setup(struct vb2_queue *q,
 		break;
 	}
 
+	VDBGM("vb2: queue_setup: %s: end (codec_state: %u, ret: %d)\n",
+	      V4L2_TYPE_IS_OUTPUT(q->type) ? "out" : "cap",
+	      inst->codec_state, ret);
+
 	return ret;
 
 put_power:
@@ -897,6 +905,8 @@ static int vdec_start_capture(struct venus_inst *inst)
 {
 	int ret;
 
+	VDBGM("on: cap: begin (codec_state: %u)\n", inst->codec_state);
+
 	if (!inst->streamon_out)
 		return 0;
 
@@ -955,11 +965,16 @@ static int vdec_start_capture(struct venus_inst *inst)
 	inst->sequence_cap = 0;
 	inst->reconfig = false;
 
+	VDBGM("on: cap: end (codec_state: %u)\n", inst->codec_state);
+
 	return 0;
 
 free_dpb_bufs:
 	venus_helper_free_dpb_bufs(inst);
 err:
+	VDBGM("on: cap: end (codec_state: %u, ret: %d)\n",
+	      inst->codec_state, ret);
+
 	return ret;
 }
 
@@ -967,6 +982,8 @@ static int vdec_start_output(struct venus_inst *inst)
 {
 	int ret;
 
+	VDBGM("on: out: begin (codec_state: %u)\n", inst->codec_state);
+
 	if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
 		ret = venus_helper_process_initial_out_bufs(inst);
 		inst->codec_state = VENUS_DEC_STATE_DECODING;
@@ -1015,6 +1032,10 @@ static int vdec_start_output(struct venus_inst *inst)
 
 done:
 	inst->streamon_out = 1;
+
+	VDBGM("on: out: end (codec_state: %u, ret: %d)\n",
+	      inst->codec_state, ret);
+
 	return ret;
 }
 
@@ -1069,6 +1090,8 @@ static int vdec_stop_capture(struct venus_inst *inst)
 {
 	int ret = 0;
 
+	VDBGM("off: cap: begin (codec_state: %u)\n", inst->codec_state);
+
 	switch (inst->codec_state) {
 	case VENUS_DEC_STATE_DECODING:
 		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
@@ -1090,6 +1113,9 @@ static int vdec_stop_capture(struct venus_inst *inst)
 
 	INIT_LIST_HEAD(&inst->registeredbufs);
 
+	VDBGM("off: cap: end (codec_state: %u, ret: %d)\n",
+	      inst->codec_state, ret);
+
 	return ret;
 }
 
@@ -1097,6 +1123,8 @@ static int vdec_stop_output(struct venus_inst *inst)
 {
 	int ret = 0;
 
+	VDBGM("off: out: begin (codec_state: %u)\n", inst->codec_state);
+
 	switch (inst->codec_state) {
 	case VENUS_DEC_STATE_DECODING:
 	case VENUS_DEC_STATE_DRAIN:
@@ -1112,6 +1140,9 @@ static int vdec_stop_output(struct venus_inst *inst)
 		break;
 	}
 
+	VDBGM("off: out: end (codec_state: %u, ret %d)\n",
+	      inst->codec_state, ret);
+
 	return ret;
 }
 
@@ -1146,6 +1177,8 @@ static void vdec_session_release(struct venus_inst *inst)
 	struct venus_core *core = inst->core;
 	int ret, abort = 0;
 
+	VDBGM("rel: begin (codec_state: %u)\n", inst->codec_state);
+
 	vdec_pm_get(inst);
 
 	mutex_lock(&inst->lock);
@@ -1175,15 +1208,23 @@ static void vdec_session_release(struct venus_inst *inst)
 
 	venus_pm_release_core(inst);
 	vdec_pm_put(inst, false);
+
+	VDBGM("rel: end (codec_state: %u)\n", inst->codec_state);
 }
 
 static int vdec_buf_init(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	int ret;
 
 	inst->buf_count++;
 
-	return venus_helper_vb2_buf_init(vb);
+	ret = venus_helper_vb2_buf_init(vb);
+
+	VDBGM("vb2: buf_init: %s: done (codec_state: %u)\n",
+	      V4L2_TYPE_IS_OUTPUT(vb->type) ? "out" : "cap", inst->codec_state);
+
+	return ret;
 }
 
 static void vdec_buf_cleanup(struct vb2_buffer *vb)
@@ -1193,6 +1234,9 @@ static void vdec_buf_cleanup(struct vb2_buffer *vb)
 	inst->buf_count--;
 	if (!inst->buf_count)
 		vdec_session_release(inst);
+
+	VDBGM("vb2: buf_cleanup: %s: done (codec_state: %u)\n",
+	      V4L2_TYPE_IS_OUTPUT(vb->type) ? "out" : "cap", inst->codec_state);
 }
 
 static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
@@ -1281,6 +1325,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	}
 
 	v4l2_m2m_buf_done(vbuf, state);
+
+	VDBGH("done: %s, idx: %02u, flen: %08u, flags: hfi: %08x, v4l2: %08x\n",
+	      V4L2_TYPE_IS_OUTPUT(type) ? "out" : "cap",
+	      vbuf->vb2_buf.index, bytesused, hfi_flags, vbuf->flags);
 }
 
 static void vdec_event_change(struct venus_inst *inst,
@@ -1289,7 +1337,6 @@ static void vdec_event_change(struct venus_inst *inst,
 	static const struct v4l2_event ev = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION };
-	struct device *dev = inst->core->dev_dec;
 	struct v4l2_format format = {};
 
 	mutex_lock(&inst->lock);
@@ -1310,8 +1357,12 @@ static void vdec_event_change(struct venus_inst *inst,
 	if (inst->bit_depth != ev_data->bit_depth)
 		inst->bit_depth = ev_data->bit_depth;
 
-	dev_dbg(dev, "event %s sufficient resources (%ux%u)\n",
-		sufficient ? "" : "not", ev_data->width, ev_data->height);
+	VDBGH("event: %s sufficient resources (%ux%u)\n",
+	      sufficient ? "" : "not", ev_data->width, ev_data->height);
+
+	if (ev_data->buf_count)
+		VDBGH("event: buf_count: %u, old: %u\n",
+		      ev_data->buf_count, inst->num_output_bufs);
 
 	if (sufficient) {
 		hfi_session_continue(inst);
@@ -1344,7 +1395,7 @@ static void vdec_event_change(struct venus_inst *inst,
 
 		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
 		if (ret)
-			dev_dbg(dev, "flush output error %d\n", ret);
+			VDBGH("flush output error (%d)\n", ret);
 	}
 
 	inst->reconfig = true;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index feed648550d1..c591d00ee0a7 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1074,6 +1074,10 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	}
 
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+
+	VDBGH("done: %s, idx: %02u, flen: %08u, flags: hfi: %08x, v4l2: %08x\n",
+	      V4L2_TYPE_IS_OUTPUT(type) ? "out" : "cap",
+	      vbuf->vb2_buf.index, bytesused, hfi_flags, vbuf->flags);
 }
 
 static void venc_event_notify(struct venus_inst *inst, u32 event,
-- 
2.17.1

