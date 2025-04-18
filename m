Return-Path: <linux-media+bounces-30512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B06A931F5
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C5D519E3E7C
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 06:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240A9269AF9;
	Fri, 18 Apr 2025 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P0lg6hHH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33EE269838;
	Fri, 18 Apr 2025 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957754; cv=none; b=KVZzmaQ1JmiFWX+1BGVxsEWoVyl+lilwOr0zili23JZPrUURoFcrroa3uVmqUY7U0vhgbITFQQhXUZK3276C1IxIH9cu87prWNC/MB/u0B5IuOfzF50W0V3RvLMDGV0Q2zEWlY9Gf5IdB/njOAoQRRLoe4M8AB/EmDkNKbhzV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957754; c=relaxed/simple;
	bh=+/EuBdJScjW67rRqP6eEqKABewXlp+BvedqY22c4ZLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=n+/p8M2H30k7CnIxMJJaR2KM24BqeYNhvEB4Ud3B77iRt0LieqaIve76IWTcDvNX11o+e48Z8/OOZXzIqd+z2/tZzLCcIPECi08726LZlumHo5eFTb+oqBT7dCWEG3qeLUzME2r+2drIFTIMFRTFKH2nDlXzDtuCBZSkX/m8tyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P0lg6hHH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2U3LT014447;
	Fri, 18 Apr 2025 06:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eP0Og7YmMzZ6QV+KELKS/owB3MrmycXkASUmEilX7tw=; b=P0lg6hHHcTbXC6lK
	PPQGmPa3a9kULu66QVg883cu9EQh6lcppXxDHjoycyG61OHWm9bJtNd0ha/dfJ7h
	gIbncl9pKr2TqQftOhs+yHFgs2wNK9k91PToxJuL5Oe1q8f+BBzM+mUN4bfpbhoG
	SjPXqp0ewsIDvTuct5P2+G9xvVIzgSCgd1CvFobuk8bk6cRCrwA0UoeFHeRgHCGK
	iq0/pt/USRERGJZJ6o7oz6f9jrZRYdhVSTNNewLfkGf/fCLsJB/ZvDfWQMG4fLIb
	4e5eXHeknxSFaC/RPcYjCyGRdEwVtvV30DW+tR/eNBngfOvu9GZJS1FwqHTkIFvQ
	b3Inuw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1h29h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:29:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I6T7B0006803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:29:07 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 23:29:03 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 18 Apr 2025 11:58:41 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: qcs8300-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-qcs8300_iris-v2-3-1e01385b90e9@quicinc.com>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
In-Reply-To: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744957731; l=636;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=+/EuBdJScjW67rRqP6eEqKABewXlp+BvedqY22c4ZLU=;
 b=aBOzrbwiNmQ9c9IQIIrLBFqFqmV2R2aLZvSv+lYx5K8aKkg1DaMNtkI2AIXSUl04p92ZB+a2t
 fR40YXv5QUUB4N2Cj/8qH9Lps8seQkmOynBlvdXoFALoE76DD96fSMQ
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=6801f134 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Vel0jnL01F1Txzc2F2IA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dnhozm3UQFhr_57kmK1byowlAth8KA7S
X-Proofpoint-ORIG-GUID: dnhozm3UQFhr_57kmK1byowlAth8KA7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=753 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180046

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


