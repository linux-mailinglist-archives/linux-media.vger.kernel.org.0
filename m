Return-Path: <linux-media+bounces-36781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95273AF8A7F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0BA75A23AF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C230C2D5402;
	Fri,  4 Jul 2025 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dM63eWzn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35A2D12ED;
	Fri,  4 Jul 2025 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615665; cv=none; b=mD3B1Vq+QduMXck5xNEIfHIa2fUOxdGl9So5Ve0iYDoAyQkIazIf2zJZdTiSkffTpOce8ho1rqkFoirYEsxDoxl7vXeBBZaafYI1pEXjgzrHUZBxMj6KxFZW+nPNC4lU7BMfdp0bzMDasEIXGlWUaFp4eKg6PUdJzbK9RoQe58s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615665; c=relaxed/simple;
	bh=HRAOdaZPz4TdXaD50WyBJL6WbKyKNuM01m4aW/p2Eks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cKuIA8daxWXy30tLqZ7G6dSjKIBcUW+UTOARW1hBj7gUohSiN7NHvRl6INULIzDB/dkvZ3Ax1QHwYkCENKgdsJ8Auswzm+Ol+wM5tsWCvlsUrWw7fTyxSAz4tNGz6/SaZ0W028t2LDRoOY6Ghv0iQ5z8TCqFU1ebSO87+VEK4tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dM63eWzn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56464I7j007047;
	Fri, 4 Jul 2025 07:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ThZ99ENkNRYHQWZj87w7NChFG0hgkn0V9pizxk8AFR0=; b=dM63eWzntPJpox/l
	inB6L3roRoXzO4l6NcDGQ9bojoCDO4ovPzD4hAkqllWirJNyC2OCrEtqCIINTdaW
	RdjSU+JTWnQM9tXe1mIzzbXWoU8AaBy2zM6o+3eKNrAIYaQRyxHQew2YVLLyntiZ
	HesviHjQorTuhFLfgEN26CbxW/AM7sdbujNAkjiHOWAt2cT35+6eVifXzaCxQq3O
	Ug459NRYnlSFq2AODfGvPLKriqQwQR00LZmNd3TbLRXVvLtyg7QxaoSj/XeuyiXc
	uHqbd0JCBdf92geQ8gpD/0qlvDUPnQtMN6PkYE+1lNPKFDqcLblenLOaEwOBCbJk
	fCqNcw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jqgt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sHo2018461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:17 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:14 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:16 +0530
Subject: [PATCH 16/25] media: iris: Add support for VIDIOC_QUERYCAP for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-16-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1524;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=HRAOdaZPz4TdXaD50WyBJL6WbKyKNuM01m4aW/p2Eks=;
 b=cpEcaouTDmdhSBwrueSrUJVcFOUUIE1ZNWkJaI/iAms8rQoZsodrC9smhi2ltM/FDZubhxk/o
 NGfkEvqWUgXD2gwtFmGoS2FBZ1nmC8dT+3v7lVao6kZ5QrOjEQkspRs
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=686788aa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=-r1po_HhmiMhMH7Jft0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BHSZCCDpKaWfS8UUfzJlY1OZASIsgUUC
X-Proofpoint-GUID: BHSZCCDpKaWfS8UUfzJlY1OZASIsgUUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX5r0Stazfkq3k
 XdXzsZDgLwwMhj5MbfGSq7zoxZJRCyKcRW3cRcydNoO7G8HyBCUu+ARsAcHErVM7ySMBcS07V7X
 OtHHpIUyKLKPQoftspGBFLdW/sHUgdf+Py3GxUG8Itq8D5jWzhRxnEdiz/8nAWfM+TE8eLt3YWz
 tfr1OFRllFHJeB90Qnw/3pBobtqI5SRP21W9ziNhMbWhiOx3hj13EvDglDTDixlJlxZq5zvAtRa
 b84TZsOY5iIZ28X1c15u/rxzDDarpKuob07L5XoQ6C3b6VVRUwAIC7LDadxUqrR0pzA6dF8wgZN
 MIwLCFCW7bJFxEXw8ImQAZtz87o6HOJMs3xI3aqfTdY3bfx7gRVTlldaaGg5ie/9p3iwvDa+JN8
 hm2EiUawkxcd9hlNFfN1iL7A9MZR8wwTIwmj4Mz/K0DHlPo51b5VV9HH94PCNSE/+cNY3KI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Add support for the VIDIOC_QUERYCAP V4L2 iocts for the encoder video
device to report core driver capabilities.

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


