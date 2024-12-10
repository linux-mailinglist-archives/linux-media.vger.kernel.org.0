Return-Path: <linux-media+bounces-23039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2CF9EAF45
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858902828A0
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 11:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B802922FE08;
	Tue, 10 Dec 2024 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YYyjzIrY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C41A212D8E;
	Tue, 10 Dec 2024 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828851; cv=none; b=vGEGPEWOXzg5Axn85H/0oO5p2v4VBI8HS1SXsVnGD2O8p8CBoBicipI7o2i6YQLEaEU62FCCdsEhW+ZxwDUqUhicjriccpF77TfPuAWnz0bypgoQHVu9LCOTDpdPWisiOCe2EMDkRiLHssytjjkNRvJr7EMMVLCk+LrAKch8HbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828851; c=relaxed/simple;
	bh=RaXa5jBYfUIRxMTXornvDOVxYUz3172mtHWBKCv0k6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LsFMO2bm24I4/rILk/zZNeFSafVbEI3A1LtFefDF0ZrtaQFfpRCgZWLw7sB9hm9CjhxttuLb5EQo/XxUMZb1/bGq2euh5RFbemgI0fVWGVNBMcL8c19dvOMVBk5L1qTKwHwTLZygv7XKa0443vmGnuiRXMPCAuOvvRFmEfuA+cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YYyjzIrY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA7gJkO022987;
	Tue, 10 Dec 2024 11:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlbZwNiFw8UQsIKi552ObOoKM0OULXiJ4XuLOmDUWQY=; b=YYyjzIrYZJOviEe7
	jguYi75Ep2OIIEGyL7jx67rW7XjZZQqwyvZNXw3anJvIlUBvOMms79ZYfSS6Rbkc
	REUdhKHym3qBzKf+P/z9H7FKgZR9EPHT5FywntENo0ZWfrDiASw+KAjvi8e7zj07
	EOaNNwaG9z3GIQVZgS6zzVJPjkxIcOf1mTwR2Oe04elJxqfQ6OQ4xsdvkkidiphh
	gVn3CpHvWhqnthcydjpnoMCgGl5sxFWqVzF1RsCmViWe7RtHZ1TZ/Q4SubAKt8gC
	Qz9BW1uPmuAA+/nkhc/tgzkjIjnL1Q45H3IZ2wqpfnrDq6tPxhdmxCfzLQuE5wf6
	FX0zSQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e5c7tawx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:07:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAB7FWC016617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:07:15 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 03:07:09 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 10 Dec 2024 16:35:20 +0530
Subject: [PATCH v8 16/28] media: iris: implement vb2 streaming ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-qcom-video-iris-v8-16-42c5403cb1a3@quicinc.com>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733828732; l=36807;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=RaXa5jBYfUIRxMTXornvDOVxYUz3172mtHWBKCv0k6k=;
 b=VdfZyZLlZQo10YeM/JigeiBKW09XXfJZvZzD8FCoca/VjaiSC3WswTjZV6fyP+kiFpzzOOcr6
 GAUZrf7CyLDAtS3O9s531Q/bfxHzld2+JTLulBwp+xcbwFdb6wWLpwd
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tF4ZHalDTvjIy85U-WqC_KKNUKDALn14
X-Proofpoint-ORIG-GUID: tF4ZHalDTvjIy85U-WqC_KKNUKDALn14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100083

In stream on, send HFI_CMD_START on capture and output planes to start
the processing on respective planes.

During stream off, send HFI_CMD_STOP to firmware which is a synchronous
command. After the response is received from firmware, the session is
closed on firmware.

Introduce different states for instance and state transitions.

IRIS_INST_INIT - video instance is opened.
IRIS_INST_INPUT_STREAMING - stream on is completed on output plane.
IRIS_INST_OUTPUT_STREAMING - stream on is completed on capture plane.
IRIS_INST_STREAMING - stream on is completed on both output and capture
planes.
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

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  82 +++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 +++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  39 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  61 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  32 ++++++-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 drivers/media/platform/qcom/iris/iris_state.c      | 104 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_state.h      |  58 ++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  11 ++-
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  70 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vb2.h        |   3 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  75 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  12 ++-
 18 files changed, 573 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index f685d76c2f79..ab16189aa9e6 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ iris-objs += iris_buffer.o \
              iris_platform_sm8550.o \
              iris_probe.o \
              iris_resources.o \
