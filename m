Return-Path: <linux-media+bounces-43113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15827B9CC8B
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 02:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB64D4A1082
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 00:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AB41DD889;
	Thu, 25 Sep 2025 00:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PI3iAsk9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C812146593
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758584; cv=none; b=FhTAeM5+j/QdTJIKOKLXDp2g03dwf7pq2RAiOjVSZmPP/oNsNakWEhEAYWYVdgT1WF+ciXj2aQ/MNDrQAizQvv26fCGesSXhI7XyRUIkW0BjD07qgB5XyaNSWTtXzLkPBKFz/syKV7tSB74tM/o19fwqMUJjmXQaOGSu56zL82E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758584; c=relaxed/simple;
	bh=50llwEahbjo+88SX5ZtwHmPwE9ksTV7vO7WigaCfAps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7bviXsfj4yBXJtrDiFQwprZ3PZyKsQUDOVayCTdtFjpvXERtGn2xB9jvMJVuLjKCPchux5MWAXWBrMu/olARalTEwfDdJXwZIfrfCxtifeCfmU8zg1M7vDDT7yMiUnu2BbOYJCB2mw+sWN2jMgTzLJOtjycPkgyOOFCyT6gTKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PI3iAsk9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCgSDY027848
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cf2DCtTNXCFi7SVpYvubK20iSKGGZnGXRxYeHWt6kuc=; b=PI3iAsk9lb2KflV0
	HfHweOYM5GnDP3gXWpMa+JiunokARv8TSHqWxVBq7deg6qT1cr7kRTHz9g4t+CCo
	J2t9eDcc2KTCGLOZDO/2Fr4NLcfxWIuTfbNhAn5NIm/rf4b5pIgTDjBbeUAljOrm
	WhqiTnn9Y/WHpz8h1yj6SwK/nWtxEO+l0UYBlVBY+z6h7ftoQpp1Wdj9m7L6VbXx
	RbLDXKmPfIiIQCBdZ8ZkPP9nqbCYNg4RueTSoe9ale/FgT4+mWbqFNx2SiTxOUse
	2fN7z6AjgRl6+YC9Yi+a/pQZkHa1N4nGOdy52U+N3SuWQeOm6GzKuWh/X9k/IENq
	pqfNnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxfat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:03:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4f87c691a7so509983a12.3
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 17:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758580; x=1759363380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cf2DCtTNXCFi7SVpYvubK20iSKGGZnGXRxYeHWt6kuc=;
        b=KpxBA/br6cHXva7FJgv05Mrm0ri0uk3tb7LDVCtuPDuA8381FNH7WogNHCMTupCLPq
         oMvCbfSeEFHRoikLsEjPd8C436zA32NXlj8QUpMNpwoo65mNouZ7/kd3N9BgGe99rvjU
         ytbu4zPm8Y+tbrNj6nf+NWXQXUTP1HvuGLKjEaDnIMKwJUa8/9BieTlwEKvLPQLHjLtV
         MgAqoh0mmUg9Z09CAUIYulnQCr4AsfvnmXKCwyobLsqHZzu8LqHSIYEmwFzICf1YeAzp
         C4bJgHjrn4opDXKIMFZtLMLUf9GvGGt3Ih0J0yzzWXFG6Voa0A1vaJu9rcZPlWAtsyS1
         rR+w==
X-Forwarded-Encrypted: i=1; AJvYcCU5pfmW2EGbXhg+w1KIl07jDK/Zc9BmbAOQ/Ioqk4jWiMsgvPxI/cp/rLRIz72Lq/j8ROsBYRPbBGLVnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlEma5YNSpQUauBTpHCDb/bf5mGt2d1pisx8qPjdt6b0ap3nH
	MRb9LC++sG+kZlGvHcBM4nJ97WlUIRA3KHt9pfRBILQZRBGVATcjM647wE/7LLW7GFUgNRs+gZR
	MiOgl1bLiZXJBjqj8hG5ds8a3EOCXRY7zmB9P/v+qBXxLiJCpkiEfJMtazXY5i4k70w==
X-Gm-Gg: ASbGncuQTuCzc43Z33bT/UNsmLLnoYfdEm7n5HlqUp8CAz62646h+Bj7lTZ1W7eyZEC
	giUC5nPI7b7lUyA+xuy17zqxvtBTQkBCKgmrev8jP8+FFGODO3rcTd8iLaIZRPhSXcIIOjuPXIb
	OoJZteYHrFT6hN/bVwDKNX28i+qboAHnccs2Jj+CYYA3A2VwK7wtw64hBZRey7njMiLhehff21o
	bT32Fd4nnw8CV3rNJ3BJGLD8+A6rRlcJsCW4cRPFsMi28rF7N7m6DUezpVLr4IIpkWyhq+p8Nca
	h+hWppJM28Utgp94krG738bkpMoxfJIXRxsZy5IH+SbQULWn7cTPh7WsujxsGKPDyzZ2ifj3OO/
	mnGMqeeR8LkFqaz8=
