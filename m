Return-Path: <linux-media+bounces-16901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 262EE9606F0
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53DAC1F213A3
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B711A2C21;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2r0gcQ4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152E71A01C4;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753196; cv=none; b=L9Frg8rwIJQgak6PvnGoZIAUqzKQij/qYqGDPlcVMv7Br6VSXtdUMbb345pK4so/IYIuKbuboIKmu+VlMvl6omK061Sjb3wcmwrIc05F9zluH1FoLBxLZXPxaIgLsQBM5WBbm7WDkt/yfk2Q/yNO5qFJcdQ9Sj4Juh02hYLW6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753196; c=relaxed/simple;
	bh=aqUoQclyvIXJU156YelZ2I48Pj7nYby6yN3DdJV51+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sMqFYj29ZdzuhU6BZf1BUN2vi/i4vTlj/REPoxXBpq3wcWNB9c/hNaulpgeHJdWvOJtSmScmBtXz/0de5yEkwoAFJJ258nZVyQn+ROf0EGsdo3ZH/KNO6ApMydvzO6SOxgyYqdtKzmlV8IxgH7GVBLC3vFyoFuv0Z6Y6SGPU3R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2r0gcQ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D84A9C4FDF8;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=aqUoQclyvIXJU156YelZ2I48Pj7nYby6yN3DdJV51+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M2r0gcQ4rplAwG3u3SgTK4lPZQ6QmnqB3nmG/FewXdEisonppu1YN8wbDrnde7zP3
	 fgNx6riT9W2W3wFMq2c7aR4br5n9PptLR9wV61VbB0QUEk5PZ6bp9ZLcJH63iTQfkj
	 ym9mcT2zO8TPbG1IWLWnUIryIQRTCI5d1Gz3CgA4r9gSpGUVeLsozTv4mcxE8LpM0c
	 NP+fyOkCWCJDCIEhxWs414VH7gvWIuVIoyxUuF678f+vAok0KsMjt589px4NM1bFKG
	 b2FdEuUb2Txqg5sq1MG4mQ0PJduPeeUMwMB7/wf0B8hcNq+20MLRYgjAPKpz4eC35t
	 NPrSqhdrpUfyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAABC5472E;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:43 +0530
Subject: [PATCH v3 18/29] media: iris: implement vb2 streaming ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-18-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=40628;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=3iYYextigobuDNu8RtJpo/cs+TqbFw3+By4eXwG8awE=;
 b=kTgdFcxjHR9VI+B8tbnTY84mkLthMqU9TNMmjTshRx6a0KD69UDC7yDobxWDWnDaVy3aeIMRH
 +cWo5ct+Jr/CTrhaa+1jkyqdkVzw+InedNta/4K3v6j/BzkJVzR8h5O
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

In stream on, send HFI_CMD_START on capture and
output planes to start the processing on respective planes.

During stream off, send HFI_CMD_STOP to firmware which is
a synchronous command. After the response is received from
firmware, the session is closed on firmware.

Introduce different states for instance and state transitions.

