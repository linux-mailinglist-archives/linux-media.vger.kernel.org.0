Return-Path: <linux-media+bounces-36113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F6AEBBF3
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3092C1C42C6E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990602EA734;
	Fri, 27 Jun 2025 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bIlBj4vN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1D2750E7;
	Fri, 27 Jun 2025 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038399; cv=none; b=Sr5sWDz3VhkIw65e/GTjTX/whZwaC1Sf6jJxhRMkwOKoFQDFYbfnKEwfDm8hv5ZQk2qLctVil+iIA3VcoHCG1vw8RgxFQM6CM7q6OHqBIGkkNfsn6P7H85OGQHVsDYOfax+1IjnRD4OS1weeLe+Lof81410sgcRo1/9CgBksiU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038399; c=relaxed/simple;
	bh=0fF4DNnpznZooU8ZimQgDbL4koCdAAspFuMZgiiLEDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=V3vMStLOYvZOm8hp8PQC0Vw5P2WG7iX8rzS627gHrcj15ZDvF844pEpQCg/t7//ooK5vs80+/+id7mC5cIHkKHIb7no4xSYXR7lDvWzLrEMuQhg2aXCBGdVzQEh/3m5WBT6rOnqYeaY7lrSJvNUBqNVijLAaRMF4b5uGI/np4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bIlBj4vN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC5WVW006912;
	Fri, 27 Jun 2025 15:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZpCxuV1i7pnVntekzWVB/5wMZnpky2emnke/YBRFfI=; b=bIlBj4vNRqQ/iivt
	dAYKsOiGSQ4uGqmbt71pCxLfNfKyDyFc1ZtzqhOULA7aRUFcOLW5/XTqrXGnGuvx
	AYg1aI56Q7a9aUi8Q5v+BAn2eP83HIictncYX2sRi0bFdWUvYaLASSguITGPKed+
	6qCvy1TELnxVPb73utDhBDRtgvwIqDbwtQs5ODoGGmd/5C5j+YLyyKwRjz0MXM5P
	bWRr3VICi5/6sXS0dYisKyW2rb64Moyq7zmwnyy+BrE1Kk+dvScRcwRYYTY5k23y
	vZgz7Aez1qEbvOlOsIW/1kswmEHGaqGqk4VWwOSNyB6VoQpwV+bMq+BDq/3Jzx0t
	y3Kk7w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60fwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:33:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFX5e6004375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:33:05 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:33:01 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:02:40 +0530
Subject: [PATCH v2 3/5] media: iris: use np_dev as preferred DMA device in
 HFI queue management
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v2-3-3931c3f49361@quicinc.com>
References: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
In-Reply-To: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751038370; l=3237;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=0fF4DNnpznZooU8ZimQgDbL4koCdAAspFuMZgiiLEDg=;
 b=i+v1T66PJDBY2kTVdSFvVWiAVrsIOVUD9IQufDruH7jhAJn8ZzbWdqT+xMPViWPZ07G8IlVAK
 Je2psbZcdIOBzioqh5u/gO4QLd5d8Uo/vtCoUiKyFmLQyqSkJ3X0bgI
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RoUCscVXNcAwrHEOCBeqBdInHPq8a5Cl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNiBTYWx0ZWRfXzQy5h+lPIVSd
 b6kXwq4srbugLNogqgOj+O3jxCZTK4z62lRdVACb+lDYIwn7bwv98a3s3T/lD4AL9/VdZJoSu8i
 mhQ7u71bZ4pQ2TqCiSAd4VnII4BF4u/FvP3i5yNKO6rJRGnBOAFu8tm4HhTUF3RAH+KTPyNJsUn
 zBWdevkqELOjrtsJpB1gQhhVYJ7Y3HBtACSFZ2fBLJdQViwuoZfxYRSGbCpeP9/YdIkPzYej1s7
 oF7/IGRSMYHOUNV/QbXS1xAU6SdOFSbyy5HScyX+W1jVQVYbXCHcP7wkx+tEWWIchz2oR3qO+u6
 q5lgjh8mWzzrK+8o8Sy/BI3r1VZLNOg9N3pQ43r42QtugNzH+DEydNMS0tcHbzR0Zoc3aWgnjbi
 JSKcIFdra56WqhupbgGGyW9qHEuSpHAk8gWY71CICjr1twcTccfGMhiWBsjLw9yY0MSKOI4S
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685eb9b2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=gd6Ub234OC9brPQr5uUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RoUCscVXNcAwrHEOCBeqBdInHPq8a5Cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=931 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270126

Update HFI interface queues to use np_dev(preferred non-pixel device)
for DMA memory allocation and deallocation if available. This allows
platforms with separate DMA domain for non-pixel to use the appropriate
device handle when managing HFI queues and SFR regions.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index fac7df0c4d1aec647aeca275ab19651c9ba23733..a31ebe947f525f0d7c09f8b786939d01b62532c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -247,24 +247,27 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
 int iris_hfi_queues_init(struct iris_core *core)
 {
 	struct iris_hfi_queue_table_header *q_tbl_hdr;
+	struct device *dev;
 	u32 queue_size;
 
+	dev = core->np_dev ? core->np_dev : core->dev;
+
 	/* Iris hardware requires 4K queue alignment */
 	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
-	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
+	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
 						    &core->iface_q_table_daddr,
 						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->iface_q_table_vaddr) {
-		dev_err(core->dev, "queues alloc and map failed\n");
+		dev_err(dev, "queues alloc and map failed\n");
 		return -ENOMEM;
 	}
 
-	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
+	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
 					  &core->sfr_daddr,
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
-		dev_err(core->dev, "sfr alloc and map failed\n");
-		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
+		dev_err(dev, "sfr alloc and map failed\n");
+		dma_free_attrs(dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
@@ -292,6 +295,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	struct device *dev;
 	u32 queue_size;
 
 	if (!core->iface_q_table_vaddr)
@@ -301,7 +305,9 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	iris_hfi_queue_deinit(&core->message_queue);
 	iris_hfi_queue_deinit(&core->command_queue);
 
-	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+	dev = core->np_dev ? core->np_dev : core->dev;
+
+	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
 		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->sfr_vaddr = NULL;
@@ -310,7 +316,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
 		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
 
-	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->iface_q_table_vaddr = NULL;

-- 
2.34.1


