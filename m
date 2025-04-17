Return-Path: <linux-media+bounces-30494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDD7A92B66
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 21:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 590B41B66F5F
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 19:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290AA253F22;
	Thu, 17 Apr 2025 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g8lBPCT1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A9255246;
	Thu, 17 Apr 2025 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916292; cv=none; b=RQ4eJJOdLRtdndq5PTRhLUnvfpPSj0lXpudm6Zfb2hZSzuAi51HEfEbq8yUCDMQKRrAFpIvYruWFKGbo1stzhJR6LScUPrzkDvEAjkbYHFjALq0ftBfTIKgIqUcXEu8uQW+FygutzdoMyeapvhk8UlB7QCp78WUyrBq5L++p84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916292; c=relaxed/simple;
	bh=+/EuBdJScjW67rRqP6eEqKABewXlp+BvedqY22c4ZLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZLrcc99hjpitVwyHi//BMw3SsE7AuigciQNaUHnoW7Q0j5PjR986rtjoWG7tX1Ib+Lj7M8G85zX+A+RkEV40lbZkH0TbYmisyhbuPsXcPWalPuMDxt+OGPpXpnmJkIHFYc8BF0Ene2rs8CbzCxZIqEE2KGM2YJAsifDY/C+DXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g8lBPCT1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClWVe029661;
	Thu, 17 Apr 2025 18:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eP0Og7YmMzZ6QV+KELKS/owB3MrmycXkASUmEilX7tw=; b=g8lBPCT1ABNA30Hs
	OUp36Lgxq64IlPjImthOvnO8boAYTDPKelX8EwIVPLRR7tWlAZPogO+qvBl1u8zo
	dqDAKabzFic+6AcKyYqXsbyJMTSJDDklkzwn76sa0DEFfj+RsdU4sfUOVFfx2MG5
	wDNwzl4HoKY8tKu9AUdqkEmmt0qxROi/sMZ37h8jkdVeCufPGiCdzc0LrWEtHSac
	W04BccyyKu9jpSQ5nWnIiRzov0aeosC1G+yD86Er8ivdh47t6cvn9hmbGfIOk373
	getpobCOwwG9qWLZ2Rph5inVK7cBLAJi7ruajF9s5jbJvMIQyoyvxF8rq3jrwJPL
	pabc4Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9fxv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 18:58:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HIw6Lp010363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 18:58:06 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 11:58:02 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 18 Apr 2025 00:27:33 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: qcs8300-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-qcs8300_iris-v1-3-67792b39ba21@quicinc.com>
References: <20250418-qcs8300_iris-v1-0-67792b39ba21@quicinc.com>
In-Reply-To: <20250418-qcs8300_iris-v1-0-67792b39ba21@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744916269; l=636;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=+/EuBdJScjW67rRqP6eEqKABewXlp+BvedqY22c4ZLU=;
 b=0rNLQsyUW0RL6LBX/QSZfnx8UrfVERYgyqGjQ/vGihdwcmgq2EGNZJN/rldaC0Xyc85IqwrFI
 BTfL3MPA8mUClZbp9tZMhdHsAIf+8+StYqXGNYHAeDQ56DQx8gxnq7v
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RLM1v-rQKhdSp_SyElBRMrpdVS7fZc0w
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=68014f3f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Vel0jnL01F1Txzc2F2IA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RLM1v-rQKhdSp_SyElBRMrpdVS7fZc0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=753
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170139

Enable video nodes on the qcs8300-ride board.

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


