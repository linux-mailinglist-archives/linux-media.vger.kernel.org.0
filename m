Return-Path: <linux-media+bounces-24508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6A7A074A6
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 12:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86913A4542
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B907E217707;
	Thu,  9 Jan 2025 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b6ffXXhC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9877721765C;
	Thu,  9 Jan 2025 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736422031; cv=none; b=RbBmvmwbHxlrfbemDktgLHu6KULYowZvckyCXkgyPv1jVfxyGT0/KWiRosFWbaKEjrbhXhtIWKMkc06lWK8dLUHl9YeQ+rJ9T4d2S7aOeEgepWeG7P/XunBihYnon4VPk87ecdcZMmukeJaMryV7YyiTUgXx3Ds5Qfapzf4IM6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736422031; c=relaxed/simple;
	bh=nAteW2pZPElXGXOc/ZpncpcwVWManw1OixJnsAZHxH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fLNFEqAh4LJ2Q0mI2MnJW9ZnSwyqyg2OMShkJB9inuZCkx+BfBcAMlWF++qA3XjNTCg+P3vWTmge5ZYrKG8AfYMzEANvXIUh9Fiy5dBr3UMyojdW+XbLgjzhQdbF3VT3XZ2d8KT25JlrQXR8gsTHocVhcg9Q4yrh4P+aCC5/HaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b6ffXXhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5097Gni8019227;
	Thu, 9 Jan 2025 11:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSsRs5KEmtRw7jwI4JgpBLgPxMotTNcafAkH0PYPNhQ=; b=b6ffXXhCpzZFmXEY
	Xc1dEsrgexu8WVc9wI7bLMHkxFRfEWcBjVUDykvmKe0Ia5a/Ma4gdXZHaQ8wruR3
	tyfiglE8qVAn6DRz3IqKbNBX3YJ/9u3FjKVZsFbWjqL0ftoVXGDafTcAHlLafIhW
	olgIpVFqF77o8FBDB9KaL9PMhEVTHN3lb3f7PutyL+k7pssfBXcZfm6fRhNvieGD
	LD+4U6q0QNlcE9FRTa9OmP9CscXOnTNOvt0NeCT4hfPRXJRKVk3vRY3SxWn5+pzt
	j3djNqQxj6LfPJxAC26+pUOawybQ+xrUw+hnfWr8B4E82Ds3vvMXPp/mecZITvYU
	F7PPqA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429x50k88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 11:26:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509BQwpD017441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 11:26:58 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 03:26:55 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 9 Jan 2025 16:56:41 +0530
Subject: [PATCH 2/2] media: iris: fix memory leak while freeing queue
 memory
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-iris-driver-fixes-v1-2-789a0f5dd7ee@quicinc.com>
References: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
In-Reply-To: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>, Joel Stanley <joel@jms.id.au>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736422008; l=1445;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=nAteW2pZPElXGXOc/ZpncpcwVWManw1OixJnsAZHxH4=;
 b=uEyqjQHzP3liZDfXAaYEfe+n2niki7BtNY7gyjTcpYsLRHYNNBP4E0LGaMxr7ARSP2JbkwtGm
 wH05ZiPmduMBujRWfX7Y/B5B9NKTFE2rdEzMS9LPUv69O4XlW0A4mNG
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ipOq9E1EYtJSsg9FjJ3oOYCrDGY0qcYe
X-Proofpoint-ORIG-GUID: ipOq9E1EYtJSsg9FjJ3oOYCrDGY0qcYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=992 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090091

Memory allocated for shared queues is not freed completely in tear down
sequence. Fix it by passing the correct value while freeing the queue
memory.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 9195715c5d5a..d1113708644b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -292,6 +292,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	u32 queue_size;
 	if (!core->iface_q_table_vaddr)
 		return;
 
@@ -305,9 +306,10 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	core->sfr_vaddr = NULL;
 	core->sfr_daddr = 0;
 
-	dma_free_attrs(core->dev, sizeof(struct iris_hfi_queue_table_header),
-		       core->iface_q_table_vaddr, core->iface_q_table_daddr,
-		       DMA_ATTR_WRITE_COMBINE);
+	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
+		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
+	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->iface_q_table_vaddr = NULL;
 	core->iface_q_table_daddr = 0;

-- 
2.34.1


