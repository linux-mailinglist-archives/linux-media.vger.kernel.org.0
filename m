Return-Path: <linux-media+bounces-23550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB2F9F473F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 263F916F105
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 09:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29BF1EE00C;
	Tue, 17 Dec 2024 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k2Q2r9IX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12C61DED7C;
	Tue, 17 Dec 2024 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427105; cv=none; b=bTRviIhOXbudvQP9XLlJ1BJkD+5vbbCybTMfKE//TH38dHCAQyNrdU/4vSKzIdpd/OL7cQptzyZ5aZv5NAQ0A7Hid4bNiw2BBwCniMVejD7nzjmiCcUmMsBVbFrYcU+XTNHGkjfEU4jGDDEB68wJwHTxOG5P4zp66KjUr0rwhhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427105; c=relaxed/simple;
	bh=06b8lLGqvb6UoPzTfPWeex1Kku4lZh7ho91BtL1ijKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mlIMrVItJW1rdGsfamdo6DoznFBdsDqm7ZTfFAfBs5SWo5n7TjNuDuVfbeIyAUje2xB+o2utpptRRzQPw+1HKoSusF8Mtjr0mo/acjwUWZx/MJJudB6rJtSUNotdkm704jevPsJ3Ghpum99dtC5hb6PYzpet/gTAVEsDtIjtnos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k2Q2r9IX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH82YCA002863;
	Tue, 17 Dec 2024 09:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OSQhARwNrSvwT+L+qHgmEH0juK0IqB5r39SAxKWeA4=; b=k2Q2r9IXcdw8AgFi
	SvDKQcSdtzPSgY3nr6HgY3v7cZBdAIa93fMQVU6LDZguPC9P67Kn/zBIOjpZYlwx
	W/6l8tAKiN9A1lspt8u4fl/YKGv6MaoNOazrOjF6w+hAXVTg3bSVvUGg03+5Gfu6
	HPahvFMk+FfHbTt9JnsMazbVtk9HflkYc6i8QC1yYL0UXlmk/NThd3QBofVxaYzr
	EcAF/u/NdK11X38Mwijo4TThNtzlkQF85k/ffCYJ3m5VW5oe+yh0eHUJ4FthaTQR
	XL+y/+n9xAq3FaDzfEzENnNcUdqtSOjYGEfvfWG3Q6NB5Wqpz9R1am9yYIfnmtBV
	F6QTbw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k5ek06eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:18:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9IJEB000565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:18:19 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:18:16 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 17 Dec 2024 14:47:37 +0530
Subject: [PATCH v5 1/4] dt-bindings: media: add support for video hardware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-add-venus-for-qcs615-v5-1-747395d9e630@quicinc.com>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
In-Reply-To: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
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
        "Stanimir
 Varbanov" <stanimir.varbanov@linaro.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734427092; l=1032;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=06b8lLGqvb6UoPzTfPWeex1Kku4lZh7ho91BtL1ijKo=;
 b=FC/PRWpyeEIh2gTTfT2gp+kEGOFYc/udsQVO9HFlFkvoId2xu1O2s3lckspDmpPA49rm80eZr
 Sp93GONqot/AAAWJWF7ZwwgHorGj3CpzeH95y9hUl8y/AQuvd1Wtq2k
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 33DcLI4bg9qwRT_XwALBBKKTo8ASG2P4
X-Proofpoint-ORIG-GUID: 33DcLI4bg9qwRT_XwALBBKKTo8ASG2P4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170076

Add qcom,qcs615-venus compatible into qcom,sc7180-venus.yaml for the
video, and let qcom,qcs615-venus fallback to qcom,sc7180-venus on
QCS615 platform.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 5cec1d077cda77817f6d876109defcb0abbfeb2c..de628709fe43b1f3261820b89c65e6eb4dd352e2 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -18,7 +18,12 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sc7180-venus
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs615-venus
+          - const: qcom,sc7180-venus
+      - const: qcom,sc7180-venus
 
   power-domains:
     minItems: 2

-- 
2.34.1


