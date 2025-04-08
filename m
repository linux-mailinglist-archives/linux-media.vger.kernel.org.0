Return-Path: <linux-media+bounces-29643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DFA81125
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E999174228
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD61E23717D;
	Tue,  8 Apr 2025 15:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MgIDjo4p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AF9237176;
	Tue,  8 Apr 2025 15:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127722; cv=none; b=Bjd51jHsLzetrjiGMTTgf19McDUb1zxBSO09ccMQHV0ZpInNNMTYUxZ9Vg87IiCAZp37I/mncdkdwpxdZS5VdSGLVTVL4dL9xDbDEnto5diqjvhNmij2clDtP0Aw/09FppMDDnvT4XN0t91v0tyA6Fu3KaGstLWloAHB97zxGZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127722; c=relaxed/simple;
	bh=knc6j5NwUrl1Ak+YthgyBvWn2DbsX09vanOVOSNjFbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IDoqpwTpr07nHtAn3rUNTcAw2JNVvethvwJUNQuSRGNbSz54AEwL6AsZCJ76vhjC6KIne33LSaNc/ssFPNJELiQ9SbpU2giR8foCr/wwc93hqUJafZlVZDPaOlGvvMLfJSkrcsRvVLVUFfPrVE+E2fgdf42B345mXd+pPVKil84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MgIDjo4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BOYZR020179;
	Tue, 8 Apr 2025 15:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPmoTxql9LgTIfLbc6oI0kud4ejzE+ljcvFai1eYQFQ=; b=MgIDjo4pN8vWOKou
	IdS8Rxul7wRPOIS3CXBtpcF33f0nFCOMTNctHpX2pg2++cJVyf6c3xLOGjyL3/dS
	fN2hsShX99R6oS98iNNkvRp4Hunh2uUXL6u+L2wRy33vQid8utx03neznNqNQagc
	KUMVtXENkiRiYkB+JEmg/c0bn320gbI3XFkeZxzg94Z7Y5eG1z+gDva8hD5vmnwG
	3+mHJPejfWmrWJ0ghfPyofRfL6rtqnwx4SOYGpaw+mu3yJMeZyNVkzNhtzFHh0Ws
	yzgl8TRD6L+rdvoCtZk+akcdrWvrA12+1whD6sS8XwBdVhmxfFjn7CV9BD1nOCiZ
	nRbzPg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2rak6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:55:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538FtGNY009206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:55:16 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:55:11 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:21 +0530
Subject: [PATCH 07/20] media: iris: Improve last flag handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-7-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
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
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=4226;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=knc6j5NwUrl1Ak+YthgyBvWn2DbsX09vanOVOSNjFbI=;
 b=OaNNAYDyXsGXyGy2bJ42seD0fbzjA9mviSwZCopi/eE8BPV8ZPVqK8DZyTVU+zaLVUIFWc6ph
 HTBcYtDpddmCOi1M76GW/GAtdXVnKzuJtpU/hSuu7UIZDbGxkUC1tIw
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tgOQiWV7gGuySMYXgJOgxggk-z3cyNgN
X-Proofpoint-GUID: tgOQiWV7gGuySMYXgJOgxggk-z3cyNgN
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f546e5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KFT2FJSas4n7fAa67OwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

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
index 8ae1f791d943..c091a49bd140 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -625,6 +625,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
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
index 2e06311f9893..7058f2d789bd 100644
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


