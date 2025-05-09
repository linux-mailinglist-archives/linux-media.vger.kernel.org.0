Return-Path: <linux-media+bounces-32087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB2AB0D49
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A964C6084
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BB22750EA;
	Fri,  9 May 2025 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nBwqSSqC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A8E22577C;
	Fri,  9 May 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779964; cv=none; b=eV9v5MRpOeSEGDlalCP1jihashMBG9qO32/vna7kO+3O9ULFf0b+PwGJ1q5a4n56+MGDYDAj7ztRFYXm7AdUG+nNLhaJRE8nq8iVeKoFOg4YATMnJM3i1ao2cXHOkobplFTYgEiJVApOu8XaZF61TI4aYrMou6CfDM3gayPfz0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779964; c=relaxed/simple;
	bh=5pE0CFOIr55+g7tVkgPeqwpzKTRTKSG2YjSACEdS3xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NQhMyl4Wu7naIkvjErmdMzsrHNMS0d6LOXyUq1hka/wh7fpCTlTXqFfxQhkJ29WxPTLuaZnAv/XZdGKDk7qi0Vqhb58QS5Evm5xJr/uDcaKUEDDOPo/PrbzoO+l4ACpnrJJm/P6JbcE6OSkrR0fWVs/6sNiJHScwOQ26SOU0n0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nBwqSSqC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493FhQ9031737;
	Fri, 9 May 2025 08:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOj48JPzBpVNoG6unemPMS49ZrnycjQPU5pFq6KYXRE=; b=nBwqSSqC5Y1Qwok7
	SZna4QOp0o5K7jpEe9cAFQ+0/SJFTnx+I3noeGOtA33aywjXIV9wiJtYu3m24ptv
	4IXb6VeHTSabTQdLbYCyOst6p1coy2HBMv8gZZDQ1mM2JJFE70EDtZ+ZVQf+fQu1
	3kEkbRPkeU3sZUNzfvl5inQyeyIiKXwZNHSSCOI52C6CiA7NyBlmofI4igXkHl9I
	MWrMfMI7PHCfbBv68rDkqxTA/eOX4I9OGXZfkrjTFmtGZBF35fSG8761M8F6ZEN5
	HVsAxbvvSrjBdeebqIvXyuhl0u1ERmYxUs720YCC5C8+ZrNIsf9Ut0zeE6p1pvLM
	EeHvzA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgkxbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498dCjs030543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:12 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:07 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:48 +0530
Subject: [PATCH v5 02/26] media: iris: Verify internal buffer release on
 close
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-2-59b4ff7d331c@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=2772;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=5pE0CFOIr55+g7tVkgPeqwpzKTRTKSG2YjSACEdS3xk=;
 b=gzGFTyuFUPNDxjCsiop6CmfOU1LNIQjprEB7R9Mxm6DDXWkoTayOjH3zBJGpSAfQQxGP/W7B8
 05zjlX1k2XXBn4YZM4DQRuWm8ygAicyhL8gURlvw9jbX6AbjwtUCg63
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681dbf31 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=ezGHl5yxtDyWcc44LV8A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX/le7UBak1V1a
 XDeB+6LhzZvkeg9g6rLv1kBhdxtMmGx1Dgz85YglqPhDgb9mCh4txB3c+vFGLJsKq1fP8udVPeW
 OrTGFqctqZ/eo2Zb+JKWb3B2CsRIF2w+iqWFmVHeivpM2oEvmuGqIsTrKNuCTKDm/VCGJpOTFMm
 Y8BRpsk89/KRcrNHgynWoH17uyUkItL1md1tqHCmxVxQickZP15apwntpLGy1En7OFmbOKEyA6M
 caF73QPjo8szLiy11tAfzagsO9Vb4LMIftp5A48r1L7RdWE25ijGgQFn2xkPBlvy/atIrTTiVYz
 ezNaWwML9bYoPz61/2pYpvKel0wlQsXjjCnm2inRXSwKAFyqil8lBH/ckNVJnLy32IDZVRqsDhd
 Hynf/l7cNLlioLPmbVqmW9ShWeecAvn3aeLqDxGngTKo9EHAa+/J5AKBeZSmpfXBC6VS+I+K
X-Proofpoint-GUID: UMTvpXdnwd5iSXxzeTe3h8AkmuNyJ5WI
X-Proofpoint-ORIG-GUID: UMTvpXdnwd5iSXxzeTe3h8AkmuNyJ5WI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

Validate all internal buffers queued to firmware are released back to
driver on close. This helps ensure buffer lifecycle correctness and aids
in debugging any resporce leaks.

Cc: stable@vger.kernel.org
Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 663f5602b5ad29f273f01b59328da104b79e1d84..a8144595cc78e8fbe33ad5bfa9688f96f2ef8ea6 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -221,6 +221,33 @@ static void iris_session_close(struct iris_inst *inst)
 		iris_wait_for_session_response(inst, false);
 }
 
+static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	struct iris_buffer *buf, *next;
+	struct iris_buffers *buffers;
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count, i;
+	u32 count = 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+	} else {
+		internal_buf_type = platform_data->dec_op_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+	}
+
+	for (i = 0; i < internal_buffer_count; i++) {
+		buffers = &inst->buffers[internal_buf_type[i]];
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			count++;
+		if (count)
+			dev_err(inst->core->dev, "%d buffer of type %d not released",
+				count, internal_buf_type[i]);
+	}
+}
+
 int iris_close(struct file *filp)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
@@ -235,6 +262,8 @@ int iris_close(struct file *filp)
 	iris_v4l2_fh_deinit(inst);
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);

-- 
2.34.1