+             iris_state.o \
              iris_utils.o \
              iris_vidc.o \
              iris_vb2.o \
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index eaa2db469c74..8b1c4d156cf2 100644
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
index 7ee69c5223ce..a3b09e8d1f49 100644
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
+	struct hfi_session_flush_pkt flush_pkt;
+	struct iris_core *core = inst->core;
+	struct hfi_session_pkt pkt;
+	u32 flush_type = 0;
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
index 3640f8504db9..1b2bf6afc6ce 100644
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
@@ -31,6 +37,9 @@
 #define HFI_EVENT_SYS_ERROR				0x1
 #define HFI_EVENT_SESSION_ERROR				0x2
 
+#define HFI_FLUSH_OUTPUT				0x1000002
+#define HFI_FLUSH_OUTPUT2				0x1000003
+#define HFI_FLUSH_ALL					0x1000004
 #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
 #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
 
@@ -41,6 +50,11 @@
 #define HFI_MSG_SYS_PROPERTY_INFO			0x2000a
 
 #define HFI_MSG_EVENT_NOTIFY				0x21001
+#define HFI_MSG_SESSION_LOAD_RESOURCES			0x221001
+#define HFI_MSG_SESSION_START				0x221002
+#define HFI_MSG_SESSION_STOP				0x221003
+#define HFI_MSG_SESSION_FLUSH				0x221006
+#define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 
 struct hfi_pkt_hdr {
 	u32 size;
@@ -83,6 +97,11 @@ struct hfi_sys_pc_prep_pkt {
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
@@ -116,6 +135,11 @@ struct hfi_msg_sys_property_info_pkt {
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
index 18ba5f67dd36..db5858ec04ea 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -11,6 +11,7 @@ static void
 iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
 {
 	struct hfi_msg_event_notify_pkt *pkt = packet;
+	struct iris_inst *instance;
 
 	if (pkt->event_id == HFI_EVENT_SYS_ERROR)
 		dev_err(core->dev, "sys error (type: %x, session id:%x, data1:%x, data2:%x)\n",
@@ -18,6 +19,12 @@ iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
 			pkt->event_data2);
 
 	core->state = IRIS_CORE_ERROR;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list)
+		iris_inst_change_state(instance, IRIS_INST_ERROR);
+	mutex_unlock(&core->lock);
+
 	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
 }
 
@@ -44,6 +51,7 @@ iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct hfi_msg_event_n
 			pkt->event_data2, pkt->event_data1,
 			pkt->shdr.session_id);
 		iris_vb2_queue_error(inst);
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
 		break;
 	}
 }
@@ -148,6 +156,26 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
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
@@ -156,6 +184,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
 	struct device *dev = core->dev;
 	struct hfi_session_pkt *pkt;
+	struct completion *done;
 	struct iris_inst *inst;
 	bool found = false;
 	u32 i;
@@ -205,7 +234,15 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
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
 
 		break;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a08e844bb4bb..b0557917fc52 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -85,6 +85,18 @@ static int iris_hfi_gen2_sys_pc_prep(struct iris_core *core)
 	return ret;
 }
 
+static u32 iris_hfi_gen2_get_port(u32 plane)
+{
+	switch (plane) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		return HFI_PORT_BITSTREAM;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		return HFI_PORT_RAW;
+	default:
+		return HFI_PORT_NONE;
+	}
+}
+
 static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
@@ -124,6 +136,9 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	int ret;
 
+	if (inst->state != IRIS_INST_DEINIT)
+		return -EALREADY;
+
 	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
 	if (!inst_hfi_gen2->packet)
 		return -ENOMEM;
