Return-Path: <linux-media+bounces-47091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE974C5D66E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46F8D4E4532
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8B332573C;
	Fri, 14 Nov 2025 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRbJSyjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0paXisG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27A731A81B
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127519; cv=none; b=cLJ7oWA79Ul6AlDBHZ/GGi5taGT7cA5Rk5jEp+hJ/P/lScnmdKCYMv4ib/oi+Ic6tnXvA6Q7035hg/tI09k2/vatLbRygjm0QBCTD66tfhYG9pQZJd0Z2NToweOnra4xB45Dzk16Q81Pd4JckBgKA1d+emOc7IPWmZlmhH00bmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127519; c=relaxed/simple;
	bh=9QruR1Mx5NdAeRhMoNEA8sd5876dKGByzxHRlJ8dKyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d8amJ1SKYBv174wtOVo8Cp+hQBLQsA/fYaQQkd9YDnS0FPs6bftU0ZoX+vK+koCFoDoPRHQjZrDRF98wJl3wer5H+xcvnUcVGVqJHVqasUUAYFIK3SxMuz/c6DU5JUCv3VOQ5LKLp9RRjnfmjoZvRV7F6Yb6X9j5IqPpx0DnnkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRbJSyjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0paXisG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8QZsp1491315
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KdnkIr5WkQ6
	QKcdZ8Gs3mw6XKqZ93l2WDjWmuqF3gx4=; b=DRbJSyjVBX9KkCQMr/D5xwi/l6Q
	kXw4tqqQwdSVQJhkNyAchyEjBQFP6qpiJf85KNz22u7D5tPPvgvZKELYCqOK0DYW
	gkdmRY0oF3OzXEx5KqtvSbl2wTt1uEdoZ9XpwVKj8HYxBJU9friG8Z09L7E71/4b
	GARQdW9gv3dNItBl3307/1yTUIF+lfJIgHY11B5YP60gQMqqxE4dJhB9Ed7x5hE1
	6K4+yu4qF3H+1DjEDGOoaa3EVZyJlo6YANkJOdgQ8HfOp8ZyDcEWcJLd4FPWQdDO
	F9suiblYjKmRO2uz1XlDiB6GZa0ORxnc4HvJEdg3vX44a62X1/udIEJyvBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hta8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so94475071cf.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 05:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763127516; x=1763732316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdnkIr5WkQ6QKcdZ8Gs3mw6XKqZ93l2WDjWmuqF3gx4=;
        b=h0paXisG/Pz0lIJIAO3gxXT9ql/+gewtcVkQAF2FMPqcFtM0qbhpg6CJY0rh8kT+6X
         noiyIvR+G8SLfL5FejI77kDx9i7RxznW5zjGXLUTwKykqi3MD2IQa2QgivDtsW7pMpO2
         8h8p4VwP0gzIQW1Ap355KWXxpD0IT26UWW3SCzTIuJ6hKyzl022fZpW16W0Rh7/Zl/iH
         Z1CUGXn1iVOIUzl/osg4QwvOotC5XtUk4WaHC42PFLtQkvvct1P7+F7ZGyh5Yk8mMZY7
         6yXyn4SY8DRMXY6ON9Nxc5ymLnttRXG4ORato+chvMy9F4tB94dPtrSBZn67rSU5ZMXq
         7PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127516; x=1763732316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KdnkIr5WkQ6QKcdZ8Gs3mw6XKqZ93l2WDjWmuqF3gx4=;
        b=L5rX0h8Sd5RwgcGx1dnMUayDo5D+XS5/FWSbGSHU9tcEmh6hs3Vpp/Kals6DHzgQUF
         PgEsxTKON8od51vDOsrADvYyqWyN58PegNTn8OFqE2ONEzS4NqwAOqN2gnwGfLHtkqOt
         CnQvGUjEunO3v5dUITaDHeru/tqSrvFEADCXUNtcRg9GZSWC+W3FXOlpcMTCpYZYuO7r
         uVcISLGbt7927Xao1r4lAiX6Z3O5yfADxeL80VSANT0LoBdrR7MCNyFjBCKK2C5cCrLy
         2S0OZbD901vPRa/EGf4lZnEXMxmRs1RxfxJBfslb63H5V6h7PDDhZYSUyLAI05l0kuzG
         2MdA==
