Return-Path: <linux-media+bounces-32105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99122AB0D91
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0054C188D8F3
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2EF2882A2;
	Fri,  9 May 2025 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M4n5ivye"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28FE286D78;
	Fri,  9 May 2025 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780041; cv=none; b=IsNLGgOSR06ax9KAuKeeNoKpIUFWxnMA3Kb0KekRliRSqHn89rNcYgvSdG4DUTvE/M20CMU6E1CBSEjHXT3qLOD7LsKaseQQsMONE3V2B33FjNmzCc4vRTGLk7SvjxbW7jMapbLunOO1Y2sO4JAKjWfwib78oqFjvQo6ZA/RDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780041; c=relaxed/simple;
	bh=FSwbVH46Xti17Kml1iZNQTh6iMXo7EfC1mfDi+8lgg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Wk//WFOrfiR7GVoykYoo1LKyk4QFE/AqxjLYGkKzQjnxIRLyU5DhX10sbpprTlz3Nac8zraoo8T6jYBmZoDk83M3fkWt/vvYBVm0Wp/FZmo/a7en0FlNhzA9scv/pMmBq5vZkuLgnaZpKZjmOu/3PS5tGXsw673bK4Zj1r/MoaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M4n5ivye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493PSMH009418;
	Fri, 9 May 2025 08:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlGFdPpsRUtOnhKWd8z5BIW+vESApen8DA7K0bfWBZM=; b=M4n5ivyeK7gcVKen
	tVqfx1dHrQeQoHQIFLviU8cEJyjMiTWU1JhsRkaGH/FgyotwWD0R9pLy/tnpxRNi
	m0Fd2D6Y8oVDCZS9O/i+pFobCZBPPDIuaieRslYjti8A1oKGXrVMyeVxtzYrcRdX
	YqtpTdZXi1FbR1MId4p29BhvM60OYgnXRLNk6JqJnPkeRaQdMUh0J8AW8Moo5kfK
	8TR1hp2NAAbXDM/FDhI/3a8OdO7+cmPdd0oOpO9eitNY43LeRKAjYKYvjuw+r8U6
	cfNriy4rYZ0iZImRUpvZ86GmxZPYtYczQb2QePK28okkGm/lBRYyMK8HL8bFGeoz
	QJv8sw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpeuw4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498eYvj018026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:34 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:30 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:06 +0530
Subject: [PATCH v5 20/26] media: iris: Remove redundant buffer count check
 in stream off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-20-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=2840;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=FSwbVH46Xti17Kml1iZNQTh6iMXo7EfC1mfDi+8lgg4=;
 b=fZw/9moEUiuGk1c6V6v7KCRobUwtNLkeIWyVoggKTHNIAeRywYc2HozuY2CJLySWKGQtNamoC
 nnhUL5QcdZ/AYLdH9WRsxJb2eVlDilu3cEl/TlxZGfzFtMjVl0hKtqr
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX00Bk+gsOa4un
 7LFwEic3xqZbgbwIcMb+kf89HwHX4RwF7YVdaaRx8CMD1lnam5mbs3C3WyoaZrovvYdAvB+fRjo
 yHhFgoZzxHQDDfUUMyEP7eImdcim4alaTjLFSCE2wvRI7Umju53yswaX9s9Kkj2peq1iFBAXwaj
 o2fd8VqunPnUmutIVZnAoECC6AmWP7iTn7HxMu6DVmeKO9B1TNOrciio+jw89GQvuM9UpNOlTY2
 ss5/sKPg4r1UqJKsIcE5DMG1s/fddC6RjXNWavj0EcOyDfYAeBOGaDk7cfXpujVr2Qx8RTKnyE8
 TBlsGkP1T57KOE3c6mDVU0ne28nGvrfmcGV27q7hwwULOmm0aZJHUhh1HmReeyDtWHLWNHK7Xdr
 hmc+BX6EP4lYuy8jFRoW+uxh7cvb6Vob7w00lmtUgQFuz34BucxoimlZrvBabTj6MZvKx5/A
X-Proofpoint-ORIG-GUID: AXST2iRhi4OazUP_07KQhNkhlCVzklus
X-Proofpoint-GUID: AXST2iRhi4OazUP_07KQhNkhlCVzklus
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681dbf83 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=-qshO7OKkG8J2I8e95wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Currently, the stream off process checks the count of buffers in
v4l2_m2m_queues using v4l2_m2m_for_each_src_buf_safe and
v4l2_m2m_for_each_dst_buf_safe APIs. If the count is non-zero, it
returns an error. This check is redundant as the V4L2 framework already
handles buffer management internally.

Remove the unnecessary buffer count check in stream off, simplifying the
process and relying on V4L2's internal mechanisms for buffer management.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


