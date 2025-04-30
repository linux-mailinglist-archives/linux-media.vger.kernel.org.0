Return-Path: <linux-media+bounces-31454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA00AA4AF1
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36D4F3B606A
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74A625DAF0;
	Wed, 30 Apr 2025 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oSSlrpeO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DE25D551;
	Wed, 30 Apr 2025 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015473; cv=none; b=rVlAzTbBmsa02EhQHPBFl8ULLkEdAdr+qayjnV5NLYAJ0cpmP5RpJ90Pp+9UjQ3vQtXPxi/rK3/s4EMNPof2V3PO5uppIkbwzQMV6cM0GhDDquA2ZF7gIN19QrKdoAKM6SyKtjaHn1wXDwEESK9PBGciwdWs7NRRLssEG78YRds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015473; c=relaxed/simple;
	bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=K2SYu3OE/wCELGAEWA0gJCX/j9Q7iPBrtNeg9iAooS6AmI2ALI7FGNUxfJyMlBXbg1eZOtv2AWQ722dCZuwDnZKJ+e2zN/x1+9ZcD9L9A2ULhQAh4x4iT/KzA8yuGApaVQrUW6xoaQIRXWlBujVNovGrmIQF01FWv22DldIo+xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oSSlrpeO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9Gud9020937;
	Wed, 30 Apr 2025 12:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSy+SgCL5lGpQjeRIMvTtjJ3CYYax4gjcpMJGDuJbbw=; b=oSSlrpeO/SCqLUgp
	NvzM9+CcZoT7YPSx4RkoFpeEFnfllW5BZHBncltIwikFP9MTbUefmSKRsNpg9xTv
	wfDOtPuYyWnVWA6/h58OK0UlnQ8RNMmz8wCUVC9db6Zvl+fJ+knumdprQpPsEpVS
	VPKzSm7tCWzkxgT1DZgZbx5/oSiE9a47cIZlBOkeObM85nB8lXRGEGx8woktQed5
	zbrL91ZqNAbS28OiKu8pylGkI/yram7CC8/Du+/QWYRyVnQ9oexML4slidS0lREI
	JtE0QfSS50t2fqRZuEMet5lfSImABkpKPAD/D2CA7fXn6DZPcNEhmYdxgpNVdslz
	n8sgLQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1t49s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UCHknP025009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:46 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 05:17:42 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Wed, 30 Apr 2025 17:47:11 +0530
Subject: [PATCH v6 5/5] arm64: dts: qcom: qcs8300-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250430-qcs8300_iris-v6-5-a2fa43688722@quicinc.com>
References: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
In-Reply-To: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
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
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746015441; l=696;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
 b=HswQuPcZcVLOkDlLa5CS4MXv8HofsKoc70mV3bLmTGTqDYG+CAPmRhjsNofPWTYJlXMZ28kgX
 ypkTXmaWO9dDwkuTX5VOt4sm5MBQUr3ih0UE8MsQN/iki3Sm4RsE4YP
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=681214eb cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=HJafQcN7i5IhSkUYFLQA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4NyBTYWx0ZWRfX6Bb0Ho0RtYCc 8uWKVTJZbLx6H44alY6kZC1nKhWEHpWuwk5yk3fdiujy8B9d+nFHyZQzYDWB/aSD7JHeZ0lPtm3 +zSuN+soFrBx6UBFSNLG9zMXpXwlt+PFexO24F2unD2lO0mimG/rKpsURke9/AWMB+dNwQ4i3sA
 uPUoq2hrLIyISmpoR/jojlszN28OeeGUGEMOy7SAIQdYdglZ+5IDLv8KWAec0l9vUomOfacsH8z HV7zzJ4VnpIB+QJuC+Vj1CbAK2jxU4bS8+a00FioRXrQbKEW24GfhXIIw2lislMVMOOM5GszCJj TsiG0hW0r7HRtzqLHytXoD27ZsQYMJsLvErOrUr6ihuzTor3ZdmXmbHHYQ0bi8WY+/j9Z1j8Y8r
 1Nag6OtELpFhL7NjNjao5AK4mpesoadjgBIEuWMjYastPjyZBrZM6SUd60/2oSalG987/O53
X-Proofpoint-GUID: D_kAtyXhAQk7f2ck2nBGe9Bb0Ss7RNK6
X-Proofpoint-ORIG-GUID: D_kAtyXhAQk7f2ck2nBGe9Bb0Ss7RNK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=844
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300087

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


