Return-Path: <linux-media+bounces-42106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A78DB4AC89
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72C51C21A07
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B01D32A3EB;
	Tue,  9 Sep 2025 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MoC6RnCB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5C326D76;
	Tue,  9 Sep 2025 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757418213; cv=none; b=F6eOWWX8//CMDhYgnIoOMM/qz2kBbb7Uju2fscpXaVKRLp2BEqhB0xGQVoUi84j+Zzc47p5dizrFYwyqx4q8ga66UiASuvhzcvoiTqO33Gh2slnlfBgEBnbL3UJCDrVnb6DaAmNAbuhhUG2UnCd8wKWRNEuiMwjpb3R7bpq9Q4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757418213; c=relaxed/simple;
	bh=3enByne2km0q3vEnL9/2KIOrPgpgsOcu2nxvznOIIhI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLYiwsAq8g5S0cCzxBwRCUExNw/JlrBwmDUoXRiyrv0V390vn3ev0z/sI/q2RuGDwepWZ0bOUeyt9uCm/h2fchsOAVKt64Y2ar9olUXnMlV2Cqn4a21n82f6CLFqqYbti6AKlh1zhO3wkYSgqhzjplY2Zadjx8hpjZEw7DGwQJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MoC6RnCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LmX0024975;
	Tue, 9 Sep 2025 11:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFn9XvZtZPEGTj9t2BnjXK4luHThGGfwDBXWSpVah9s=; b=MoC6RnCBP25Xg6V2
	pSCb3TmyYe5bq1Il3j32tnbV/KqaWus5Ujj9DaBZCjvETR+PGQs5lTgMasQtRfbn
	6Ca0yELLUDloKVMTNZG1HXxJjtSxE6bCGb7FJnU/pse0NeNeBJwDaUEUt6RZWVMX
	csl4FKxXgGQK8ruKs4gF3NaBa8YEAJ7WqkhBqVJhTsE54hb9SLOsSEThhOYcEP70
	+oMFYl8k0hXY0nQn4jHnHby8nQ4qV15xXJtuOpZoBvoWHPIfZji7/WLvBzxR9wa0
	f3gVGX3G51HXnX8oiq9K0Hgus1eGgYCaluZIxZXEMhi6/Y4qHq4Kz3mph6ssmsAZ
	fhCVoQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by9041m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:43:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589BhLPw024823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 11:43:21 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 04:43:16 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] dt-bindings: media: camss: Add qcs8300 supplies binding
Date: Tue, 9 Sep 2025 17:12:41 +0530
Message-ID: <20250909114241.840842-5-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c012da cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=QciY1cZ01I9P_ZE3WJ0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hsSpPUbIlVcNGr1oiRaCKJffsbruv8ZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8z52DWK0t7fS
 A0Scxyv/I0RuBFnkPZ2nYcJJutUHpOzC/KTOguVhxCLTytY/H0SFmOnOjlWX5ahzPtbwDXCWshp
 bz0jMsqB0YLLAQYJqlrEhgiuf36WqYpNFx9rVRUl5yu0J0i1UgqvNOTcP/6yFsfd59NN4gCTEnB
 B3KvCOXmoRGp+e52vdhkxVSuXNOHfd1SCH8Hx5qJZdRUcXlhx5aodml+NsmjfodEeCRkZrmdutk
 SbbmvpgrfGJs+rAE6Z7ULNtFfvbsP83qCFCopEkxl4kBkyD6aOjUNV+4z3L1jJF9YKOjTKOlirq
 +y4+gbetL8G+dD3iJlWnOH1rA5IQV8dkbJEK3KUnrAb6BD7m7w0ATZLsm9DcrksUl9rWi1wwNY7
 V0qwdH7K
X-Proofpoint-ORIG-GUID: hsSpPUbIlVcNGr1oiRaCKJffsbruv8ZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

Add vdda-phy-supply and vdda-pll-supply to the qcom,qcs8300-camss binding.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index 80a4540a22dc..559db6d67f06 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -120,6 +120,14 @@ properties:
     items:
       - const: top
 
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -158,6 +166,8 @@ required:
   - interconnect-names
   - iommus
   - power-domains
+  - vdda-phy-supply
+  - vdda-pll-supply
   - power-domain-names
   - ports
 
@@ -328,6 +338,9 @@ examples:
             power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
             power-domain-names = "top";
 
+            vdda-phy-supply = <&vreg_l4a_0p88>;
+            vdda-pll-supply = <&vreg_l1c_1p2>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.25.1