IRIS_INST_INIT - video instance is opened.
IRIS_INST_INPUT_STREAMING - stream on is completed on output plane.
IRIS_INST_OUTPUT_STREAMING - stream on is completed on capture
plane.
IRIS_INST_STREAMING - stream on is completed on both output and
capture planes.
IRIS_INST_DEINIT - video instance is closed.
IRIS_INST_ERROR - error state.

                   |
                   v
            -------------
  +---------|   INIT    |---------  +
  |         -------------           |
  |            ^    ^               |
  |           /      \              |
  |          /        \             |
  |         v          v            |
  |    -----------    -----------   |
  |   |   INPUT         OUTPUT  |   |
  |---| STREAMING     STREAMING |---|
  |    -----------    -----------   |
  |        ^            ^           |
  |         \          /            |
  |          \        /             |
  |           v      v              |
  |         -------------           |
  |--------|  STREAMING |-----------|
  |         -------------           |
  |               |                 |
  |               |                 |
  |               v                 |
  |          -----------            |
  +-------->|  DEINIT   |<----------+
  |          -----------            |
  |               |                 |
  |               |                 |
  |               v                 |
  |          ----------             |
  +-------->|   ERROR  |<-----------+
             ----------.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  82 +++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  26 ++++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  32 ++++++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  67 +++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  24 ++++-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 drivers/media/platform/qcom/iris/iris_state.c      | 105 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_state.h      |  55 +++++++++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  11 ++-
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  79 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vb2.h        |   3 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  75 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  80 +++++++++++++++-
 18 files changed, 638 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index f59ce97d5b7e..4ac97692d072 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -49,6 +49,8 @@ struct iris_hfi_command_ops {
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
 	int (*sys_pc_prep)(struct iris_core *core);
 	int (*session_open)(struct iris_inst *inst);
+	int (*session_start)(struct iris_inst *inst, u32 plane);
+	int (*session_stop)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index f8bd185bb68b..a2e29f03bfee 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -71,6 +71,9 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
 	struct hfi_session_open_pkt packet;
 	int ret;
 
+	if (inst->state != IRIS_INST_DEINIT)
+		return -EALREADY;
+
 	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
 	packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
 	packet.shdr.session_id = inst->session_id;
@@ -83,7 +86,7 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
-	return iris_wait_for_session_response(inst);
+	return iris_wait_for_session_response(inst, false);
 }
 
 static void iris_hfi_gen1_packet_session_cmd(struct iris_inst *inst,
@@ -104,12 +107,89 @@ static int iris_hfi_gen1_session_close(struct iris_inst *inst)
 	return iris_hfi_queue_cmd_write(inst->core, &packet, packet.shdr.hdr.size);
 }
 
+static int iris_hfi_gen1_session_start(struct iris_inst *inst, u32 plane)
+{
+	struct iris_core *core = inst->core;
+	struct hfi_session_pkt packet;
+	int ret;
+
+	if (!V4L2_TYPE_IS_OUTPUT(plane))
+		return 0;
+
+	reinit_completion(&inst->completion);
+	iris_hfi_gen1_packet_session_cmd(inst, &packet, HFI_CMD_SESSION_LOAD_RESOURCES);
+
+	ret = iris_hfi_queue_cmd_write(core, &packet, packet.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	ret = iris_wait_for_session_response(inst, false);
+	if (ret)
+		return ret;
+
+	reinit_completion(&inst->completion);
+	iris_hfi_gen1_packet_session_cmd(inst, &packet, HFI_CMD_SESSION_START);
+
+	ret = iris_hfi_queue_cmd_write(core, &packet, packet.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
+static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
+{
+	struct iris_core *core = inst->core;
+	struct hfi_session_flush_pkt flush_pkt;
+	struct hfi_session_pkt pkt;
+	u32 flush_type;
+	int ret = 0;
+
+	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
+	     inst->state == IRIS_INST_INPUT_STREAMING) ||
+	    (V4L2_TYPE_IS_CAPTURE(plane) &&
+	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
+	    inst->state == IRIS_INST_ERROR) {
+		reinit_completion(&inst->completion);
+		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
+		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
+		if (!ret)
+			ret = iris_wait_for_session_response(inst, false);
+
+		reinit_completion(&inst->completion);
+		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_RELEASE_RESOURCES);
+		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
+		if (!ret)
+			ret = iris_wait_for_session_response(inst, false);
+	} else if (inst->state == IRIS_INST_STREAMING) {
+		if (V4L2_TYPE_IS_OUTPUT(plane))
+			flush_type = HFI_FLUSH_ALL;
+		else if (V4L2_TYPE_IS_CAPTURE(plane))
+			flush_type = HFI_FLUSH_OUTPUT;
+
+		reinit_completion(&inst->flush_completion);
+
+		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
+		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
+		flush_pkt.shdr.session_id = inst->session_id;
+		flush_pkt.flush_type = flush_type;
+
+		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
+		if (!ret)
+			ret = iris_wait_for_session_response(inst, true);
+	}
+
+	return ret;
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 	.session_open = iris_hfi_gen1_session_open,
+	.session_start = iris_hfi_gen1_session_start,
+	.session_stop = iris_hfi_gen1_session_stop,
 	.session_close = iris_hfi_gen1_session_close,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 9dc050063924..fb11d3e45c9f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -23,6 +23,12 @@
 #define HFI_CMD_SYS_SESSION_INIT			0x10007
 #define HFI_CMD_SYS_SESSION_END				0x10008
 
+#define HFI_CMD_SESSION_LOAD_RESOURCES			0x211001
+#define HFI_CMD_SESSION_START				0x211002
+#define HFI_CMD_SESSION_STOP				0x211003
+#define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
+
 #define HFI_ERR_SESSION_UNSUPPORTED_SETTING		0x1008
 #define HFI_ERR_SESSION_UNSUPPORT_BUFFERTYPE		0x1010
 #define HFI_ERR_SESSION_INVALID_SCALE_FACTOR		0x1012
@@ -31,8 +37,11 @@
 #define HFI_EVENT_SYS_ERROR				0x1
 #define HFI_EVENT_SESSION_ERROR				0x2
 
-#define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
+#define HFI_FLUSH_OUTPUT				0x1000002
+#define HFI_FLUSH_OUTPUT2				0x1000003
+#define HFI_FLUSH_ALL					0x1000004
 
+#define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
 #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
 #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
 
@@ -45,6 +54,11 @@
 #define HFI_MSG_SYS_PROPERTY_INFO			0x2000a
 
 #define HFI_MSG_EVENT_NOTIFY				0x21001
+#define HFI_MSG_SESSION_LOAD_RESOURCES			0x221001
+#define HFI_MSG_SESSION_START				0x221002
+#define HFI_MSG_SESSION_STOP				0x221003
+#define HFI_MSG_SESSION_FLUSH				0x221006
+#define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 
 struct hfi_pkt_hdr {
 	u32 size;
@@ -87,6 +101,11 @@ struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
 
+struct hfi_session_flush_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 flush_type;
+};
+
 struct hfi_msg_event_notify_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 event_id;
@@ -120,6 +139,11 @@ struct hfi_msg_sys_property_info_pkt {
 	u8 data[];
 };
 
+struct hfi_msg_session_flush_done_pkt {
+	struct hfi_msg_session_hdr_pkt shdr;
+	u32 flush_type;
+};
+
 struct hfi_enable {
 	u32 enable;
 };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index c9b87ff4db3a..b42eba10e074 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -44,6 +44,7 @@ iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct hfi_msg_event_n
 			pkt->event_data2, pkt->event_data1,
 			pkt->shdr.session_id);
 		iris_vb2_queue_error(inst);
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
 		break;
 	}
 }
