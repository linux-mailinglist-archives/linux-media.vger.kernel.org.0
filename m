Return-Path: <linux-media+bounces-19584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E625299C536
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62B8288D18
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CC915D5C5;
	Mon, 14 Oct 2024 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dEAFHuzW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B31B4F25;
	Mon, 14 Oct 2024 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896980; cv=none; b=Tbz/OEjA42ml3fZGmBBOFrGFW3LtyFpomlZJ7B8SV82FTwHfVEBdEimXcpy29oyWMGupS5OcssbQdzbWUE2aiYvOx/b6b0xqb7/3339caILleFJRdDBSx0UEirpHQW01wocoPmn/g8O7aACrqgucIDdDp1swePaECNKlaRLm6k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896980; c=relaxed/simple;
	bh=9jFgyK3F00jvGzeg3Ta82ZVJSP2p9iVPc7cEluPMX7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dGeKgoAWLEWskiUF1m+wYC3jZ66kosShHGh5PsWgFTWjxlqa72cjwcD+NXj/vr1uYMrGTTCZBuCqm+MCSVOBbUM9rSbeFslrGDtlFDvJQ2qH1rMQe+X29lGCAGw9mmudU/u7BbLQOE8yv/XMoFbjrUyBZhCs88QNtTtPrBoSjLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dEAFHuzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DNP3ht029651;
	Mon, 14 Oct 2024 09:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBLmT+EZ7E7Nz7umpWlbQNbvOUoVNHlxvljDCYYk5Gc=; b=dEAFHuzWjKIqW7zF
	jVls8iUiGuqrtRhho5ariWnmIv3bUGC870WES8J7OtfiJSilmO2Jks5lfMekIyEo
	l3EnSxvnxokkjU5Bql4AnadL7/w+6W8LVYRP14gL46JZc78Ydr+zT9IE6Y6UaM8H
	XR/5fnHkScjdw2sJvUs+u7ycRvqRH2VL6FCZpLrajoK7mofuNBja1EYVXUwnJUq4
	lKB6fVgEPd75w+ps4Wha89hgIfhclculJmXWKgBf13GsNQvbPcy0iWatAR1qW0nL
	wR0wx4Tu57VwHAq2H8Tt3zFCHGtikPg4mJWg8ktJXGB7t0O2iHIhNWde9OiPDtCI
	IDmXTA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427etec2af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E99V4J004917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:31 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:09:27 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:46 +0530
Subject: [PATCH v4 25/28] media: iris: implement power scaling for vpu2 and
 vpu3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-25-c5eaa4e9ab9e@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
In-Reply-To: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
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
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896854; l=16196;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=NhAVEyY8ACe4grLh7KVVt3Ez2r+QwqkA3VIl+G1C4gM=;
 b=E41GvuPlmlizX/1+QHMMIEiXJKjXBo8dgoe1Kcp8RmHgmehu/C7b29lZAyPpLgW28Uw+aVdIq
 IUgqh8HDQoPCrWlWdltkBEiqYsmZS9G6s2SzTTUuCntENMt+oLm3ip3
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CSQ-5Ss-mgVIaeaO_GpSWX5clIA_bSyZ
X-Proofpoint-GUID: CSQ-5Ss-mgVIaeaO_GpSWX5clIA_bSyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140066

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement power scaling including vpu2 and vpu3
specific calculation for clock and bus bandwidth
which depends on hardware configuration, codec
format, resolution and frame rate.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
 .../platform/qcom/iris/iris_platform_common.h      |  23 ++++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  12 ++
 drivers/media/platform/qcom/iris/iris_power.c      | 140 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_power.h      |  13 ++
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |   7 ++
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  27 ++++
 drivers/media/platform/qcom/iris/iris_vpu3.c       |  40 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 12 files changed, 275 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index ab16189aa9e6..ca31db847273 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,6 +10,7 @@ iris-objs += iris_buffer.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
              iris_platform_sm8550.o \
+             iris_power.o \
              iris_probe.o \
              iris_resources.o \
              iris_state.o \
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index a002675d15d7..3c90a88d7740 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -8,6 +8,7 @@
 
 #include "iris_buffer.h"
 #include "iris_instance.h"
+#include "iris_power.h"
 #include "iris_vpu_buffer.h"
 
 #define PIXELS_4K 4096
@@ -500,6 +501,8 @@ int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type bu
 	struct iris_buffer *buf;
 	int ret;
 
