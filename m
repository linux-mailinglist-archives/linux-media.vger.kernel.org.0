Return-Path: <linux-media+bounces-25067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F47EA184C8
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 19:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D30347A2A7C
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 18:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8401F758A;
	Tue, 21 Jan 2025 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KohHG6D3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4D1F5438;
	Tue, 21 Jan 2025 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737482916; cv=none; b=Htk/X189jZxryyRTSV0brieAv36xt7V0w1Q2jKBkaraPgXlM5rNNt/ihQqOY/I5TZPKzUwX6C9d0YanQSD1poJcnVrN7+/OHDOHILUF0QFeXdAZWqT66OiYdLC1oInEwVQnHYFUWXwrIdyy5TO1u+6wiTil+Jblcdl7de1pK4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737482916; c=relaxed/simple;
	bh=CG7RwSUXu+HQPIkYbXI8uw6o4ZrYCkn8AbRNQDUa/lo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPOcTcU5+esBHUB0GJi4fpiWGnmxBY76gd5PuJ/RMgqAfQLzka0V7ECErlFTfO1Uea/KafHAbLjw6tWCDZP2gMcZ4hP5XQm4LFCx00suzlgyskTeo/oY3vT2TP7fiuX5nX5mEH7rEQnJW6rHF67S0+3nZ8JpmKZNppQf9mtNmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KohHG6D3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LHvrK6018767;
	Tue, 21 Jan 2025 18:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xggt0WOmm3Xya7UtSkigoga45da+J9JvLJBlZklUIv0=; b=KohHG6D3VLWoigQc
	agVpAokZBEq13SHlUTdWVrSe7iCBzprWU8kh4qaPIqNqe1jRmC6PujJuKoPYJDOz
	rCgJOaB6w3O+B9/sYqChwHZYe6kccw8W4uwD1PB53beBj3/Tr75lzQcTGdEvNvcp
	z6Gya4Zjed2RgOxPFfLEJaQdWx3VtTMEcUAtLeN+2/Hz4iI9hQe5t6V5MypSXtPk
	vvnC65CDRyQ1M6TZCrN/Q2S3awVOUTW40z7EwcLhKeRYubzaRAogChui2Wgn3B20
	j1evw8EpfHmdhkbGO/2lSKS8iojGyTGVDGA22+kZzyIifP6chjcRYr9d6nx70/Yn
	ZeMQ2Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44agej8146-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 18:08:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LI8IY7008092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 18:08:18 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 10:08:09 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v2 1/2] media: dt-bindings: update clocks for sc7280-camss
Date: Tue, 21 Jan 2025 23:37:45 +0530
Message-ID: <20250121180746.1989996-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zDEaFVotolXfsGDupJdkhlj4bqqsD33e
X-Proofpoint-GUID: zDEaFVotolXfsGDupJdkhlj4bqqsD33e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210145

Update clock names to make them consistent with existing platform i.e
qcom,sc8280xp-camss.yaml. Rename gcc_cam_hf_axi to gcc_axi_hf and add
gcc_axi_sf.

gcc_camera_ahb is always on and we don't need to enable it explicitly.
gcc_axi_sf is added to avoid unexpected hardware behaviour.

This change will not break ABI because the ABI hasn't been cemented yet as
the dtsi changes are not merged yet and there are no users for this driver
as of now.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../devicetree/bindings/media/qcom,sc7280-camss.yaml   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index e11141b812a0..ee35e3bc97ff 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -55,8 +55,8 @@ properties:
       - const: csiphy3_timer
       - const: csiphy4
       - const: csiphy4_timer
-      - const: gcc_camera_ahb
-      - const: gcc_cam_hf_axi
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
       - const: icp_ahb
       - const: vfe0
       - const: vfe0_axi
@@ -310,8 +310,8 @@ examples:
                      <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
                      <&camcc CAM_CC_CSIPHY4_CLK>,
                      <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
-                     <&gcc GCC_CAMERA_AHB_CLK>,
                      <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
                      <&camcc CAM_CC_ICP_AHB_CLK>,
                      <&camcc CAM_CC_IFE_0_CLK>,
                      <&camcc CAM_CC_IFE_0_AXI_CLK>,
@@ -343,8 +343,8 @@ examples:
                           "csiphy3_timer",
                           "csiphy4",
                           "csiphy4_timer",
-                          "gcc_camera_ahb",
-                          "gcc_cam_hf_axi",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
                           "icp_ahb",
                           "vfe0",
                           "vfe0_axi",
-- 
2.25.1