@@ -188,12 +203,58 @@ static int iris_hfi_gen2_session_close(struct iris_inst *inst)
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
index 173a554a0d44..930dbae49dfa 100644
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
index e1c43daea6c7..53b700ef852e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -101,6 +101,7 @@ static int iris_hfi_gen2_handle_session_error(struct iris_inst *inst,
 
 	dev_err(core->dev, "session error received %#x: %s\n", pkt->type, error);
 	iris_vb2_queue_error(inst);
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
 
 	return 0;
 }
@@ -108,9 +109,17 @@ static int iris_hfi_gen2_handle_session_error(struct iris_inst *inst,
 static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
 					     struct iris_hfi_packet *pkt)
 {
+	struct iris_inst *instance;
+
 	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
 
 	core->state = IRIS_CORE_ERROR;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list)
+		iris_inst_change_state(instance, IRIS_INST_ERROR);
+	mutex_unlock(&core->lock);
+
 	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
 
 	return 0;
@@ -129,20 +138,32 @@ static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
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
@@ -247,8 +268,11 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
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
index 9f1a1e5ba7c7..6b88daf31011 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -26,9 +26,11 @@
  * @ctrl_handler: reference of v4l2 ctrl handler
  * @crop: structure of crop info
  * @completion: structure of signal completions
+ * @flush_completion: structure of signal completions for flush cmd
  * @fw_caps: array of supported instance firmware capabilities
  * @buffers: array of different iris buffers
  * @fw_min_count: minimnum count of buffers needed by fw
