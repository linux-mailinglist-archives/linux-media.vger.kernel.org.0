Return-Path: <linux-media+bounces-36122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B25AEBC5C
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63409177A5F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06092EAB76;
	Fri, 27 Jun 2025 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gRGZSOQC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81202EAB8A;
	Fri, 27 Jun 2025 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039326; cv=none; b=OvE1NVnhXpO4LygzpjaEZrmtbsZhlY6CODbhf8V89cHDfbguINDGKLX1luDM1/7kVFPbpaD19W0OKBJNBvYRP351riuem7mm4XkcPBo9UClyJ2sN2VhrOiHza107xeY0atp2QzxFWoIE55eRKUALkgZpP/oPNhQB72noqGm2f94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039326; c=relaxed/simple;
	bh=7yLqISZi2iOkaYLdO3jaD791BiQle43dMbxx3g6IDjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qrvn+0nDUBJyIxnfVkyR3YXYc2xWs4AbclMzxlZNhxceAqJ2mNavsm5gNKUoQqYIVpqn/MAe4lFlUrI43sGpVtflbDlUId2MRPbGxpv9szavo4cRXWdjp7Fh6aW6Lk7vmoWN4DuGqBczZ1g0RF8t2BHTa8i//0yEWyPtOaZCcrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gRGZSOQC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCIo9H028698;
	Fri, 27 Jun 2025 15:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tv69h5+7Ly9EksC2Tsf+uzCBpppecTtLheLgqclXCFk=; b=gRGZSOQCphYRkqX7
	Aq+Hj11aUw7umLbLdqti0LrTYMYwNWu6n4So8v4CmPvIVgWEQ5nie6kgFJHNHePe
	Yo6mD3NKQTculMsmIuqDoJQPrEy/QQ5lfbeYDG+JDw5iUv+YXuFa5Nk7bIOn4yPr
	kMMHJBe5qBxPu0bgfmyTbyldbEgbCz8L97SdLSW+ibDWJ6CBAFGF8PJ8ouUiukAU
	GOjc/alR2xIECvu/qve0QamLKiNDJeBoPIB4GuwLoAQJjfa4BGeWXbfTh/Jrcjok
	WROZ7MX8252eiywhhrUjXVunmkzRMB5DoM9Oi9Br/rbdQQtLRHB6mk8/vPjTMS65
	JkI5Ew==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa50nbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFmcWL025734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:38 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:48:35 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:18:11 +0530
Subject: [PATCH v3 5/5] media: iris: configure DMA device for vb2 queue on
 OUTPUT plane
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v3-5-51e18c0ffbce@quicinc.com>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
In-Reply-To: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751039297; l=1047;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=7yLqISZi2iOkaYLdO3jaD791BiQle43dMbxx3g6IDjM=;
 b=f/9pnDtfHnKYZSWsnIhQVhw3Q24SY8lTNex1OwDLpmmvJzY10eYJgyezMK5PgAH8Oi5oJTQ+f
 EwPwIma40bnAsQUBJ/kk7SK9kZsQteDoHZknKQ3nE3NuhZxekcCilhX
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685ebd57 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=9NI5Io21HBJBbxBAymgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nTC4a0Avg5fFgynBOdyyHFyLgH15LAaL
X-Proofpoint-ORIG-GUID: nTC4a0Avg5fFgynBOdyyHFyLgH15LAaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOCBTYWx0ZWRfX4Fi7YTg6ObH1
 G5YTCPX62ELbBiBF5T95AJ6cdvNz7AL+M/9kl15PGs7Tm/Ig7NGvAA/wZd73rrafmO9ohLWS2oe
 c+BnUOepyTGcarcZFaUYET8bJVhS0CBsddfv5toAvdmJXl2T19wAoUqrfoCE7HEWvQTud2ko9pZ
 bsTWVie4RD8OPd0qzN3po6t5wt6+veZTc00VhvNqtqCy/fUK+P+SBfWqze8bAl+aIeggVTrrtyX
 x7eGSMd530Lmp0tf4ytek21aBSzJNCiDyPOfj4D1eQcmaoN6IzLyVytUvPJlXJURnzOebffjYFf
 UVxqZ46bYTOvPSeVD3Bhflw72OfA2LhbkvKyYyw+It6hMc7SyDuVDkgwZRVOz8k3HAylQiKCQP/
 YUqOjWQSsJqc17zDNViRgGs7LuALhu7kUyNKFNi9DDMdOOIUife6ue74Z+to+vMlkvsEbZMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270128

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


