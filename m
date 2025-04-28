Return-Path: <linux-media+bounces-31165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC3A9ECC4
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6A616AC79
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7CF270546;
	Mon, 28 Apr 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SQaoUeii"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD426FD8D;
	Mon, 28 Apr 2025 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832650; cv=none; b=qQ3qg2GdJPcTpmyjFIsbttWDsKsCLkeUGeinZmoWwSD1KedSdiF6Kuyw7vQ8QHVvBPoOaLY8bXKhtAJyZBO7RrvrcQ2P3PRKf+sPDwENo0bZvjTRoeik+Q75Q+A4Ip/joDrknB189jO1MxEolicTiOmUlCuEzz7R/f9PfuMkzZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832650; c=relaxed/simple;
	bh=OS26Jj51ZldgN11RpUmzGtSgzq99loWOkBBJLpUeCvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BpO3nYO7//2MUpDncCNzud3QLfplVvnVgd18OdIyJEnaTkjulgLYIIlTyM2Wh8+30aWHepRXHeKyiz9vzGN7818Yu8b4b55yIYL0eOn2EpxnGvD//9v7beXYBcw81wd2fXqmGhYtQOp8OINU8lbXYGXN2IBZOPSNFYh+P/hIcZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SQaoUeii; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6ioMC001893;
	Mon, 28 Apr 2025 09:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YrlCR2+xxMvC4twUuhyUFQob6OCybuJlv4o/s2o/B5U=; b=SQaoUeiiZ2D3ycsl
	WfESuYnRbTnZvK0r33Kh2X9M5N7SsbjkrDmbpqDj/HxBrQTym4Di+JBR84tSNr0/
	StbX7dNsXCZbQIzeZySOvIZcEk+qXt9UxstpgSvLd2+ElNeeCJYFtcJQb3OJ8ZAy
	AkFPlATlt0AvKEcCI7SQpyiTXK6R8RvN5/zfMfIBCmb1n5Sk4+MmmMUpT3R8PcD9
	5FYoBQjh9akavu2xHi38+0X2HzAgRRt23LxLTN/6dju/f1Pizzl3QhtHVRRqHxlw
	cuXV30Z8a4Ex2pwv/8UsgzyFfnjcyb348hzBG8A6P3gUVrbIiOkQqw74Qk8JfX+k
	jzUtSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmyfm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9UiB9029694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:44 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:38 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:59 +0530
Subject: [PATCH v2 11/23] media: iris: Remove redundant buffer count check
 in stream off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-11-3a6013ecb8a5@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=2446;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=OS26Jj51ZldgN11RpUmzGtSgzq99loWOkBBJLpUeCvM=;
 b=5MZAkS4a5G2Bn9f1fYtibJRPkht7ZKM6M5Uc1X1RVOYER1PI+eLgNh3SU2E57UyVj5SmI4FUT
 wAdXMRzCzkQBiGCAx+ZA4D9me7c2kIqaRyApBTafuP11jzzqCF/XzhG
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uulLTBREjDRmWhhE1ucfC9a0vstARav4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX0g/bhgZzoArM YxbrnBwKLomV9ebYVvZgbqJ0rM/zGGnSjpnyYocTH1WLBnncKt+nFTTsu/FiK9LgYlLwrQDzRls Jf+CF9+ySG5uFdSFEH0laz1EYFi/B9vVccp34YdEoQpi0sH4HGUy8ZrPLswpaCehCya3vRYN2wa
 +XOFfV+rzEgr0uF11n2UiiyVblA8N2zLg2NLkk2YgXtJcHSaeiy576x5hqaQX123UDzG1ciJDDb MuT5Zmh6Z3mudn9LGvhsE+6E99xH3X2qPoNQNgQV5I5vlOm49F8saXRBakr91zsuUBzuK3PDEtp JX5QftB4ThyFHNpVc04pC9WhY0L1pHNInHxTgv3fevr6/nrTKuxc6l0l7Iimtjd6LzmdMU56BJb
 v1sm2IawR6w7uE176L0rGpmVNG5vXA3C7s/TtJdw4j2St37pjvU5C0Qfb4r+WYFQizpmdb8D
X-Proofpoint-GUID: uulLTBREjDRmWhhE1ucfC9a0vstARav4
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680f4ac5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=-qshO7OKkG8J2I8e95wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Currently, the stream off process checks the count of buffers in
v4l2_m2m_queues using v4l2_m2m_for_each_src_buf_safe and
v4l2_m2m_for_each_dst_buf_safe APIs. If the count is non-zero, it
returns an error. This check is redundant as the V4L2 framework already
handles buffer management internally.

Remove the unnecessary buffer count check in stream off, simplifying the
process and relying on V4L2's internal mechanisms for buffer management.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 36 ----------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d162cc9650f5..30a9969bc368 100644
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


