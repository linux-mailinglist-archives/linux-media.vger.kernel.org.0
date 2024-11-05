Return-Path: <linux-media+bounces-20855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF29BC687
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB1C8283543
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F9F206E9F;
	Tue,  5 Nov 2024 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QdD9CYQN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636D206948;
	Tue,  5 Nov 2024 06:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730789934; cv=none; b=fZxBVHmY3OaNdxUgLII02xK9SBw/uUy9lrLUmjilv8tB9EDhypQpEsXSap2uAXwkFvNrTcI5r7g+1Qn0DatFjJGFWqWIkE/VrHLIIvQUjs2MzI0sRNFfrkmqYHKGPn4dMmvKscW02waMyKMVKLizmlCd6PovR08iLAl7N9C9nBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730789934; c=relaxed/simple;
	bh=p18NTYvzqatTJIbQrZcUYBrCa8e1+ZV75jdxd5NR/CQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GkuE7GpgKXyMINQ7Vkfazmb6brnxyPR6m2FS2O5GU0LT7dkBZD3fuj3ZmWf7iU+GuLJ/4NjHb1Pxw+Jfr+W3DqsixGSl+k3z8mp9db0HXXLZmLhWI9QPEhdr+jETrtDwE+TyUwGiDaFGLYvIQo5RTvbqcFX1YyFUoYneJmIEjwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QdD9CYQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIhbg009100;
	Tue, 5 Nov 2024 06:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvlO2/CcizvPVSu1KGEJaC7dant7T3UV3Da5J3eNesE=; b=QdD9CYQN+2+pSOmO
	yFBTCDpkmW9MJi8Y30iTOZVE0rZUJp0aFbDVlAXNaMfk++WgRMS8JHAlWGo7s/LY
	ol0PDIFJh/de2wSGa4EM7QAZHI5rx2OBZVzz4dgHIUaWGPDvRegVn7NAn6msOMd9
	O6Njp2u3rkYJWsiZFDNPpoYZIT/mGZ0xEFBthSs17OPRcTXWb4guNlrkoU+lfxsK
	gP7CJuuT43683ORvrogDCkRRT/QsCAM3BkYsZDdjQdPH5ih5wecOZ/hpDoyMBHW9
	fGRjLyjBOtSZEvmWR9zmACx5Fy2T+j1PGQWa/CFPbhcWYVBWbLMHSiESPCiPkupD
	RVGAaA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4uppb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 06:58:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A56whuN031573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 06:58:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 22:58:37 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 5 Nov 2024 12:25:44 +0530
Subject: [PATCH v5 24/28] media: iris: add check whether the video session
 is supported or not
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-qcom-video-iris-v5-24-a88e7c220f78@quicinc.com>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
In-Reply-To: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730789780; l=4761;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=2NVFPwJKD3mYBHvJOQ+NafIU5Ar579R9hWWc2gbizjc=;
 b=J0er7/mZ2jX6/+7LA9hAT+Z4oGvev6t7MBQAP0T4hP8B3cfl5mFdFsADFc3qVZcH8kiXRKn5B
 SpqyTDQFVsbATfHnTrc1nriyuek38b53zprQxauY8cd8sHgx1MAVp4r
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QsyakL7n3qB0vf6-2UhGzEqzcFnQpDkM
X-Proofpoint-ORIG-GUID: QsyakL7n3qB0vf6-2UhGzEqzcFnQpDkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050050

From: Vedang Nagar <quic_vnagar@quicinc.com>

Based on the hardware capabilities, add check to restrict whether the
video session is supported or not by the hardware during start_streaming
and queue_setup.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        | 97 ++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 090646aa80ff..eb329cd05174 100644
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
index 70ff10a23ba8..2acaa831d97f 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -12,6 +12,95 @@
 #include "iris_vb2.h"
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
+
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
@@ -57,6 +146,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 		goto unlock;
 	}
 
+	ret = iris_check_session_supported(inst);
+	if (ret)
+		goto unlock;
+
 	if (!inst->once_per_session_set) {
 		inst->once_per_session_set = true;
 
@@ -119,6 +212,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
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