@@ -148,6 +149,26 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SYS_SESSION_END,
 	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_LOAD_RESOURCES,
+	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
+	},
+	{
+	 .pkt = HFI_MSG_SESSION_START,
+	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
+	},
+	{
+	 .pkt = HFI_MSG_SESSION_STOP,
+	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
+	},
+	{
+	 .pkt = HFI_MSG_SESSION_FLUSH,
+	 .pkt_sz = sizeof(struct hfi_msg_session_flush_done_pkt),
+	},
+	{
+	 .pkt = HFI_MSG_SESSION_RELEASE_RESOURCES,
+	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -155,6 +176,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
 	struct device *dev = core->dev;
 	struct hfi_pkt_hdr *hdr;
+	struct completion *done;
 	struct iris_inst *inst;
 	bool found = false;
 	unsigned int i;
@@ -205,7 +227,15 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		}
 
 		mutex_lock(&inst->lock);
-		complete(&inst->completion);
+		struct hfi_msg_session_hdr_pkt *shdr;
+
+		shdr = (struct hfi_msg_session_hdr_pkt *)hdr;
+		if (shdr->error_type != HFI_ERR_NONE)
+			iris_inst_change_state(inst, IRIS_INST_ERROR);
+
+		done = pkt_info->pkt == HFI_MSG_SESSION_FLUSH ?
+			&inst->flush_completion : &inst->completion;
+		complete(done);
 		mutex_unlock(&inst->lock);
 	}
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6ad2ca7be0f0..5ace377fec7a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -85,6 +85,24 @@ static int iris_hfi_gen2_sys_pc_prep(struct iris_core *core)
 	return ret;
 }
 
