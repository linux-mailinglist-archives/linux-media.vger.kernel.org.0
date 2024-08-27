Return-Path: <linux-media+bounces-16911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF31B960709
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F2771F2060D
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF551A4F11;
	Tue, 27 Aug 2024 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UI0HtRYV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0A1A2C1D;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753197; cv=none; b=oc1HkteEYfHwiLNJs3nSlBqOdBiVrMD2exLjGhbamhuFGcNgeiGRqT4ac6dOiHBasAQl6d6HR2d0PJb51WOl3ZsGvmkwe9f+QDouRJRFyH4p0h4gDPQ/pr7+zQjl2VXH9UdeCOrKhvuj97PIT7KYeDZeRXzqjCZIsnmfFo+or1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753197; c=relaxed/simple;
	bh=sRcEnTMGMEtOIyGmwRWTi2XXDHk0JS4ehbiTCWQc8H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjfmbgcHWlRPWZffiNaNOAXgHb7Cuzc/4ZQ97xvfxxNKvvMG37eB7aoaIjW7Gvncn4biQ+UGfdcs3hnZTv/WUJCtWlbv6G2Jx+tNJqA75My3oIDa66LfXOiyVEbMWvxgwx++B4Tt7klbK2KvwdrbJ8oP3MOSs6z9e2pOMtbqJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UI0HtRYV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D23F2C4FEF0;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753196;
	bh=sRcEnTMGMEtOIyGmwRWTi2XXDHk0JS4ehbiTCWQc8H4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UI0HtRYV98DmWIuAbtMafLw0z5OHTdMT5AnWvZlPAGbEePm81oe5Lvp+TNpBlrVuN
	 Ba4RNuFUQeFjL1+XQrJcxUuM49ULQiDml/eB0XO55ZM3ngW/Lc2DjfIJRPgogIu3MC
	 JV8jhusLUAmqystZbKivNlqhOD9RdxReMrDHQH93pAActFC5FN/tMgZnfi5odDRllI
	 b8FIaqxZq+c72nVLwlStlG46iJpYRLcaodmKUO0pbFgYv1EJcmsYmsQ6AHHuG7PIkR
	 07dZy2wFgmYQ10UWzUgfOhHij77Zdw2sw0nWCwDtOVdpGjgvyTIfclJbeOJB9tVndY
	 SV87sMe56eXYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C809EC54734;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:52 +0530
Subject: [PATCH v3 27/29] media: iris: implement power scaling for vpu2 and
 vpu3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-27-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=17651;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=ZMt5f7w2pDYigrH3LIYCwefJwvOPDMibnmpDxsQCOW4=;
 b=idJNBi9tdLUjcJ8SzR40vRA/coP1eGvxI1ootl9thRzzEMQstiuznQmafq7S0+NCNfUjHZY2f
 oKjwbV0oeTuCWuydd45TsBXeQpZTyhKJDGNLnAtnkgjkjnW3VQaB2Z+
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement power scaling including vpu2 and vpu3
specific calculation for clock and bus bandwidth
which depends on hardware configuration, codec
format, resolution and frame rate.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
 .../platform/qcom/iris/iris_platform_common.h      |  21 +++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  21 +++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  27 ++++
 drivers/media/platform/qcom/iris/iris_power.c      | 149 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_power.h      |   3 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   3 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |   7 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  28 ++++
 drivers/media/platform/qcom/iris/iris_vpu3.c       |  46 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 12 files changed, 313 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 3a11930a8076..8b874e0ad628 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -8,6 +8,7 @@
 
 #include "iris_buffer.h"
 #include "iris_instance.h"
+#include "iris_power.h"
 #include "iris_vpu_buffer.h"
 
 #define PIXELS_4K 4096
@@ -510,6 +511,8 @@ int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type bu
 	struct iris_buffer *buf = NULL;
 	int ret;
 
