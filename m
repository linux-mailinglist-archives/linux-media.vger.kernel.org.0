Return-Path: <linux-media+bounces-27597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ABAA4FCA0
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D78263AD150
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD01822A7F1;
	Wed,  5 Mar 2025 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dG7GIJFH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9C920DD43;
	Wed,  5 Mar 2025 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171498; cv=none; b=YccitbSdWPYyvR2fOO8x3cgGSXsAKmckjQO5za4MnA5q1heGL2R7Vw7ax5TxHUvt2PtfNIn+Y8R1BX5oX0uZIiNHx0mhXTdLaHz7G/ADMFXZxbzIJmj4XDU5B6xGJHPKVQKUdsofEHAYz+QHmXHj73nEur2ixdJaFFocvkJ+9NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171498; c=relaxed/simple;
	bh=UxcQSJ+tWceGzHCFgwPewAhSh3/pkV1WCiEJgtTxKw4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W52TFebRGNjCN2hrJIGtUiHjIlS+yWdVDDBSI5lYYgswjE01vlXlCajwTtKX4gCEuT0e3TXM5PyWQ9Q4EtYMq1YSpohHWxntKKEn4zloN7SDoM878xxpl/wb1GAv3C/UsxmeVVzj2BqwHxOGLG3ghIyPDyaHtnKvJ2oC8hFMQLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dG7GIJFH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NA3SQ031287;
	Wed, 5 Mar 2025 10:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgIldraM2gz+AZJjqmfWlrbPiVQqhXogxAJXLU3McDc=; b=dG7GIJFHDj25DZCO
	/60Q/so95ialeIxRcS2Yyz8/jZ2fBcP0cvLeUbnuOCNJovhMr1n3YBoRRubr1Voy
	p/b6n6CMDFoMtwJy1PCMN4vEx2m+5hYxLpSdMFDB74aT7CjNvkLa3+4voKFu+VHe
	Ho51UGZuTYcQTIOccucrC6R3Uc2MjsNDosHfBOsae+DwX8HLlYXU4fy1V1V02AID
	hlHWHhKyNCy86n9/arYo+sEl7r0M7UN8o5XVzHk9aIDs35cSMWTZ7QbSgkUxaiY/
	X3abKdKkm6LvTAbx4jizCjsBC4tLOz8+FNb7OMa0QTV17RuOdrYCTKFSc4RJJVMy
	f+5F5g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t5201-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525Air8s003455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:53 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:50 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 09/12] media: iris: Avoid sending LAST flag multiple times
Date: Wed, 5 Mar 2025 16:13:32 +0530
Message-ID: <20250305104335.3629945-10-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g3gIHbfNEObTOen4oc92MoUhpCdruXc4
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c82b26 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=SIJt3Iv031T6S2pOMCsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: g3gIHbfNEObTOen4oc92MoUhpCdruXc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=800 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Add a flag to check if LAST flag is sent by driver, to make sure  it is
send only once for a sequence change.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c   | 1 +
 drivers/media/platform/qcom/iris/iris_instance.h | 2 ++
 drivers/media/platform/qcom/iris/iris_vb2.c      | 3 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c     | 2 ++
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index e5180340383b..9e5ef7cb803a 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -628,6 +628,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 			v4l2_event_queue_fh(&inst->fh, &ev);
 			v4l2_m2m_mark_stopped(m2m_ctx);
 		}
+		inst->last_buffer_dequeued = true;
 	}
 
 	state = VB2_BUF_STATE_DONE;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 625325f7f9b0..43239e7c678f 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -44,6 +44,7 @@
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @in_reconfig: a flag raised by decoder when the stream resolution changes
+ * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
  */
 
 struct iris_inst {
@@ -76,6 +77,7 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
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
index d5127d88d103..0c9997cc7445 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -454,6 +454,7 @@ static int iris_vdec_process_streamon_input(struct iris_inst *inst)
 		return ret;
 
 	inst->in_reconfig = false;
+	inst->last_buffer_dequeued = false;
 
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
@@ -547,6 +548,7 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 		return ret;
 
 	inst->in_reconfig = false;
+	inst->last_buffer_dequeued = false;
 
 	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
 }
-- 
2.34.1


