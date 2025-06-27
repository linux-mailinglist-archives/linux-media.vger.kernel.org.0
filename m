Return-Path: <linux-media+bounces-36121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1020AEBC66
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BDC66A255E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AF42EAB71;
	Fri, 27 Jun 2025 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YNAjWUHD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D32EA73C;
	Fri, 27 Jun 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039323; cv=none; b=pxTN+1p9D4vYnLj8NkfyiPwOpOxxmXGK+BJLawB66kcJkyiEbybD48Ze/s5W5g0eCdSqVPY8yn3JI2zq/Vg75Z8EP3vSH3I/F7Tnmu7NEurfuLwosDu4Dwn0wF6N8N1XyDP8Ih16R0QBJa0e5snW20dOiJrENtel9E7l8Xr6QAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039323; c=relaxed/simple;
	bh=HnzC2NXWKuXGG6DwRrGTVEY4cwE6xjAZhcxObvKqsbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ICKGAuvIjdvHHP91I+2r0YovzK/S/kwq57eVEaR/rNaguHiYQVzFByK/3HTvdsARk7svdyWI+t4h7w5Ru0M4lOftCT68SSxk3ERoyMorBt5CHWu82zK3gkl+Hwz42JkLr1h1+dy2Kk2VjFjtsnJ6uKWuOyAYlYq/i+AXUXdbzos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YNAjWUHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCCr55014512;
	Fri, 27 Jun 2025 15:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9lsuwkEDfzWSPkDeANs5L89I9hXnOx1xQOCrn7r2z4=; b=YNAjWUHDoJjW8o/P
	jdWpUB873rGl1Nwe+iDVKqswsGfYQsFCNZuHW/beci2eO3godNs6bbpFV/saxjlL
	E12infumuEqCj2uQeM0ZFO1I88wOZoAdm1oSHkGz364fwsnFmgJ9dSJMmuvMbbn3
	LD3RhW6P5WcLwWj7TwkEUnAK48DpzPPH0kzN+IeYZBvjfcWclm7cD28/81i1ryom
	oY3ZG2U8uKBjttg8rwH8HrS5aRyYvjYDeHsPhr7MThDERYBbcfeG4/q5UsG85GNj
	55FJaFI64jUEijd5QNTmIrsGuAQq0mYAbLPT47d8os4zsdS/KKi8sUETZ+3MYTfO
	cn/scg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25x9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFmZcp005676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:35 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:48:31 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:18:10 +0530
Subject: [PATCH v3 4/5] media: iris: select appropriate DMA device for
 internal buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v3-4-51e18c0ffbce@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751039297; l=2223;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=HnzC2NXWKuXGG6DwRrGTVEY4cwE6xjAZhcxObvKqsbw=;
 b=hhaAoze6JgnM1tpYNFjN6AcsI5+hO3yGXU1pVMOmsRS+zC2wMS5EPpnCIFN2ZXcPQmhl5Kiga
 7yQl/20Qd6fCSnn3WWsbx78h9KS6XnuwVHN2kzBRIJREjcb5eGjcTcj
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685ebd54 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=Jl8zK0-8wVe6xbTnPs0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jwh4OgYIF-6yQSa6iCczCgziDUjgaET6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOCBTYWx0ZWRfX9jaRt025K/mn
 ctlrdtLhv92b+ch3v29IwF7QdCdozUxotyY75ic2h7vRorjyqYm/sXGRAtsGqpc6xCWhFZ3aGM3
 gRzUgyEEkZv5brQ9xc6iYm8sOOUGXI07ZU88wPwrw2/gtQO7S9qolL7f3OA0wrQms6nZOy9ffrh
 OSiCsFMg/vUyoqBRKCDb4Ueqe3+pdwu+qNhlR0GFTqK7uvGqiryfbqqY5t6I2akMOw4B2uKyylJ
 7B7xHpq8cSw9T7d3sEWXtmp5/C6HYJWwnCtafh5YshOJT8JUv3Wh4SSettABkHllReUZT3/lV5b
 +EGFTb3rYeAodSnc/0zSB3bx6BlZVHeWC2iutd8R4n4dcXZyn0jDMMvGCH/ybv2hxl0CMGnk1ju
 +YdHdYwrF+pd878+zonaGErGftz+RzDhh3xW2WNBXuQJK9+1csVYcXLdnqm2MUfXwYRLLYz1
X-Proofpoint-ORIG-GUID: jwh4OgYIF-6yQSa6iCczCgziDUjgaET6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=937
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270128

When a non-pixel device (np_dev) exists, it is preferred for DMA
operations for internal buffers which are specific to bitstream data
processing. DPB(decoded picture buffer) buffers are internal buffers
associated with pixel buffers, hence they are not part of "non_pixel"
device.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index e5c5a564fcb81e77746df8c4797a10a07f2ae946..0bf6041936175d03a51985be148e78894fc3e990 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -265,6 +265,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 	struct iris_core *core = inst->core;
 	struct iris_buffer *buffer;
+	struct device *dev;
 
 	if (!buffers->size)
 		return 0;
@@ -280,7 +281,11 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 	list_add_tail(&buffer->list, &buffers->list);
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	dev = core->np_dev ? core->np_dev : core->dev;
+	if (buffer->type == BUF_DPB)
+		dev = core->dev;
+
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr)
 		return -ENOMEM;
@@ -367,9 +372,15 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_core *core = inst->core;
+	struct device *dev;
+
+	dev = core->np_dev ? core->np_dev : core->dev;
+
+	if (buffer->type == BUF_DPB)
+		dev = core->dev;
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 

-- 
2.34.1


