Return-Path: <linux-media+bounces-21670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A49D3E40
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6456A1F22384
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3105F1DBB38;
	Wed, 20 Nov 2024 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kDw8nEZr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FF31B9B50;
	Wed, 20 Nov 2024 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114139; cv=none; b=C5if1B0Jy2z7gNhVznrHwEG96djEq2DDrmsgfIR8Lz58mf0tvPo5W5DdtFVEGCqTxq9ilKzzdurQMRPcUTsqrbJc1++Ayb38J8sxJO/cb6ePhMDO+zhCWOaEDOmjOXPXo3FQ8ccHuOAAdXNgfV9hsoKrU8T3EoHHUBBY9aL5Wrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114139; c=relaxed/simple;
	bh=HUeuhBy8edxUGO3cDrMQwB3vYeWIphej8nYOvg1X3Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Wff2of14z92Og6G369tti+nwDvgXhJFxy1Q7LkYSjgIem2F5et1lT65fi3X4BwvHDomL/7l1pcqCxETuXx2uIlRBnjmZ5c8rQk7ND62M4JU/OVUT1Ugfm/NoG2rtnk10/eGwXZCuaReRdFDnwzHyscg9jEh/1qK15fL6+3aYq3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kDw8nEZr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKAo7vs027176;
	Wed, 20 Nov 2024 14:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tTr08puGSbMhIyFVlWiYORF3CdVkKJxEnOAV53nW1E=; b=kDw8nEZryxuZ8D4E
	Jzk/J2u+ZSqIK8aCYisRh0bwTAVDX1FVdYUPkm2HeH6lvHAhdWmsnMYAvnx8bmqF
	EuNtDl/I1+izPay/bLoTROHhYJetkGqHfXwdyCuOAv26DqecqJeB9CBDkEEZ3hGk
	LeU4T8ltveMAkdPmmVr98YrISH1sX3WyYOrYK2penq0laG6353j2RwiHY89MSTmv
	xbTXX9ZZoXWKCknsfU5UOUsRWDZk9WmhVj4Z8C6E65bo0JrCqx+G8xRYY0OzMAtq
	XlB4vn12/IvjK7nmilIug5EA07CUU3yvFmm4Mytmg2k06i/UAE1jzkF3hgtTRiOo
	klzCKg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431eby8k17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:48:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKEmmhS000787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:48:48 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 06:48:42 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Nov 2024 20:16:14 +0530
Subject: [PATCH v6 24/28] media: iris: add check whether the video session
 is supported or not
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-qcom-video-iris-v6-24-a8cf6704e992@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732113983; l=4742;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=sswJ17DqYEqE+Sn7DPFHp2IKJe6l2V9Ll9PwW3wzV/I=;
 b=nD4ky/fAw+ih2CFuwGOwNO+aUTZw9DGBQCFZH2mCq4GNPvhQe1Bp0l9H6oxp1zBwjjXsFRvim
 bxzzisIA0j6Dou6j8yBlj8BZ9oJA0TmLyA0pQww+lDUAXh9m40rM9Mz
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GH_WqqVVSKt9C4QBrTnKAKSVAy5MQ-Oa
X-Proofpoint-ORIG-GUID: GH_WqqVVSKt9C4QBrTnKAKSVAy5MQ-Oa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200098

From: Vedang Nagar <quic_vnagar@quicinc.com>

Based on the hardware capabilities, add check to restrict whether the
video session is supported or not by the hardware during start_streaming
and queue_setup.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        | 96 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index de0388a100c3..a5a7d6838d16 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -144,6 +144,7 @@ struct iris_platform_data {
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	u32 max_session_count;
+	u32 max_core_mbpf;
 	const u32 *input_config_params;
 	unsigned int input_config_params_size;
 	const u32 *output_config_params;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 2a45e605e140..68907ba6986f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -232,6 +232,7 @@ struct iris_platform_data sm8550_data = {
 	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
+	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
 	.input_config_params =
 		sm8550_vdec_input_config_params,
 	.input_config_params_size =
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index f51fd6929f64..f3b126accec9 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -11,6 +11,94 @@
 #include "iris_vb2.h"
 #include "iris_vdec.h"
 
+static int iris_check_core_mbpf(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+	u32 total_mbpf = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list)
+		total_mbpf += iris_get_mbpf(instance);
+	mutex_unlock(&core->lock);
+
+	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int iris_check_inst_mbpf(struct iris_inst *inst)
+{
+	struct platform_inst_caps *caps;
+	u32 mbpf, max_mbpf;
+
+	caps = inst->core->iris_platform_data->inst_caps;
+	max_mbpf = caps->max_mbpf;
+	mbpf = iris_get_mbpf(inst);
+	if (mbpf > max_mbpf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int iris_check_resolution_supported(struct iris_inst *inst)
+{
+	u32 width, height, min_width, min_height, max_width, max_height;
+	struct platform_inst_caps *caps;
+
+	caps = inst->core->iris_platform_data->inst_caps;
+	width = inst->fmt_src->fmt.pix_mp.width;
+	height = inst->fmt_src->fmt.pix_mp.height;
+
+	min_width = caps->min_frame_width;
+	max_width = caps->max_frame_width;
+	min_height = caps->min_frame_height;
+	max_height = caps->max_frame_height;
+
+	if (!(min_width <= width && width <= max_width) ||
+	    !(min_height <= height && height <= max_height))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int iris_check_session_supported(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance = NULL;
+	bool found = false;
+	int ret;
+
+	list_for_each_entry(instance, &core->instances, list) {
+		if (instance == inst)
+			found = true;
+	}
+
+	if (!found) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = iris_check_core_mbpf(inst);
+	if (ret)
+		goto exit;
+
+	ret = iris_check_inst_mbpf(inst);
+	if (ret)
+		goto exit;
+
+	ret = iris_check_resolution_supported(inst);
+	if (ret)
+		goto exit;
+
+	return 0;
+exit:
+	dev_err(inst->core->dev, "current session not supported(%d)\n", ret);
+
+	return ret;
+}
+
 int iris_vb2_buf_init(struct vb2_buffer *vb2)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
@@ -48,6 +136,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 		goto unlock;
 	}
 
+	ret = iris_check_session_supported(inst);
+	if (ret)
+		goto unlock;
+
 	if (!inst->once_per_session_set) {
 		inst->once_per_session_set = true;
 
@@ -95,6 +187,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 	}
 
+	ret = iris_check_session_supported(inst);
+	if (ret)
+		goto error;
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ret = iris_vdec_streamon_input(inst);
 	else if (V4L2_TYPE_IS_CAPTURE(q->type))

-- 
2.34.1


