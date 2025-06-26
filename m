Return-Path: <linux-media+bounces-36009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D3AE9FA8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E344E0355
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0AF2E8895;
	Thu, 26 Jun 2025 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSMfIxc8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795432E7637
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946382; cv=none; b=fs97GVwqfUCQpbtFjdGzDmNua310uNAOt3hq2znq1zlbs/9skXs9v7ueyJekeE/jaxI7Ycz9GIYU8r3CydsYsKNkzJ3ZJvgA39p9oTqoauzAu/2W5xNech5qf8Caa0SWBTjMQadA+7AuAJeIWsyPBqREGTj+7VHn8rUzlSkjrNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946382; c=relaxed/simple;
	bh=3llpCeYPwVEU1Ua4dK/n1ltSBvl3qua0O7k/UjK9Xkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GamxOJlNW6a8dzcBZuDKhJZHYPZKOjrHuka0k9TzBe9E/UbKWveGLSL8CTpgE8vho4mS3oKzxC1btwBtEmi4jy9JPDzeYnnzjsHRkwHbfGhosEzOKRHG3VDtbWN1IpDgPeqnhX4vz89QS++Zoj4NX09YaQVDrLZOCY8kHYr4WI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSMfIxc8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9mGi0013320
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w5ukSaT42Hf
	S9Tp9K7F/V858WfIpO/bmJmKWflR8t2k=; b=hSMfIxc8vlzAtk8XUank+7JpwsF
	iY+BhNiM2ppLzKTKqY7EKCft6WXbvmLrf+w8z9Y/KMaK08B1pRWuBAcPLy6L+VLe
	dSgVWFVdZCZfuZGeshDk5DuUZvxEMd3uEcZtxYANH4R/P/aBMFc9DPQ6vYkV6MSj
	Z4XFyoH4my1uXTk2l7gBRuduYGesXe0oLaASyuLBjcFmB7+N4GFvlF69lHFeoizf
	xMUDJ99FfLY2mLLUOr4HJF0PoqUdQKAtdnZ2Qq9tCcK3KaEkiZ7Z57lCxuk3+hAB
	Uy5+rA/plvDxMF3zUdgOAXO0eeEftdODMthZiDTCqTBNvx78wTpt4Qx4eog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgkgvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d38fe2eff2so156512285a.2
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 06:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946378; x=1751551178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5ukSaT42HfS9Tp9K7F/V858WfIpO/bmJmKWflR8t2k=;
        b=S2/LwuAVbiHKjftypV9WxG6LN0cSzXNuCIPzv/NzXs8gKVHn9/RMjL/byryznRCD9a
         JFvF5uUOCZ4P8sT/oyzvFDj/Ge9pY/yZf/A3qwIGDXVcmQZPrgCMX7FYHkthkaD7C2Mg
         +EmTVaUo+UIuqLPuybLuo+T3DVOEFd/TgXGtHJdLpQIXgIgTtYCPPRaPKeJZ44YCV83Z
         V8OZXOGV0YGhSDjtrITGIdQRvt4A4pl7Es7Qiq2BcRwkp98z+cnq+tkk8MZe4Ap7PhRB
         ZsdxoLZq+1OdT4OhVJsxh4Ml/TTnW/nqzPbO6NDpTXh2aMuSOjRDAXeiFXemQB39CG2f
         57RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAHK4VqlMqlsllR5ACDiga8mjeieJMewk+rGgFd6KWhu7fLWBTDUlV392Un0HgrVckfkELG9Nm5BVVzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQxXzu3ylr5froy98xLm2rZYO8Z0F3veCO/IYfnkNen3rKUCR
	eWAq2+YweNvp8+5hfLYmxTarj/Z4mQOEblZ4RxR5DxOfU0NVoWC4Z3SyBZWQemUuCR3BstHQ2wt
	AlgeyrjVD7ogBoP8N8ne9JYpBzT4GsxyfVP+OgoLlEm+60UEYygwHZL5JmFopDRYIBw==
X-Gm-Gg: ASbGnctRc7XplgTtRAZAKLjnxo+ik0EOnS89tEz3kV8GUSbwlSpxZiDFuc1nMzUrcW8
	4CHYp9l189yrpYnAo2IaXpev8PW+jB3LAF2orZm0lL1MKa35jXc073/ZhSL1BbCVZiiAPOboCvr
	1UrQwGC6xu5slLDE763qmwyq2aHiqGh9VjqdcOVmnvwRxCbrxHFtVkUl3kDloYfZrs0bH/sNogU
	men5b21rhJXcXyne3OKa3mxtRa6FBdP8GzY2ZBuxqqSNjxrJFzxq6J0bIFldzFiX8rO9zU3ySVH
	QgVUrxJ5I4JPYsKgDvAJavg/W2eQVHIG8DBwd6uT1pKW7jF3U6fgTg7ggJsXIU7y5RlcC4w7XZm
	i
X-Received: by 2002:a05:620a:430c:b0:7ce:c47e:7877 with SMTP id af79cd13be357-7d42973f693mr819026785a.39.1750946378185;
        Thu, 26 Jun 2025 06:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQVjfLIW4yZd8IXs/lRogGtYBSNMwPGRxW0UqFNcWPzl2N+Q5ZCuRIYwpWPGBtAxJOqYBulg==
X-Received: by 2002:a05:620a:430c:b0:7ce:c47e:7877 with SMTP id af79cd13be357-7d42973f693mr819020985a.39.1750946377582;
        Thu, 26 Jun 2025 06:59:37 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:37 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Date: Thu, 26 Jun 2025 15:59:27 +0200
Message-Id: <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gdmSffEUh7YsW4cCcvIybjUe_R_qm-om
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfX3/cZCtQXm7lZ
 TveahYA5CfddED/M0pNZ1TYCqSmtUSbfUGesN1u3K/1ade84DhmSd+aC3v3Nt6begfc4BloQdGZ
 8OhEK8nihY88DdcaX6vCxqPppYgZUQafNWXJiUPKPWOZOwljDjMTRf0kR65RBsn5/q9Zo0TK8Wl
 zsgpPEzv0+VoZGgUzx6YaD9BKESRKF+vEkzOYBAluy7rOTb2rgDDfGT6D8i2r8A0Lvo0+3g1BJ3
 9eYrI9aJvGW1Zq/OAes4ujkumjUwcl0Mldr3tGNZ0IYGwSK2x7l5kzSUktooIE5xqufo73pr3OF
 2QxCeCvwi191RLgUme17vdpChXrr8+YbkYosM+hmlGswZqQduU58I7DLVii+JusqNt3yalEAxLm
 xS4CKznZ8H2qQ552T31uWR0KICN9UkfpzshsNtX+nvcaSx0SFzcwQPYXzNzZYSMy5HHQ24CB
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d524b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=1mX_ai67dwKzVtmm1w4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gdmSffEUh7YsW4cCcvIybjUe_R_qm-om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..a9f89b545334
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,127 @@
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
+        reg = <0x5a00000 0xf0000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core",
+                       "iface",
+                       "bus",
+                       "throttle",
+                       "vcodec0_core",
+                       "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xE0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+        interconnect-names = "video-mem",
+                             "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
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