+	iris_scale_power(inst);
+
 	if (buf_type == BUF_INPUT) {
 		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
 			buf = to_iris_buffer(&buffer->vb);
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index dad7ca89e070..c23413cab30a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -33,6 +33,9 @@
  * @state: instance state
  * @sub_state: instance sub state
  * @once_per_session_set: boolean to set once per session property
+ * @max_input_data_size: max size of input data
+ * @power: structure of power info
+ * @icc_data: structure of interconnect data
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
  * @subscriptions: variable to hold current events subscriptions
@@ -61,6 +64,9 @@ struct iris_inst {
 	enum iris_inst_state		state;
 	enum iris_inst_sub_state	sub_state;
 	bool				once_per_session_set;
+	size_t				max_input_data_size;
+	struct iris_inst_power		power;
+	struct icc_vote_data		icc_data;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
 	unsigned int			subscriptions;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index eb329cd05174..c333a14f9c54 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -20,6 +20,8 @@ struct iris_inst;
 #define CODED_FRAMES_PROGRESSIVE		0x0
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
+#define DEFAULT_FPS				30
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -67,6 +69,10 @@ struct platform_inst_caps {
 	u32 min_frame_height;
 	u32 max_frame_height;
 	u32 max_mbpf;
+	u32 mb_cycles_vsp;
+	u32 mb_cycles_vpp;
+	u32 mb_cycles_fw;
+	u32 mb_cycles_fw_vpp;
 	u32 num_comv;
 };
 
@@ -106,11 +112,26 @@ struct platform_inst_fw_cap {
 		   enum platform_inst_fw_cap_type cap_id);
 };
 
+struct bw_info {
+	u32 mbs_per_sec;
+	u32 bw_ddr;
+};
+
 struct iris_core_power {
 	u64 clk_freq;
 	u64 icc_bw;
 };
 
+struct iris_inst_power {
+	u64 min_freq;
+	u32 icc_bw;
+};
+
+struct icc_vote_data {
+	u32 height, width;
+	u32 fps;
+};
+
 enum platform_pm_domain_type {
 	IRIS_CTRL_POWER_DOMAIN,
 	IRIS_HW_POWER_DOMAIN,
@@ -124,6 +145,8 @@ struct iris_platform_data {
 	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
+	const struct bw_info *bw_tbl_dec;
+	unsigned int bw_tbl_dec_size;
 	const char * const *pmdomain_tbl;
 	unsigned int pmdomain_tbl_size;
 	const char * const *opp_pd_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 68907ba6986f..d0891d89d8d8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -126,6 +126,9 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.min_frame_height = 96,
 	.max_frame_height = 8192,
 	.max_mbpf = (8192 * 4352) / 256,
+	.mb_cycles_vpp = 200,
+	.mb_cycles_fw = 489583,
+	.mb_cycles_fw_vpp = 66234,
 	.num_comv = 0,
 };
 
@@ -141,6 +144,13 @@ static const struct icc_info sm8550_icc_table[] = {
 
 static const char * const sm8550_clk_reset_table[] = { "bus" };
 
+static const struct bw_info sm8550_bw_table_dec[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
 static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
 
 static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
@@ -214,6 +224,8 @@ struct iris_platform_data sm8550_data = {
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
 	.pmdomain_tbl = sm8550_pmdomain_table,
 	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
 	.opp_pd_tbl = sm8550_opp_pd_table,
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
new file mode 100644
index 000000000000..dbca42df0910
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "iris_buffer.h"
+#include "iris_instance.h"
+#include "iris_power.h"
+#include "iris_resources.h"
+#include "iris_vpu_common.h"
+
+static u32 iris_calc_bw(struct iris_inst *inst, struct icc_vote_data *data)
+{
+	const struct bw_info *bw_tbl = NULL;
+	struct iris_core *core = inst->core;
+	u32 num_rows, i, mbs, mbps;
+	u32 icc_bw = 0;
+
+	mbs = DIV_ROUND_UP(data->height, 16) * DIV_ROUND_UP(data->width, 16);
+	mbps = mbs * data->fps;
+	if (mbps == 0)
+		goto exit;
+
+	bw_tbl = core->iris_platform_data->bw_tbl_dec;
+	num_rows = core->iris_platform_data->bw_tbl_dec_size;
+
+	for (i = 0; i < num_rows; i++) {
+		if (i != 0 && mbps > bw_tbl[i].mbs_per_sec)
+			break;
+
+		icc_bw = bw_tbl[i].bw_ddr;
+	}
+
+exit:
+	return icc_bw;
+}
+
+static int iris_set_interconnects(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+	u64 total_bw_ddr = 0;
+	int ret;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list) {
+		if (!instance->max_input_data_size)
+			continue;
+
+		total_bw_ddr += instance->power.icc_bw;
+	}
+
+	ret = iris_set_icc_bw(core, total_bw_ddr);
+
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
+
+static int iris_vote_interconnects(struct iris_inst *inst)
+{
+	struct icc_vote_data *vote_data = &inst->icc_data;
+	struct v4l2_format *inp_f = inst->fmt_src;
+
+	vote_data->width = inp_f->fmt.pix_mp.width;
+	vote_data->height = inp_f->fmt.pix_mp.height;
+	vote_data->fps = DEFAULT_FPS;
+
+	inst->power.icc_bw = iris_calc_bw(inst, vote_data);
+
+	return iris_set_interconnects(inst);
+}
+
+static int iris_set_clocks(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+	u64 freq = 0;
+	int ret;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list) {
+		if (!instance->max_input_data_size)
+			continue;
+
+		freq += instance->power.min_freq;
+	}
+
+	core->power.clk_freq = freq;
+	ret = dev_pm_opp_set_rate(core->dev, freq);
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
+
+static int iris_scale_clocks(struct iris_inst *inst)
+{
+	const struct vpu_ops *vpu_ops = inst->core->iris_platform_data->vpu_ops;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf;
+	size_t data_size = 0;
+
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
+		buf = to_iris_buffer(&buffer->vb);
+		data_size = max(data_size, buf->data_size);
+	}
+
+	inst->max_input_data_size = data_size;
+	if (!inst->max_input_data_size)
+		return 0;
+
+	inst->power.min_freq = vpu_ops->calc_freq(inst, inst->max_input_data_size);
+
+	return iris_set_clocks(inst);
+}
+
+int iris_scale_power(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	int ret;
+
+	if (pm_runtime_suspended(core->dev)) {
+		ret = pm_runtime_resume_and_get(core->dev);
+		if (ret < 0)
+			return ret;
+
+		pm_runtime_put_autosuspend(core->dev);
+	}
+
+	ret = iris_scale_clocks(inst);
+	if (ret)
+		return ret;
+
+	return iris_vote_interconnects(inst);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_power.h b/drivers/media/platform/qcom/iris/iris_power.h
new file mode 100644
index 000000000000..8718efdcafc0
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_power.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_POWER_H_
+#define _IRIS_POWER_H_
+
+struct iris_inst;
+
+int iris_scale_power(struct iris_inst *inst);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 19ac300981c6..65fc15795144 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -11,6 +11,7 @@
 #include "iris_instance.h"
 #include "iris_vb2.h"
 #include "iris_vdec.h"
+#include "iris_power.h"
 #include "iris_vpu_buffer.h"
 
 static int iris_check_core_mbpf(struct iris_inst *inst)
@@ -214,6 +215,7 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 	}
 
+	iris_scale_power(inst);
 
 	ret = iris_check_session_supported(inst);
 	if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9d6810e7b752..019c2bdf4cc0 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -9,6 +9,7 @@
 #include "iris_buffer.h"
 #include "iris_ctrls.h"
 #include "iris_instance.h"
+#include "iris_power.h"
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
 
@@ -379,6 +380,8 @@ static int iris_vdec_process_streamon_input(struct iris_inst *inst)
 	enum iris_inst_sub_state set_sub_state = 0;
 	int ret;
 
+	iris_scale_power(inst);
+
 	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	if (ret)
 		return ret;
@@ -446,6 +449,8 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 	enum iris_inst_sub_state clear_sub_state = 0;
 	int ret = 0;
 
+	iris_scale_power(inst);
+
 	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
 
@@ -595,6 +600,8 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	iris_scale_power(inst);
+
 	return iris_queue_buffer(inst, buf);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index bd8427411576..8f502aed43ce 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -6,6 +6,33 @@
 #include "iris_instance.h"
 #include "iris_vpu_common.h"
 
+static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
+	.calc_freq = iris_vpu2_calc_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
index 10599f1fa789..32c31c798c42 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -79,6 +79,46 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	iris_vpu_power_off_hw(core);
 }
 
+static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 height, width, mbs_per_second, mbpf;
+	u64 vsp_cycles, vpp_cycles, fw_cycles;
+	u64 fw_vpp_cycles, bitrate, freq;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	fw_cycles = fps * caps->mb_cycles_fw;
+	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
+
+	vpp_cycles = mbs_per_second * caps->mb_cycles_vpp /
+		inst->fw_caps[PIPE].value;
+	vpp_cycles += max(vpp_cycles / 20, fw_vpp_cycles);
+
+	if (inst->fw_caps[PIPE].value > 1)
+		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
+
+	bitrate = fps * data_size * 8;
+	vsp_cycles = bitrate;
+
+	vsp_cycles = div_u64(vsp_cycles, 2);
+	vsp_cycles = div_u64(vsp_cycles * 21, 20);
+
+	if (inst->fw_caps[STAGE].value == STAGE_1)
+		vsp_cycles = vsp_cycles * 3;
+
+	freq = max3(vpp_cycles, vsp_cycles, fw_cycles);
+
+	return freq;
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.calc_freq = iris_vpu3_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 525bbb52dd79..fce17351ed67 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
+	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.34.1