X-Forwarded-Encrypted: i=1; AJvYcCXFTe7b/I02vfdAyVOAco0f5r/2v1e/I4VZuQwF5VSbjO+tKZ6SvRNAYyNE4q4EKOGIhUpb+IYYNAd/sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzzbxtIrxsB5HZAP+XUW0rdC6rEvxXHiyoTglhqWNJ6mUBz6PM
	a/VyfiOH3i+dg/sx1BTY/oKbmyskPSVB16LuPr+uB3aZeI7WwyGBc2t7VXuHNPw70JvTPnpCFu5
	Kv+U+XO/Edxlo2Tdzo+ZXqVuxUUAIHV7+2E3qOyn9PwyohypjwIg4csoDdvatGMY5wQ==
X-Gm-Gg: ASbGncuz75lt61fRMXgbP5TAQNbHMeO72mwqM5AbJMipndbEUTbVis6nJTvgY0Vy72l
	u5j+yQbblqOfQzwrKiWQWa/ZVct8f18hcxJhPd+kf59+4U6WToTJchurzyATxr1x7YB5lHhPM48
	+BFEUKCg221q6iss52Nof2/N1ge4GyGSl/6CoAy39PwFcQHMtFIgzmoJ0sgFTs25SZ9OEJgUJpc
	cszYBGcVua6rQo8xkqZr7PWDannWsobTjEiax8ROEugcSgdTeRWFXpOPiB7nnSkmmQpulpKBFCt
	IBlmAnH2liHorFdfKSdHj3CdbJuTvo36/Uwsk1CuPog4vdVUKQHQljq3oZWBpusMMxYaq8ndfSC
	1g9Zp6eiIAmY++ReQNO2KVodYmN/4Ff5JQNZDKWDGvs3kdz7mizRDFicaTJ9LfTPtPA==
X-Received: by 2002:a05:622a:40d:b0:4ed:b7ad:6fd with SMTP id d75a77b69052e-4edf20f1efamr44182111cf.49.1763127516110;
        Fri, 14 Nov 2025 05:38:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7nuiryy5wLOzPoLCrBpQvxcS9nqor/7BWrjvbQcsaJkDel++CoGoooU8knJVTPssRHoL1hg==
X-Received: by 2002:a05:622a:40d:b0:4ed:b7ad:6fd with SMTP id d75a77b69052e-4edf20f1efamr44181311cf.49.1763127515256;
        Fri, 14 Nov 2025 05:38:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:34 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v3 4/4] arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine
Date: Fri, 14 Nov 2025 14:38:22 +0100
Message-Id: <20251114133822.434171-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BTbg4owngCIrJUaxRHUEHNFjnhUAF3qL
X-Proofpoint-ORIG-GUID: BTbg4owngCIrJUaxRHUEHNFjnhUAF3qL
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=691730dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=7LMiiagzcmBKsUgaGM8A:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEwOSBTYWx0ZWRfX/ctxGVgeHbph
 9W1R355aQ8H/dvPLVyopqv5PPAmytyGAKcet+kEje2A7DpXHM1dr5I+e2q+oSDlEvAO1VwkC79+
 kXN4T0ipd2jrN6V/uygrIWwfvBP7yTyd0ZV10O0y0H9hG5Qlb7DbTklIN2jylbVDJ768BQF/5tA
 vkL2f1PXPDaEz8T1mcm1UzFWmiRJJ+uz6w1yPASgXqPS+A36SrVcrtqODOBFzRlTz0xDHo0WV0Z
 cncJ+pC4iQOamgj3Qg074lvxxtM7bLM7dlCC4oCKIbYuQ8SuJjc64IWcCUqnG8HeeOTVKUNkVhQ
 ZVT9rM6W3WWtlacVdeLaYOmcAdxBgmP+V+HB07EVO3IHEjLqWJO/cY+Yo26iiDWVUXVea3d1yyT
 6T/Row0VDea9ssk5HKnmZw2qHjiDaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140109

This initial version includes support for OV9282 camera sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 65 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..af029d04758e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -144,6 +144,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
+
+qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
new file mode 100644
index 000000000000..6f3d8de950ad
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&pm8008 {
+	status = "okay";
+};
+
+&camss {
+	status = "okay";
+
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov9282_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
+	camera@60 {
+		compatible = "ovti,ov9282";
+		reg = <0x60>;
+
+		reset-gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&mclk3_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_l3p>;
+		dvdd-supply = <&vreg_l1p>;
+		dovdd-supply = <&vreg_l7p>;
+
+		port {
+			ov9282_ep: endpoint {
+				link-frequencies = /bits/ 64 <400000000>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy0_ep>;
+                        };
+                };
+	};
+};
-- 
2.34.1


