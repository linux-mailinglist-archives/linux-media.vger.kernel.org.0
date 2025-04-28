Return-Path: <linux-media+bounces-31158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AC8A9ECC8
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C7B23AA4F0
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACC8253B43;
	Mon, 28 Apr 2025 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JlP4cmLU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C5269823;
	Mon, 28 Apr 2025 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832609; cv=none; b=B8vzEJllIqgLa7Pg82FQYskvEM2qYAJyggWIr/gmCs1P06mTjwKeRyA7cC9aXKDEj7Su1dPH8n7oXrQa42w3lWDMLaEOzaPN4ugAM6/lP49IbvwY45gP/fpA89R1594743GZWt8klcVwLb9Z/ZiTe46qtx7OHBm3QSv5cojEB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832609; c=relaxed/simple;
	bh=muYqVjO0fyyEQMqE2ujJYoh8yGnjRW/J10EtpE8Licw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=l3RXa7fNjOBqENmMRTqBTz7eMMybrHgp61oayCHnT1DL7o9tDmOR9VKZYRiuu3e9Zi/1wg34ZUOi6JiC3c1cTSUPU/HTQsUC5M3eqWlQlKfxRlLk2uQPRi/lye+DPcTood9a8AujiyMFc8ZtNc05pdhY3aluziW5eMS0uTvvXgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JlP4cmLU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6lUdb006372;
	Mon, 28 Apr 2025 09:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YIg1PPfKtih89AITB2UuK4fcT2ayz6+SfafGlgMAvOM=; b=JlP4cmLUpeE55pB4
	c0utU9LWsmtJpQOhr/Pkin1dx7bMVnbmZ8lRnULfgISL1hIuAwKmB1nWiB0r88u3
	UQ7X9nlAMJVFAdSMktNWUuJ7mN5B0jrnusHAg7uC6LQOdrnD6cN9WATyd/NzUmQj
	QGLyk1xq8kTAGiD/2/LzW8wrWYoEVh1aWWBh/3kptAr9qHdLrjSOhZ0vjRC5//qT
	DB26yyA83Xxhqr/vvY92KlMF3Xr9td/+2xxJQewMkWpvp/fN0zfNQhtqegh3HJiq
	P8Emfoback/0plxc3kN6b/AQGhuPg0xyvPPHHgM4v1VbHkOz0GJ+pZOQqzn467tp
	qZuifw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevfm42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9U2iR020826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:02 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:29:56 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:52 +0530
Subject: [PATCH v2 04/23] media: iris: Avoid updating frame size to
 firmware during reconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-4-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=4491;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=muYqVjO0fyyEQMqE2ujJYoh8yGnjRW/J10EtpE8Licw=;
 b=kudyPTSZ3eW710mAsdcYLknS4GqOx6sjN0q1Vfa095wDz/JwKD2kMI49ZzhYP+nVsWXmgoWzV
 DjMYHIZHLMvC8sqcQ2JJvyv9oWm6wANhKOvqF/GQQW/+h1oQK+lVuX1
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: coiTdSz80JUor6zjrK1jjKdcUAmcF05Q
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680f4a9b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=efeAoCtM9CIncqHwMkEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: coiTdSz80JUor6zjrK1jjKdcUAmcF05Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX/HMlX5h61izJ iH13M+Q6VWPFgKzMwdIB5sk6yHPip2i0HdOZBAnXySrP3fb3V2c8OSaQAQz5nc1nD+tK06bU5lY Vl3I0xzOL1/PS+WT2lOPK2AeigNmoS8wkCdHUPuhOF70q+Hk0TwRw5XWnw2oCXUhHFHh0/aDQxQ
 BUjRh3kN+m2PGVYA1Mq85+AtbxpoGfC2keJpvFSCvxZnWWqzbRqJmbTHCRgY2+gr5HMWH6yN1Ua F5WreqgGZruwZX+yKHgaUUUX8SUwgcR2mSJQDVpdng8+uDwmGL+OUNECeMG12GyAsnAK/N6eBYU 4BFY+UXHv/eL1pc7xa8ByVQoAFlBl6+ywvHEh+xOI7+5lzZtMh4KOhB6YblsoQnCYOw8qN9QJl3
 JmAAAKkAs1PWYsoDKqypqoxuDVEG87MJ33V5F+Og602EnbAyJhkuWixjPr+bgz9YmSUMWwJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

During reconfig, the firmware sends the resolution aligned to 8 bytes.
If the driver sends the same resolution back to the firmware the resolution
will be aligned to 16 bytes not 8.

The alignment mismatch would then subsequently cause the firmware to
send another redundant sequence change.

Fix this by not setting the resolution property during reconfig.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  | 15 ++++++++-------
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h          |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c              |  1 +
 5 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 64f887d9a17d..2239708d2d7e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -546,14 +546,15 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst)
 	struct hfi_framesize fs;
 	int ret;
 
-	fs.buffer_type = HFI_BUFFER_INPUT;
-	fs.width = inst->fmt_src->fmt.pix_mp.width;
-	fs.height = inst->fmt_src->fmt.pix_mp.height;
-
-	ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
-	if (ret)
-		return ret;
+	if (!inst->in_reconfig) {
+		fs.buffer_type = HFI_BUFFER_INPUT;
+		fs.width = inst->fmt_src->fmt.pix_mp.width;
+		fs.height = inst->fmt_src->fmt.pix_mp.height;
 
+		ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
+		if (ret)
+			return ret;
+	}
 	fs.buffer_type = HFI_BUFFER_OUTPUT2;
 	fs.width = inst->fmt_dst->fmt.pix_mp.width;
 	fs.height = inst->fmt_dst->fmt.pix_mp.height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 91d95eed68aa..6576496fdbdf 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -155,6 +155,7 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 		inst->crop.height = event.height;
 	}
 
+	inst->in_reconfig = true;
 	inst->fw_min_count = event.buf_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b75a01641d5d..0e889d07e997 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -508,6 +508,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	struct vb2_queue *dst_q;
 	struct v4l2_ctrl *ctrl;
 
+	inst->in_reconfig = true;
 	subsc_params = inst_hfi_gen2->src_subcr_params;
 	width = (subsc_params.bitstream_resolution &
 		HFI_BITMASK_BITSTREAM_WIDTH) >> 16;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index caa3c6507006..a893751766ca 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -42,6 +42,7 @@
  * @sequence_out: a sequence counter for output queue
  * @tss: timestamp metadata
  * @metadata_idx: index for metadata buffer
+ * @in_reconfig: a flag raised by decoder when the stream resolution changes
  */
 
 struct iris_inst {
@@ -72,6 +73,7 @@ struct iris_inst {
 	u32				sequence_out;
 	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
 	u32				metadata_idx;
+	bool				in_reconfig;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 71751365b000..46abdc47420f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -487,6 +487,7 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->in_reconfig = false;
 	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
 }
 

-- 
2.34.1


