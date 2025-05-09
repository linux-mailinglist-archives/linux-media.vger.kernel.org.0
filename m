Return-Path: <linux-media+bounces-32091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C810AB0D5A
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00EE49E3C8E
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D845027933F;
	Fri,  9 May 2025 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HqTt/vyt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F3B27875C;
	Fri,  9 May 2025 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779976; cv=none; b=Oz2hcnxQmvH1orJs4Cg9+6m4vIh6i0C3uf66HkW7tgNTwfHl7NkHs4Po1TyZ+kwcAUQ/Z5VosyGYdnRBw6qYHg6LsNjOHyZrGIpqNpoy3nseYkqCxunmzCwEmarS8WpEZn0SyAWWDbQF0Xdb4OdwszAMyTIAiUgeNGtVmmfWxgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779976; c=relaxed/simple;
	bh=WFkZ0TB8zbz7W1yHn2TvHfRI/xgIPVtamfal+Tgp5oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OnPpa+etMmEkbS+tPFMTYbJCGh98xLCsF44teflgUjeJocDwB9hZi9ktUmlKS+TlZ171VX83Z8dQgKwAU1MHdz4TJo+6nb1JfuBicdLj1iFXdkvnh2Qke8UiT/vS7W52+2wiSWsuAoVVeZ4MKCgiyegwH9AC7RRcgW6OmgeAq98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HqTt/vyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492WkkE025001;
	Fri, 9 May 2025 08:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWHDuvR+Az7WS6luZJ15tY0Lb073WVXZaohtYo1+DPs=; b=HqTt/vytXt3BORUe
	5IlKZtGM1DwL5VIAF8Q+9hnJjSLF7CpP7B06b64KVA6L6gP+56ECfNz62kBodo+4
	1HZlotTKSFkpeMEXe2fYbDlzajz92UPBkBodJTsG7NkOQKurwYzktnQQ7LxhGzy1
	uwOn3XphYipvDysIBHtKjjnqi2Mj/s4RWXoGo5aaw2E6f4lznVXWv8N5NZ6yBFc5
	gZe9MqzlUGcXD4fjoUbdnHszG+I9Is5eBWYkHRczOd5XTwFGEsJ0uHZOiLy4bS/k
	hE0k0t7AxUta0097KdXwt67y3jWYFPsGQr0+vgUAUIEvOIOzN3YM/9l0mgQO8EKJ
	cKv2Qg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp1415k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498dUwd030883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:30 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:26 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:52 +0530
Subject: [PATCH v5 06/26] media: iris: Prevent HFI queue writes when core
 is in deinit state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-6-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=1743;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=WFkZ0TB8zbz7W1yHn2TvHfRI/xgIPVtamfal+Tgp5oY=;
 b=sRgg+AAX9Z9AoLK1C33Gh2Gb5k4j4vf4t8h89mej0iUok7zaQQeUNDlEMXF9DWzKyCkFWMgVT
 7TltpQm2u+3DPKFE7YJv1GQzCwVFerebxuqXNqUh+8d/zlBrqpF/+vq
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfXyo6p9RMyio8f
 qySPmMKKR3RvbZeyx2bokIkm/geNMAN/rK7QnMtnCh0pHEplRP08gez2gLwzxUM2IO8ia17pDYK
 4Qic4dOLgBnHjg1f+VjtcWe8pmI4gCHjObKCPY4lG72xia88YRsfPRFxqDU+vXYqMWU+1u3f8nV
 ICPWzaryhBRlYu4/siVpDaFp0SHtxyP0ITh+601ShobzzN01iC5LH2mhGK9wmRw4TWcYDrvWvCk
 5G4lPLRe7Uaautko5XYrqaM1ZrS/WSKjh/UvwhYMRpgcN1XrSEvJn5cS4L5xlC1LPRzzrhMPD/4
 CGP5Bm1A2z5x+fk7mODUGtC6qRBcyWTvbGD8GTBz26JN/PCcIpOZLHlPpoBq8OmGH5Wolld6F/G
 11RAcBacwCbr9SqJX90wwR10HByemFmUB3u25l4f4IYMHR1gvOVMjnjuTu/GU4TyOzVgXxfQ
X-Proofpoint-GUID: gzC8PJ5-48RU_uJ0-VlNDSOGlm2deLhD
X-Proofpoint-ORIG-GUID: gzC8PJ5-48RU_uJ0-VlNDSOGlm2deLhD
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681dbf43 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=TuTThgpRNTc_Uxy4z7QA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

The current check only considers the core error state before allowing
writes to the HFI queues. However, the core can also transition to the
deinit state due to a system error triggered by the response thread.
In such cases, writing to the HFI queues should not be allowed.

Fix this by adding a check for the core deinit state, ensuring that
writes are rejected when core is not in a valid state.

Cc: stable@vger.kernel.org
Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


