Return-Path: <linux-media+bounces-40891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D52FB3374B
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A354202A25
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8692BD5B9;
	Mon, 25 Aug 2025 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gNOfcVUY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845082BD590;
	Mon, 25 Aug 2025 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105321; cv=none; b=sGigX8XpUIl9b2slKydlqqElYrisY0W0EiP2F7X+JnJ6viPaXn/dUQdABBtFf/rbH//UIajEktwKi7g8ewCGkace9l7FRx+nEunJGoMSY6sEi14ygrsjedhMJgS+bRVVNO4IRmqOJwj607XnjaUTIR/mzl69LuHSZgXNTecRA/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105321; c=relaxed/simple;
	bh=TsgICSkClq1Sm0fAJUfWg2z4PxiIFqd5myul3628qW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HD6ssYAD19/Q5Q2MRkX0NK8AOwrTLJkf88L3RI4+zx6ZkfsaR2uxrwno2dQ1qfcX7+cbJvIl+0Cxb2Qnhm7CLt0th5vhQ9FdqImWqsumsP4MeSuqWb7lrjNsaCE1b2VJn5MvbgeuGAJvpOHCDOeAfDK3QXgfiYms1n7Db6/G+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gNOfcVUY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OKbFwA005298;
	Mon, 25 Aug 2025 07:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exZe8Y4kBBQld+8OI2haYTsykAiMiS6VvbyYEjBJmCA=; b=gNOfcVUYs2taUeEO
	t4uJQWc1U2I+0xr/LjAWu/1VnzE72u0DkrePKstDtP1LVhZ4nfTKK+UHH+kospp4
	pJ9dlHFtvM7ef7TvVJ5cY30HGCS+3HOs4kMrUHM8Q5gY76+fo07FGBjN/jdXBGv2
	qjDXBj6aWAXtSIcLhRcN+ttAPz0D1R86nP2Jiu+1Rz+DiflcorGVqbgQxBLoHRmQ
	19NN2FVC2Y1IvGS/FLH7mjLuBwDba1at7X4SZXGuUpbshzA3oK4H0gL0+ucdPvcU
	zP9QLRisPEvZl/3Xt0rcJnfTsIXD+SAcepcj7TnnssPF8Fx119MCAoll/gJuRwXc
	mQCfzA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de4576-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P71rcS019021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:53 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:49 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:41 +0530
Subject: [PATCH v4 17/26] media: iris: Add support for VIDIOC_QUERYCAP for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-17-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
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
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1783;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=TsgICSkClq1Sm0fAJUfWg2z4PxiIFqd5myul3628qW0=;
 b=VLFCzbxHMp2OftK0JgipIQIfy/kMoToYEZfgmFtSgyFlhW6wJ5XdT6GKwFrRDb3BOSRSGkT3T
 onysKj7sAX9BX8sD5IHybuKCdux/hJvy+gdfl7ms8BYcK7QXyIA0Elf
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX+0KqHD+GdIt5
 MGrng3k1dpVTfwgWDYje1HwR4sHYtENkomxdEzuY0KMvvhEoLjwkgdXCC84SqBvLeLmIlm2LoLk
 RilzBlxQvoM0LEa9dk77bPJUakuUpMgdlGLw0rxWCYRzktqAeG/VyM5svCx+Z6vZq7iDQa0v9k2
 Gr3dmtJhS+AfW3/wHegUObkVsUAdkLo34SKGK9/7pJjDlagSu87j4ks62iTECsgxZo+COAZ9pj6
 aLH7HdsYB5jswLNfjSCmWQryWxN17TrZLfZfXN8RLdHlCo7MysSBzsucODBNS1rTilSclaJymN2
 zP/cOPYjlAjkopOeO3zB+5rNZKIzow3alccje3d0S1bvvVI9SrRq/vJMOFvXkXbxaP2k+1i9/m8
 smDbfa7M
X-Proofpoint-ORIG-GUID: mT0Wv0jmFSmjkyy9KI04TpzDdJ8r6YC3
X-Proofpoint-GUID: mT0Wv0jmFSmjkyy9KI04TpzDdJ8r6YC3
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac0a62 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=ky-C5ppFSYfpMUgXL_8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

Add support for the VIDIOC_QUERYCAP V4L2 iocts for the encoder video
device to report core driver capabilities.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


