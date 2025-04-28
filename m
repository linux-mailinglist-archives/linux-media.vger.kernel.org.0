Return-Path: <linux-media+bounces-31172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330CA9ECF2
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F1CD7AB0B0
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCE12750F7;
	Mon, 28 Apr 2025 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jHG0fe/x"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE262750E1;
	Mon, 28 Apr 2025 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832696; cv=none; b=W9h3G/gxa4/60K6xieVZ37FwEpFCZ7JQADRBih37rwPbl5p73P4HEalqxqCVHxB/+Unjqyy+G3/r3ML2Tfbz6qrZ/G2SunarGnK9nKs8QV31TbpnDYL7C7J7Bg346xjf718Y7mg9CBj96F7R9WsLib09rfEDBjH4TsFfYrvrFlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832696; c=relaxed/simple;
	bh=dLOSGJBQw2BrNwxYqKUFYUSKRlBmZL2FMfP9Bb4MfU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k4g4JzTm8z9AHHswrH1E8fJCRRHmbOLiCBH2ZlwD1wSvSLfgdIYLgLawv4yTzRAITZEChPTxzZ67XeEHN/iaQBH5+4lRzViaKMl0HEX6cmMsykIdAAh4kJ3QFeTp5CzKr2sK10ki/a1+XsPRdctGxJ9q1FFJ253+wIuuVqe2RDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jHG0fe/x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S85DU8012252;
	Mon, 28 Apr 2025 09:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FoeC6c3OJf0lz1d5vTbvVqAE/Dj1ykt9wnLc989muwI=; b=jHG0fe/x4WHhP35u
	haffoA//oeFtIEZcglYMYhkjW0CwbqKq10GNDGoRM1spK0ZoU4Z/K/gQAhYFM0ju
	7IJQIO2IOVvhwAy4hx04jJFIf06m+IaKkWr1dX/cK/wrYIxRc49ApOYibrHR6Vwm
	223WXijn4NX1nB6J3UmDSem6qXlHnW8K5AWDH1+6a7GlgJVAtMS9afWW6UtSwsYp
	stlDyROpLJ7ELx/se0UNXQeTTYfy9+dQjw/B2zSwWGJMF2t6hDhMg1ccncXrhubE
	+go4ABEBqLZvu2CyAu+gkg8rzRFpPUbcMxU4LR6KFjDw1myNTxEBlISkbyo6nqlf
	nuTGHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hqg95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9VUQi031028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:30 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:31:23 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:59:06 +0530
Subject: [PATCH v2 18/23] media: iris: Fix buffer preparation failure
 during resolution change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-18-3a6013ecb8a5@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1740;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=dLOSGJBQw2BrNwxYqKUFYUSKRlBmZL2FMfP9Bb4MfU4=;
 b=UDLQyCYsWI1Ua9ViHcj4mRMVkzCl0baXBEJ1c4y0S62f5FFisU42hEOGKct/JE/ZThH+9EZ4W
 kRLaa2cqPSFBz6ya6ciJu7r4EVeY9Inzkp4pK8ppeb2ErAyV0XfN4aR
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CG1GCL29Qf0X7adTxTl4pA3O9gJnuJJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX3iDUw6nrpGl6 Uourb4PcJRiwfEjPL80vhO5siSUfnTXDh843AlWOd3zueLnFu3aRMcfNAwROArJT0CI+6bjRp7V BTIjjhm7QKfw/VtElmjGlvtcWDnicQSW2kc7YSMsMT4ZylRjr29kbsZ7OtvPvQeNiVQpkh42yyB
 YjSG1zgsozONI8CYJTMkJPIm7eWurNcNTt1dUx7QMWI5AeJgYqtfJnco8LHXNqfAKxnPorJNXZZ 1wVYNKk1YMkG1ullMekOB/O80LmTeOt2PT0gDPw3Va1etNoePrv9riy6TiASXKUcjR7oV4WeFkJ 49sPSWofDpa0fgrb80F+eORT+cJVdc2mh2USgeJzzLTuetTmMlZM0y4zFjqu6rFARwki/z5VDhl
 E0dvgfmMZLNQdjJ3gjpZoQ1eTYUCY1mJupmEzkF9MPt5AAjWYZKgahGZ2EkHscMb8OLHbrWt
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680f4af2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cZZdrgoR5-lzdedOY2QA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CG1GCL29Qf0X7adTxTl4pA3O9gJnuJJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

When the resolution changes, the driver internally updates the width and
height, but the client continue to queue buffers with the older
resolution until the last flag is received. This results in a mismatch
when the buffers are prepared, causing failure due to outdated size.

Introduce a check to prevent size validation during buffer preparation
if a resolution reconfiguration is in progress, to handle this.

Cc: stable@vger.kernel.org
Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 23473cbd0b2e..7671df0e1c69 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -259,13 +259,14 @@ int iris_vb2_buf_prepare(struct vb2_buffer *vb)
 			return -EINVAL;
 	}
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
-	    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
-		return -EINVAL;
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
-	    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_INPUT))
-		return -EINVAL;
-
+	if (!inst->in_reconfig) {
+		if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+		    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
+			return -EINVAL;
+		if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+		    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_INPUT))
+			return -EINVAL;
+	}
 	return 0;
 }
 

-- 
2.34.1


