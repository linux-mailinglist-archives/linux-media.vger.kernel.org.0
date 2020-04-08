Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8FD1A2B08
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 23:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730466AbgDHVV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 17:21:28 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41020 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730411AbgDHVVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 17:21:22 -0400
Received: by mail-lf1-f66.google.com with SMTP id z23so6288736lfh.8
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zrN2AJysnRrd7tScXLgKvVeZNzRk8jbdhU7zjHnGzoM=;
        b=w2p7vEFBjttXDcozu8XyNt2d5S8Tx4MKu/XCnmkUTh5fYBf0WP0Pmn0QA7h1Alh4Sh
         zEI0WDD7DmYxO4ckHVugL2HdPYjExF19axfdLGnM9tmWpz4VBNrPqy6EIebfJGPZhZny
         y5VHDSSCpWBwU55abdAMfvTdHmMNaLYk82+msNjKcixDqy6w3itKDIclhlbyPXFmis0y
         3vLoVXzLRmNAPT6EuZkntFQeLRPDAC15q95kRsLGSWLWQaf3QfntyP8his3mZa4TUbNv
         bxcUUqIoMVz5ngJRkE3d9oSKTHci2OZc2fkQTs81S/t+Fk6TyEheBRm+bQiaahJG31PD
         Z7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zrN2AJysnRrd7tScXLgKvVeZNzRk8jbdhU7zjHnGzoM=;
        b=luJ7dbmBKZZ/cJ7iYbIR2ioV2Gi4aatFKPvOe2T1sEfi1n7bfXSOgkC0eC2YYvcp8M
         lwLF8s4tR4W36eirUsPf55EC22WFDVp57HXHeGFuqbU+++udnKTwyzuTaciibG5p/0IL
         fcSnY6CO0vlWXc+YJNGV1+HnyG/vl3WeP5K5cXJTazPeInx8PBvfgqcZN5s4Je+FGUp0
         tbzqukMq996AL2EzuOlfOiSz84ivzaLcoYsYbbUjgDVk+S7IqPIX8/YH4F8cnc8F55a/
         YL6dSkH8JGQxw36fhTHcXj24pDkOC3N6M39wK2lBPJSCs3sqG+/qFSE9Wt/OUM2RH7k8
         dT6w==
X-Gm-Message-State: AGi0PuayLYi/o/fP84rpkWe05BoVijjtHT+uNVmHuyquRKPlNNYxFnSU
        51cgjeVmtdiv9g83WLozd4XRCXrk7n4=
X-Google-Smtp-Source: APiQypLazl80SfazbYATmIW7XpVpaNnxb4MWewZXCKb4wNLIViuGqsDajiItsUTxIftr0KesG3bf1A==
X-Received: by 2002:a05:6512:3049:: with SMTP id b9mr5815265lfb.176.1586380879410;
        Wed, 08 Apr 2020 14:21:19 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id b28sm17395301ljp.90.2020.04.08.14.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:21:18 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/2] venus: make debug infrastructure more flexible
Date:   Thu,  9 Apr 2020 00:20:24 +0300
Message-Id: <20200408212024.23377-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408212024.23377-1-stanimir.varbanov@linaro.org>
References: <20200408212024.23377-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here we introduce few debug macros with levels (low, medium and
high) and debug macro for firmware. Enabling the particular
level will be done by dynamic debug.

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
 drivers/media/platform/qcom/venus/hfi_msgs.c  | 24 ++++---
 drivers/media/platform/qcom/venus/hfi_venus.c | 20 ++++--
 .../media/platform/qcom/venus/pm_helpers.c    |  3 +-
 drivers/media/platform/qcom/venus/vdec.c      | 63 +++++++++++++++++--
 drivers/media/platform/qcom/venus/venc.c      |  4 ++
 7 files changed, 94 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 1980211659f3..b95d0ab7e1aa 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -15,6 +15,11 @@
 #include "hfi.h"
 #include "dbgfs.h"
 
