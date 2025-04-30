Return-Path: <linux-media+bounces-31486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411FAA5616
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 22:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC8253BAA08
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 20:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712C92D1915;
	Wed, 30 Apr 2025 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hQ3DcHNn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0982D1120;
	Wed, 30 Apr 2025 20:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046052; cv=none; b=gUpJz7LO7GktkFAN7mbU+mqLXPyHHmaXISBdqIRfBOjeRN7neXCokjRMBAaH/wGfc4fgfOORI3rt5xyPWiO3lWJ7HvDTVTEdOLNRgi1i9smV7A0xDaPcqIly+oXVRtAv601NYG2gHgj4aFCxbonqBuAu0WphbAnBBiOhd8mLzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046052; c=relaxed/simple;
	bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=r5fDCArlLfbMz/BM54l0odiMnLApjvpk79flMQl/1nexY+F9Ju5wNmtmQHfVwK7ywbgRueBA8z7xBg5Z5a+5EbXmgWkEcFoUR85BYXapA6FMlFFFbaWML0gwLvKAZGP7dnXWPCEVoTzzHwrKhSdDqk3+YSNgoqqQS8mMek7wiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hQ3DcHNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UH21qn004198;
	Wed, 30 Apr 2025 20:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSy+SgCL5lGpQjeRIMvTtjJ3CYYax4gjcpMJGDuJbbw=; b=hQ3DcHNnkPq+3BbR
	1SbXo0dtR63CMaBVJunHUXRcwdquqG0d1itZBM3PJOlb6hIxQ8P2pKQTDJ8SXTk6
	O3/OsoEeCwszAS6kO4gI+8ii2xFe1/tVsamAGeML9uSGkiCOoav64kH24Cz3Da+K
	jJbzQuiDmMxOtrXgL+4G2zqcsNHcDIS3fSCq0YCiY+n5KudVECA8EStcUds1HNLa
	bE6a1yCeFUfVWWstCbpRXc31db1GVNfWK80kkOUJ+sShewIAEjUC+ThSZh1CZAAD
	Qe8aqxhDY6a0CcYPV9UPJE0O1w9JPoBCW+E+cUgJ6ATx+CDbgbKjMv2mLw1J2cAL
	uXXsHw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4bn1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 20:47:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UKlR5g002149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 20:47:27 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 13:47:23 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 1 May 2025 02:16:51 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: qcs8300-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250501-qcs8300_iris-v7-5-b229d5347990@quicinc.com>
References: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
In-Reply-To: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746046022; l=696;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
 b=KYl5QFDiRrBA9y4XpODczTb96W5Rf2T5r5OqaMXdSPcBISmVOv5cnvdWlyzwXsKuuAQs7QhNS
 7wdyvFwFe1ED1s6r3uGuMdy+3bcG7NaTDIYRwMohvldjGcxLedc09P9
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hYpLuRIDkUkqLcf4rmU3V6LIkP5_O_8h
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68128c60 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=HJafQcN7i5IhSkUYFLQA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE1MiBTYWx0ZWRfXzdE4LCl0LIq4 7xOwxzi7Adj93hlwVhv4J1oKcuEmIPbSXciVJK5KlIBkhupA4pGcGoBK88Zi8oZY6/3/Q7jIOhy YgeQNQo4Z5uJG+FY9YQ4hmKUCuSfeuPSsa+PVbfoOS1K9YkYeiSdCm3vgqAZ2I3mL1pEukJIpiN
 3tGo82KXIV2t1aMGKs9ghbQV1OCzUZB/LlwTXVk+xfcT4odTrqLe0V0rXl5WacxVR0UTWM++r/Y y6lWhxzxRV374OOFDuG1+6bsa57+2uVyiOD8mEtRMDM+2gAVAutflOxDAPR3oLhov0H6CGs5xpg Q1lY5mOTIf1QKM6Oqi3B/X1SYTCYJjpHQQv3LiW/z1OBvsNeNw9Th6D07ECDk38f1GQ4TCJUrx6
 MbkmBd5QkXtNaVfEsl/3QKMd00AovzU7IH+uD4hs4v3sRslzbwcPqqMecCsNKfVXD8bTpZhE
X-Proofpoint-GUID: hYpLuRIDkUkqLcf4rmU3V6LIkP5_O_8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=844 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300152

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


