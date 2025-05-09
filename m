Return-Path: <linux-media+bounces-32090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9DAB0D54
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8E714C6D0B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8E3277813;
	Fri,  9 May 2025 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FVOZeHcN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2B27702B;
	Fri,  9 May 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779972; cv=none; b=FOBccN7c4fABIQWyN+FpSBq4DRurSdA7MH1cHQFSPg0lOC8UZlQ4O7L8rgTGV9BFV5gl0MCr5j0JPw6VGmlEw/mEnvEkElzRMjVcjds9yXDJ+XtRDDDaiY0o4DQ7VbDzDgZxMd/4ZvCBYefBgiSyTK/0He3bDIgsNUn3VZ2iGBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779972; c=relaxed/simple;
	bh=TT/cPqOUahE33J8tsS4zy/RyBpouGr1yiHO7pv3rPH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QBLe8wEWb62m8OZ8OZP/okPW5jVazsnhMtYZDRrmI2hyANE3kpBzU+wdBnG/TUw2wlMEokRLzRZV0Xl4OP+GNTj+2UEoK5zC5pDC62CFq/1ZCkJYmqaekIfWITvN3LuGJe7e1x/LVixIgFzX4OiBu4ipGbuHhd39tfXhfNJv2DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FVOZeHcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5496v193020446;
	Fri, 9 May 2025 08:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Uw492D5LwJUPA1Ry3P/JRP/QuTbu8m0MaCdWEucrLM=; b=FVOZeHcNFPO/57BI
	WR2PvvBeOhu3sQqWZuU++0cb9ATrlMQ/eQJx1QLYY5uyVAeOqr7Xq+WYle4YIhFm
	JHngOG4UmkJrIGWCFJH3YuxYpw5k+PBp2VOEkDp+30xSVs6Yda4aUASwWVQIHVPs
	TJu8w+Gefs8cAYosMWO/NZAs2t7RD0e+F58iCrvK/DDe76u5zzcCQO/iDFKSABk6
	3YDMn9V96G2mN+bHtrDULdgS9jwRYuNmnl6FcWPo1IUAdqrdS9XTRC7T9ahNSZYM
	oVH2Pnp7ws11Ud+WOVUg1dxX7RR9OE0YzUjo6Ny63HwFoj/lVfhAesjdKvNahsOs
	jN0prQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj3d31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498dQam015555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:26 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:21 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:51 +0530
Subject: [PATCH v5 05/26] media: iris: Drop port check for session property
 response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-5-59b4ff7d331c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=1572;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=TT/cPqOUahE33J8tsS4zy/RyBpouGr1yiHO7pv3rPH8=;
 b=jyk9It5+K8HxrMAX88mu0BuMiL3OHY9bCZj9UiLwm9/LjkFnH9mmf95TpRU/V6lDhny6+0I5z
 l5EG5UqubK5C8X0Z1rLncQIKjvlDdV4Bf4/+6Ni2vzYZ3ByzZjQrc9o
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681dbf3e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=cpaLyVTj-7XRyRbX6gwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX33fmSUVDWsT1
 XHbSpsNMCX8jDR1O+aYUIN70E49ZBrd4CMu7zBbUuUJzn3I0kOknov7Ohw+ViD4Ny3x9FG98uK6
 dQHlp+1JBz/JDKIwQH6BUtk8mlw6sFT0yvehzbr2cMVxDXeJHTvUFZ9hmNsodX9K7GKAuBry/Fj
 VlfCp8+NEbEwJklpbOrdDsKK10N+SmeiXdHATtUlotr922NHImi6F6nsXG9HsFXDJY6ftNmLXqH
 JpbPyHK1d3IKcWg6ByuJLZ8QJysux8krlqUh/9yW5lmEq07h2P5dRDBixEQpH6fWlZj/eMT7YWA
 1bmvcBdkkG4+7jy8tDVxezAkCZ+GgbBFS52ONt8UeFpXxFxCna1IDwVg83rb+kIvtc7EGSZVoKi
 0WVMO34R9fneWpRJ1aOxnywxCK44vO9DTfAOhn3TEVH2ou4UMXvCrup57r8udEDWHUAmv09l
X-Proofpoint-GUID: OdAgLEoFKZBsiTBmiRf3cEQnZmVNeU03
X-Proofpoint-ORIG-GUID: OdAgLEoFKZBsiTBmiRf3cEQnZmVNeU03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=683 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Currently, port check enforces that session property response must
arrive only on the BITSTREAM port. However, firmware can send some
responses on other port as well.

Remove the strict port validation to correctly handle session property
responses from the firmware.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b75a01641d5d489a03206b3501b7d1617b3ec110..d1a2a497a7b2e6a1a810f2acf7d8d6f332d3d63d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -636,9 +636,6 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 
-	if (pkt->port != HFI_PORT_BITSTREAM)
-		return 0;
-
 	if (pkt->flags & HFI_FW_FLAGS_INFORMATION)
 		return 0;
 

-- 
2.34.1