+static u32 iris_hfi_gen2_get_port(u32 plane)
+{
+	u32 hfi_port = HFI_PORT_NONE;
+
+	switch (plane) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		hfi_port = HFI_PORT_BITSTREAM;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		hfi_port = HFI_PORT_RAW;
+		break;
+	default:
+		break;
+	}
+
+	return hfi_port;
+}
+
 static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
@@ -126,6 +144,9 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	int ret;
 
+	if (inst->state != IRIS_INST_DEINIT)
+		return -EALREADY;
+
 	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
 	if (!inst_hfi_gen2->packet)
 		return -ENOMEM;
@@ -190,12 +211,58 @@ static int iris_hfi_gen2_session_close(struct iris_inst *inst)
 	return ret;
 }
 
+static int iris_hfi_gen2_session_start(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_START,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED),
+					     iris_hfi_gen2_get_port(plane),
+					     inst->session_id,
+					     HFI_PAYLOAD_NONE,
+					     NULL,
+					     0);
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
+static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	int ret = 0;
+
+	reinit_completion(&inst->completion);
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_STOP,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED |
+					     HFI_HOST_FLAGS_NON_DISCARDABLE),
+					     iris_hfi_gen2_get_port(plane),
+					     inst->session_id,
+					     HFI_PAYLOAD_NONE,
+					     NULL,
+					     0);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+				       inst_hfi_gen2->packet->size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 	.session_open = iris_hfi_gen2_session_open,
+	.session_start = iris_hfi_gen2_session_start,
+	.session_stop = iris_hfi_gen2_session_stop,
 	.session_close = iris_hfi_gen2_session_close,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 401df7b4e976..f822b91bc217 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -15,6 +15,8 @@
 #define HFI_CMD_POWER_COLLAPSE			0x01000002
 #define HFI_CMD_OPEN				0x01000003
 #define HFI_CMD_CLOSE				0x01000004
+#define HFI_CMD_START				0x01000005
+#define HFI_CMD_STOP				0x01000006
 #define HFI_CMD_END				0x01FFFFFF
 
 #define HFI_PROP_BEGIN				0x03000000
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index dce2cf04a856..35ecc66d630a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -101,6 +101,7 @@ static int iris_hfi_gen2_handle_session_error(struct iris_inst *inst,
 	dev_err(core->dev, "session error received %#x: %s\n",
 		pkt->type, error);
 	iris_vb2_queue_error(inst);
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
 
 	return 0;
 }
@@ -129,20 +130,32 @@ static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
 	return 0;
 }
 