+	iris_scale_power(inst);
+
 	if (buf_type == BUF_INPUT) {
 		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
 			buf = to_iris_buffer(&buffer->vb);
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index dd1dad586a69..6ca16f855955 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -34,6 +34,9 @@
  * @state: instance state
  * @sub_state: instance sub state
  * @once_per_session_set: boolean to set once per session property
+ * @max_input_data_size: max size of input data
+ * @power: structure of power info
+ * @icc_data: structure of interconnect data
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
  * @subscriptions: variable to hold current events subscriptions
@@ -59,6 +62,9 @@ struct iris_inst {
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
index 2abc96d56a4b..32d7b04181e2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -68,6 +68,10 @@ enum platform_inst_driver_cap_type {
 	FRAME_WIDTH = 1,
 	FRAME_HEIGHT,
 	MBPF,
+	MB_CYCLES_VPP,
+	MB_CYCLES_VSP,
+	MB_CYCLES_FW,
+	MB_CYCLES_FW_VPP,
 	NUM_COMV,
 	INST_DRIVER_CAP_MAX,
 };
@@ -117,11 +121,26 @@ struct platform_inst_fw_cap {
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
+	int height, width;
+	u32 fps;
+};
+
 enum platform_pm_domain_type {
 	IRIS_CTRL_POWER_DOMAIN,
 	IRIS_HW_POWER_DOMAIN,
@@ -135,6 +154,8 @@ struct iris_platform_data {
 	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
+	const struct bw_info *bw_tbl_dec;
+	unsigned int bw_tbl_dec_size;
 	const char * const *pmdomain_tbl;
 	unsigned int pmdomain_tbl_size;
 	const char * const *opp_pd_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 81f8366bcdd2..5dcc39598853 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -30,6 +30,18 @@ static struct platform_inst_driver_cap instance_driver_cap_data_sm8250[] = {
 		.max = 138240,
 		.value = 138240,
 	},
+	{
+		.cap_id = MB_CYCLES_VPP,
+		.min = 200,
+		.max = 200,
+		.value = 200,
+	},
+	{
+		.cap_id = MB_CYCLES_VSP,
+		.min = 25,
+		.max = 25,
+		.value = 25,
+	},
 };
 
 static struct platform_inst_fw_cap instance_fw_cap_data_sm8250[] = {
@@ -77,6 +89,13 @@ static const struct icc_info sm8250_icc_table[] = {
 
 static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
 
+static const struct bw_info sm8250_bw_table_dec[] = {
+	{ ((4096 * 2160) / 256) * 60, 2403000 },
+	{ ((4096 * 2160) / 256) * 30, 1224000 },
+	{ ((1920 * 1080) / 256) * 60,  812000 },
+	{ ((1920 * 1080) / 256) * 30,  416000 },
+};
+
 static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
 
 static const char * const sm8250_opp_pd_table[] = { "mx" };
@@ -124,6 +143,8 @@ struct iris_platform_data sm8250_data = {
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
 	.pmdomain_tbl = sm8250_pmdomain_table,
 	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
 	.opp_pd_tbl = sm8250_opp_pd_table,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 1b7644fdd21b..1a1e112f3e97 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -32,6 +32,24 @@ static struct platform_inst_driver_cap instance_driver_cap_data_sm8550[] = {
 		.max = 138240,
 		.value = 138240,
 	},
+	{
+		.cap_id = MB_CYCLES_VPP,
+		.min = 200,
+		.max = 200,
+		.value = 200,
+	},
+	{
+		.cap_id = MB_CYCLES_FW,
+		.min = 489583,
+		.max = 489583,
+		.value = 489583,
+	},
+	{
+		.cap_id = MB_CYCLES_FW_VPP,
+		.min = 66234,
+		.max = 66234,
+		.value = 66234,
+	},
 	{
 		.cap_id = NUM_COMV,
 		.min = 0,
@@ -170,6 +188,13 @@ static const struct icc_info sm8550_icc_table[] = {
 
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
@@ -243,6 +268,8 @@ struct iris_platform_data sm8550_data = {
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
 	.pmdomain_tbl = sm8550_pmdomain_table,
 	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
 	.opp_pd_tbl = sm8550_opp_pd_table,
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index e697c27c8a8a..276637a48df5 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -3,10 +3,157 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#include "iris_core.h"
+#include <linux/pm_runtime.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "iris_buffer.h"
+#include "iris_instance.h"
 #include "iris_power.h"
+#include "iris_resources.h"
 #include "iris_vpu_common.h"
 
+static u32 iris_calc_bw(struct iris_inst *inst, struct icc_vote_data *data)
+{
+	const struct bw_info *bw_tbl = NULL;
+	struct iris_core *core = inst->core;
+	unsigned int num_rows = 0;
+	unsigned int i, mbs, mbps;
+	u32 icc_bw = 0;
+
+	if (!data)
+		goto exit;
+
+	mbs = DIV_ROUND_UP(data->height, 16) * DIV_ROUND_UP(data->width, 16);
+	mbps = mbs * data->fps;
+	if (mbps == 0)
+		goto exit;
+
+	bw_tbl = core->iris_platform_data->bw_tbl_dec;
+	num_rows = core->iris_platform_data->bw_tbl_dec_size;
+
+	if (!bw_tbl || num_rows == 0)
+		goto exit;
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
+	struct v4l2_format *inp_f;
+	struct icc_vote_data *vote_data;
+
+	vote_data = &inst->icc_data;
+
+	inp_f = inst->fmt_src;
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
+	int ret = 0;
+	u64 freq;
+
+	mutex_lock(&core->lock);
+
+	freq = 0;
+	list_for_each_entry(instance, &core->instances, list) {
+		if (!instance->max_input_data_size)
+			continue;
+
+		freq += instance->power.min_freq;
+	}
+
+	core->power.clk_freq = freq;
+
+	ret = iris_opp_set_rate(core, freq);
+
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
+	struct iris_buffer *buf = NULL;
+	size_t data_size = 0;
+
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
+		buf = to_iris_buffer(&buffer->vb);
+		data_size = max(data_size, buf->data_size);
+	}
+
+	inst->max_input_data_size = data_size;
+
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
+
 void iris_power_off(struct iris_core *core)
 {
 	if (!core->power_enabled)
diff --git a/drivers/media/platform/qcom/iris/iris_power.h b/drivers/media/platform/qcom/iris/iris_power.h
index ff9b6be3b086..0a7ce1772893 100644
--- a/drivers/media/platform/qcom/iris/iris_power.h
+++ b/drivers/media/platform/qcom/iris/iris_power.h
@@ -6,8 +6,9 @@
 #ifndef _IRIS_POWER_H_
 #define _IRIS_POWER_H_
 
-struct iris_core;
+struct iris_inst;
 
+int iris_scale_power(struct iris_inst *inst);
 int iris_power_on(struct iris_core *core);
 void iris_power_off(struct iris_core *core);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 9dfbd0d66b61..974fce49d8fb 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -11,6 +11,7 @@
 #include "iris_instance.h"
 #include "iris_vb2.h"
 #include "iris_vdec.h"
+#include "iris_power.h"
 #include "iris_vpu_buffer.h"
 
 static int iris_check_core_mbpf(struct iris_inst *inst)
@@ -220,6 +221,8 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 	}
 
+	iris_scale_power(inst);
+
 	ret = iris_check_session_supported(inst);
 	if (ret)
 		goto error;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index b8d2d6846daa..4b8670612dab 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -9,6 +9,7 @@
 #include "iris_buffer.h"
 #include "iris_ctrls.h"
 #include "iris_instance.h"
+#include "iris_power.h"
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
 
@@ -388,6 +389,8 @@ static int iris_vdec_process_streamon_input(struct iris_inst *inst)
 	enum iris_inst_sub_state set_sub_state = IRIS_INST_SUB_NONE;
 	int ret;
 
+	iris_scale_power(inst);
+
 	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	if (ret)
 		return ret;
@@ -461,6 +464,8 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 	bool drain_active = false, drc_active = false;
 	int ret;
 
+	iris_scale_power(inst);
+
 	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
 
@@ -598,6 +603,8 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	if (ret)
 		return ret;
 
+	iris_scale_power(inst);
+
 	return iris_queue_buffer(inst, buf);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index bd8427411576..2e0777a3bf68 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -6,6 +6,34 @@
 #include "iris_instance.h"
 #include "iris_vpu_common.h"
 
+static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
+{
+	unsigned long vpp_freq = 0, vsp_freq = 0;
+	u32 fps, mbpf, height = 0, width = 0;
+	struct v4l2_format *inp_f;
+	u32 mbs_per_second;
+
+	inp_f = inst->fmt_src;
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	fps = DEFAULT_FPS;
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * inst->driver_cap[MB_CYCLES_VPP].value;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * inst->driver_cap[MB_CYCLES_VSP].value;
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
index 414b8ec67b33..8cff853044aa 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -74,6 +74,52 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	iris_vpu_power_off_hw(core);
 }
 
+static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	u64 vsp_cycles = 0, vpp_cycles = 0, fw_cycles = 0;
+	u64 fw_vpp_cycles = 0, bitrate = 0, freq = 0;
+	u32 base_cycles = 0, fps, mbpf;
+	u32 height = 0, width = 0;
+	struct v4l2_format *inp_f;
+	u32 mbs_per_second;
+
+	inp_f = inst->fmt_src;
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	fps = DEFAULT_FPS;
+	mbs_per_second = mbpf * fps;
+
+	fw_cycles = fps * inst->driver_cap[MB_CYCLES_FW].value;
+	fw_vpp_cycles = fps * inst->driver_cap[MB_CYCLES_FW_VPP].value;
+
+	vpp_cycles = mbs_per_second * inst->driver_cap[MB_CYCLES_VPP].value /
+		inst->fw_cap[PIPE].value;
+	vpp_cycles += max(vpp_cycles / 20, fw_vpp_cycles);
+
+	if (inst->fw_cap[PIPE].value > 1)
+		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
+
+	bitrate = fps * data_size * 8;
+	vsp_cycles = bitrate;
+
+	base_cycles = 0;
+	vsp_cycles = div_u64(vsp_cycles, 2);
+
+	vsp_cycles = div_u64(vsp_cycles * 21, 20);
+
+	if (inst->fw_cap[STAGE].value == STAGE_1)
+		vsp_cycles = vsp_cycles * 3;
+
+	vsp_cycles += mbs_per_second * base_cycles;
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



