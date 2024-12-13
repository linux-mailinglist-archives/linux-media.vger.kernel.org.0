Return-Path: <linux-media+bounces-23365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B49AF9F08DF
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75D6C2842D5
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134181B414B;
	Fri, 13 Dec 2024 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IFKtB3J5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4591B4126;
	Fri, 13 Dec 2024 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083856; cv=none; b=bMgGzooHReMgnP6+5TLijX/ASJFqwnGRnSOxMOi44CTEXuy6ovoSvLNn237w4zWcisBrZ6cQOmtfoXe6C9DuEok2x1NwN2HY6NW/iIGheNlCUrwPu5Wg8dHNbf8smaRt6PkjzOwkh6rv9UGF789+CpyTubgDY7tz1fjF4H6UsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083856; c=relaxed/simple;
	bh=nVU23QDeAUD8yiafCqoD5xrazbt1IBvpnfozPSD/x2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Q3brAY8STogejEGT9U0NoU4962fk0Zi34h644cvNyxV74yl3TOghR9fvgmhZKWIsogAGald/e0eYfffD2QWpsZ/1UiOxkXTVybAMMfvGSCpiE9IcyKprEukSpPkmugG30517KC8RBA0LO4pqaYemtokf3gk7APZpUEk69t9HFx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IFKtB3J5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9nZTa017417;
	Fri, 13 Dec 2024 09:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/ZM6z3aN2dNtQWXvRJjBjbmmWfS4QZwT/82jlW+/Rc=; b=IFKtB3J58fOBf+gV
	XTr9zD+hGV4HY/WSrFGBXCSA8LTwkwgyPv+fMMTtySlLCwpax+GoBOB+tkviaLIw
	U9xvQdHZ/bgnqOzicb6blDf3bYk+5aMZqg+//vlQ3yhNIdQq4XGFLSfTUcAloZDn
	JAh45hpEazatVWlKJMWhdD1KP/izUi9h3RpGutKk3kjFKMhX+F8oDGwoTqHz7QDI
	mhb5Mvp8IQFc1D0wmfOozjXA1ksZJG6mLFQWrof7XFD+xYVbg0WBeMCQ92bpQUg7
	j25+Gl6aSrPfmsm0UZlqP0NM03UvEM7JxGvPEABdatK56u26fF6KcNsJBrepx9mL
	L4hLtw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjmt00xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:57:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9vRh9028932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:57:27 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 01:57:23 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Fri, 13 Dec 2024 15:26:46 +0530
Subject: [PATCH v4 1/4] dt-bindings: media: add support for video hardware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-add-venus-for-qcs615-v4-1-7e2c9a72d309@quicinc.com>
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
In-Reply-To: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
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
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734083839; l=1036;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=nVU23QDeAUD8yiafCqoD5xrazbt1IBvpnfozPSD/x2M=;
 b=UEbC3p4I9Qm9ML+933v4PwnIx9tN5JjYvdjNDTZ0oIQqjV1TEO6gqesSRM+pVTqNeVbycxcnq
 gAX/Cycda20AFH2e5MQ3+WDDaxVOhOkbm1zIp64G0BjE1crezm5J8u2
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vryCoU3tSddQ43hOM9fBH1u7JmJeCRJp
X-Proofpoint-ORIG-GUID: vryCoU3tSddQ43hOM9fBH1u7JmJeCRJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130067

Add qcom,qcs615-venus compatible into qcom,sc7180-venus.yaml for the
video, and let qcom,qcs615-venus fallback to qcom,sc7180-venus on
QCS615 platform.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 5cec1d077cda77817f6d876109defcb0abbfeb2c..6dee45b7366578e51319b575e5dd2587dc84baeb 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -18,7 +18,13 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sc7180-venus
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs615-venus
+          - const: qcom,sc7180-venus
+
+      - const: qcom,sc7180-venus
 
   power-domains:
     minItems: 2

-- 
2.34.1