+static void iris_hfi_gen2_handle_session_close(struct iris_inst *inst,
+					       struct iris_hfi_packet *pkt)
+{
+	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		return;
+	}
+
+	complete(&inst->completion);
+}
+
 static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
 						struct iris_hfi_packet *pkt)
 {
-	int ret = 0;
-
 	switch (pkt->type) {
 	case HFI_CMD_CLOSE:
+		iris_hfi_gen2_handle_session_close(inst, pkt);
+		break;
+	case HFI_CMD_STOP:
 		complete(&inst->completion);
 		break;
 	default:
 		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int iris_hfi_gen2_handle_image_version_property(struct iris_core *core,
@@ -256,8 +269,11 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 			if (packet->flags & HFI_FW_FLAGS_SESSION_ERROR)
 				iris_hfi_gen2_handle_session_error(inst, packet);
 
-			if (packet->type > range[i].begin && packet->type < range[i].end)
+			if (packet->type > range[i].begin && packet->type < range[i].end) {
 				ret = range[i].handle(inst, packet);
+				if (ret)
+					iris_inst_change_state(inst, IRIS_INST_ERROR);
+			}
 			pkt += packet->size;
 		}
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 2429b9860789..c225466b4e48 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -26,10 +26,12 @@
  * @ctrl_handler: reference of v4l2 ctrl handler
  * @crop: structure of crop info
  * @completions: structure of signal completions
+ * @flush_completions: structure of signal completions for flush cmd
  * @driver_cap: array of supported instance driver capabilities
  * @fw_cap: array of supported instance firmware capabilities
  * @buffers: array of different iris buffers
  * @fw_min_count: minimnum count of buffers needed by fw
+ * @state: instance state
  * @once_per_session_set: boolean to set once per session property
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
@@ -48,10 +50,12 @@ struct iris_inst {
 	struct v4l2_ctrl_handler	ctrl_handler;
 	struct iris_hfi_rect_desc	crop;
 	struct completion		completion;
+	struct completion               flush_completion;
 	struct platform_inst_driver_cap	driver_cap[INST_DRIVER_CAP_MAX];
 	struct platform_inst_fw_cap	fw_cap[INST_FW_CAP_MAX];
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;
+	enum iris_inst_state		state;
 	bool				once_per_session_set;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 2935b769abb7..3893e690d314 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -15,6 +15,7 @@
 #define CODED_FRAMES_PROGRESSIVE		0x0
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
+#define DEFAULT_FPS				30
 
 enum stage_type {
 	STAGE_1 = 1,
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 043aa0ee80b6..14a7f03a012c 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -3,8 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#include "iris_core.h"
-#include "iris_state.h"
+#include "iris_instance.h"
 
 void iris_change_core_state(struct iris_core *core,
 			    enum iris_core_state request_state)
@@ -13,3 +12,105 @@ void iris_change_core_state(struct iris_core *core,
 	core->state = request_state;
 	mutex_unlock(&core->lock);
 }
+
+static bool iris_allow_inst_state_change(struct iris_inst *inst,
+					 enum iris_inst_state req_state)
+{
+	switch (inst->state) {
+	case IRIS_INST_INIT:
+		if (req_state == IRIS_INST_INPUT_STREAMING ||
+		    req_state == IRIS_INST_OUTPUT_STREAMING ||
+		    req_state == IRIS_INST_DEINIT ||
+		    req_state == IRIS_INST_ERROR)
+			return true;
+		break;
+	case IRIS_INST_INPUT_STREAMING:
+		if (req_state == IRIS_INST_INIT ||
+		    req_state == IRIS_INST_STREAMING ||
+		    req_state == IRIS_INST_DEINIT ||
+		    req_state == IRIS_INST_ERROR)
+			return true;
+		break;
+	case IRIS_INST_OUTPUT_STREAMING:
+		if (req_state == IRIS_INST_INIT ||
+		    req_state == IRIS_INST_STREAMING ||
+		    req_state == IRIS_INST_DEINIT ||
+		    req_state == IRIS_INST_ERROR)
+			return true;
+		break;
+	case IRIS_INST_STREAMING:
+		if (req_state == IRIS_INST_INPUT_STREAMING ||
+		    req_state == IRIS_INST_OUTPUT_STREAMING ||
+		    req_state == IRIS_INST_DEINIT ||
+		    req_state == IRIS_INST_ERROR)
+			return true;
+		break;
+	case IRIS_INST_DEINIT:
+		if (req_state == IRIS_INST_INIT ||
+		    req_state == IRIS_INST_ERROR)
+			return true;
+		break;
+	default:
+		return false;
+	}
+
+	return false;
+}
+
+int iris_inst_change_state(struct iris_inst *inst,
+			   enum iris_inst_state request_state)
+{
+	if (inst->state == IRIS_INST_ERROR)
+		return 0;
+
+	if (inst->state == request_state)
+		return 0;
+
+	if (!iris_allow_inst_state_change(inst, request_state))
+		return -EINVAL;
+
+	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
+		inst->state, request_state);
+
+	inst->state = request_state;
+
+	return 0;
+}
+
+int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane)
+{
+	enum iris_inst_state new_state = IRIS_INST_ERROR;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		if (inst->state == IRIS_INST_INIT)
+			new_state = IRIS_INST_INPUT_STREAMING;
+		else if (inst->state == IRIS_INST_OUTPUT_STREAMING)
+			new_state = IRIS_INST_STREAMING;
+	} else if (V4L2_TYPE_IS_CAPTURE(plane)) {
+		if (inst->state == IRIS_INST_INIT)
+			new_state = IRIS_INST_OUTPUT_STREAMING;
+		else if (inst->state == IRIS_INST_INPUT_STREAMING)
+			new_state = IRIS_INST_STREAMING;
+	}
+
+	return iris_inst_change_state(inst, new_state);
+}
+
+int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane)
+{
+	enum iris_inst_state new_state = IRIS_INST_ERROR;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		if (inst->state == IRIS_INST_INPUT_STREAMING)
+			new_state = IRIS_INST_INIT;
+		else if (inst->state == IRIS_INST_STREAMING)
+			new_state = IRIS_INST_OUTPUT_STREAMING;
+	} else if (V4L2_TYPE_IS_CAPTURE(plane)) {
+		if (inst->state == IRIS_INST_OUTPUT_STREAMING)
+			new_state = IRIS_INST_INIT;
+		else if (inst->state == IRIS_INST_STREAMING)
+			new_state = IRIS_INST_INPUT_STREAMING;
+	}
+
+	return iris_inst_change_state(inst, new_state);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index 8bf22f839311..d6613970a24e 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -7,6 +7,7 @@
 #define _IRIS_STATE_H_
 
 struct iris_core;
