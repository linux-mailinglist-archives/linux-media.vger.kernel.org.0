Return-Path: <linux-media+bounces-41576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92503B40110
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D71232C1F3C
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3A22D3ECB;
	Tue,  2 Sep 2025 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjiAF4Hz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4682D0625
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817125; cv=none; b=a279HABZS8+Xi71+FdDfeE9AMCEzsY7uhAKtjwzofQ3yj9cHepiIO2KpmWAL7P9jCHCy/RpkkwlKx2yOia9GkKVthLFqlG/mI2b5Ag87df3j+TGsO+4nHy/BwGn4VF+TFq1LWqEN+RDZBlsBjKcLcu2Cvgb/M4JqBmlG8BNoLuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817125; c=relaxed/simple;
	bh=sbjyRnxTLBt2ugASXwvg+gxrL1cNeK5WCtqhGVwFYjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac9T8SwCNYXdzKdIIgof5IROGDv0dPmqi/Va2mArvitm4zEkkcfWI8CBZ87sca9NtdWjgL5MNlGvCLJskvmMWL0e2YmQfijFPiL2+znIpLU2hmhQT3EubOQXux5NDuGyjHAGi3UMSTldmECqTy9IzFrusAAYhZNgyE25EdzjG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OjiAF4Hz; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b041b155a6dso26139166b.0
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817120; x=1757421920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+9TiZTM1RZR2Wj46fze89iF02ABnVNqr4NQNbD13/I=;
        b=OjiAF4Hzg1Gk9loKCmU26GsFoqTNvQpQzkyiAcFp/lm9B1flb0MN2/VRKlSILiJ3UC
         PmDFwiuaID2PAnY0p/oqVhpax/hUrUH+asilVDRdAXVOpo1+zdQlXIEWgksUobIQQFd/
         CzoLIr1tH5Su+pGuKx4NTNEplk7Coi11KoT2u4UMX5k2H9B3vQKCuxgmUe+aFNPSG5E+
         55zpQGNAOgQ7Bhj+CK+PjTZ2u1Z1siAyJhirj02cYAHDTHy9gBSp6kc4rX2XSmerUgUj
         6zAeV8U9aalQNBLR1GBdfY9H6KgZf1R6bbRyH/jGURoKWobN+YqGd+7gVdcX6a7EfxkE
         OA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817120; x=1757421920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+9TiZTM1RZR2Wj46fze89iF02ABnVNqr4NQNbD13/I=;
        b=vKa45eX7fIrUkJfrueztKwk0rOJdmlHm09JDkAuuoRsnJwquZ4nHgtcLa8+XgJ+bVe
         icHUJ9HkSwweBiYTrRWJuybD3YvWKk3M35+kjaakUCMpdAg0O8ZJZ9GikZao5j2rg3LB
         +fSu40tlDMh2uMREI8reJ7FMVxY4duvPmohMwVfeSGuu/8bH4WkE/ggbi+mvVYqJi2wo
         KHrNiQv/wbnw2rGF2yNSVLbZROvS35Xnwa9WnQnxkJLZwgySZ9GwoH5n0p4A+F8p1lmM
         UNwmz2SxCy+iSGr4SCJi+6JcE/gB85IZ12VzFTxOtuhlu09dyzXQomb8BUp4U3U2r4VM
         9rhg==
X-Forwarded-Encrypted: i=1; AJvYcCV/bQ9iVdyPD0367QclG3s378i8WWN4otmM+nTN8RT6qlHwZ/5bCHg2YGp/P7TAn7CB2njymgftX/+1fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6te06qPyA9DIeXvCLHKqhIrfWX11yI4WeLKj9paKYxLRm3GXN
	xQQHT4iOUyk0LeiVbaIpB5Qp3cxUyBTzBObvd3H4U+eABKc2jYmhuYcFX3jKb8fRNrI=
X-Gm-Gg: ASbGnctOks/1PFNEURp41d2I8avi7L3pVulFMIRPtiZLwngxtKe4jG9PkeNFOY17S7l
	ELtu13e2lhdZtXA5yYxO4DR50nr6P6+a676h53RKNyXh+YV41/AtuKAEgxM15q/xxboicHoHCdX
	t+4ANcLZjH/CEhc/Dp6gKXNmGMguUbWuKQ3LmThxekzJ1+/t1/vQLFDOp16jkmMlwJ184h+fQHv
	qO2nJKHXaNXcHOv4wygCvlTTw9YHEuJQZBIQJVhUCT8Gfq1sW6gklNnDMrcaSvpRdL+RGFePTna
	3FFa7S3wYzDHgq7wqO7pDp2gPrQtOmLzTHiyxAYv+NfQAfK/fMNM17i/6TlIpcEGqtt9s5o0LTg
	UV5ZRmf4zxi5T3EOtvx9ByQG8uUdElwwk3DDwIXSeDXN7LFwIFQ==
