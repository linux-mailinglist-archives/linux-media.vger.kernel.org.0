Return-Path: <linux-media+bounces-39773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B711B245D2
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AD1F5A3F36
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1E2305E1B;
	Wed, 13 Aug 2025 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S/Uj/ZqI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86CF2F49E7;
	Wed, 13 Aug 2025 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077966; cv=none; b=ldnt61tG7aH+IlKbxOFbRFKGyMdECw0oSJSwegSLueC9PnXK+WOhOBlotW3G4o/09XBVmlsr2PVBPQOpg9W4O78PEKwNH+L5SDd+4dKIuXM+ET5SoZLbHegjEJpDT7B+WRZPBHbce0NtHxls8vUAX46s1uzZ6esIUNFrbNyftX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077966; c=relaxed/simple;
	bh=1xHMvtJrQisLlr8pS7p29XHFPEKuJ58CU6l/Z3BmEQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tQwTLZeTFhIVKN0OjsPhlcL2Uwvx1vXHQvWwavrNOWcako9Nt+H5REf1nXM4qSFQNzBpNXvhcbYUkgLCRZ7yFcO8Ewe/cPfJha79CtFk/6tWEY5eEbWmpuguwkVFpSsPVfMFQi8EhgKD3IENucX4wdORNJLb1BlpZhII55b8d3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S/Uj/ZqI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mhpv016517;
	Wed, 13 Aug 2025 09:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxC5Bmg88kEpvy9IJ3z3jhlQdxQqTo6MZjVRvEZ0QF4=; b=S/Uj/ZqINfMhia2z
	SMw9ze4ARXjWCu2R/Sj7n70kHYXmP3wyLNcXvLHagm+896BQo+GNA3BnjThxH1rC
	rW9NTvMCAJEFduzT/2FoRiQTCV3Dw4uEJr3m2gA7U9vwyRT92EDWk759N9tuJ8ho
	B7uxrshfhM8mIC8bq0RBCsEqZ3DF7RrBh2QypS0E08rPcPWOtNNlOofFEZojigUE
	5CgNIJr2vXRT7X7YAtuGQoSb4x7fXFLyJ4mnqeljiDUYurUPUAjaG70GH7/8cQRv
	O6w1aMfIsIz33YW69QYsgksqPcB/jCktErj2PAZQXhkZYhTuSFUb/rweMK9wGBp6
	/oPkaA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbefmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9dKXm029289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:20 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:39:16 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:08:05 +0530
Subject: [PATCH v2 15/24] media: iris: Add support for VIDIOC_QUERYCAP for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-15-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=1590;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=1xHMvtJrQisLlr8pS7p29XHFPEKuJ58CU6l/Z3BmEQ8=;
 b=pRi6GT3SblZLmHRXFBAiUOoIipBZBdag0n7EdGXUZTGEruAYt060b0wn5bjwvnLXVvB4ml8zE
 w8rry3lDRL+BZzWD4iw5x5eDQpkif1YB+gRl1y7a3IIILwHSD33X8f0
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c5d48 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ky-C5ppFSYfpMUgXL_8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXwNBvADg8fa2e
 CoYLlwKQRtZ6zSikxnD4y7RIjJ/AKyeB5PyAKWtA0BDMKfIz3PmfdQ8d1F08XR7YNJZyBeA6CAw
 DmppL1Y62ggW9IxqTyu2ZbY/Tndi1aimr0cjtcELwHHe9w4+u2dVJeqmyLzzeSUqGrAK1duuMk1
 qn6sdQHSntVSNg4C7raWYr2H+knuiuVBnkiv1eWCHFY1AFRSNfV5UYtKmhYTrXQS8xCe68FgZUS
 NMrN6ao6a+LmVwVeYLHUIMj+FEPyMcsUOD7t//tRftZH0WcAZO0BxQ0HrBwTb7VFNjHEK7QAUNF
 5Kuw4hyfllLBPyxfgStxgdWEEqs7TjRPJoT7r0btgKqIKRbKZID/CGf2d5DKfzn67gioOoRtIow
 mCfFEDhs
X-Proofpoint-ORIG-GUID: mWqyTCjdNP7QhH7R6c8afMYX3Zw5C219
X-Proofpoint-GUID: mWqyTCjdNP7QhH7R6c8afMYX3Zw5C219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

Add support for the VIDIOC_QUERYCAP V4L2 iocts for the encoder video
device to report core driver capabilities.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index cb1280c0c6c82187243f0bda4d98e42370ee787c..458773a2ed7f5e16d5bd5e79dba2f5c029036505 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -446,8 +446,14 @@ static int iris_enum_frameintervals(struct file *filp, void *fh,
 
 static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
 {
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
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
@@ -577,6 +583,7 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
+	.vidioc_querycap                = iris_querycap,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


