Return-Path: <linux-media+bounces-36120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B4AEBC5F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE4036A2DE7
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7E12E9EBA;
	Fri, 27 Jun 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UsY5xk+T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD102EA163;
	Fri, 27 Jun 2025 15:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039320; cv=none; b=KZ9o3Aun8OnQ5o+ufJw2/TWCh3ENrhIq/ZByIjeaa6tMLqZ4PxiMsodxZTOpjdSs5wOVa4bW2wLXbPH1ZABTRL4eUHqGCAfn/ZgVmeZkrHPF3QZXRioX/neUDUxEbM4eTwT/2pKHl8YPvArPYEDU81oXoLFWyRp43Q0lW1KGhek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039320; c=relaxed/simple;
	bh=0fF4DNnpznZooU8ZimQgDbL4koCdAAspFuMZgiiLEDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AuHjzhkhSQPvgAPQwQVtYjA1wdt8Ai3QMqq8uTXpCFcXbr63WQFF+H5Lovoz+1p6ApnyBhJD6mmYKXCQiwWWH5ACMzRHNqQ9y4kdEiqxz3Ch8FOpkmN28h4JUd+cX+iM/OWak3he3fZkZCBBlhVnokF4kthtjR+qHEVRHBoesfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UsY5xk+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC4AVw028843;
	Fri, 27 Jun 2025 15:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZpCxuV1i7pnVntekzWVB/5wMZnpky2emnke/YBRFfI=; b=UsY5xk+T4jxOS2EZ
	J70g5n8pfvVsceaWYPRzrmWMmdwM09VmlKRtcpm/EVBBeciQ5RafIkd7XRw8euqA
	R2O4q57yqorjqDpizLhJTdoxMUnP+99mfsEKt/4lOSlbHcUEAIk28JeX6HpPdF9A
	O1FOUV9hPfgUd1PqKVYZAAikTIEzgJtlEQco9N63w1Yl3bnlevys8rQJyk4u8vq1
	Z10svcAC+MGSh8Pz/nAI4vjSB7E9tccert/6yFKIis61kdpVS4kCYgaT45ExzqKG
	HLV25QnwJwdQQ5oJ0vtky26vKmoBDK4z/RqnXGA0ha8Kq7LtIEh1+jYLj4E6Auj1
	kC24Og==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa50nb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFmVh3028674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:31 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:48:27 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:18:09 +0530
Subject: [PATCH v3 3/5] media: iris: use np_dev as preferred DMA device in
 HFI queue management
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v3-3-51e18c0ffbce@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751039297; l=3237;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=0fF4DNnpznZooU8ZimQgDbL4koCdAAspFuMZgiiLEDg=;
 b=L7OY1+0XhY7D1jcPZIoj9df/I3EqHZMpuYdRP2f3xhKH+505QT/a7xBP8fj2mjEq+rA+is7fH
 0mjTPpPZ4mzCcBGOBskObK8ywFu97GTepDtxTEqInl+DNJJ2WpICQ6R
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685ebd50 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=gd6Ub234OC9brPQr5uUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GWv83yFt8bnh1poOSplrXDjFHLTeN-C0
X-Proofpoint-ORIG-GUID: GWv83yFt8bnh1poOSplrXDjFHLTeN-C0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOCBTYWx0ZWRfXxd+KPzIHfNlb
 qhQyjGnJWCLDQjlWtO6GGDT9yUxuW1vYDbuGoUZLiB5MSVTeRKLVIFm4ES0eWkyrgW0zgDUdzeK
 KE7Uw7M1FAIH6h0/xR2wRxoSS8QyNu3EIo4WxCULhZAZbZaDg0SmbDIjIZNBTkgoKIK9A54n6bd
 42s+jFdTKPSGkYfY24VPLBIg90PIUeTc3goJRxr9+iV3xOsg/dN9xBez/v/fqOIasa02QopZmQv
 mEXR8BoTZlv3cmF+SWKsiH3DwzIAZLvrqads15dxxi/rA7SAN07g+78dIhYoZEr8TKndDhJ+AHp
 UyYK7nW80rdi2UOqtW2rZ9nGI8OiAFF1zvDOvjVe8bXExVXrl0MLp6jQK4WlpCGKtaSHpkd+Zx7
 Cy/JUPiSnilKjx1QYX8YV40QcdqMbeenIiFxdbiAG7X4GLaH/4CwCVI5LyavtIuzwLkVMNsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=931
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270128

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


