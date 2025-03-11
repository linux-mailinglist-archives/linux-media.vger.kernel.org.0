Return-Path: <linux-media+bounces-28029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C48A5C075
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 13:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73935189D2B8
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 12:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A1225F991;
	Tue, 11 Mar 2025 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PW39Z2I+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBD2580D0;
	Tue, 11 Mar 2025 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741694679; cv=none; b=rCRvCbVhnE76dmxtMAJKQk0RzQeIPDfBqIiCQ2vCTRgV+QlmujozPkSm2PdqfYFuFXvd1cmLLR02Hvfi6XGmVoiNZXjosr2bsqs4u3xwO+yHCeVdtjuI+eVKzICsR2FGRLiq2nrPCdDHaOji+9HWXgAji3ycAC6S16+dg1WNf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741694679; c=relaxed/simple;
	bh=bN37PRau9yzUACvEXUlab0xuXdnGRCwoxQGre8KGuFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=T6yaDBK1Ug/EwWUpB5cFjnaDCgQ36IXuZDLhIbGaHqLmUNFl6lHHMGb1IrBY3uCuZWPnOGaxyKVz4EFu8AnYQQEMZIrC0Pwc0raG8aN+k7YnkYbBs/7fBweGRx+nuGqR/8sIym/yaRe8gagjAYuxF2SR9327Uus035jrw2HVvJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PW39Z2I+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B9omdL015357;
	Tue, 11 Mar 2025 12:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaX2xUig+zgUbBcF1sZCI4dijlk2Lr4bemGGpalLR3Y=; b=PW39Z2I+byRbu3i7
	sanki2p+mdiCWKzPyjLv0pMStvR1QvW5OREEQHRm2k7WAA+tKZ0ZfK7vjfFmeQ8O
	B1NP2hxUSHEA5rdyaOGO6j1RsvPBmCK9zECay4vGwvLWSBtd2hxCrpiR1U+b8vj/
	z/fsqeVCQifbAmAQoidUKWVHPCrFzpi75TpfjcyJDkfBsAj9EP2Ykff7DUf6uQMj
	sx1jjfIvvaOX+i4GEgLeav1O85YXIOAyfoO+h6zD0a2Rpm46pQ3wZT9jS5QTdP77
	pcN6FMNrabusCroxyqpcvDd1LPayfYhZblaOemgJsIghLOyGrPQT6ZbJQtCkvcGb
	jFUSnQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ab8m1tk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:04:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BC4Ywf026492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:04:34 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Mar 2025 05:04:30 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 11 Mar 2025 17:33:53 +0530
Subject: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
In-Reply-To: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
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
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741694666; l=842;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=bN37PRau9yzUACvEXUlab0xuXdnGRCwoxQGre8KGuFs=;
 b=RorLe8D3qXx5leW9bxrxEt9FbaNLrVrUFk/1xfaJD8nZ4j6mNLacm/edEbosX21ygsXxvWHAq
 xOkob2jLrTxCdYJ1XzerK7NPaIEInYyEk+oQ5uu+OLf6v9SDRHQLJte
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _ebAKCKZ5uS5UDQltQppBPPeMpaUbd5o
X-Authority-Analysis: v=2.4 cv=K9nYHzWI c=1 sm=1 tr=0 ts=67d026d2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=tCKTKDNnIw5OmQEaJSUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _ebAKCKZ5uS5UDQltQppBPPeMpaUbd5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=736 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110078

Not all platforms has a collapsible mx, so use the more generic naming
of mx in the binding.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index e424ea84c211f473a799481fd5463a16580187ed..440a0d7cdfe19a1ccedefc207d96b26eed5d6630 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -28,7 +28,7 @@ properties:
     items:
       - const: venus
       - const: vcodec0
-      - const: mxc
+      - const: mx
       - const: mmcx
 
   clocks:

-- 
2.34.1


