Return-Path: <linux-media+bounces-28547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC734A6B335
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 04:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43935468216
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 03:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F171E5B6A;
	Fri, 21 Mar 2025 03:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BaOVxuY8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277D1DF739;
	Fri, 21 Mar 2025 03:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742527183; cv=none; b=os7XSqMlZsdxCKpP39qhiRxgYohFs+/wxY+qdF49VphrcVCPv652sV06Ic5asg7k9eQ2V2gCAPIGvQGhLZwYNSd6TpezFCVBNjpO8N7CReAo2aU54mGma+B+w3DAm4RsEGjx4G1o6fH3TW9vNiS8wELcXagUzk0lSsvJdrNeDn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742527183; c=relaxed/simple;
	bh=VRiH/ciOpzuCr4PEeYPHGm49AVARFp/QZNHx1VF1UJ4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=p7ZZfCtBEUqvCE189VbRfiAXg1aFXpqrRCp7Zk1t/rb7JVKfkIUBdwegV+8q46JWCdUDW4R71p0S61mBsPWidgeNHHdpmKe5+gpWZOKznTabu/EvqEV0eBCyPMeajVQ1c7J4x1AZQkiOL1SRc59mp1x7R68V29lSCNzAs+vT6PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BaOVxuY8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1WTn0030777;
	Fri, 21 Mar 2025 03:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wp3CaERTLWcfT+cKKr+jCf
	TBY9Si8O9HvYVlTABF9xw=; b=BaOVxuY8JdWjvK2WwyS2xPa1w0LYqKPcngMSxe
	2Y94ZldT01csEpv8mtvDrHcDSijjFXwhYTIbvgnO5/yX0H4/jrjzeu9hBcv1hah/
	8mKNHLDOdbQXTyh3VlLS16qTwTSKqFaGGyJj8Vf4PJeGYIqU+6GaFLWY0IBFmOyc
	Vj9lnFTB2IqG3496ZhXz3zMLXvRACxwIBkF34KRKJoVNmfJA58g27H9L8+jprlm7
	sVh2i/p5RcvowzM4CTSuGn2Ibr7PB20MgXnBuh12s7QgF8ohFQllTRn0t/nvz2RB
	vUKbm245selB3Ssgs+g4PzwuJ6bAUkYFC3ZlEJAnohaTtXJw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1be1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:19:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52L3JXNI024510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:19:33 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 20:19:28 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v4 0/3] media: qcom: iris: add support for SA8775P
Date: Fri, 21 Mar 2025 08:48:59 +0530
Message-ID: <20250321-dtbinding-v4-0-6abd4575bff4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPa3GcC/3WOQQrCMBBFryJZG8kkTVtdeQ9xkU4mdRam2mhQp
 Hc3CkJFXL7PvMc8RKKRKYnN4iFGypx4iAWq5ULgwcWeJPvCQittlQEl/aXj6Dn2sl1r6AKCBVq
 Lcn8aKfDt3drtCx84XYbx/k5neK2fCswqGaSSFlvVeGNC42h7vjJyxBUOR/HqZD1z9fyDrIvb+
 pacq6ipEX9d89c1xdUO6oDkLXj77U7T9AS5P3gWHAEAAA==
X-Change-ID: 20250310-dtbinding-8921bfc151e9
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742527168; l=1293;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=VRiH/ciOpzuCr4PEeYPHGm49AVARFp/QZNHx1VF1UJ4=;
 b=B0Z2R5jeQTnNIMFCe092l0g4Bai0hDRVxjt3Zh7BgFOJMcySo4H62DchWpWAhXsb7ZQYApPFb
 XXus1LLq6O+ATr/qMvL/3kJ0htrte/TC0PQguzSSTyl9lBjRgK4jWdf
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dcdac6 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=uUO1Guatd2edvWoe2zcA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TKVAXP0vucgklNJRiJqV3Y3wMY-XkT3h
X-Proofpoint-ORIG-GUID: TKVAXP0vucgklNJRiJqV3Y3wMY-XkT3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210022

add support for video hardware acceleration on SA8775P platform.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v4:
- Fix the order of video node.
- Link to v3: https://lore.kernel.org/r/20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com

Changes in v3:
- Fix nit review comments.
- Link to v2: https://lore.kernel.org/r/20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com

Changes in v2:
- Drop 01/04 patch as it was not needed.
- Introduce sa8775p as fallback compatible to sm8550.
- Move firmware files to board DT
- Link to v1: https://lore.kernel.org/r/20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com

---
Vikash Garodia (3):
      dt-bindings: media: qcom,sm8550-iris: document SA8775p IRIS accelerator
      arm64: dts: qcom: sa8775p: add support for video node
      arm64: dts: qcom: sa8775p-ride: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           |  7 ++-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  6 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 71 ++++++++++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250310-dtbinding-8921bfc151e9

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


