Return-Path: <linux-media+bounces-17560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7191C96B9D0
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E160282706
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E171D0146;
	Wed,  4 Sep 2024 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k4fel73E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8451D1733;
	Wed,  4 Sep 2024 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448335; cv=none; b=JrWADPbano5iHK2IGA+e0RjPX0oPRTL4vzoRXpjx1Tl79jvRxgEJrw+DS+69qVp+N3H09SOey6eELTGCvKVc/yOydcrQG/OxAGa7aLAHGEppHPmAIFiAVK2pdTuOvH7cOH3LdRiKh5Li+CJ5lq2W2lidnyUsGUD5crhx6U7fmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448335; c=relaxed/simple;
	bh=TrdQZ87GF+cpzN/Dk5KoADPZXw52dsKzRF2LR+lKVxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dSz3nziC1dEMhaU6N9Bw4mGBq++wY7nbYam9JotZNhHWTQctHoSf3gYhjVUEWU2IG6NP/ecEqWbYVo9oxnnyOOf550DYWs9ixTnJOLnUcHg40tfiYE5vGqehVTDW7/wIMrYoFB7a86UgqafP9cnz+WoTCHKP8RW0zsamG6QFXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k4fel73E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4844YBLH010626;
	Wed, 4 Sep 2024 11:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ydj3+/Ij3Vjn6ILiAUcYBPDNnsQ2O7eY/4Dj7qGjaWw=; b=k4fel73ENkKlD29p
	uhIB6jaSxYpjNY0KNmTAfJXRz5xrqtc2/ZcnwG00CeGVfLeL5OrjCpX8YkCSQN37
	uGVS86BR+paw4v673AfomuSYGL93nLo+QZvIHq7d+sTTULAyM5DTXmE7VGy7C7t/
	OCjx9x4kxl7wLSKnYJUq/yCYK3pbtIWbKS3HkUCxPFWx3/yn+rRqrqtdVeWnLSWy
	zwMm98+6r8+fHkqLWGX0uZ3xUVhcjZld2av2qVSxmrC6yZOekkYHXFt12AO+1aTV
	mA2b7NgdDGlKciEosE0TNICEhMhGiXO0lXkABPjNlnA4SM/9RZ5HjgeD4b58Hnku
	75cOIA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrgy2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 11:11:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484BBmjQ023857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 11:11:48 GMT
Received: from [169.254.0.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 04:11:42 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Wed, 4 Sep 2024 16:40:08 +0530
Subject: [PATCH 02/10] media: dt-bindings: media:
 qcs6490-rb3gen2-vision-mezzanine: Add dt bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-2-b18ddcd7d9df@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725448289; l=748;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=TrdQZ87GF+cpzN/Dk5KoADPZXw52dsKzRF2LR+lKVxE=;
 b=W1Wk17lrjlnZ4T3ZSNuqMxW00A8A68P7Qj9TvQ7OST7dyzk8v9/gMY/pOWqJ9hTpp7ZRi/RKf
 /c6GSyThwGwD2ifAktGa8MVWRDKnv+sld3TX/LcM8wVZTYnNhvrLvgj
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y48omhXVKSgOjTlBS2SoIZXEavJOhItS
X-Proofpoint-ORIG-GUID: y48omhXVKSgOjTlBS2SoIZXEavJOhItS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=973 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040084

Add bindings for qcs6490-rb3gen2-vision-mezzanine.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..b2261dcdfc2c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -390,6 +390,7 @@ properties:
               - fairphone,fp5
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - qcom,qcs6490-rb3gen2-vision-mezzanine
               - shift,otter
           - const: qcom,qcm6490
 

-- 
2.25.1


