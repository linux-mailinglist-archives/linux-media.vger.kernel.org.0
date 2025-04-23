Return-Path: <linux-media+bounces-30830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 807CDA9941C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 313801BA4099
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C352D0270;
	Wed, 23 Apr 2025 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HV1lXyI6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F1C2C1E2A;
	Wed, 23 Apr 2025 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422797; cv=none; b=n6uR6skCGxu93UppXGeooVQL6UzxVMp5Tk856M56fy5gwvRtc7qde7+9xMQpVr0ofW7EUc8iIwDteqcOQ9+sWhzl+jx2zdT5s0ccmLd8rSYaNS1Tf3u3QXJzCV8LlwlDuG/LB7e2DOaAIWfzHfpRVcwNPah7djmWAz9mwWXK4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422797; c=relaxed/simple;
	bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dnIEehq9rVXordRt4pBUKlU4GWY2yMLA9lXhbzM2J6po/Km3VWOKPGqHfhS3dvdi8gGJbxmN8m8D1cutGzNXaBAr4fbyH3nN4v7eaLKo1YEcuKQOaCC3rCmaytOZMKvV+VuaaooCnawTD6kfORJGMRi6lUzFJqzCV6knLuZAX7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HV1lXyI6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApNAI016813;
	Wed, 23 Apr 2025 15:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSy+SgCL5lGpQjeRIMvTtjJ3CYYax4gjcpMJGDuJbbw=; b=HV1lXyI6EVTHyup4
	9J3qwYgO58Bb6kJTKtOPdDbYKVQDvrMQcQv9d+VubPLdMfHoHZz594DYqvW4WScW
	vaiXxqPh2lYkQzr+w0mRoQo7gGA97NI6K4ZN6OUop1hEx3VBuOYV/VfZFPP1yy0U
	wVfOIMBKFRqnoz8r61yCmp3UXVW+kn6dKGX4dOgzXffu3o119JzuiQmzvX4B1N7e
	v1EltxGSYfMTVDywrWOEueCNp+8ef/WI+/36jBFSAE1CFLHWUAMGHeh1NIjf9Qhm
	8n+3N5sFA9eWue5unEuVYmGmpVEy2boF7v/aYdmxq1V393XrxbjbRliK3afU+0U5
	1RfLjw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0amp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 15:39:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NFdpgg030353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 15:39:51 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 08:39:47 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Wed, 23 Apr 2025 21:09:12 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: qcs8300-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-qcs8300_iris-v3-4-d7e90606e458@quicinc.com>
References: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
In-Reply-To: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745422770; l=696;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
 b=MhgYhW96r3QHH3nE1X3L1bQWpx38IuwKCCJhbFFrD95qInRqMt7l3R3jChqKQ7JeQU7gS3Jxm
 SiYFBcs1ZukBdqWosLlyG+pwe3AaPa25SRL34uDovYNmkXbyiBA9N9C
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Aj49hHRuibV7S2wgcEgiLJ0btQuNP1Ct
X-Proofpoint-ORIG-GUID: Aj49hHRuibV7S2wgcEgiLJ0btQuNP1Ct
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680909c7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=HJafQcN7i5IhSkUYFLQA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDExMCBTYWx0ZWRfX13szLP6dnObT ALd3PZcV8GX8DHwL7IgClAxG6NOYTQhw2NXyKyExhu37a/4w5h9TiW12rBt6srncmCtr9aXYgPj Hd/iY8oRwE7DgspH+EY/m4CGf2erIfuzcAjJZ/ByOlfI2yyJosIvojb7Mcq7BieWGOcdC5Kj65M
 PL9C7N1YaWO6mr/gxEoGILfxtJXjV89BhstYANhWyQFcwNlKdgXhsCCge1LoJrHbZ+d3lg4j2wo 26cJKzfi0jhy+ngrbUbsNlSDQxF4QC5iOsaqi1M+jg/gJknQDgOk64RneTRv33cbsy3EZiqfC1U fXfT8XItxWf9kXQJ3ob/UngZCMr0sBQH5LMfZ/puLXQsD/RCIlkUk8uNIdtMCajUGdaRcYXkXKp
 h66Jx8HzzLAOfDHOK3/jAIMjkjRJ38KIDQf0niQmbimK2aCawfUlmMPYAQZE429iStA0yo7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=845 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230110

Enable video nodes on the qcs8300-ride board.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index b5c9f89b34356bbf8387643e8702a2a5f50b332f..87114a349fedd80296abaf3d2f5f284b5adbbdfe 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -285,6 +285,10 @@ queue3 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


