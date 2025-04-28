Return-Path: <linux-media+bounces-31164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5CAA9ECBA
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 392B516B077
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE7826FA58;
	Mon, 28 Apr 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mZyULbVa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0FD26E141;
	Mon, 28 Apr 2025 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832646; cv=none; b=YHW3DOktI4IX2PQVi45AbzK+u4Isfvoo0+ff8Vcnfe1SPjU+UKKJkpl5us+8uQqEC1iG8BFS8zpjSIYm9ZPsqIL/TLyHfXKc1d9Yl11bM73VuK+DM2gHSiA9GTcjJzyaCLlr0ySEKmuCZSBe90+O1vpix660QUoRd4WMBm1+Nf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832646; c=relaxed/simple;
	bh=HQEuEjqL1Y4c+j7mj4RVYfJ4F25B1YtxlgagvLlVhSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WCEZGUGS7tlTfW52v4rSyZw4lmGb0r88k6yXxXxIXvDbqrU0wqiKgI/m3WcRjvQbz+7bZqz8SY89Pfip+8gV9Jl0x3r1t6aeWFLVJPT9Z94V7/RvNT646fw55Uk6ju4aU89GNiXINNmRqNx5h9ZZRhmGgyYLjAPUVtucEcuy+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mZyULbVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6k1YZ008854;
	Mon, 28 Apr 2025 09:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	anbng86u19CyHhLvcYMYRNYDb4+6BUgFsydVK45yT48=; b=mZyULbVaJPyLlLMN
	2yFrWMiVvpbndj3nyCM2hrobQ6oNQkwR2eMphjcOnFjNJ+i8H3n2/FvszF459FJp
	wVp1oKxY6mSf2NqnR+VokeHB5zFW2+FmXD750pQmSHz+NyiW6ZM5uL4MxNZGGOEg
	vhQXSUbHG38qZUXZ5N6J4wc1Q3btSaSGkjgE+rC76QOF/E9Q8R1zhPytwuvGinlC
	BHtqo7C4dEiBiMFmrn90U0sfZLeL3STt86B+ysvLJh9GIO5KG25CUi8cgwEYMxZE
	79koLWO081gocu5Hc9joGg2t+8bJhckOt4u7roaoQi/8fT4iKrl7s4Nv/hJF+XhN
	x+XeWg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hqg41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9UQKB006574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:26 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:20 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:56 +0530
Subject: [PATCH v2 08/23] media: iris: Improve last flag handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-8-3a6013ecb8a5@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=4226;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=HQEuEjqL1Y4c+j7mj4RVYfJ4F25B1YtxlgagvLlVhSc=;
 b=yGpDEYRzELbGQvk5svCgcIydYdk3yScHr36Hva68/MSAz7AQevc+CrnNQoDIXl6eWcfjfZ4ws
 u0jhNIo8LvvDO+3vbau98UuBMO2pdA9NKLgAsRnqST+zW8G8mA+8THO
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dfB5dFFwAM6RsiiKicNrHbSwDZgLJUzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfXwgLQblkOth4R FAWzMjji5Sx8WmXsyhVNVN6j4O7HhXzmk41vdLe32xxuCX3Vnj5KhI49JS6zO7IvHYC1en9+P2/ N8dVT4LA4MzUAX2dWpE1hXY2sUuP5pGK2uwROhhK3K1gu5A6DiZdbkj8jrI7mulfivA0go6kOQT
 waVBcBMcSggYUE7iDx+J+d5X2XG8neK88qusvyHl0ktSMt0HnSdb4NePxEKAVoqfZK7aLgzAgvC cx2vR4Ozh6UDVwgL0r+AKKJngq1omtC0hd2wA08VBfTYldhDDD5/aNJVA7aMf+FR4rPhOLXgbaI mykFp3qFzic6nKcn4RK6mj3c4VzjJlWDihjxNagU45h9LWQEvm5EgXVDQWYWstKIx9dhfdbXn9U
 YAJQeRP8cN2ZgXSB9zbFoa54nym+8FoMpcvfFXHR/heRFVACIsQBLq+th+4jzcGvdw8yrsus
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680f4ac1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KFT2FJSas4n7fAa67OwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dfB5dFFwAM6RsiiKicNrHbSwDZgLJUzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Improve the handling of the V4L2_BUF_FLAG_LAST flag in the driver:
- Ensure that the last flag is not sent multiple times.
- Attach the last flag to the first capture buffer returned during
  flush, triggered by a sequence change, addressing cases where the
  firmware does not set the last flag.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c            | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 8 +++++++-
 drivers/media/platform/qcom/iris/iris_instance.h          | 2 ++
 drivers/media/platform/qcom/iris/iris_vb2.c               | 3 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c              | 2 ++
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 3691b68ea294..9f7d890262c2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -653,6 +653,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 			v4l2_event_queue_fh(&inst->fh, &ev);
 			v4l2_m2m_mark_stopped(m2m_ctx);
 		}
+		inst->last_buffer_dequeued = true;
 	}
 
 	state = VB2_BUF_STATE_DONE;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 6576496fdbdf..ba858abab336 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -456,7 +456,13 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 		timestamp_us = timestamp_hi;
 		timestamp_us = (timestamp_us << 32) | timestamp_lo;
 	} else {
-		flags |= V4L2_BUF_FLAG_LAST;
+		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
+			if (inst->sub_state & IRIS_INST_SUB_DRC &&
+			    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
+				flags |= V4L2_BUF_FLAG_LAST;
+				inst->last_buffer_dequeued = true;
+			}
+		}
 	}
 	buf->timestamp = timestamp_us;
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a893751766ca..5150237f0020 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -43,6 +43,7 @@
  * @tss: timestamp metadata
  * @metadata_idx: index for metadata buffer
  * @in_reconfig: a flag raised by decoder when the stream resolution changes
+ * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
  */
 
 struct iris_inst {
@@ -74,6 +75,7 @@ struct iris_inst {
 	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
 	u32				metadata_idx;
 	bool				in_reconfig;
+	bool				last_buffer_dequeued;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index cdf11feb590b..23473cbd0b2e 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -304,7 +304,7 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 		goto exit;
 	}
 
-	if (V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
+	if (!inst->last_buffer_dequeued && V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
 		if ((inst->sub_state & IRIS_INST_SUB_DRC &&
 		     inst->sub_state & IRIS_INST_SUB_DRC_LAST) ||
 		    (inst->sub_state & IRIS_INST_SUB_DRAIN &&
@@ -318,6 +318,7 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 				v4l2_event_queue_fh(&inst->fh, &eos);
 				v4l2_m2m_mark_stopped(m2m_ctx);
 			}
+			inst->last_buffer_dequeued = true;
 			goto exit;
 		}
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 46abdc47420f..d162cc9650f5 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -488,6 +488,8 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 		return ret;
 
 	inst->in_reconfig = false;
+	inst->last_buffer_dequeued = false;
+
 	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
 }
 

-- 
2.34.1