+struct iris_inst;
 
 /**
  * enum iris_core_state
@@ -40,6 +41,60 @@ enum iris_core_state {
 	IRIS_CORE_ERROR,
 };
 
+/**
+ * enum iris_inst_state
+ *
+ * IRIS_INST_INIT: video instance is opened.
+ * IRIS_INST_INPUT_STREAMING: stream on is completed on output plane.
+ * IRIS_INST_OUTPUT_STREAMING: stream on is completed on capture plane.
+ * IRIS_INST_STREAMING: stream on is completed on both output and capture planes.
+ * IRIS_INST_DEINIT: video instance is closed.
+ * IRIS_INST_ERROR: error state.
+ *                    |
+ *                    V
+ *             -------------
+ *   +--------|     INIT    |----------+
+ *   |         -------------           |
+ *   |            ^   ^                |
+ *   |           /      \              |
+ *   |          /        \             |
+ *   |         v          v            |
+ *   |   -----------    -----------    |
+ *   |   |   INPUT         OUTPUT  |   |
+ *   |---| STREAMING     STREAMING |---|
+ *   |   -----------    -----------    |
+ *   |       ^            ^            |
+ *   |         \          /            |
+ *   |          \        /             |
+ *   |           v      v              |
+ *   |         -------------           |
+ *   |--------|  STREAMING |-----------|
+ *   |        -------------            |
+ *   |               |                 |
+ *   |               |                 |
+ *   |               v                 |
+ *   |          -----------            |
+ *   +-------->|  DEINIT   |<----------+
+ *   |          -----------            |
+ *   |               |                 |
+ *   |               |                 |
+ *   |               v                 |
+ *   |          ----------             |
+ *   +-------->|   ERROR |<------------+
+ *              ----------
+ */
+enum iris_inst_state {
+	IRIS_INST_DEINIT,
+	IRIS_INST_INIT,
+	IRIS_INST_INPUT_STREAMING,
+	IRIS_INST_OUTPUT_STREAMING,
+	IRIS_INST_STREAMING,
+	IRIS_INST_ERROR,
+};
 void iris_change_core_state(struct iris_core *core,
 			    enum iris_core_state request_state);
+int iris_inst_change_state(struct iris_inst *inst,
+			   enum iris_inst_state request_state);
+int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane);
+int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane);
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index d7e7c9852aca..47e210ef4beb 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -20,20 +20,23 @@ int iris_get_mbpf(struct iris_inst *inst)
 	return NUM_MBS_PER_FRAME(height, width);
 }
 
