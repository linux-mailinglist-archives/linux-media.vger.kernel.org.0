Return-Path: <linux-media+bounces-23586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB79F4C9E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C04F7188784D
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 13:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103EB1F472F;
	Tue, 17 Dec 2024 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pJGDBFh7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538D1F3D3A;
	Tue, 17 Dec 2024 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442837; cv=none; b=tqkOjOlRI/I3q5k4YfcZ1F3SrFm/NmkpDmt6dRbFrLL97XPJ2XhmdAfRgHFkwH0LVV3/PSmJ9hBHJ2CTB6BkoSmKt6phF/UD9TJ9uIuqVjhdLe11MOd7BDg7UBngIa4kAmvuPhuIusxdedxqHlJJIfQtJ+TmV7Xwv5I6GsNLPss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442837; c=relaxed/simple;
	bh=sUzxkPFR7JWUz2VGvXWyCvGmwMxj7P/fRZOEqhPejr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NlhnrsNdxuQActkkcHNSxVDY1gjNs2to+nTye0G+oEdv/3ohACouSB5J+QiiyjmkNKCf+FEnN6Qk0ioyW99PWkWMnpAIje9J7H9T2NfwG5yx5ekjWhQZkX0zZBGV0+sf10HR4GXMycdj3D7nI5A/+W0C0TDKwOhj1NjEwn7lBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pJGDBFh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHAokFK000659;
	Tue, 17 Dec 2024 13:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zupeWSD1m2oZokKFXM6Li38mfJnIz/VL+gMVTKclJBA=; b=pJGDBFh7do9WK6KD
	QvVjtwjyAuuzAsDG/ZDIvKuBWqDXdwWVlEOZHiN4HNBGoqZdaS4o4CPfH/QTMl5d
	wKFaDo2bqjZ6Mw5SHLxxhZu5llRFvbjE+/vfykZhk8VhgCNbQoFOCGQvW61Hogs/
	INEhDCb3sC3wxAsjRhKb0+WeYy0Ys43tfIhDSg8/bdtB192nQwgwZfQHLYJhthxr
	WR6Bh27+SBRnCaYrF8oe9pEh288uyol3lCslrcHpS5O7EqsaBDIOMLcv+rlj+iv0
	sXkXei2DNyMEuCGWb+7sPSCKfINNydjo3StTBnoQ28cfcZjqwMn0dMgJ09DjVFfU
	Y2LJ5A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k7w50dyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 13:40:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHDePhR029218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 13:40:25 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 05:40:16 -0800
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
Subject: [PATCH v9 1/4] media: dt-bindings: update clocks for sc7280-camss
Date: Tue, 17 Dec 2024 19:09:52 +0530
Message-ID: <20241217133955.946426-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241217133955.946426-1-quic_vikramsa@quicinc.com>
References: <20241217133955.946426-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: vjPanlz9WBapzRiieSBXBVhWx4RqZGSP
X-Proofpoint-ORIG-GUID: vjPanlz9WBapzRiieSBXBVhWx4RqZGSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=923 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170109

This patch change clock names to make it consistent with
existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
This also adds gcc_axi_sf and remove gcc_camera_ahb.

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


