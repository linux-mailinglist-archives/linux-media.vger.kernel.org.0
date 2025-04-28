Return-Path: <linux-media+bounces-31161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E0A9ECAF
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A3A16A39B
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1369E26B2B1;
	Mon, 28 Apr 2025 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DP5ZPVdV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D29262FDB;
	Mon, 28 Apr 2025 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832626; cv=none; b=p8+qFEqfqb7Z/sesIrGfLwRyCP3+3/5262MfvPZbyfq/CI15t3Rqvc4qTlSTNSad0TnRCsjVAC4lyNSFuxBGefhYQGkgfkVY0r8NEbSEFHaIQgSbtDeBkQdpsdkoWRPP6W4mnEQH4Z5zwnkOMUwPqxq7/jogLN02uswUoRkGRdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832626; c=relaxed/simple;
	bh=dDdfhPRntqCrFz+asXcKeeWI7fYJmQNXL34AK6GAWCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L8ioeirZdtTioec756cJq/Fhdco7tzVp0KBKRey0WxQsG3myUaoWxww5VQIAgcXiGeZ1GrTjXZABNt/C3SdfnJpmqTIVuCVshqXvbxaS1lYxbxuPh4crxLJzLl9Kry1Oue3woLGM9UZih3Q2YW8ypO9PvzytDD2dHC8OwufLR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DP5ZPVdV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6YhNd011849;
	Mon, 28 Apr 2025 09:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2WgHwR3Vktmh0BeQ0Q+0QkNME5irGAtZ/Zvs1Cqj0bo=; b=DP5ZPVdV5KkrxeG6
	hC8xB3E7ZIdY5TbyVm7g6UHF8Dw0yD8tkELzK6a8XovLSpQ9XygHE9GU/lp9K2cs
	SiTDEN45HiyiTC0/jCv9/RLNwK6MBzLXMghMeDtjP5cCbQ0PuMDqT/zIO3wJQa1X
	IvfH1J0W0YHNl+tbL43eNFiJmg4WoPnJJL0kvY54j0WFuaTINwuWy6uok3qBlAeR
	qZSUzoVjtpB6NBUehAS+bodeCg6KEXQDjcsPCE1N5MPYby3OlamDe5cidRRDLnw6
	e6rjtVZlVJvpwbgs1lR93x7mRe3qZIdW0sPeLKY15jlWrS1BWjFfXHZRyWgtljca
	36EKoQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb7fky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9UKiu006460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:20 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:14 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:55 +0530
Subject: [PATCH v2 07/23] media: iris: Add handling for no show frames
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-7-3a6013ecb8a5@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1844;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=dDdfhPRntqCrFz+asXcKeeWI7fYJmQNXL34AK6GAWCI=;
 b=xBNUbx68mzRjQJdeuW0p6dB3ijfWbYzZ76/QNXcM3/fph6oOGTjPS8XM+bH60FRvWayMtwdeR
 xHldnGo1UfHCHXVbaUkOLWb/seMIUQ3eRG2WBZMsd+Qjzd5N1AM5qMy
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX4AFFZPKBgpy1 xNuMxdnYpuftKgjiygBluwpBnwZjXUVy3pBpu85CBx1iIeGmuG9mw/kMEYSGpK4H9e8lgNdWeUf mtcX22qIuQzDYyEo1pzqDtVj8lvwVcjmpDzuZTV99palnCYVA9aCIc7UZIfG4/WeafqC6mjIQge
 poCcqTCSoCXZRcM+LClCwqETs+Jczb3/8hb3Xp2aVKuBp+zWokHmDd2q/0cm55AvToShvgl1BV+ VwJVDZZ27KvjoWdBpbBlTJ9hPZ63PrL+HSRbMfJ+Tk3eM57SS18biDESYjzYhPCwZmW8c5dWZRK zoNcTWEq4xMj8u9a9YlBY930fJLc3TcVA2cFeTqeCb0sabGQKOtgqq54As54coysgswEYS4pSDz
 2Xug9vQGzlH5QG0wG03AFbczwbqAa1Dh08JTtblBIrBKcA9GkusPRhg1KmXKFVyO85SxL0iQ
X-Proofpoint-GUID: y252Y_Qk31d9Xm67TNjUFOQOnw_d_qjL
X-Proofpoint-ORIG-GUID: y252Y_Qk31d9Xm67TNjUFOQOnw_d_qjL
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680f4aad cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=8LAZgHa4aglvpo7nPw4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=857 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Firmware sends the picture type as NO_SHOW for frames which are not
supposed to be displayed, add handling for the same in driver to drop
them.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h  | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 806f8bb7f505..666061a612c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -113,6 +113,7 @@ enum hfi_picture_type {
 	HFI_PICTURE_I				= 0x00000008,
 	HFI_PICTURE_CRA				= 0x00000010,
 	HFI_PICTURE_BLA				= 0x00000020,
+	HFI_PICTURE_NOSHOW			= 0x00000040,
 };
 
 enum hfi_buffer_type {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 5bb20ec0d67f..1ed798d31a3f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -91,7 +91,9 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 driver_flags = 0;
 
-	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
+	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_NOSHOW)
+		driver_flags |= V4L2_BUF_FLAG_ERROR;
+	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
 		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
 	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
 		driver_flags |= V4L2_BUF_FLAG_PFRAME;

-- 
2.34.1