X-Google-Smtp-Source: AGHT+IFSz//rZE+/Nu573m7a/hh0V9stQds6GQBqIi6S/sgqWW8yivrgTSM5p/+4ua1ud0OHF5CCQg==
X-Received: by 2002:a17:906:1b13:b0:b04:35c3:40a0 with SMTP id a640c23a62f3a-b0435c3424fmr280742266b.7.1756817120319;
        Tue, 02 Sep 2025 05:45:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0428f88a61sm515784866b.70.2025.09.02.05.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:45:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 02 Sep 2025 14:45:10 +0200
Subject: [PATCH v3 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-sm8750-iris-v3-1-564488b412d2@linaro.org>
References: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
In-Reply-To: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6580;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sbjyRnxTLBt2ugASXwvg+gxrL1cNeK5WCtqhGVwFYjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotuba/wINgZXIpk7P/hVyDyQ44P1tOKN2GfanG
 /XCgdVggYaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLbm2gAKCRDBN2bmhouD
 12pFD/4tDByOxPAcUP6Zam1w7QloYbA+rPCS4yaqJymL8EKxpupE7DXgdtQ/yME9K91KgUOaTpK
 y0Ie9GlvsktI8rj9fbK9Yc/GBk2GRRlmAYJqYlWcS05tBwA8IDCO4O21a+Treyq7zpVL+TW8niq
 xOPEXGw7qY2ZTMO1TmuOjNBIxAhBrVn8KGH4CsnNA2DgEWzV0pjiBr/T8Epa8yCKPaMKMR13Cd7
 sgfCIWBeBJC/uLGKURSlsAyoVvhx7+nNV9lCltMt6sMUJlJvIVoA638dkUfAdCJYm4iNE2mEVgM
 WEsabuqUEddEQYWNy4LJFCzLhGRkYeuhTcxGP6Z+LWO+LfB24WFDOi5zQu/DBUa+wVsL/odZrNp
 UN23/hLhNcZCPsnKCZjAMJgh+ViENrkVQIdhCX+rzNspsfa9wrtEx6X4Gm/SJMOoS8XVcZP/zGO
 ngWNXiDulkf672cdrQc3Ybsox3hzLNqYh8DDVT04yoYJRrv5fymOPY4P9nttW3sTm4BaQSRo6fQ
 M0BSnd0zXkdE7GM6l+e03MRzg/gXRObHFekhaX0U1gCUUSndxQWhExrux6/6LZHB+qgNw6WQzjV
 mGDUszsAIL4E9Y1mqYF22emsm0LC7lI+FI1RxorZhfj4QHu1bk0+cU4dPscmaEonal7jSh3wO1Z
 mX05UGpiPZ15OiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add binding for Qualcom SM8750 Iris video codec, which comes with
significantly different powering up sequence than previous SM8650, thus
different clocks and resets.  For consistency keep existing clock and
clock-names naming, so the list shares common part.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,sm8750-iris.yaml           | 201 +++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1d9e8479a4b04eaf571cfd022725dc0b397e4947
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8750 SoC Iris video encoder and decoder
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  The Iris video processing unit on Qualcomm SM8750 SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8750-iris
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: iface          # AXI0
+      - const: core
+      - const: vcodec0_core
+      - const: iface1         # AXI1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+
+  dma-coherent: true
+
+  firmware-name:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  iommus:
+    maxItems: 2
+
+  memory-region:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domain-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,sm8750-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc GCC_VIDEO_AXI1_CLK>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun";
+
+        dma-coherent;
+        iommus = <&apps_smmu 0x1940 0>,
+                 <&apps_smmu 0x1947 0>;
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        memory-region = <&video_mem>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-570000000 {
+                opp-hz = /bits/ 64 <570000000>;
+                required-opps = <&rpmhpd_opp_nom_l1>,
+                                <&rpmhpd_opp_nom_l1>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };

-- 
2.48.1


