Return-Path: <linux-media+bounces-31914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EEFAAD8B0
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 072EA16FEA4
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142BA22A4F3;
	Wed,  7 May 2025 07:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GszcD2pA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64E221DB3;
	Wed,  7 May 2025 07:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603708; cv=none; b=LnXn1gMqiJBzPnvfIA7YQVRyCf/SycnFnarN+b5lvcGPQZyTevR1WO7J4lboaf8U2fM+v9UBUu1TFZT4Rw2WhSZ11EcYerlpBu844f5wy2A59od+nGPVlTPCPcpwvWHJqROldX/e0M2Qd4oV8DsP5xGpUfDNyY0tZ+2uHeza7vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603708; c=relaxed/simple;
	bh=DMlZ28z0C+cncq+pKvwmes8Er6KI3IaQGZpJDZWg2ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gVekPCOvGMZdQw5l5OwlfMFEZFC/qRBvpa7eJXGPbszGxTzNA8GwzWcQ0lPFo5yj7ueVLONgmB3Hrw9Phz8lCGtJOz9BYZR0mkmLHZIyM/S+44Bqbi9YKnSiN4310iJ7Kv222O98UG1qpkjsofifskb13UEU7g/GjI08xianJGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GszcD2pA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GmCq020191;
	Wed, 7 May 2025 07:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pb77wtEFRXX+nUw1xpAyP6LLqBohvqnLvzwcrvsqX6M=; b=GszcD2pAty8l0gQh
	VfuRuz5KY3wwah8uKgRMC1/hvZqWFJOX74vEXG/yoDo6BoMcRXGfrutufNfIu507
	xXzis4YsrwePUBjvmjDevxiVrvfuPgk07K+vbdMNk2b5NLHX7OCSA9h9TQPbfdh4
	QR6zp79/lhPwplJOVOCOgKTFDNUis2zle2lRO1v/6doossrg6JOMWveYK/9qVrZo
	HDRV2Vz9Ng8IaUaXVNg6noeOdVltIUw1qpN+6ZTTIfrf5TdnRl5fQ18GkMjvZBPF
	Ja/0QcOZVSLyzZ8lVtyT2M+7LreOVJ/x7yAH9Ocg9u3paEzgDeRlwVW5sPsPqfeA
	mNEg3g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9epab12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:41:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477fgH0001891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:41:42 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:41:37 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:50 +0530
Subject: [PATCH v4 19/25] media: iris: Remove redundant buffer count check
 in stream off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-19-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=2556;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=DMlZ28z0C+cncq+pKvwmes8Er6KI3IaQGZpJDZWg2ls=;
 b=sgP4d7rlKBN72lm00cVxbDXJcpyR2bM0pGhElfp+enABWPVJX+ZCZzm5a7sHRZWF/2HvYSR37
 gwuQb+7KrQGB1XflzMVoz/mL5URBK1hUrh1v7n+nvqIQ5iVkAW3jsvz
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681b0eb7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=-qshO7OKkG8J2I8e95wA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Uac3WwwwohDpMLLRoLkUTydsufGLyThT
X-Proofpoint-GUID: Uac3WwwwohDpMLLRoLkUTydsufGLyThT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfXxTuoX13IzUTx
 LOt/0W0NDkTabCEls9GyhbUVbg6CQupmU8jDf4A+GCTN1I+TR2rsLw5oeQSWh0UHtF0uZSt3x2Y
 dtCYGzn0ERRfdCmADYDZn3oxbXtloHEuCcvSdlr7kGiL1DUNJV3llfyOBMf48CPI5GbpIs9z9G9
 D+N1h+Yyh3FH1isrcauDuJjLsNqLxQTnLIUMG9NuKcX0KeZ31Er/7L9kcQKPCqjNM5PWXpK3ACe
 jfGhkyqtv3Ms9tjdR9lBHgvwwvuttUr/n72ZCd1cP70JLmJ8wQ4QN6feHHhlFwj+esAHL4itVhZ
 dGF2GqDVWmQul7NJ47cBUj63IX+/mSui69HrVhk/SkccBGLJKZNGmBirwkrBh12Od6Xmmqjbl2S
 aZcIA2zhK+RIQ6qV1nWKjwp1U/cyTzSBYinJwDVK/MNk+2TxkHr/8qykBp3bcDvkmKn7WhnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

Currently, the stream off process checks the count of buffers in
v4l2_m2m_queues using v4l2_m2m_for_each_src_buf_safe and
v4l2_m2m_for_each_dst_buf_safe APIs. If the count is non-zero, it
returns an error. This check is redundant as the V4L2 framework already
handles buffer management internally.

Remove the unnecessary buffer count check in stream off, simplifying the
process and relying on V4L2's internal mechanisms for buffer management.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 36 ----------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index de4e3fe8ed5ac7a905071362d32d9a87a52b6731..ce97c555192a9a4eed5c6b1287f4dfa201a017d1 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -244,35 +244,6 @@ void iris_vdec_src_change(struct iris_inst *inst)
 	v4l2_event_queue_fh(&inst->fh, &event);
 }
 
-static int iris_vdec_get_num_queued_buffers(struct iris_inst *inst,
-					    enum iris_buffer_type type)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	struct v4l2_m2m_buffer *buffer, *n;
-	struct iris_buffer *buf;
-	u32 count = 0;
-
-	switch (type) {
-	case BUF_INPUT:
-		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
-			buf = to_iris_buffer(&buffer->vb);
-			if (!(buf->attr & BUF_ATTR_QUEUED))
-				continue;
-			count++;
-		}
-		return count;
-	case BUF_OUTPUT:
-		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
-			buf = to_iris_buffer(&buffer->vb);
-			if (!(buf->attr & BUF_ATTR_QUEUED))
-				continue;
-			count++;
-		}
-		return count;
-	default:
-		return count;
-	}
-}
 
 static void iris_vdec_flush_deferred_buffers(struct iris_inst *inst,
 					     enum iris_buffer_type type)
@@ -321,7 +292,6 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	enum iris_buffer_type buffer_type;
-	u32 count;
 	int ret;
 
 	switch (plane) {
@@ -339,12 +309,6 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
 	if (ret)
 		goto error;
 
-	count = iris_vdec_get_num_queued_buffers(inst, buffer_type);
-	if (count) {
-		ret = -EINVAL;
-		goto error;
-	}
-
 	ret = iris_inst_state_change_streamoff(inst, plane);
 	if (ret)
 		goto error;

-- 
2.34.1


