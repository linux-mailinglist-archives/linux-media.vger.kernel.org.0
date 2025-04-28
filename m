Return-Path: <linux-media+bounces-31168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F62A9ECFD
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 690713AFD69
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B279E274660;
	Mon, 28 Apr 2025 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LBrc7rxO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DAB2741B7;
	Mon, 28 Apr 2025 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832670; cv=none; b=bXowFDUPF3m1bH25CpZ+N2BXGsiEdFixH+JPguhzJVeQOrBeTPZn29mIRKEjHJm/YRpaHeWIShP/MkFe+QaUs4GMCWTKEIv7Qe/Hn/7pv5ya0InMQmsZwUCyX+1c4VqM8+UbKbGlllo3+EVnX1KczWASEFyKJ+Vd8nYGBrUJYM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832670; c=relaxed/simple;
	bh=dUJc8x8s4c/FzROhHBGWwO3ozZlnHsLgSvs4E9VI970=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SQ5Nbq4BScV6D4YabRkK/r0baiTIUGzzQYXRq1FjyhKO8ocduSjmolruq6+ZlwTVys7KD+CXOYkUU2reDI9qu0brQgRA4GbTYMZuv1rbQw7NwwjiZAfT09lXAsvDrc8WrCBq7rLFW8rH586GZ5xvcg4xDLPJ/9Vlf67w6fZZG44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LBrc7rxO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8EpAp029586;
	Mon, 28 Apr 2025 09:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2m0DUCjsmqVfwBmYf03OAgjVtcqK5Cyuj8zbKKeFUVE=; b=LBrc7rxONUFgdETX
	6wjq0mgw0oHhL2XMOAc4JiKUJ0GrZk/Ih1CYKLty4Yi/Uc/Qx+CoOWF4L8iODxXP
	JrvPvEtWRMq3vsJ4qJyXN9DonxuI0B04yz1UV7QihhYVNw5NxudjK4GWBFxcDk7k
	zheRhO8oqwgUBaiN3b7mR90Sdi7iSwEYORQ1EjwE5E2xH8o/84OkN6U7uRyceY6G
	ClLj3lrWwa0M0HgMiQmEd5mlGZ9NFi1sZLTzS27NgZcQCr2YOVHzLpAuKHmWcQEo
	bcLAdFS32OGgeHi7HfotUlYjmGkUgdYctEEozIJQIcLFcpYbpIwoJXtfH9Ty+9LQ
	ru+hAg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevfmay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9V3Bf030576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:03 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:57 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:59:02 +0530
Subject: [PATCH v2 14/23] media: iris: Fix NULL pointer dereference
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1389;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=dUJc8x8s4c/FzROhHBGWwO3ozZlnHsLgSvs4E9VI970=;
 b=/tB/BjXKhj8IsFPE49xXPsm7TFS+zorQQXyKHWa8oAkFlc3gZ2a2ookXdTt/Fq+MXP2QIQvkG
 skeL9ufZPi4DtwUZoWxNz7GyE0m4rO6UncOe3v0yIq1hsQnHeUCJVxN
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YPcNEN0375qc7yKqIP2q2sHZ6LAvhyd_
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680f4ad8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=_9w-BpbxiFVjEEnp1AAA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YPcNEN0375qc7yKqIP2q2sHZ6LAvhyd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX9Bi/hZOZ7HyC bG9GSRUs7WZmtHiNOQQDbXHaUmRd1k4gDUzNtOIvWgms3P1W3SbbssoBOdq0/FPaabv7PotQtrm oZxdup2LeibCaGjLhWT1r/cXew+t1qFI1hHqOCey1CBZzLfsX01HiOQL3zL4QlTgk9mAk+iKFP9
 3+cmIiX3NXNOOpT47flJYtnWo7anohjEtMQmyFmCkOHVTNOjigeanmY3lt3HvL1riQjUQqflxJL CGBbpPIpcqvOy2J5DozCpca01NuyQ849nM1Kl5gomtgax9icqm3xBgRa7lymkKhlxnpNwuvS028 Ya9CcaTKCzDbeeRmv8BQNmwu6ejrI4z8OTpgHayraerpVzRy0aqKgIN73chL84cTypPC29qpzAC
 sJ2AqH9kObam2+Z4q+o0O6T9t+j0sNuymOPEsv4mKhLsqu+rd3BEUin+YScRX6O9n1Mjq82V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

A warning reported by smatch indicated a possible null pointer
dereference where one of the arguments to API
"iris_hfi_gen2_handle_system_error" could sometimes be null.

To fix this, add a check to validate that the argument passed is not
null before accessing its members.

Cc: stable@vger.kernel.org
Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 1ed798d31a3f..cba71b5db943 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -267,7 +267,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
 {
 	struct iris_inst *instance;
 
-	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
+	if (pkt)
+		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
 
 	core->state = IRIS_CORE_ERROR;
 

-- 
2.34.1


