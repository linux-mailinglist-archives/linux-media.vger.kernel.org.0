Return-Path: <linux-media+bounces-40361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3AB2D7B8
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D71853BEA49
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD232E54B6;
	Wed, 20 Aug 2025 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G0wuLNZk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38142E5420;
	Wed, 20 Aug 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680906; cv=none; b=ouWfeDZDVt5+vAqgACWeKMR+TeexG+fCNHvWhPsBc+KDmMTycsWIydLIu91l+yHxhEKCOKVCsdq0Q04wJF54AbDhtdzCaR7RubVXq8JJ5B20fJGByJJxaT9ZZ9E2QtyHaiGTfMcQree7BbC2HlpWC5dFRRZFDznQsqeF9colnyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680906; c=relaxed/simple;
	bh=3VyQQnDgqEQ01wzNip4NYpPcfoZUTz53lDKM/6mb++Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=m96TBOpxN9JFxIduZjz1J1l6i8gdQkbogg/YXdmFzSAHiOIQjzGjH5mkKvaf9fySG88JDusOT/490mSFYCv28NqTRmhuYEiGL52E3DweVDyvTNuJZWhyyBfBEo/cEwDcGSdSaQ4/pWak0vVh3V29hE7pexlxfKv0F54szR0DXfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G0wuLNZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oxMs005872;
	Wed, 20 Aug 2025 09:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRtkU1Ws1PmOsgwF9N7RNwtXaZvqbeYkEEcLtBXngJY=; b=G0wuLNZkBCYbCLmh
	K0Gnb6tlKfJnj38fswN9kMnefzppYbcnrdoQ3ijUQhTgYV4ourHhO3K2M8Sof5Fd
	jLqe0QldT9128RZ4HZ0jnBhwZyAHnA4jSCry8IEQHf+EdMZs7kedBAtJJPfAnh7d
	MpWX1wR2nY+teC2oqqUqf5N1mZH0whRUYOjBb5euxW4kPB5e0P9uVtPpgkDkVYkT
	eNzKE1OZf+nJNls1AI9yFrLLHTg52mF7wntj3FSwpunE/txL6gAHXCeI1ZXOgjYa
	vo1NgmzsJ+Ee2RFAMipKDkt0gohcFHk5ySbmu2ZzmZF4rToPmBoq+iV+ieyyziQm
	QFpeEQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ch3pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98J01004241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:19 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:14 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:45 +0530
Subject: [PATCH v3 07/26] media: iris: Update vbuf flags before
 v4l2_m2m_buf_done
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-7-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=1548;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=3VyQQnDgqEQ01wzNip4NYpPcfoZUTz53lDKM/6mb++Q=;
 b=oSvlQ7OiBf1rhG1LfZFY2Je3fq+3pBu7ryCcJDtFXUxUa6UFZBeLOdA1U5/705MOJXjEvX17j
 IfkmLc3svcyB9up6BiZV8tQ2JEmySzESPn91Ckqy6gMddz4Z0u+VhiF
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yB_JzA8HTtDjvWmMYj57lWgL-eTMxNgR
X-Proofpoint-ORIG-GUID: yB_JzA8HTtDjvWmMYj57lWgL-eTMxNgR
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a59083 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=MjMrax0v_7cEApFHy6YA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy0AP6nRyntD1
 AD2cgRR9FMaDdJm0BhoLNVZdPVrJ8v/8QoX8BEUMB7qjKyYa7i2Hx/pC5Iu8ed6bc6Gmi1D58Qb
 FRWLc1m5ZvdyURQ3S+6Er5LeTfzhO7RjEds3yJ+c7TbAnXAljydHKHhTzw6C8vmv7upEhDnbIWg
 i/UtxS2db4l6eNI6anIGXcLPEy3pZt1xuDHgZaIp7k7FspaLpI7UCi45EosWFkdm9WAMlkilb0A
 YZnm0Kxm10+XjC4YGNbKl5U7XuIoPdVW/PiHof3aX5BcSwL16KDcdaKTacrxx/KdeOoQJVld09N
 /6T3PQ/JLpgZ4FEqEOssD1sKtxDy7wUKuqRf9fF5CWHdi+kzz3geu7tKAlPQzYjLvypNuIY7wEA
 yxIjLYQZYfgIqYV9cDZEqTLae8Vc+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Update the vbuf flags appropriately in error cases before calling
v4l2_m2m_buf_done(). Previously, the flag update was skippied in error
scenario, which could result in incorrect state reporting for buffers.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 23cac5d1312913b8dac44347ae66cb80a6a15deb..38548ee4749ea7dd1addf2c9d0677cf5217e3546 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -651,6 +651,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	vb2 = &vbuf->vb2_buf;
 
+	vbuf->flags |= buf->flags;
+
 	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
 		vb2_set_plane_payload(vb2, 0, 0);
@@ -659,8 +661,6 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 		return 0;
 	}
 
-	vbuf->flags |= buf->flags;
-
 	if (V4L2_TYPE_IS_CAPTURE(type)) {
 		vb2_set_plane_payload(vb2, 0, buf->data_size);
 		vbuf->sequence = inst->sequence_cap++;

-- 
2.34.1