+#define VDBGL(fmt, args...)	pr_debug("VENUSL: " fmt, ##args)
+#define VDBGM(fmt, args...)	pr_debug("VENUSM: " fmt, ##args)
+#define VDBGH(fmt, args...)	pr_debug("VENUSH: " fmt, ##args)
+#define VDBGFW(fmt, args...)	pr_debug("VENUSFW: " fmt, ##args)
+
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_PMDOMAINS_NUM_MAX		3
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index bcc603804041..9fe729ee8c6c 100644
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
index 04ef2286efc6..586c7466bf9f 100644
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
@@ -247,7 +246,7 @@ sys_get_prop_image_version(struct device *dev,
 		/* bad packet */
 		return;
 
-	dev_dbg(dev, "F/W version: %s\n", (u8 *)&pkt->data[1]);
+	VDBGL("F/W version: %s\n", (u8 *)&pkt->data[1]);
 }
 
 static void hfi_sys_property_info(struct venus_core *core,
@@ -257,7 +256,7 @@ static void hfi_sys_property_info(struct venus_core *core,
 	struct device *dev = core->dev;
 
 	if (!pkt->num_properties) {
-		dev_dbg(dev, "%s: no properties\n", __func__);
+		VDBGM("no properties\n");
 		return;
 	}
 
@@ -266,7 +265,7 @@ static void hfi_sys_property_info(struct venus_core *core,
 		sys_get_prop_image_version(dev, pkt);
 		break;
 	default:
-		dev_dbg(dev, "%s: unknown property data\n", __func__);
+		VDBGM("unknown property data\n");
 		break;
 	}
 }
@@ -297,7 +296,7 @@ static void hfi_sys_ping_done(struct venus_core *core, struct venus_inst *inst,
 static void hfi_sys_idle_done(struct venus_core *core, struct venus_inst *inst,
 			      void *packet)
 {
-	dev_dbg(core->dev, "sys idle\n");
+	VDBGL("sys idle\n");
 }
 
 static void hfi_sys_pc_prepare_done(struct venus_core *core,
@@ -305,7 +304,7 @@ static void hfi_sys_pc_prepare_done(struct venus_core *core,
 {
 	struct hfi_msg_sys_pc_prep_done_pkt *pkt = packet;
 
-	dev_dbg(core->dev, "pc prepare done (error %x)\n", pkt->error_type);
+	VDBGL("pc prepare done (error %x)\n", pkt->error_type);
 }
 
 static unsigned int
@@ -387,8 +386,7 @@ static void hfi_session_prop_info(struct venus_core *core,
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
index 4ed2628585a1..ec9f47a638f6 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -225,7 +225,7 @@ static int vdec_check_src_change(struct venus_inst *inst)
 
 	if (!(inst->codec_state == VENUS_DEC_STATE_CAPTURE_SETUP) ||
 	    !inst->reconfig)
-		dev_dbg(inst->core->dev, "%s: wrong state\n", __func__);
+		VDBGM("wrong codec state %u\n", inst->codec_state);
 
 done:
 	return 0;
@@ -724,6 +724,10 @@ static int vdec_queue_setup(struct vb2_queue *q,
 	unsigned int in_num, out_num;
 	int ret = 0;
 
+	VDBGM("vb2: queue_setup: %s: begin (codec_state: %u)\n",
+	      V4L2_TYPE_IS_OUTPUT(q->type) ? "out" : "cap",
+	      inst->codec_state);
+
 	if (*num_planes) {
 		unsigned int output_buf_size = venus_helper_get_opb_size(inst);
 
@@ -785,6 +789,10 @@ static int vdec_queue_setup(struct vb2_queue *q,
 		break;
 	}
 
+	VDBGM("vb2: queue_setup: %s: end (codec_state: %u, ret: %d)\n",
+	      V4L2_TYPE_IS_OUTPUT(q->type) ? "out" : "cap",
+	      inst->codec_state, ret);
+
 	return ret;
 }
 
@@ -819,6 +827,8 @@ static int vdec_start_capture(struct venus_inst *inst)
 {
 	int ret;
 
+	VDBGM("on: cap: begin (codec_state: %u)\n", inst->codec_state);
+
 	if (!inst->streamon_out)
 		return 0;
 
@@ -877,11 +887,16 @@ static int vdec_start_capture(struct venus_inst *inst)
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
 
@@ -889,6 +904,8 @@ static int vdec_start_output(struct venus_inst *inst)
 {
 	int ret;
 
+	VDBGM("on: out: begin (codec_state: %u)\n", inst->codec_state);
+
 	if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
 		ret = venus_helper_process_initial_out_bufs(inst);
 		inst->codec_state = VENUS_DEC_STATE_DECODING;
@@ -937,6 +954,10 @@ static int vdec_start_output(struct venus_inst *inst)
 
 done:
 	inst->streamon_out = 1;
+
+	VDBGM("on: out: end (codec_state: %u, ret: %d)\n",
+	      inst->codec_state, ret);
+
 	return ret;
 }
 
@@ -980,6 +1001,8 @@ static int vdec_stop_capture(struct venus_inst *inst)
 {
 	int ret = 0;
 
+	VDBGM("off: cap: begin (codec_state: %u)\n", inst->codec_state);
+
 	switch (inst->codec_state) {
 	case VENUS_DEC_STATE_DECODING:
 		ret = hfi_session_flush(inst, HFI_FLUSH_ALL);
@@ -996,9 +1019,12 @@ static int vdec_stop_capture(struct venus_inst *inst)
 		venus_helper_free_dpb_bufs(inst);
 		break;
 	default:
-		return 0;
+		break;
 	}
 
+	VDBGM("off: cap: end (codec_state: %u, ret: %d)\n",
+	      inst->codec_state, ret);
+
 	return ret;
 }
 
@@ -1006,6 +1032,8 @@ static int vdec_stop_output(struct venus_inst *inst)
 {
 	int ret = 0;
 
+	VDBGM("off: out: begin (codec_state: %u)\n", inst->codec_state);
+
 	switch (inst->codec_state) {
 	case VENUS_DEC_STATE_DECODING:
 	case VENUS_DEC_STATE_DRAIN:
@@ -1021,6 +1049,9 @@ static int vdec_stop_output(struct venus_inst *inst)
 		break;
 	}
 
+	VDBGM("off: out: end (codec_state: %u, ret %d)\n",
+	      inst->codec_state, ret);
+
 	return ret;
 }
 
@@ -1055,6 +1086,8 @@ static void vdec_session_release(struct venus_inst *inst)
 	struct venus_core *core = inst->core;
 	int ret, abort = 0;
 
+	VDBGM("rel: begin (codec_state: %u)\n", inst->codec_state);
+
 	mutex_lock(&inst->lock);
 
 	inst->codec_state = VENUS_DEC_STATE_DEINIT;
@@ -1082,15 +1115,23 @@ static void vdec_session_release(struct venus_inst *inst)
 	INIT_LIST_HEAD(&inst->registeredbufs);
 
 	mutex_unlock(&inst->lock);
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
@@ -1100,6 +1141,9 @@ static void vdec_buf_cleanup(struct vb2_buffer *vb)
 	inst->buf_count--;
 	if (!inst->buf_count)
 		vdec_session_release(inst);
+
+	VDBGM("vb2: buf_cleanup: %s: done (codec_state: %u)\n",
+	      V4L2_TYPE_IS_OUTPUT(vb->type) ? "out" : "cap", inst->codec_state);
 }
 
 static const struct vb2_ops vdec_vb2_ops = {
@@ -1167,6 +1211,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	}
 
 	v4l2_m2m_buf_done(vbuf, state);
+
+	VDBGH("done: %s, idx: %02u, flen: %08u, flags: hfi: %08x, v4l2: %08x\n",
+	      V4L2_TYPE_IS_OUTPUT(type) ? "out" : "cap",
+	      vbuf->vb2_buf.index, bytesused, hfi_flags, vbuf->flags);
 }
 
 static void vdec_event_change(struct venus_inst *inst,
@@ -1175,7 +1223,6 @@ static void vdec_event_change(struct venus_inst *inst,
 	static const struct v4l2_event ev = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION };
-	struct device *dev = inst->core->dev_dec;
 	struct v4l2_format format = {};
 
 	mutex_lock(&inst->lock);
@@ -1196,8 +1243,12 @@ static void vdec_event_change(struct venus_inst *inst,
 	if (inst->bit_depth != ev_data->bit_depth)
 		inst->bit_depth = ev_data->bit_depth;
 
-	dev_dbg(dev, "event %s sufficient resources (%ux%u)\n",
-		sufficient ? "" : "not", ev_data->width, ev_data->height);
+	VDBGH("event: %s sufficient resources (%ux%u)\n",
+	      sufficient ? "" : "not", ev_data->width, ev_data->height);
+
+	if (ev_data->buf_count)
+		VDBGH("event: buf_count: %u, old: %u\n",
+			ev_data->buf_count, inst->num_output_bufs);
 
 	if (sufficient) {
 		hfi_session_continue(inst);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 9981a2a27c90..9b8726a0ac20 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1066,6 +1066,10 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
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

