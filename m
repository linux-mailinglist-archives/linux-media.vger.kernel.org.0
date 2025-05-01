Return-Path: <linux-media+bounces-31528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB74AA63ED
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 063827AB219
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E803F22D4FD;
	Thu,  1 May 2025 19:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kKck+LSA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31B2288C0;
	Thu,  1 May 2025 19:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126946; cv=none; b=UOgjFAWx0LSX+zlDkpEHn/y16+j56C+s1UYbh7PBQi24EdgrNHE6NFLnZVJRjMjmTRAe9IV+QtbNJ3Fyb0TPDd99k5FI1FhmksRi19upH9w9JczG2vo29x+6Q44upHomrr/XHg/CAeTjlcgfbqaa+qbXKeTr54pkxWXIHdK9B84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126946; c=relaxed/simple;
	bh=cykMNW4gezG/3T5mqrPf5KzR1AlV5trTY8mLW2v8j90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aNey2m0Bh1tv8AozGWZ3v8Agi+GAxxp+zjPfR919pQotlRUi0fk+IQXaINi8OQbgPZHa0y463ImcHEucJeH9znKM9+mew0Ubm/A8v1j6EM4RnFAROqrDRUhp0qasz5fnMQn9MBriLCoSsPiigbNYHmKZLzGPX8CpVYqF5ea+X5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kKck+LSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2Pm8010690;
	Thu, 1 May 2025 19:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LefXvc/xdC6em6kqSjTfUljXvfFUQmM4E/whmjrQoIk=; b=kKck+LSA3JOs+wFN
	tbsf5I4pLPZiy2Iuq7McoiOxRS966qymgiTFHooLcdPDCGDbgBQw5+c/5jQ7oPcU
	gYJTmOoWxvtJzgDHs114ypGqar7ppC5ZuXhkg4MQi6Af3UWqklfNCybAA1TVAhJm
	94nyTy4QNGYg2dsGtTGwOKuI1JD3wrqniqhoIRaxBoe/huI2EPWgEKKbqLm9LRFE
	Q4mMpR8ttb1O/wh7UFhQSzsfsRnLztzNu/0/ehFS+zfVW4gn2OfAjwDHrEVdl2az
	ga9Jgr/i9rm4njLlz3D+vJJAJapbZOyWc4BXzNhT0dqFzfnlQtWMcvFL9hsYTtLA
	39JsEQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4e767-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:15:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JFdrZ031507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:15:39 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:15:33 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:47 +0530
Subject: [PATCH v3 17/23] media: iris: Remove redundant buffer count check
 in stream off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-17-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=2500;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=cykMNW4gezG/3T5mqrPf5KzR1AlV5trTY8mLW2v8j90=;
 b=V+jLzZ15LutihIeo3GgUZlrW/gnGI3YpbZCFdzugJEyXl6ZmSYsRRxGS3W0VZaFxx4iflvdPX
 bGi9NsnHrReC/9qpyB0GfXBELuD3lAFXXrF9+TT2WOAaZm+lwWEfgKM
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4BpDNCWWz_Vm6iHJynzQxQkhxceZImYX
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=6813c85b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=-qshO7OKkG8J2I8e95wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfX9HV1RZ/+63Ol CyQ+qLuKaHXu/4vI1zqfg9j7C6p4nhkclk0u44RCLhLumT1WKHi5eLkIBYT3LasXHZfJLTT+wze jCNZPR2HiCp/USNqTKGxjh/1TQOCFBal798/1cQ8TrjVxjmlp0xEv9MCA0ucEuUzxLAyn4mYDfH
 iMSZbyuMXwiZBj0K8FEjZuD8ivWQzynzlLDQV4Mcv73iWaj4qpxVId7AXO8iQKVo44W7RjUcQDT LZudzVhgILcCPI7ybnZMYw0mTas2kC8I2bb5mRokgLKfxNeD8rrwq0ZoLw90BUS7ZIKS8aKs2yJ 76s4b8vXuIXWO0HfQqPSPa+5REKkVlrnUHiD5lv0KUMkfdMZVfNk3wM+1fRgpY8qTfQCIAYh0Ae
 dQBRTr1/4ngeSsxWeMdZlo2JrKWq2QeyV1R+mKQVXx7TtoHTNZ6Fh29uRpCb/5lETxLqj8rI
X-Proofpoint-GUID: 4BpDNCWWz_Vm6iHJynzQxQkhxceZImYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

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
index de4e3fe8ed5a..ce97c555192a 100644
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


