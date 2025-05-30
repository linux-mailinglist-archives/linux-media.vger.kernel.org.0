Return-Path: <linux-media+bounces-33621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2CAC8727
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 06:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA696A258BD
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 04:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEF1201100;
	Fri, 30 May 2025 04:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U0b2STfi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AB01FAC42;
	Fri, 30 May 2025 04:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577800; cv=none; b=mi/W9TRaJAmzjCAoB5TqtdLhI+dTZukJvH/hcw2NNU5JnXL5ZOkLAE8mZpr4DIvify7V5nCj7IyxC7hI79XV9ja1nSrdVyTafvq3J/qybV85QvB7ZiPk2/2IVuy7o7XmcBIKfTKbwhtlZ9lR2Ium+qcJk2X/cCCgJ5vmMrsACwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577800; c=relaxed/simple;
	bh=Bhv08tf8IfVooEUV98A22ujdDnjVjCoxavWzvMsfg1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iVSSoU/QFz81DmrKBFWp5HBjbHj+LC6ScYuypLQ08TJP57AHF8gAXK2HmzT8haWT5JP+R7aEB6OORGNbzPcWXJ1hu4lDAJipd/zqJsigko6Gmiv60AIMa69SpFVJfa9dozTq0OCpDFAlakarVXX6kcOEARhVsngZg2yYVPhC4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U0b2STfi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U15uCp024010;
	Fri, 30 May 2025 04:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iRIv26I4XNbj/rsh69mFh2RG34OAeGAiVTyPYpO9PWE=; b=U0b2STfiLQI3TbQJ
	DOembpVk1CnrXKosq4KLDbLV7TcT82wwiAVO7ZSNS6Ip8EI+O2eZ0d40+iQRtRyk
	ygLD8pZLHpsFfrhCr442+jrdHD/rwCIlS65vwV/FkQPeeBmj7LaHWT+DYtbYcO/Y
	hh3g9eTYmp2XD8fVBgFWZVPg61n662pOhw4sWiXYoAch+leMqLZu+tr8rnqjk5tJ
	jDxJrR7dVe9xwdHswuh7tpvT1Cgb+901TSJX/rZ076+f8rh7XYZwBmjanLDMaI9E
	8cjAI91+a6BwThtu8zecHG4qxU02U8ZTlhwVHpkWwdxeCfpX06kNXSKFdmqicSo1
	TP4vMg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7cddb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 04:03:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54U43DBw023676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 04:03:13 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 May 2025 21:03:09 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Fri, 30 May 2025 09:32:15 +0530
Subject: [PATCH v8 3/3] arm64: dts: qcom: qcs615-ride: enable venus node to
 initialize video codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-add-venus-for-qcs615-v8-3-c0092ac616d0@quicinc.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
In-Reply-To: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577780; l=776;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=Bhv08tf8IfVooEUV98A22ujdDnjVjCoxavWzvMsfg1w=;
 b=I1DCnuHllVdwHs83/OjAKNyqTYKQ9ssZJu66kTNbqjZcL1/Bu4BmnZQNOGfIN+Zau1orRrXBY
 gBkFk+442fvDD3fnZQPZYVCMfcEVJVa9Mbe6WWzsGmmvpokGRqxho1V
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: njivV9Z21-eYSxFaou13gRp6NoWGhhd_
X-Proofpoint-ORIG-GUID: njivV9Z21-eYSxFaou13gRp6NoWGhhd_
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=68392e02 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8
 a=COk6AnOGAAAA:8 a=1tseWai4MNHguRGVtBsA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzMSBTYWx0ZWRfX/lEkzsno0ZEY
 l6qafjuUbdzjC1kxzNhvKwIh1QIx1oB8glI6hPEblElg/V54ooIYTJvLoNsYkHqkHwtrB4t2xi8
 Mjg9ScPyTm3Fe4kS4SqHGRKj9lOTQZQkDWSFDhFKcPLF7x7upN2fDXw2jokP+uSOXlFLFuzMqsU
 fWgRsLq2tT8CNhbTLLdIOvL/ei0Fx9cvxssU2xUFTWeKYBI+0diwusBOltJ8JQL4BLgdEpmaS37
 ZbEzZmWRjEfurJRvlrNPZpD+eqqeQADwhk/tKkAOjLLaDLvE1ZAd5pb3yjQT98xa0o5bLR31G2w
 Fc7wTAcWih8X1rmQTymKWGC1WgGGKHsFl3xR4BjSoX0Y5aIGF1YdlX4z5I59ZRbbCRDKZ7PorqP
 hfT6kRm/aW3Cjrb2OFmgtnRVYx8GJ0NXfjeS36vWJyWqynukeij+/ECgMBQTJ+AbZLC+Qblc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=824 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300031

Enable the venus node to allow the video codec to start working properly
by setting its status to "okay".

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..0686f5c10bdaf7ba3f522e16acd2107d25742dd9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -338,6 +338,10 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&venus {
+	status = "okay";
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };

-- 
2.34.1