+ * @state: instance state
  * @once_per_session_set: boolean to set once per session property
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
@@ -46,9 +48,11 @@ struct iris_inst {
 	struct v4l2_ctrl_handler	ctrl_handler;
 	struct iris_hfi_rect_desc	crop;
 	struct completion		completion;
+	struct completion		flush_completion;
 	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;
+	enum iris_inst_state		state;
 	bool				once_per_session_set;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
new file mode 100644
index 000000000000..44362e8fe18f
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_instance.h"
+
+static bool iris_allow_inst_state_change(struct iris_inst *inst,
+					 enum iris_inst_state req_state)
+{
+	switch (inst->state) {
+	case IRIS_INST_INIT:
+		if (req_state == IRIS_INST_INPUT_STREAMING ||
+		    req_state == IRIS_INST_OUTPUT_STREAMING ||
+		    req_state == IRIS_INST_DEINIT)
+			return true;
+		return false;
+	case IRIS_INST_INPUT_STREAMING:
+		if (req_state == IRIS_INST_INIT ||
+		    req_state == IRIS_INST_STREAMING ||
+		    req_state == IRIS_INST_DEINIT)
+			return true;
+		return false;
+	case IRIS_INST_OUTPUT_STREAMING:
+		if (req_state == IRIS_INST_INIT ||
+		    req_state == IRIS_INST_STREAMING ||
+		    req_state == IRIS_INST_DEINIT)
+			return true;
+		return false;
+	case IRIS_INST_STREAMING:
+		if (req_state == IRIS_INST_INPUT_STREAMING ||
+		    req_state == IRIS_INST_OUTPUT_STREAMING ||
+		    req_state == IRIS_INST_DEINIT)
+			return true;
+		return false;
+	case IRIS_INST_DEINIT:
+		if (req_state == IRIS_INST_INIT)
+			return true;
+		return false;
+	default:
+		return false;
+	}
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
+	if (request_state == IRIS_INST_ERROR)
+		goto change_state;
+
+	if (!iris_allow_inst_state_change(inst, request_state))
+		return -EINVAL;
+
+change_state:
+	inst->state = request_state;
+	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
+		inst->state, request_state);
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
index 1ffe6fe706bd..0bf9d0e063ac 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -6,6 +6,8 @@
 #ifndef __IRIS_STATE_H__
 #define __IRIS_STATE_H__
 
+struct iris_inst;
+
 /**
  * enum iris_core_state
  *
@@ -38,4 +40,60 @@ enum iris_core_state {
 	IRIS_CORE_ERROR,
 };
 
+/**
+ * enum iris_inst_state
+ *
+ * @IRIS_INST_INIT: video instance is opened.
+ * @IRIS_INST_INPUT_STREAMING: stream on is completed on output plane.
+ * @IRIS_INST_OUTPUT_STREAMING: stream on is completed on capture plane.
+ * @IRIS_INST_STREAMING: stream on is completed on both output and capture planes.
+ * @IRIS_INST_DEINIT: video instance is closed.
+ * @IRIS_INST_ERROR: error state.
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
+
+int iris_inst_change_state(struct iris_inst *inst,
+			   enum iris_inst_state request_state);
+int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane);
+int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane);
+
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index d5c8e052922c..4833830f30d5 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -17,20 +17,23 @@ int iris_get_mbpf(struct iris_inst *inst)
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
index 26649b66d978..40658a6643cf 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -29,6 +29,6 @@ static inline enum iris_buffer_type iris_v4l2_type_to_driver(u32 type)
 
 int iris_get_mbpf(struct iris_inst *inst);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
-int iris_wait_for_session_response(struct iris_inst *inst);
+int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index e9db44515d91..b93da860d336 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -5,6 +5,7 @@
 
 #include "iris_instance.h"
 #include "iris_vb2.h"
+#include "iris_vdec.h"
 
 int iris_vb2_queue_setup(struct vb2_queue *q,
 			 unsigned int *num_buffers, unsigned int *num_planes,
@@ -18,6 +19,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 	inst = vb2_get_drv_priv(q);
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto unlock;
+	}
 
 	core = inst->core;
 	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
@@ -38,6 +43,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 			dev_err(core->dev, "session open failed\n");
 			goto unlock;
 		}
+
+		ret = iris_inst_change_state(inst, IRIS_INST_INIT);
+		if (ret)
+			goto unlock;
 	}
 
 	*num_planes = 1;
@@ -48,3 +57,64 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 
 	return ret;
 }
+
+int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct iris_inst *inst;
+	int ret = 0;
+
+	inst = vb2_get_drv_priv(q);
+
+	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
+		return 0;
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
+	inst = vb2_get_drv_priv(q);
+
+	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
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
index d2e71d0596cc..3906510fa71f 100644
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
index 132b578b34dc..92651d86376d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -222,3 +222,78 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
 
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
index 9f08a13cb6bb..a17bb817b6e5 100644
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
index 5b54231f2def..1d10c430c795 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -145,10 +145,12 @@ int iris_open(struct file *filp)
 
 	inst->core = core;
 	inst->session_id = hash32_ptr(inst);
+	inst->state = IRIS_INST_DEINIT;
 
 	mutex_init(&inst->lock);
 	mutex_init(&inst->ctx_q_lock);
 	init_completion(&inst->completion);
+	init_completion(&inst->flush_completion);
 
 	iris_v4l2_fh_init(inst);
 
@@ -194,6 +196,9 @@ static void iris_session_close(struct iris_inst *inst)
 	bool wait_for_response = true;
 	int ret;
 
+	if (inst->state == IRIS_INST_DEINIT)
+		return;
+
 	reinit_completion(&inst->completion);
 
 	ret = hfi_ops->session_close(inst);
@@ -201,7 +206,7 @@ static void iris_session_close(struct iris_inst *inst)
 		wait_for_response = false;
 
 	if (wait_for_response)
-		iris_wait_for_session_response(inst);
+		iris_wait_for_session_response(inst, false);
 }
 
 int iris_close(struct file *filp)
@@ -214,6 +219,7 @@ int iris_close(struct file *filp)
 	mutex_lock(&inst->lock);
 	iris_vdec_inst_deinit(inst);
 	iris_session_close(inst);
+	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
@@ -356,6 +362,8 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
 
 static const struct vb2_ops iris_vb2_ops = {
 	.queue_setup                    = iris_vb2_queue_setup,
+	.start_streaming                = iris_vb2_start_streaming,
+	.stop_streaming                 = iris_vb2_stop_streaming,
 };
 
 static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
@@ -373,6 +381,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_g_selection             = iris_g_selection,
 	.vidioc_subscribe_event         = iris_subscribe_event,
 	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
+	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