-int iris_wait_for_session_response(struct iris_inst *inst)
+int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 {
 	struct iris_core *core = inst->core;
 	u32 hw_response_timeout_val;
+	struct completion *done;
 	int ret;
 
 	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
+	done = is_flush ? &inst->flush_completion : &inst->completion;
 
 	mutex_unlock(&inst->lock);
-	ret = wait_for_completion_timeout(&inst->completion,
-					  msecs_to_jiffies(hw_response_timeout_val));
+	ret = wait_for_completion_timeout(done, msecs_to_jiffies(hw_response_timeout_val));
 	mutex_lock(&inst->lock);
-	if (!ret)
+	if (!ret) {
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
 		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index 1c1e109d9b5b..a4a797fb11e2 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -33,6 +33,6 @@ static inline enum iris_buffer_type iris_v4l2_type_to_driver(u32 type)
 
 int iris_get_mbpf(struct iris_inst *inst);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
-int iris_wait_for_session_response(struct iris_inst *inst);
+int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 3fd18b6773fd..03b533aef010 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -6,6 +6,7 @@
 #include "iris_buffer.h"
 #include "iris_instance.h"
 #include "iris_vb2.h"
+#include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
 
 int iris_vb2_queue_setup(struct vb2_queue *q,
@@ -27,10 +28,19 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
 
 	core = inst->core;
 	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
 
+	if (inst->state == IRIS_INST_STREAMING) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
 	if (*num_planes) {
 		if (*num_planes != f->fmt.pix_mp.num_planes ||
 		    sizes[0] < f->fmt.pix_mp.plane_fmt[0].sizeimage) {
@@ -62,6 +72,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 			dev_err(core->dev, "session open failed\n");
 			goto unlock;
 		}
+
+		ret = iris_inst_change_state(inst, IRIS_INST_INIT);
+		if (ret)
+			goto unlock;
 	}
 
 	buffers = &inst->buffers[buffer_type];
@@ -90,3 +104,68 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 
 	return ret;
 }
+
+int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct iris_inst *inst;
+	int ret = 0;
+
+	if (!q)
+		return -EINVAL;
+
+	inst = vb2_get_drv_priv(q);
+	if (!inst || !inst->core)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto error;
+	}
+
+	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
+	    !V4L2_TYPE_IS_CAPTURE(q->type)) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		ret = iris_vdec_streamon_input(inst);
+	else if (V4L2_TYPE_IS_CAPTURE(q->type))
+		ret = iris_vdec_streamon_output(inst);
+	if (ret)
+		goto error;
+
+	mutex_unlock(&inst->lock);
+
+	return ret;
+
+error:
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+void iris_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct iris_inst *inst;
+
+	if (!q)
+		return;
+
+	inst = vb2_get_drv_priv(q);
+	if (!inst)
+		return;
+
+	mutex_lock(&inst->lock);
+
+	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
+	    !V4L2_TYPE_IS_CAPTURE(q->type))
+		goto exit;
+
+	iris_vdec_session_streamoff(inst, q->type);
+
+exit:
+	mutex_unlock(&inst->lock);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
index 78157a97b86e..bc3bb830c2ba 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.h
+++ b/drivers/media/platform/qcom/iris/iris_vb2.h
@@ -9,4 +9,7 @@
 int iris_vb2_queue_setup(struct vb2_queue *q,
 			 unsigned int *num_buffers, unsigned int *num_planes,
 			 unsigned int sizes[], struct device *alloc_devs[]);
+int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count);
+void iris_vb2_stop_streaming(struct vb2_queue *q);
+
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index f82a337b8f43..a2c9e9481677 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -255,3 +255,78 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
 
 	return ret;
 }
