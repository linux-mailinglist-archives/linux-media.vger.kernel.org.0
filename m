Return-Path: <linux-media+bounces-35464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E0FAE13B4
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89FE519E3305
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C129225A2C;
	Fri, 20 Jun 2025 06:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CRN+ploE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12524224B02;
	Fri, 20 Jun 2025 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400501; cv=none; b=W368MuJfcWZ9mpm4Gam7KFoOAu5mwFRJ6DeEKuUThwuZTl0wV+X3qhZ7Qk/NrfvyzIV8p6Ee0SPjg2uT6FObPHfOijezMFd/Ia/0T+4Uz61t7UpVCuRfe5Vu/geGv5Tx/qEj8LPc8bcK9rx9N0BY3C3vadlDsL3reJd4Oqpy/u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400501; c=relaxed/simple;
	bh=0fF4DNnpznZooU8ZimQgDbL4koCdAAspFuMZgiiLEDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jxqey5qSuGoWDLZRFXaLMTp5d7BHJx6ZJHRLZcsGGbqpTmbBMvWMiHUp46TNbggumX5zQ7uKqxo40VVIiAQnmUymyJIDTsaMRHugrz0/TCsX7NN85zKtahiK99T35SCQ5n2pu5Z4AZqB8r6BKFEkgwMHmlmt0uitm8rOrTnGiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CRN+ploE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JL1pl5024412;
	Fri, 20 Jun 2025 06:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZpCxuV1i7pnVntekzWVB/5wMZnpky2emnke/YBRFfI=; b=CRN+ploEOEaXtx0B
	49U7afXnjB9y3z9CuRwBsJKS6PZomEHSMcvo2iyd/cmlZPnWhe5xwZwd8pz9ixJ7
	kY4cPSbLFnnVE3cDErxL2sQP8erHWddFrVEIOgeI9nu9JK3EiDS5lMsJADMjG09N
	Hoo9x3/aEZaOxSeFcPaAiqiXZxejvnFX2SygiMxGmLUF1SRAtMqWkpTEVDpdsWNe
	WzU8Ks90CxC3yooaUPhJezTdkAttnfxxH0AVf6dztI7diaCMLC1ye0TqERUJoBFp
	U+2YIoVRsnUL3rVNrTKHitGDorumT62D25BLvQIfeUp8/V21vEDmIbs3vfIWrzNG
	TaRCug==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13e90q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K6LYvQ023582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:34 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Jun 2025 23:21:30 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 20 Jun 2025 11:50:53 +0530
Subject: [PATCH 3/5] media: iris: use np_dev as preferred DMA device in HFI
 queue management
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250620-video_cb-v1-3-9bcac1c8800c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750400480; l=3237;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=0fF4DNnpznZooU8ZimQgDbL4koCdAAspFuMZgiiLEDg=;
 b=sLwzA4SXMpqrKpucLO2ud5f52Ag8N7buOm3thAF15bPt7eLZRqtNyWD8fi+EcsOHTdqK9OrQw
 JMETGoWcrmkB3PDyDRRTgmBwpx3gTE8h5Jc2KSkI0yUE2igw4OOBk9s
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6854fdef cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=gd6Ub234OC9brPQr5uUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: I9ey0FnhOICbxpjx6vUuzw8eFpmGi-gS
X-Proofpoint-GUID: I9ey0FnhOICbxpjx6vUuzw8eFpmGi-gS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NiBTYWx0ZWRfX3jxuwQO+Wp/8
 VPrOBKLw/GzWSjJFk+vgdcqQf6x1dNbYv1FwifZcZDHYnokAYkKmXA0LqZnN/rcwB55MGzKB6GO
 fjoYQh9tVixZhIfQNVmw8RRfNuYbp69lNmFp13+53pPjochiIef7QZeNvFqIi3cIdh6oRusrUhU
 k8dNF6ayzKz8y5Ed0JlDGjV7ePoJvfIRhCkLN5i9eXGtjOVTS5r0SYi/EIfbCvHASBJ4CLxGvay
 EGzbAFxmFBx+sIE/Zl1GpRZJCKxfPc0VM+vT0Q1VHBLvfngdYV+0f+yhROiCic1Ch/YsXggS9lE
 74gRd1WY8soHKxArqSfc+cRxJfXtJNabV9mhGGfbu7z1VrKvUqkb9jrBGcqbiPOndLCiGV99iLK
 6BULn+4bjIkO3gOQFwKEpSykooOcBXIWaFVvVHJgJghIn+ADCj4jcaIPWDwwBCSr1SMUM365
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=931 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200046

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