X-Received: by 2002:a17:903:2446:b0:272:a900:c42b with SMTP id d9443c01a7336-27ed4a5a862mr15212165ad.31.1758758579581;
        Wed, 24 Sep 2025 17:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqg9vyOFkMwmRfAlukSLXKheguukAauJbZlBb1L+Gm/YKjTkl+epS8voBRo16Vb+Qbdf/Erw==
X-Received: by 2002:a17:903:2446:b0:272:a900:c42b with SMTP id d9443c01a7336-27ed4a5a862mr15211635ad.31.1758758578966;
        Wed, 24 Sep 2025 17:02:58 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm4807215ad.52.2025.09.24.17.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:02:58 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:02:49 -0700
Subject: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758574; l=16126;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7mg5q8J6iKl5s+hgvMbN067BI4ysYe5vmyQhWh79W3Q=;
 b=2K3k9f3nkf71XxWKGRskIXz5bhHPZCnTbJRkeUz+N6fev0RUD7gwspZ9LGp5wy4aSN9FlmKQ1
 C4ExL1hiHdoCWeFYc2CV9yScBrPnF9iRr2ZX2+CbERJN9wY4wP76xSZ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d486b5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=rVt-Ozra7OWOKpRw1cMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: h6rQDkDc_suRsxNsgRBhGi9ip8eoYm3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXzM/R2aunMJfb
 fE8e4dQdnh6ZVYo/VRnfD54r9A0z+H3/YpmJ5cDB75PyU4vWhnU5hLKBzqEu1HEpZ3czH9rq6sE
 yQdNHi3EkaXI4N/QjUfWeGNC/5GR4R91zelBxuaNmTWFN78dVoQzLBWkl8l65pm4iLxtBtIU5rL
 HsPSkkWewIF/Yr7sYp1rGvsmZe6b7dQe2fJ+LqjBLSJTM/VfskX90v2nnUQGy0pn5C5oxid7Q7h
 8REIH3w4vRmRhvr/6cr7gQ7HUqVGRLejuTUIwWoxEbihciY0e8z4olA0DrYAhzeOt9dXvFoHnBp
 oNTxX4enUJPkeUdRbbrrgeSvZZ9WiY9DCIYMiQh03mo3zauZrf6xPLxCvrnESInH0PJVyQAK8CW
 853FyxK/
