Return-Path: <linux-media+bounces-43238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B433BA2D09
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 09:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02B4C17120A
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 07:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1CC28AAF9;
	Fri, 26 Sep 2025 07:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwVXIY+E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B9E289E0F
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872076; cv=none; b=Sc95Jmw75Opu8Neo2oNZtl3tKNMwAOwrq/hJEpAYEC7GXDyzo85buhCBcOXTHSYCB433DluBCxppA2Eh8myiM+OmHC0GtlUPGAErS58GgIAsCNRnB73JL82UjmAgCKaQnlMWA/+ukNrqAXmmKRoePyZHXTV0f9J+Pwo3rxB4R0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872076; c=relaxed/simple;
	bh=vgrsRGF2X72LzCSWHnhcbeAYtX4kO2jUD2JtNTJYzxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W2Wh0NDvNkAPRYCn+umn5J3U9+m9WQzpDuy69sBsbdaAX3l17J/AzWVg3wePIb3PB9214Qu1R8kDuCrxdDAPnhly82Of4FX2xklFsmQNJVLUUxQiWwFYHNC4hLYOq8K89P3wpVEhR47pjxQK9z0JQ18LfmUONXVIbCu3iLJs3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwVXIY+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6sYrU011327
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+mmgz37Uv+A
	eRgPO+mReb10DH0VT6NyGPQbQD7907lA=; b=bwVXIY+EMAZEdAdHZK1ibzrKwCz
	wJyoUtKOEEsQ+Nr2lfSX2m6uRcfdho8hO2KHPOm6O4fBDZopf3qBGKSqHvhQE1pY
	nrNtXUxbxeHscR4y4vFEPdg1Q84LbqtA+i8pv42wq+p1k0t/eAEi/IEqjUIaXmKZ
	KT4jSW8LrHMYxglg3SyEfSLi73iCJF/9O7uK1boNdBJLMCsWA+aCsclB57IHTi2k
	hR7BuyLcatfOYXYvtdCapl72USG5epdDFivcQK+XlTl7u5R9lY5jiT/kK2jYiEn3
	LempB58ab92YsRSEF9ofIWnL9prFULtaqXpzfffVGIWRhlXB+VaFWpdikZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q1x8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dbd8484abbso22183191cf.0
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 00:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872072; x=1759476872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mmgz37Uv+AeRgPO+mReb10DH0VT6NyGPQbQD7907lA=;
        b=IzZgunzt9mY/a5owBKr+eUcnEGQUYU3tE9I7igjwqXiMEEp8TV89avfJUcMZtmWma/
         AesHCPM1lSZ+BAOYcay8qeWeISfomx+V+dNvycTA/PeuvwkR0brSHTrUBOAxoRlPDqDi
         TpL0wrE5QJa4JBlxekQnGkbrs/xahntd85GuYx8ReOXzTdoJc2OnuQwo79a0NiFQOWQ1
         qcXNmnmHLC11y6DX/Csbf/UxJ5I1Tc35v+ft+LacHxLlvviDSN6UY+1bK0TNkRSzcuYn
         k6B8R27Qgerrfw3LhWyC2X0MfqS4Klr8oJTOP/lxWX+H2g0eb3DWPCfRcyrdrSAjPIri
         N0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbTp2rQ87h6upiEtmcnSFTN/SjJ+tNlxle7VQHdvD2Ykia0/UjjToqCA/IhjDzWF4YWNer/VDzz9JU4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbInT7xGrlIKWi+6xBMKJwsZjSk3eA57o/N0k4L4J4NmIS95TW
	Gd/vFHSxuA5zgbLwd0guh0p6zndsDf6uO02yT19zsmdC7ku+2jPrzR0AZBSmgHA7bVJ8+fyNbRH
	SMuhCDozyrL9j6f3oIPD70oBPHlb1mFhtMdo6imVgxS9k6mXdpKDzH9N+amwTYzYnrg==
X-Gm-Gg: ASbGnctQiLolx4ZEw+UdvW6WMZDa2GjgRzjnFPEIjlAxtdVSxYRA4hquKsbr+Gm3OgS
	JFEk7dZNJ2lJ7/C1GBtsl1ffd64Ifjz5oXScZpVLMRG6kFpEuUr2XxyVXjRty7bjOaRanNxpqm4
	3JwiB0uFhx65iM5hdI6G9Q6vI24rDUfx3LFN9eOfJhP5ASdtILJfZpiLu52xcLS3476XXUidx38
	NRuhMm4CRWVyNNZmt81LVF6/lsKgVXYJpIHKK6ksGAnwOw0Kka4MhMcQnEgaXTnLAPRbTM7IXKN
	eWZmIUn/COVQverQ7/YleZEWJBCxpWW4Oy2xFtWZKxuA2ectqYY1FaAZ5m4om46aC58SLE0Dssv
	Swi88YVgKS5sRm0Wz1PMTwEhCcFfO
X-Received: by 2002:a05:622a:5e0b:b0:4db:29eb:901a with SMTP id d75a77b69052e-4db29eb9503mr44240491cf.35.1758872072450;
        Fri, 26 Sep 2025 00:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGshBzJtM6YOzHmRdy3HJRWysdkNo2IWZgWC6jZEQ/Za7M7pO+C0xrfpw7CSBrVs87Z2qJsaw==
X-Received: by 2002:a05:622a:5e0b:b0:4db:29eb:901a with SMTP id d75a77b69052e-4db29eb9503mr44240251cf.35.1758872071852;
        Fri, 26 Sep 2025 00:34:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a54sm320481666b.86.2025.09.26.00.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:34:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine
Date: Fri, 26 Sep 2025 09:34:21 +0200
Message-Id: <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f29sRUVcqKEqZFtZxWXuSWuUF-uixGiB
X-Proofpoint-GUID: f29sRUVcqKEqZFtZxWXuSWuUF-uixGiB
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d64209 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=adKDawEoGyzw0LH5ae4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX0/MlyIIuSTtX
 FVI7kvwlIPBkOWRLFRUGfm0qfrEJDYp65G6GT37V1wI3tL54bZtvxtScCq8sMUhykOj9C666q2w
 +jwnrKVrdlbfzGdqkHSWXW2L/x3wNr9jwJCBjgC39KWrJzM0fxGzRpZb1BSHwWw71f8yKHqWybF
 YC0LTTtHCJo70kkKxDwjq66wjI9Wd0SB5UXphGcbp5rGcKSe+TRygutPooC1d+Swa2bWAfU6cOJ
 rH1ho2kfMkxdypDuoTCqtiyLfh5zFN1imMj6wr0A+X/VyOMtYNZW2ZORZ1VumvX8fZlHc3rX+of
 555N2+atxde/zlx9GxrfMdafSPT75XroFGljwi7InBurzH/PlGuektItiwFQQdaHif+dOfqAtYK
 3//XiINSVbnxM4JIba2aUf4vYhSQ7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

This initial version includes support for OV9282 camera sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 76 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d7f22476d510..bee021efc249 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -138,6 +138,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
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
index 000000000000..3b6261131b75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
@@ -0,0 +1,76 @@
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
+&tlmm {
+	cam0a_default: cam0a-default-state {
+		pins = "gpio28";
+		function = "cam_mclk";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
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
+		/* Note: Reset is active-low but ov9282 driver logic is inverted... */
+		reset-gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&cam0a_default>;
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


