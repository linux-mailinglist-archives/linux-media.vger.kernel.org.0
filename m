Return-Path: <linux-media+bounces-31904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 344ACAAD8AF
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9160C3BDCA7
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013E3221267;
	Wed,  7 May 2025 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C8lGj0Mr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD7221265;
	Wed,  7 May 2025 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603664; cv=none; b=W5EXlsEKZFAwdJyb8/H3dCIwkXWUBRAJn15VOKkdAVHCBD8xtz1chBb+Q/Oz/XFFbE3/FJLWUwNPWdipE194vUS33pNkf+ceRGcz6jC1yLUtRy30Xy/7a/Jf2gBoCiDFzURzVNa0YPCI4/v/fUrVPfxONAD2kjLej1VY9tz1owU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603664; c=relaxed/simple;
	bh=kDUXrehDDj+JIHHpnLQKR2PIUFt+LfI6VnJnVNkn/aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bRmluvpvYS6kraeBfEHE3cnwAjiwHOnf/bWNMyDyfYNnsCLcL8qnbAYoGype6odXT9/uu0sTcvLVAe855aKKut6uA2lyqmrcjyjkLm+cWMHnwdYQDJC9Bxs8AWxnxACS65zX047H5Vy7/Cyer6wNxUiORO/XPMPbq4zAMzz9674=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C8lGj0Mr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H6CX019970;
	Wed, 7 May 2025 07:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bH18Rbhd+/SH6rXJc8WsY4TKYHIVm7F+wSPHbSUDWoo=; b=C8lGj0MrDr0+/faX
	/0KHkX1lps6PbFLAhuoNyiR/dhf4JjifREwcxFNr8W3NVSAI2zotukbRA/gf7P3r
	3XilDKSgCm5Pn/HahLEwHFZaRhGY2Kjgi9x0cItSHIotrrHTAx1BRvXcG8+DPkgC
	px2LOrIw7ABe8GIaZHjPyOzg4IBUWi6oilejkaBwvmy+bwdYicGK1FkCFpCpqwkF
	EtGj8LtQNPlPt3n405jIK4YKxc0wP1Gp+4VCNgp1n4nM5WEhbETTcHMXKOMgA/H8
	mGm24pJkrEDA0sYLR7Q20OomOvmdhNQ139FfeQxTUUN7wpNOyEOVFC+2gfB7sq+8
	G3dXEQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg4rrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477evAJ019071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:57 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:53 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:40 +0530
Subject: [PATCH v4 09/25] media: iris: Fix NULL pointer dereference
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-9-58db3660ac61@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=1559;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=kDUXrehDDj+JIHHpnLQKR2PIUFt+LfI6VnJnVNkn/aU=;
 b=m/7AZZ/jNzv6FOGeMkZWav4v+g2hngxN4Ohps+I0IjLI2Md1KC1tk70n7xXXJDtxUooi9EqDd
 8B0iy2UEft8DCfZfLm6R7jemcuo1v6XXoeQbSb0rjAclcmfN3xHXXsT
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FN2oW16NnWASbeizNR8-yV4Wpf6On38t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX8+BW5zIMRkz0
 7JtSc53uPLYS55i0WymDKlwX7Uj9En4LuIv9PnwKgQ/+tJOHiP4ZZ62n9vO4F122lKLPMWbXWAg
 eG7hyMiJqsaF3F4Pt8jsAsawGaCSCznJ6NieRraqIpA7erTvWsqebfGxvCVCs0Iw6dfbo/gUX/I
 81oBl/k6SGQKIadF+lmjL/y59XP40Pl2Q3CePt1PRgqdpqMWmp3w2+pJNdtcKSh3ArFa/fQM1Kt
 MT/+9Cr1qztALCLQpSF7aIQjjOAdeLldYwi59E3SFwqcV+j2DpCF1i0d+WITt9L516gKeO6gRcF
 tJdByDoifbwJkRgVatVVizIQOTMtBZ3ANTD/fFHSqJpwOE1hyxKtwSYTlB+aIk9tRUVOZ+3SSkV
 NWKu3T0JLYLG61zGvXXamxUxTGtLxreTehIX3XhV46xK6UVMYkGwWXQnBS/9/qzfAs3mEmJI
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681b0e8a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=_9w-BpbxiFVjEEnp1AAA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FN2oW16NnWASbeizNR8-yV4Wpf6On38t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

A warning reported by smatch indicated a possible null pointer
dereference where one of the arguments to API
"iris_hfi_gen2_handle_system_error" could sometimes be null.

To fix this, add a check to validate that the argument passed is not
null before accessing its members.

Cc: stable@vger.kernel.org
Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index d1a2a497a7b2e6a1a810f2acf7d8d6f332d3d63d..4488540d1d410b58af02ab82a3238ccbe40f7093 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -265,7 +265,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
 {
 	struct iris_inst *instance;
 
-	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
+	if (pkt)
+		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
 
 	core->state = IRIS_CORE_ERROR;
 

-- 
2.34.1


