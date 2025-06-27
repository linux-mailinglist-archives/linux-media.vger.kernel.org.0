Return-Path: <linux-media+bounces-36114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28345AEBBF9
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 456457A4C3F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F8A2EAB6F;
	Fri, 27 Jun 2025 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VX00Cfnj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD42EA73F;
	Fri, 27 Jun 2025 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038401; cv=none; b=ciXI6MMnCzcUU6JMq5KHQgQNHvHF5k9egtybaskmy87Z9zEiVslnF5tgfpfanjBEeT96PkICDzewSDqOBwNSbeTdLVA2xaixHV8Xa54+wnAxhprXiKHjg2QOZ1ep5iSCbyZXCb8h00QpbVLov9TpdZs/IzyYPFR30AVRJ0eqXqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038401; c=relaxed/simple;
	bh=HnzC2NXWKuXGG6DwRrGTVEY4cwE6xjAZhcxObvKqsbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uWtj4q5xAIYglkroO7u7wtDVk+7P0kSSEd9eKWOYPf/p7hnRyNMyJweSFxa21WHxRj1VDwGBFR+I6gDjL+bZqsr0H9ox5zyn2A6gmphbnk4/tST+EYdqIMlW4KcPn1MDwhnL6Ki0Pfe+T1q2RSUd2xg9201sAQKJVUHvD5oQq6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VX00Cfnj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCl8pV007798;
	Fri, 27 Jun 2025 15:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9lsuwkEDfzWSPkDeANs5L89I9hXnOx1xQOCrn7r2z4=; b=VX00CfnjqJrkTeK6
	RWae3fyLry0Ri36Pi325RSrALqpkw+0pk5gxasivAxWwzsw14Dv8W72S0rdFMadd
	BJ/yDOM0QBxOd1KJnFpIk2G7/uU/tno17/XOgdaY+qIGiac+eBtAqwqOoVx8E5FR
	G5Mk3gC7WanKbqsjwtRpRUxpbAyTDEUzNFPlq0R52lSZEtoAT128KUAPN3Ynnmy1
	eCHSjtNrebkpYk7GGnT4DfgK+9FK92LJwhilUxGCTYsAYotiSdOIhf2PJY4tQfdt
	AZyMVZ58yCGBrDVukzle1UqkeEGKEzJNQLSJRrMfZ15/1Q7ZPXmN5nAGP9ORtjEr
	gIPNPw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqwpdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:33:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFX8gu024094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:33:08 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:33:05 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:02:41 +0530
Subject: [PATCH v2 4/5] media: iris: select appropriate DMA device for
 internal buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v2-4-3931c3f49361@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751038370; l=2223;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=HnzC2NXWKuXGG6DwRrGTVEY4cwE6xjAZhcxObvKqsbw=;
 b=Fpm05UCHcYm4rHrh6PBE5QMueKbIgNRMm0CWAAbc3ATnOcGib0AX/0crthRHCCaKRP0afR/An
 StOzjAkcBP2DveClCtYUb/fIUgL8JUcbTggSUhJuwMCRY79MgS6zmS/
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cAq3tUxLkmRq4xOBWxvBeffU8gkkDIzm
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685eb9b5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=Jl8zK0-8wVe6xbTnPs0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cAq3tUxLkmRq4xOBWxvBeffU8gkkDIzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNiBTYWx0ZWRfX3iU2vqG0md+0
 ZmTjPny8nVL8aviJTcj/kg6dvUMI2dFDdM+5km2zHBmu9vc0GmOOGxF0t69zyG0CnoN4eIOXjuZ
 xRTiJzSynPhfyESQECRKcuHOziUstGjFZE93QXFjVcmcVtHeFThE4WAjsa8rm7TD4+z4cikcTFq
 JNUyojhx4WzvajNmHB129DFf+fve0hFgIvWLlhjnOak4RZDUwGIzXtlR5p5HtAFsWQQat+I+wSc
 94dhSa9IlL99dGKXfaEP43GXEwLMKBcosnzi2dcErJvpvmxUOsSjCbx8ofQrggtcL3Vo5Iuoz1J
 kZjZJHGkHNG60UNAN/v3ziOjSOdgexP+rpOxm0zySmGnGI1hYozNNNrreL9l7PAFWRZYNSyWDeL
 ef1RaqAL2k7uZwzDvNRaTp/74SF8xq4kV6qTtIutQBXFGNL2xYc9jq0VDZujsB+f6xFSsnsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=937 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270126

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


