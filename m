Return-Path: <linux-media+bounces-31900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63DAAD87E
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3C247A56BF
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42209221F38;
	Wed,  7 May 2025 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j++veMcN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3028A220F3D;
	Wed,  7 May 2025 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603647; cv=none; b=EFUBnEq3wNKg1fMjyLWIpjuMYo6wEgLeAeRhODLWBCAY3q3K+o5Jdv8rk89IoK97gctIP2/ShvhHyoO0IErD4k3l0fpz8mNYh7hQjkjIKvHtyvvMiNk+YM0tThPZSY0txNATv9O1wwkf1Fc1JHrauZMR0HKSDh4EN/FBdAkuOGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603647; c=relaxed/simple;
	bh=dWkx3iIFTOoUkTc9iWTd5NGLGu/0Ilf+DU7k5K4Lq10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hL+w2poE+f/trmxW0/IUEvOXG7RU5tFMuSVPzIdSQy10nG+4Sl7Q52L7hqXox2gYruR4GzP5OgxXOIPX1g/nn0YPNT07wjAw3nqglOSx85trINVZyHaL3cxpbtm2XY3CQYRbzYCUlc6m9/MYojdkKHw7WAlH7DzddnVU7ie+sUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j++veMcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HNBc025468;
	Wed, 7 May 2025 07:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFed52haySU6kuuShUbfBC9voZQJkeVlTxfMCaRbkm0=; b=j++veMcNSoEmmExj
	VP+oza6bfvdJfG9J7NHtVHRnxYDiXCtqxThuS5od/2nT7Ard4+irZ1g86pOMfjFU
	ZbmrnozTCIyh73+B3MIG464qKG+vWtc4AVH9OeFH9Q4bKykzsdiICwy09yOjz9DS
	o1R2wj4kkxKRaOFyM/dOD36wLANlP2q6HOXFCpbiU6jSUPMY7rekNSOhIYEJuLJ+
	n/1ibJc9ALYNbCMAaBzxozNhd3V/QK1XLcyuyGtUcgyE8PeSqyHrq1rTwaWQe+5U
	OCF0xx2NGtLfEzyHubN1S0qDh49KnfjZrLGD1KUHx+GCJCHOQUariCkZxjEThjoI
	Z9JvXQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3cub0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477edim030307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:39 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:35 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:36 +0530
Subject: [PATCH v4 05/25] media: iris: Prevent HFI queue writes when core
 is in deinit state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-5-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=1459;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=dWkx3iIFTOoUkTc9iWTd5NGLGu/0Ilf+DU7k5K4Lq10=;
 b=vcKRd32xHXvmrKEpmh9tHaDN1WVbXq5uihx01NQBF4T3QuDiOyx/RBqHOmHbgAxGr3pvWcgiT
 wJLj6uf6dNFAt7qzT+hC14Iu9g33JRS2jNdEyNGJr8dFkwfV4EyVg+o
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX8gQbT+O2O2QK
 QEHV7QBUId5SCzISje5eXMdfaBQtRk0hH749oAs8fu0orYr3Q/8BzH53IJZq3Uk8zMEMajVIeWi
 gYpQ2otM+X5lQ7KYdSbf0SSDgsUAlz7kOUdRy1329OO6n+80oY/aaOzW7noVNPQNI7mhpT/DWQc
 khDdiXTWXgoN49IEkxpE/2zb+D7y5RcP0xksNbnLCfSSnj5unjWOVor0wjWr43ST6zMYEQ0ctP0
 LgIrz065rkRK8nRIeP1gPMc+cXI+SWoI2NMzMnO8Ue9XUK8+zRBbpSIu6KGn4jKrfqKSb2W3m7Q
 TklfoDR8ntgaW5WchjTyBr/OzijdvI4GdBjFxdnUYUZ9aQaQVp8j6INdfJ7Sm5bEEUlHjgDEuF+
 Px3RkP9e/plg53r4iE/CFg6lIkDyD4Mm4jV175faQZbw6QzLB6U4eF3blIyHCssiuLUZLtY4
X-Proofpoint-GUID: nRoV7MNWMAdsqN5zLOadvb5CdA0rk-jr
X-Proofpoint-ORIG-GUID: nRoV7MNWMAdsqN5zLOadvb5CdA0rk-jr
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681b0e78 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=TuTThgpRNTc_Uxy4z7QA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

The current check only considers the core error state before allowing
writes to the HFI queues. However, the core can also transition to the
deinit state due to a system error triggered by the response thread.
In such cases, writing to the HFI queues should not be allowed.

Fix this by adding a check for the core deinit state, ensuring that
writes are rejected when core is not in a valid state.

Cc: stable@vger.kernel.org
Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index fac7df0c4d1aec647aeca275ab19651c9ba23733..221dcd09e1e1095074457e7eae2ae547fb3d5376 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -113,7 +113,7 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_s
 {
 	struct iris_iface_q_info *q_info = &core->command_queue;
 
-	if (core->state == IRIS_CORE_ERROR)
+	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
 		return -EINVAL;
 
 	if (!iris_hfi_queue_write(q_info, pkt, pkt_size)) {

-- 
2.34.1


