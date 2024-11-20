Return-Path: <linux-media+bounces-21671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6439D3E43
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33A611F22384
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA901DDA3B;
	Wed, 20 Nov 2024 14:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SwaC2d1R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2EA1DACBA;
	Wed, 20 Nov 2024 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114146; cv=none; b=newSqFR2Eono1Dhqa53BOA7APTbruvL47VA+mJwwes+3+SD0NMJ8TttO/9gDy2L0iBOhlLhnBvovXqkrG27JPHeqWJIEyf7cCyin1miqxthZRfa9IuCAe6LVa5cUbXZUQWTkIQ1dIHOAhQ7hELiSLbwKzHz2WNR2QM/bs+rgado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114146; c=relaxed/simple;
	bh=AtTTwV1DqIGrzn0krmHUSdaXYV+uoTmDE2VLiKare4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Su1FjZOJj1PYd15KRaJOIhaX1f615dRucNSwy3HTMgI89j7UQNTJBZcMsMqXW+LJIug0MA7BKGDKv220OKBZQo9ptRGfxE3NDA6VVV+0EadCWp9c5WUqM6jUTIvwuBwpQ0hTmBZpLiMixucKTK/EeM0kJdHqJRx/IB9PXkVBz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SwaC2d1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FVjf005827;
	Wed, 20 Nov 2024 14:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nsd6NihEuNcFZcJzpOTeMhVs/rfuSj/u98YMz0VqLiM=; b=SwaC2d1R7U6eD9OQ
	r1inY/6LKADk7ohqB85c0k3z3Z6xHuVKQSNeR01QbWwbx2nZg59/0h0yEwU2NsIb
	NT6nHVryqyAfDzzCHcMgG49371Bo7zGXMdYCpwMWJYZYjnSxiKBfr9T9N1G8tIeu
	0lZkTRvxfZ/Ugz5IDUAU/fkKoFkPZC0VpSqJJQvGeKXyuenC6lSqyIW3J1Hz/4tt
	I4i3Fo/4QAQbDliNklbA150vEAwgK+Ppx77nM6PyWmcDcHE/+lsmWeTZfCFiiNJk
	qXD1ihvgQI7T3v9i+opZdtzpOjPPtujwg9K62Ay0nRiEUX0RXr1UrL2SAF3vXsi9
	ly6jlg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7x7hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:48:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKEmspU000821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:48:54 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 06:48:48 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Nov 2024 20:16:15 +0530
Subject: [PATCH v6 25/28] media: iris: implement power scaling for vpu2 and
 vpu3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-qcom-video-iris-v6-25-a8cf6704e992@quicinc.com>
References: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
In-Reply-To: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
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
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732113983; l=16259;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=SpYJvGIFWBasfDFw/paSp5MMd7vW9JtC6su4lkxCsmY=;
 b=oHe3kBAwPEoORlyADwuL0DZLQXbSh/iVjKeO9Fjj/5eEqcDt0syyEsCypoNpMJ7fgY/DJMmYG
 cOl6p7leuu7A7SpCYUxmMGhaxWVzxF5dTP5Xv19Q2AIttiQRQTA/t8q
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WEcxPaDgw3fhYWYLzSa8drmCiuDNTH4y
X-Proofpoint-GUID: WEcxPaDgw3fhYWYLzSa8drmCiuDNTH4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200098

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement power scaling including vpu2 and vpu3 specific calculation for
clock and bus bandwidth which depends on hardware configuration, codec
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
 drivers/media/platform/qcom/iris/iris_vb2.c        |   3 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |   7 ++
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  27 ++++
 drivers/media/platform/qcom/iris/iris_vpu3.c       |  38 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 12 files changed, 274 insertions(+)

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
index b77a138c0e6b..be781a3e5191 100644
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
index 4a747c6cf809..ed275626dc79 100644
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
index a5a7d6838d16..189dd081ad0a 100644
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
index 000000000000..55212660e72d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_power.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_POWER_H__
+#define __IRIS_POWER_H__
+
+struct iris_inst;
+
+int iris_scale_power(struct iris_inst *inst);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index f3b126accec9..3bdf7e6141a9 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -10,6 +10,7 @@
 #include "iris_instance.h"
 #include "iris_vb2.h"
 #include "iris_vdec.h"
+#include "iris_power.h"
 
 static int iris_check_core_mbpf(struct iris_inst *inst)
 {
@@ -187,6 +188,8 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 	}
 
+	iris_scale_power(inst);
+
 	ret = iris_check_session_supported(inst);
 	if (ret)
 		goto error;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 1ae0bb4830de..b6513c4d59a4 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -9,6 +9,7 @@
 #include "iris_buffer.h"
 #include "iris_ctrls.h"
 #include "iris_instance.h"
+#include "iris_power.h"
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
 
@@ -363,6 +364,8 @@ static int iris_vdec_process_streamon_input(struct iris_inst *inst)
 	enum iris_inst_sub_state set_sub_state = 0;
 	int ret;
 
+	iris_scale_power(inst);
+
 	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	if (ret)
 		return ret;
@@ -430,6 +433,8 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 	enum iris_inst_sub_state clear_sub_state = 0;
 	int ret = 0;
 
+	iris_scale_power(inst);
+
 	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
 
@@ -576,6 +581,8 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
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
index 10599f1fa789..b484638e6105 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -79,6 +79,44 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	iris_vpu_power_off_hw(core);
 }
 
+static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 height, width, mbs_per_second, mbpf;
+	u64 fw_cycles, fw_vpp_cycles;
+	u64 vsp_cycles, vpp_cycles;
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
+	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
+	/* 21 / 20 is minimum overhead factor */
+	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
+
+	/* 1.059 is multi-pipe overhead */
+	if (inst->fw_caps[PIPE].value > 1)
+		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
+
+	vsp_cycles = fps * data_size * 8;
+	vsp_cycles = div_u64(vsp_cycles, 2);
+	/* VSP FW overhead 1.05 */
+	vsp_cycles = div_u64(vsp_cycles * 21, 20);
+
+	if (inst->fw_caps[STAGE].value == STAGE_1)
+		vsp_cycles = vsp_cycles * 3;
+
+	return max3(vpp_cycles, vsp_cycles, fw_cycles);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.calc_freq = iris_vpu3_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index d3efa7c0ce9a..63fa1fa5a498 100644
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