+
+static void iris_vdec_kill_session(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+
+	if (!inst->session_id)
+		return;
+
+	hfi_ops->session_close(inst);
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
+}
+
+void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	int ret;
+
+	ret = hfi_ops->session_stop(inst, plane);
+	if (ret)
+		goto error;
+
+	ret = iris_inst_state_change_streamoff(inst, plane);
+	if (ret)
+		goto error;
+
+	return;
+
+error:
+	iris_vdec_kill_session(inst);
+}
+
+static int iris_vdec_process_streamon_input(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	int ret;
+
+	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	return iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+}
+
+int iris_vdec_streamon_input(struct iris_inst *inst)
+{
+	return iris_vdec_process_streamon_input(inst);
+}
+
+static int iris_vdec_process_streamon_output(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	int ret;
+
+	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		return ret;
+
+	return iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+}
+
+int iris_vdec_streamon_output(struct iris_inst *inst)
+{
+	int ret;
+
+	ret = iris_vdec_process_streamon_output(inst);
+	if (ret)
+		goto error;
+
+	return ret;
+
+error:
+	iris_vdec_session_streamoff(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index d7b8a0ad6fa8..b3299164f823 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -14,5 +14,8 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
+int iris_vdec_streamon_input(struct iris_inst *inst);
+int iris_vdec_streamon_output(struct iris_inst *inst);
+void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 1dd612b7cec5..2aad96bbaf94 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -164,10 +164,12 @@ int iris_open(struct file *filp)
 
 	inst->core = core;
 	inst->session_id = hash32_ptr(inst);
+	inst->state = IRIS_INST_DEINIT;
 
 	mutex_init(&inst->lock);
 	mutex_init(&inst->ctx_q_lock);
 	init_completion(&inst->completion);
+	init_completion(&inst->flush_completion);
 
 	ret = iris_v4l2_fh_init(inst);
 	if (ret)
@@ -221,6 +223,9 @@ static void iris_session_close(struct iris_inst *inst)
 	bool wait_for_response;
 	int ret;
 
+	if (inst->state == IRIS_INST_DEINIT)
+		return;
+
 	wait_for_response = true;
 
 	reinit_completion(&inst->completion);
@@ -230,7 +235,7 @@ static void iris_session_close(struct iris_inst *inst)
 		wait_for_response = false;
 
 	if (wait_for_response)
-		iris_wait_for_session_response(inst);
+		iris_wait_for_session_response(inst, false);
 }
 
 int iris_close(struct file *filp)
@@ -247,6 +252,7 @@ int iris_close(struct file *filp)
 	mutex_lock(&inst->lock);
 	iris_vdec_inst_deinit(inst);
 	iris_session_close(inst);
+	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
@@ -268,7 +274,14 @@ static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ret = iris_vdec_enum_fmt(inst, f);
+
+unlock:
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -284,7 +297,14 @@ static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_form
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ret = iris_vdec_try_fmt(inst, f);
+
+unlock:
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -300,7 +320,14 @@ static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ret = iris_vdec_s_fmt(inst, f);
+
+unlock:
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -316,6 +343,11 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	if (V4L2_TYPE_IS_OUTPUT(f->type))
 		memcpy(f, inst->fmt_src, sizeof(*f));
 	else if (V4L2_TYPE_IS_CAPTURE(f->type))
@@ -323,6 +355,7 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 	else
 		ret = -EINVAL;
 
+unlock:
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -342,6 +375,11 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	if (fsize->pixel_format != V4L2_PIX_FMT_H264 &&
 	    fsize->pixel_format != V4L2_PIX_FMT_NV12) {
 		ret = -EINVAL;
@@ -372,10 +410,17 @@ static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *ca
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
 	strscpy(cap->bus_info, IRIS_BUS_NAME, sizeof(cap->bus_info));
 	memset(cap->reserved, 0, sizeof(cap->reserved));
 	strscpy(cap->card, "iris_decoder", sizeof(cap->card));
+
+unlock:
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -392,6 +437,11 @@ static int iris_queryctrl(struct file *filp, void *fh, struct v4l2_queryctrl *q_
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, q_ctrl->id);
 	if (!ctrl) {
 		ret = -EINVAL;
@@ -421,6 +471,11 @@ static int iris_querymenu(struct file *filp, void *fh, struct v4l2_querymenu *qm
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, qmenu->id);
 	if (!ctrl) {
 		ret = -EINVAL;
@@ -458,6 +513,11 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		ret = -EINVAL;
@@ -495,7 +555,14 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 	inst = container_of(fh, struct iris_inst, fh);
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ret = iris_vdec_subscribe_event(inst, sub);
+
+unlock:
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -509,7 +576,14 @@ static int iris_unsubscribe_event(struct v4l2_fh *fh, const struct v4l2_event_su
 	inst = container_of(fh, struct iris_inst, fh);
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ret = v4l2_event_unsubscribe(&inst->fh, sub);
+
+unlock:
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -526,6 +600,8 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
 
 static const struct vb2_ops iris_vb2_ops = {
 	.queue_setup                    = iris_vb2_queue_setup,
+	.start_streaming                = iris_vb2_start_streaming,
+	.stop_streaming                 = iris_vb2_stop_streaming,
 };
 
 static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
@@ -545,6 +621,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_g_selection             = iris_g_selection,
 	.vidioc_subscribe_event         = iris_subscribe_event,
 	.vidioc_unsubscribe_event       = iris_unsubscribe_event,
+	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1



