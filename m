Return-Path: <linux-media+bounces-35465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5042AE13C0
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD225A2440
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2B2226D13;
	Fri, 20 Jun 2025 06:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e4ReLmde"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C850221281;
	Fri, 20 Jun 2025 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400508; cv=none; b=sftCVBb66JofMWHk20NIDng/hFDMXi7qqKAtTJzj3Y9lprrzN/h5aWOEawZ+g+6VMRJrQu0eVza/DuhhH922t+2qQRZnt/q18G93of4q6c3Jegx7//j56Yd3aWQNJH6sQAf6sNNGJ8NdAW34WEvEr0QV+ksxBOPNf31pUoRCH0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400508; c=relaxed/simple;
	bh=7yLqISZi2iOkaYLdO3jaD791BiQle43dMbxx3g6IDjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g/9VL+RefcOIydcz+24QIajB234shibfWnbQkobQoiJH95eYrVI7eGV0ajE2eb4tn51CvbQCyBPKu/zx9Jo7AW6HagQTY4qMrRw2p2tpB8Oc458Xn0tqDbNeU0uz/0v5JIonfqe6zl0eZidmSugHbDbnQiJ/LZxVTejIjL3xSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e4ReLmde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFeTc5024471;
	Fri, 20 Jun 2025 06:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tv69h5+7Ly9EksC2Tsf+uzCBpppecTtLheLgqclXCFk=; b=e4ReLmdeLx7bjypR
	60e8TaJ2+OAkWksErbwrMTRFlIKkNRU5zxTxr+xvpnpixbOBqeb8WM1pOVhcGpo/
	ZCmsEYqdGDl7geKB18uZcTzw6D9oymDbNx6z5cK1UpK0rIHXRh86h4h1AFx8t5gS
	5PYbBKZN2MHlIAku7PDQKQP3gAfMXEjvEl5p7GYjuPoCwxBACESLgMB7msAABC6J
	9kGSXOh9b4PRENCxUwQ/c7gZRPbn2CjclYy7usCkzfEdTUq99Pw8Lb0seWmmDLcF
	s0CfGryVLLjEZH+ZhO/mwxRejFrJnUgnwv2b1YtPFefchHHDdR4w471CVmbwwvSH
	Z1MG8w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792caad3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K6LfJi032172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:41 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Jun 2025 23:21:38 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 20 Jun 2025 11:50:55 +0530
Subject: [PATCH 5/5] media: iris: configure DMA device for vb2 queue on
 OUTPUT plane
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250620-video_cb-v1-5-9bcac1c8800c@quicinc.com>
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
In-Reply-To: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750400480; l=1047;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=7yLqISZi2iOkaYLdO3jaD791BiQle43dMbxx3g6IDjM=;
 b=ImbgSpYiEs9xk00RdFh8SJ7TLQu3dgodnogThKGLS1vi0czi7n02MC7Wst+Q9O/1/9YJqPv+x
 Do8NvlMd0J4Dv/N4i9bVNM+zsP11kCQLowyDX0l9Z+phNsFXddyWwwJ
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CVd8M26JK9lmEvmR1FHGqWzp6EIPuFS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NSBTYWx0ZWRfX/dzq0DEt1NZq
 Uu/zS4GWCSjeJ5viOyitQjhayXENIiJLQoPo6Ahr1BOWpkYREvrV3ECI2CyxVVvhnWXpIw70f2+
 zGpw/0uFwVQPkP5HeuW3iI0gYYx3oWS7sEb1vB7eIMZxvIj5a7MbZVBr9ePXiS2wxLDEcs5EHou
 x5eN4NQOjZCiUCFmtpPwTyOJ8s4tGgedLipWlXReLUB9LRRH8yvwpKTD/HfdAHjFItzRXcAWZ92
 WSOjYl8AR8i6r9Zjpnkt1vjNywsjS/Jtyr787pOjCyQ+SHWEmFUBAV3zzcoZZGpNd5uZt7s9Z3e
 YipFSwjNWd06YS/z3f0kazwV9X4a1yMKYGAqV4oMuI6Wc0CS+KNkcoMEV2Nu3o9+Utq4KSbTIjO
 hoeb4k7SM+EdPHrdHmy9OMjwtkcsMtRAt43sbVABd7voXB7f4rfLXJZYpggShXl+PB+4aiNk
X-Proofpoint-ORIG-GUID: CVd8M26JK9lmEvmR1FHGqWzp6EIPuFS6
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6854fdf6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=9NI5Io21HBJBbxBAymgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200045

While setting up the vb2 queues, assign "non_pixel" device to manage
OUTPUT plane buffers i.e bitstream buffers incase of decoder. It prefers
the non_pixel device(np_dev) when available, falling back to core->dev
otherwise.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index cdf11feb590b5cb7804db3fcde7282fb1f9f1a1e..01cc337970400d48063c558c1ac039539dbcbaba 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -159,6 +159,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 	*num_planes = 1;
 	sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
 
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
+	    q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		q->dev = core->np_dev ? core->np_dev : core->dev;
+
 unlock:
 	mutex_unlock(&inst->lock);
 

-- 
2.34.1


