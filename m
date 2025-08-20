Return-Path: <linux-media+bounces-40371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB2B2D7D1
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C306F3BF456
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671802EB841;
	Wed, 20 Aug 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="krqx24Rf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A42EB843;
	Wed, 20 Aug 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680945; cv=none; b=TFJWfN+l6NwuQARxkajpCA7T+kkIvqtPLe+Dn16sx/N1QiwGgUX56p3b5phwbrVNgCdBiACTBwb5LDaprlOFZTfZe8CZuvpGgoZn+stKDmLH7QAHzc7tBpIvx0Vw+CYRXKQ9ewYZ9nTuf2k/cCdQI9BFO9uriWyArz8UV/5mYj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680945; c=relaxed/simple;
	bh=eXDYoqDnzGGs20/J+A8xMPuMBnA8XQMbv9ZDBDRA7ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dnUoDB5ltIOkzQzuufQ7e9uBapcwzyv9ckbR9qtfTuoOGM/x/mohFRs8oEYWq/3B9rK7iaPTI8ilEP3y+5pHk/rhzqCQMX1SqSwXmTHUmLGPLYYpFy127NWPF8bGlw4LYzWW040LD0Ynrv7BEQwKBJMiZo8W+qLw9+KW/ooQmDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=krqx24Rf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oTxv001966;
	Wed, 20 Aug 2025 09:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	psrTwB2Lpvty8bcIBnz+rAMfe5Oc2tlok5TUd1qnb2Q=; b=krqx24RfC9HD3gEN
	DmIV7Z0b3m2+LOuNW1yPVaCtizqWveRwbtx1jSzoIVIQuurhHg1jnt2a6pjnvick
	qAjTr+uclfkVRYdqSL1yeOrTzZJO7pOtivGxG8Ucol6k0vOJFdF//3emWiBPXvpx
	Q6WdhLNbxMSFSq1CYST38j5m+1HReWlGpAfyv8tDeFJNZxl6cS9BZeWSU344fHcV
	yDGnIHbmrIDLqfPoRj9kpiF/cifPr7CSrQAJir4bJxPtKAd/iWDrh9U8PG3TcVC0
	i+JgP0CwLqdOPxAQQTxMmumXuO+KcqcAY4NYnZeDsMJS+zd3+HRjm7gwVusi8OzZ
	2ZvFWA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s3py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98wtK011910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:58 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:54 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:55 +0530
Subject: [PATCH v3 17/26] media: iris: Add support for VIDIOC_QUERYCAP for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-17-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=1641;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=eXDYoqDnzGGs20/J+A8xMPuMBnA8XQMbv9ZDBDRA7ws=;
 b=VEObIANLWUDc9YNuGbcfvAxM8Nxu14LrBcF39fxCSXV0DcA4FxBOhtNHjfo/NOqLH7e0jftj/
 ktB0oIpUJ9YBdYldbPlUeyaKM1l45KSIdZMU9gsPwu+KrVu5t11JCzz
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a590ab cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ky-C5ppFSYfpMUgXL_8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: azLgmu_pSd7y3q2CBUa9WyE7JusX6DB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwzddHUe1xasN
 Fub2iU5xmKUxht3gni04mFRumN4mLjWSNT7lyeKvcz3VWU2NQgitn44q/JOeiCNpZUJWE+5F+Sz
 ogSOTj/y+liiJnt1kOWeLz1HiU/yhsjr12G9EgbiTSel2p7zMRpPDdNkOCi71MvbNYQfQiOFeWF
 X+IuMkF6i7p8xRFVycV09VGBACAXgvikdj5XeT1uzY+vMK1L4Up4e1ofufWNUDCsRiJxfw8kyx2
 Wl2qh7cAFabBK7xjbqX6GF+JJFFy872N3PUc7WJCAAqkoTm5B00y+253J911BGb1wBe4lnFBfey
 fZCGCePQxYPGwfPb8rdFGQ1uc7JkuGKOvB7qehMyNaRjSYPZRU4VqJxot4x+rZfUBNOkFijyRsy
 TBGSyr8NG0ZV/kIc8C713pMhWNAG9Q==
X-Proofpoint-ORIG-GUID: azLgmu_pSd7y3q2CBUa9WyE7JusX6DB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add support for the VIDIOC_QUERYCAP V4L2 iocts for the encoder video
device to report core driver capabilities.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 3f641782e932a30af46c631003a72d7dd2b4386e..92a616787a30a51f4fbf4760badffd6fabc48cc6 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -444,8 +444,14 @@ static int iris_enum_frameintervals(struct file *filp, void *fh,
 
 static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
 {
+	struct iris_inst *inst = iris_get_inst(filp);
+
 	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
-	strscpy(cap->card, "Iris Decoder", sizeof(cap->card));
+
+	if (inst->domain == DECODER)
+		strscpy(cap->card, "Iris Decoder", sizeof(cap->card));
+	else
+		strscpy(cap->card, "Iris Encoder", sizeof(cap->card));
 
 	return 0;
 }
@@ -575,6 +581,7 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
+	.vidioc_querycap                = iris_querycap,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


