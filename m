Return-Path: <linux-media+bounces-31160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1967A9ECD2
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32B4C3B26A6
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3B526AA89;
	Mon, 28 Apr 2025 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YBjs3bxZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AFA1AC88A;
	Mon, 28 Apr 2025 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832621; cv=none; b=L2ssNupTJ16zrmaLJy1FDON4kj3IqjtyBtNm6TF8aZx7dh76+HFSXZXfBDrQJgWfo7RlMK5SJh45MpiDG5m1EhgLXYxO9eFAAqa8rd9C8ik9o/WWuIuuPy0kD/dfo0s0QBU5+XcMKOux7FlBW3joosiHqK5zqB6nh+qMSyOq9t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832621; c=relaxed/simple;
	bh=Rvf3T77HwuNNdUPaOlecOYZmL6w8yG0D5SFVwzA7Ln8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lyvdAO5swY8fz1+/rw1+k9uhYxgcCJ2Shboih+xn0b7GM4xusSBahJGo3dCl0y3pTPLwgiIY5PLpmq0Kh9HCOQOJN/3fiRe+omU13U+qpchNA1NrSB/9LkpyFkWu7/wXkFKf2zR2iAv6Rv4uNtxinY3KbbSnH1RnmyOnBlfkPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YBjs3bxZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S97Iw5009775;
	Mon, 28 Apr 2025 09:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpDVZTzWKxlqE8Z9d8GAJVej3cydgoVm7/nmYFQRF4A=; b=YBjs3bxZJZs2wz9w
	RuEk4gVi03+hD3wP4+V4BObE7Z/NRxpJtqsFUKO3P53WportjGTGpUW9/hP3PXCc
	Q5d1G0OLFfk6KJtiFPI4j9Wy5VCnb4wv4wisfbBgmUXXY0cw5TcUfs/c1DMi4RnC
	BOqiqcJr0G/+SHOUDCzkFMXi8q+9j78bS5Tg/2lT5f9qHlQmmO2rzpiIYYdWpS+g
	bbVvQo7E7Lc/1UOmZnPsjfVo1XI2UQuInFkkXYKEmpL+SlKu5bFqoeDtFptCNjgy
	4XcrEGxZ+UUHvzVCrQgfn+Bn0kkpMzYXeF9imdk64mo/dU70Z3ogh4Ujk6NxmrT5
	jlXINw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevfm69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9UEtY029005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:14 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:08 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:54 +0530
Subject: [PATCH v2 06/23] media: iris: Drop port check for session property
 response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-6-3a6013ecb8a5@quicinc.com>
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
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1178;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Rvf3T77HwuNNdUPaOlecOYZmL6w8yG0D5SFVwzA7Ln8=;
 b=DGsjuVpUVIxvpb3pNU+PH7kEY1PbPw8nFD3ADz38hBZBTr+MEMNqmaauqMxEj7x00c/lrj4Re
 hEZivR5g+MxCR97Za4kgGxGIBULrDzSCWSujtUFzo7Sw1gIgFeiK0Y7
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x75cWSTJLetx7vjRLmDEANvQDbEgQliv
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680f4aa7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cpaLyVTj-7XRyRbX6gwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: x75cWSTJLetx7vjRLmDEANvQDbEgQliv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX33QojtV0V06k SWDvD0LlOQ6EzKZxXKmT0GImZ7+P2gryy4YOCsbGc2hIRFgpJ5FUph0Y9Byz7S6+gH20oRYlkTF TKJeQsNdkTNjOf4iKWTYabrDDUY7cf1bmw26KSGwIvjygVbenariewfGBusAC6uW2iOCpQtxcDj
 ubvCRjJQc9nLK2u7SSnD7uR9cRhn4/XB6F4uTbTCsaq0+BZbdwLDkBPinyE40Vi6woQslEVomuj XuHVoKv88P3j6YTr+iqJtB3G6u8Nli2HPklcJSVOY+PjRG8bVghQ5E0uSC2700lD+ZEME0cwngE CIcKOjQlt0Fa1fwxYfgq7vDE0XvNdfPrpgpLKH2y27tm0IGsfm4prGcwxqOKL5cmTQBkKzoVz2T
 Cq6FvCIH07vD3INZzSqw6jmqf4EAaPfzN1b0XU2/pYWO/hEnsd1dMvF0NLLqW29cVMxan0eJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=696 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Currently, port check enforces that session property response must
arrive only on the BITSTREAM port. However, firmware can send some
responses on other port as well.

Remove the strict port validation to correctly handle session property
responses from the firmware.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 0eb7549da606..5bb20ec0d67f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -643,9 +643,6 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 
-	if (pkt->port != HFI_PORT_BITSTREAM)
-		return 0;
-
 	if (pkt->flags & HFI_FW_FLAGS_INFORMATION)
 		return 0;
 

-- 
2.34.1


