Return-Path: <linux-media+bounces-35575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E4AE376B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 09:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5571894454
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 07:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF21376;
	Mon, 23 Jun 2025 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uwzvan2r"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D053A201270
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664998; cv=none; b=fgTmFGvZ9/9am/QNALHqakLzZ1SLWIiT1A1Cf58OLjRvULUOtLHA10zTeo84oyIBkdTBfWH7ULefpNlp62y2iD47n1LKLZMGppy7bGS2Qz1qnUEJfikMigU0odyMAnkpAkAq+y9IN27yJcbFKTK4Xd2OPONRkfsFc2dxUTeTS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664998; c=relaxed/simple;
	bh=v2+PUpyQuEpd6Qy8uGCa9JWlCfSUOoQ6R2C6kBCVvKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfDUcTiTpYP5h85pD+ai/JWke8LMpP2ZpXjqGrfiJQJy4mjBGSzNY2gJM6TBuIqBY8jmG+Otcs+jb96pOsQSG5i3u0oVjrZ9TV5YCACbH7QIoPpM0CtJis/zx6u/L/eqqALzDJ1hKsjBaYZgLSAL/aG+EXOudUKCIVyL3qenHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uwzvan2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0P2Ye014580
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/IEG3Lw7qKW
	3BELpNeKdPEcAL7+R57y3cNniHNfPDSA=; b=Uwzvan2rmcOkWANaCOsJcAe7WUH
	vpolFjMg5ZOVt6TBIpC9H1WwSOQF8oGCE6F/+WgGJbvPygEgIILK2daFamh+KzxA
	ZAmmLzdBuZ4oe4k3xwtqHKpL8S02u4wdn9lbJthLf0WVLfJvn4z0Z24E38T5Kegq
	NDb578cFQ3kRcRu3Xn6K9wFlNtzGr7UDkK7cEq2B7jqHWaGJcul4XmPIcYhir7gb
	LrJWXqq4SHHa419PURk4Qbq0aZhr1D1ytUTUG2GskywlY+eAcL0KCsX//iJvf12b
	fafgXFmluxlXrESf8FaQWYkkYS2Uz2yaYlDPXKDJjalDhyv4pSoYZgaZRCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5gwx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:49:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0981315c8so299509685a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 00:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664994; x=1751269794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IEG3Lw7qKW3BELpNeKdPEcAL7+R57y3cNniHNfPDSA=;
        b=qb/RgeFxPRlfH7kqhTytBPOd2ihCVr14Q+HD/cPxRW9zEETZdQk5QUCe1+wWXqMOUA
         xGzjHzRMhNtH5VO68TowcpHmB2rohskDOAqE1A6EMDjqkzFcmQlhnX3hz0MKxVQ7P2wt
         oIYSxAEd7MiPP0xSJkAH1rWNrOHl99NDyuQ7XhAbLqN5kY3j+vCTYdJ5+jqFTtYfSX3l
         c/mBl2PLO2N6rSPI1ereGfgG+pLdzyV7SNOU3l2BxdvsSa2pwk1vzyxtsERu529KfSHN
         a1pqZNWXTPpcV3Obf9jmRSJMZt1eXajtFrNBpL4AWgdKuKy2Ha5A0sZqvvaFNzxm910u
         OY1g==
X-Forwarded-Encrypted: i=1; AJvYcCU2BDxrKBTPhsDtmLC5GXlimtcCj1lk4e1Vz1ELSSNA5ph9DXg2uWOzkOC34TqM9GW3sEM4b9HwrmwE+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgcID8E9X9VEBcLKZrtly9VtyjTqb+yUycvDtM8lZNJPgVOpg
	05m4rymovq0tyt3BLicJaSHU0XXoy64ejPCIgyHJ80rmTaa6g8UJcys96g5rE28McjW3aJ8XH8P
	wul6/dEaS5wv98B/51/dYr+mB7HOst8ge8orxD8jwGJeD+uf4cb80VSKT+A3eLODWyQ==
X-Gm-Gg: ASbGncv9lKGnuw5ob49An5GrwksOPoOUgNVRvaEhqn3kNd6LuvDoSdZ4ppeCseHB7Mv
	zxPjzHuBZqLw7V2Mg0J15f4aNkaRXI6DTm46krPG9UCxcqQi5eaTMsPTuRx+31fxyq0rzTFJyq/
	V/jeGeuis3DFRrV5JJsCIPXkuuMFq8cGm/j3ZHqtwx+1pONbfcJJ22/5pwtlOtQ21Fr96/v/wNc
	aswaZNHCo57zT1Et+YLJmE6CFWoy/elSMiVZ74qoRyaZEjONCJGSRyp9yIIR23ksaHhOzg0sL3t
	Sg8PVEBUpkfSzM+oGEQis7sxp/YAt3q83EzZbC1KdsCVTi7cCFN9v2kbEk8VrxaqfCIzIk8daJQ
	o
X-Received: by 2002:a05:620a:470b:b0:7d3:8fd2:c0cd with SMTP id af79cd13be357-7d3f99469acmr1779647385a.56.1750664993997;
        Mon, 23 Jun 2025 00:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY4gsMYAPVe+IThSQyLPbP0O2YiBUFQ1tUyFy77BiLqNi6c7jvjbSIb56TYV2W/OPEXPL5bQ==
X-Received: by 2002:a05:620a:470b:b0:7d3:8fd2:c0cd with SMTP id af79cd13be357-7d3f99469acmr1779645085a.56.1750664993561;
        Mon, 23 Jun 2025 00:49:53 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17ac7sm8755313f8f.23.2025.06.23.00.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:49:53 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Date: Mon, 23 Jun 2025 09:49:36 +0200
Message-Id: <20250623074940.3445115-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J7IWZGncyKTAOOU_yc-U_iDXGIoWlkua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfXym6TQHlG2tuS
 EwDf+g1TYkmPSlqQ82sMI1Yq32Zx+HhcFE942+wiW9iphbaDx0QWjkxrA5hw1iSh9XJQkxKg9+R
 TpNaFqV76AWELjuFQMZq0R/pcfIRprvgm7fOxD+A8A0PH+3ZO70bynk1HkXfdrpF/FC9xqTRy3l
 75dh9AJ7+9tRM80d8iP+plaEpQLg7bff8fv9BeLm7/ChvxgOfVNP42pyaZzohrf/Ch14QcTDRws
 ZMHgTgqNniF8q8UolT/v54EdETEQOQXAi82WO6LNsHpjBZ3iTCh1xbLYJ1GAKk6tmScqTiJJQL8
 Uo5jNXr1RAeb2yxkDBR0uhAWezzozVYQSfCwcseHOFkmqwjWtbcjQY2GLzpvpnNj0H0FKebq8bs
 UJLsglPEwWe1N9JT9wMhbQausdcIIdV41buXTmO/2mdHs/aKyw8n3/h+YGlTkSbTRZoOGIde
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68590723 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UBg8vxrJu69tSQrAULkA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J7IWZGncyKTAOOU_yc-U_iDXGIoWlkua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230045

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..1b94a95ce514
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Vikash Garodia <quic_vgarodia@quicinc.com>
+
+description:
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: throttle
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    minItems: 1
+    maxItems: 5
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xff000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus", "vcodec0", "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core", "iface", "bus", "throttle",
+                      "vcodec0_core", "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xE0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+                        <&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+        interconnect-names = "video-mem", "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+            opp-133000000 {
+                opp-hz = /bits/ 64 <133000000>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+    };
-- 
2.34.1