X-Proofpoint-GUID: h6rQDkDc_suRsxNsgRBhGi9ip8eoYm3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add bindings for qcom,kaanapali-camss in order to support the camera
subsystem for Kaanapali.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
 1 file changed, 494 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..ed0fe6774700
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,494 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    maxItems: 16
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 34
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_rt_vfe0
+      - const: camnoc_rt_vfe1
+      - const: camnoc_rt_vfe2
+      - const: camnoc_rt_vfe_lite
+      - const: cam_top_ahb
+      - const: cam_top_fast_ahb
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: gcc_hf_axi
+      - const: qdss_debug_xo
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 16
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_0_mnoc
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description:
+          TFE0 GDSC - Thin Front End, Global Distributed Switch Controller.
+      - description:
+          TFE1 GDSC - Thin Front End, Global Distributed Switch Controller.
+      - description:
+          TFE2 GDSC - Thin Front End, Global Distributed Switch Controller.
+      - description:
+          Titan GDSC - Titan ISP Block Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: tfe0
+      - const: tfe1
+      - const: tfe2
+      - const: top
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+  vdda-phy0-supply:
+    description:
+      Phandle to 0.8V regulator supply to PHY core block.
+
+  vdda-phy1-supply:
+    description:
+      Phandle to 0.8V regulator supply to PHY core block.
+
+  vdda-phy2-supply:
+    description:
+      Phandle to 0.8V regulator supply to PHY core block.
+
+  vdda-phy3-supply:
+    description:
+      Phandle to 0.8V regulator supply to PHY core block.
+
+  vdda-phy4-supply:
+    description:
+      Phandle to 0.8V regulator supply to PHY core block.
+
+  vdda-phy5-supply:
+    description:
+      Phandle to 0.8V regulator supply to PHY core block.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data on CSI0.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data on CSI1.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data on CSI2.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data on CSI3.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdda-pll-supply
+  - vdda-phy0-supply
+  - vdda-phy1-supply
+  - vdda-phy2-supply
+  - vdda-phy3-supply
+  - vdda-phy4-supply
+  - vdda-phy5-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      camss: isp@9253000 {
+        compatible = "qcom,kaanapali-camss";
+
+        reg = <0x0 0x09253000 0x0 0x5e80>,
+              <0x0 0x09263000 0x0 0x5e80>,
+              <0x0 0x09273000 0x0 0x5e80>,
+              <0x0 0x092d3000 0x0 0x3880>,
+              <0x0 0x092e7000 0x0 0x3880>,
+              <0x0 0x09523000 0x0 0x2000>,
+              <0x0 0x09525000 0x0 0x2000>,
+              <0x0 0x09527000 0x0 0x2000>,
+              <0x0 0x09529000 0x0 0x2000>,
+              <0x0 0x0952b000 0x0 0x2000>,
+              <0x0 0x0952d000 0x0 0x2000>,
+              <0x0 0x09151000 0x0 0x20000>,
+              <0x0 0x09171000 0x0 0x20000>,
+              <0x0 0x09191000 0x0 0x20000>,
+              <0x0 0x092dc000 0x0 0x1300>,
+              <0x0 0x092f0000 0x0 0x1300>;
+        reg-names = "csid0",
+                    "csid1",
+                    "csid2",
+                    "csid_lite0",
+                    "csid_lite1",
+                    "csiphy0",
+                    "csiphy1",
+                    "csiphy2",
+                    "csiphy3",
+                    "csiphy4",
+                    "csiphy5",
+                    "vfe0",
+                    "vfe1",
+                    "vfe2",
+                    "vfe_lite0",
+                    "vfe_lite1";
+
+        clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                 <&camcc CAM_CC_CSID_CLK>,
+                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                 <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY1_CLK>,
+                 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY2_CLK>,
+                 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY3_CLK>,
+                 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY4_CLK>,
+                 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY5_CLK>,
+                 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+                 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
+                 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+        clock-names = "camnoc_nrt_axi",
+                      "camnoc_rt_axi",
+                      "camnoc_rt_vfe0",
+                      "camnoc_rt_vfe1",
+                      "camnoc_rt_vfe2",
+                      "camnoc_rt_vfe_lite",
+                      "cam_top_ahb",
+                      "cam_top_fast_ahb",
+                      "csid",
+                      "csid_csiphy_rx",
+                      "csiphy0",
+                      "csiphy0_timer",
+                      "csiphy1",
+                      "csiphy1_timer",
+                      "csiphy2",
+                      "csiphy2_timer",
+                      "csiphy3",
+                      "csiphy3_timer",
+                      "csiphy4",
+                      "csiphy4_timer",
+                      "csiphy5",
+                      "csiphy5_timer",
+                      "gcc_hf_axi",
+                      "qdss_debug_xo",
+                      "vfe0",
+                      "vfe0_fast_ahb",
+                      "vfe1",
+                      "vfe1_fast_ahb",
+                      "vfe2",
+                      "vfe2_fast_ahb",
+                      "vfe_lite",
+                      "vfe_lite_ahb",
+                      "vfe_lite_cphy_rx",
+                      "vfe_lite_csid";
+
+        interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "csid0",
+                          "csid1",
+                          "csid2",
+                          "csid_lite0",
+                          "csid_lite1",
+                          "csiphy0",
+                          "csiphy1",
+                          "csiphy2",
+                          "csiphy3",
+                          "csiphy4",
+                          "csiphy5",
+                          "vfe0",
+                          "vfe1",
+                          "vfe2",
+                          "vfe_lite0",
+                          "vfe_lite1";
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "ahb",
+                 "hf_0_mnoc";
+
+        iommus = <&apps_smmu 0x1c00 0x00>;
+
+        power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                        <&camcc CAM_CC_TFE_1_GDSC>,
+                        <&camcc CAM_CC_TFE_2_GDSC>,
+                        <&camcc CAM_CC_TITAN_TOP_GDSC>;
+        power-domain-names = "tfe0",
+                             "tfe1",
+                             "tfe2",
+                             "top";
+
+        vdda-pll-supply = <&vreg_l1d_1p2>;
+        vdda-phy0-supply = <&vreg_l3i_0p8>;
+        vdda-phy1-supply = <&vreg_l3i_0p8>;
+        vdda-phy2-supply = <&vreg_l3d_0p8>;
+        vdda-phy3-supply = <&vreg_l3i_0p8>;
+        vdda-phy4-supply = <&vreg_l3d_0p8>;
+        vdda-phy5-supply = <&vreg_l3i_0p8>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            csiphy_ep0: endpoint {
+              clock-lanes = <7>;
+              data-lanes = <0 1>;
+              remote-endpoint = <&sensor_ep>;
+            };
+          };
+        };
+      };
+    };

-- 
2.25.1


