Return-Path: <linux-media+bounces-38857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D95B1A378
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 15:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BC5718A0349
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 13:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B703726CE2F;
	Mon,  4 Aug 2025 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="be678F4i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42183267B7F
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314674; cv=none; b=uFLE+996C9Kym7Ub0P5p23OE02s+un9uJdnkyJTG5e1CiVYdsj/Q8yPh2cHGIw64ea6GMBsWDAkmDslIRSLItNzcpDdIr7gKFwupJUKR02j8rKRY+ES7X9FL4AEv6nDGfvECUVrGjJehfzCk+Osjb0SWfx5JlkGYKtURCF/EGbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314674; c=relaxed/simple;
	bh=03EFWbjpjg66HUQuvdjKNzq7BijWLpJo3Z/rP3nASts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J75JHkkGR6n+mwCdqNZxGOuXxpPccT/Eq8ojlbDTRfbiHDPvnWI+Ggp9LrEPz8zvogSL0cs8NWSizb4xeE/fY5PyayFHsqLoKajMR49CWZf6X0U+bG51SQ3hArk+XGsGVnNRQUSjzfyNe/g+/JxD4JugI6FjRiFwqw23lSGsH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=be678F4i; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af968269b97so20970066b.3
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754314670; x=1754919470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vn6JCB3HTxusrlXxNaqDsM/0Lzi1CG25OTh9JwfYvGo=;
        b=be678F4imxgaJoEW9NsDgKIAO6/9yR/FqaDojqDzYhnEs1MKzLSCPTejk1j7d9WqRw
         J+z4/PQiU9gHvn8yxw2TrGnbMTjGeVJHvdP/bY6gtc1phqNmuHHCUghdK6NpQVulAjCk
         6tKm7mvGSx6z1gsL1SDoInsul3Nu8SzMfxbw1MgEoS/wglq4sSlvCOQVoH4Q5FDnr0Ek
         sx7L7nXtO92+zcri9UyuNIsumQqsYoHIT2TC9FJvJuVnghP8WcWIUE19A2B6yME7sAkn
         6srLWqq+7o05Kbqsqh0NoEzg21jF1sNKCqctS6e2zVuhjcbG1pVo739FzVH15gUQDC1p
         HNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754314670; x=1754919470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn6JCB3HTxusrlXxNaqDsM/0Lzi1CG25OTh9JwfYvGo=;
        b=dDA6UYG8SkiYtBz+7BljBkVpJ2drVFDyZsULM3S1JamatXprtfpKsMfwV93Hogl3j4
         j03Jpu9fMDcplSeZ3O/2MSgg0MUeK7eJn//rjSk8S7C4j7ywYDwj1ZCpSSB+fR52ENIU
         za+cwJcs1rlmVngrep4yk/ei4b15xHWf1+TKVPFUFPBGrukq4jXyAnxIIvxFpiSjQlt1
         OWh2bNDgb+rIkyfpPDF5Hhgqf2DepCBXBBxrVmMjRcBYwJ1HWG9k8UC3Q3EdFyAwU0Jm
         WlJnjCVch7Q2PzozDdg22q4lkqmftSbeRUrDE9zM4VgJs/wP9fNI+rGStfdm2WuVgBGm
         Zphw==
X-Forwarded-Encrypted: i=1; AJvYcCUlK+8JNegdjR/h4g31F1mpc6jgYjPUfzizoDZyGBxQczR2GDV9vF6d3YFC3gs8AhVXshO28buL378LaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIo+P5XWuDtIdZNgz8pmgzy2Q8XObUZvzxqjru6uc5VwDu7/iX
	ZkKKVJk3ZEErY9NomPzLJe5e8dqEEXhk0Uha6cTZnyONDa3oosbZ3rjDpFIZ8Wol5IA=
X-Gm-Gg: ASbGncsxqB/VyvBeGDafzOZXNiMH//1ZfNEGQ0MAQGuvFAU2Xby2JnMyh4Wgj+kNi6o
	Rm0GkHSlbdy9fJBhhaUewqRAndcxgaPVXI8iL2T+4fFgn51Ta3Mr1fwQPvlyyQbCg4epLw61DkK
	i4yKwifm3rG0tPrlhOCEpF1m7EZamFlLamLQxYFsU7zd+PsZNcQ1usXJh5uaddQQB0go0+zO3Qh
	gTu6XFrmjqq/T3bn8ApN4muve91JiLEIbX+E9xj4wLkEwUyfEmKpiTXaIL6F4N0jDwTqrEoW3XN
	fsEJHn2adlrkjkxlJGRDz6Ir97FtC3wwljTM5PPq+txczM8oUyXOwLeEVXCfRCUSjiIbIV8Y6xr
	ccYe1ZvqxXxToqoiUWjDzfuGPuKBWoyRqFGow8b8=
X-Google-Smtp-Source: AGHT+IFv2StHvTHYtD7YmYQdVcCrSMW9Cx5LOrD+lcjn+nZHjDAPZ6NTnt08Bq2CWeSkeaBTFXAmvA==
X-Received: by 2002:a17:907:9691:b0:adb:2ce8:686a with SMTP id a640c23a62f3a-af94021d74bmr422522766b.12.1754314670469;
        Mon, 04 Aug 2025 06:37:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078cbasm741533166b.5.2025.08.04.06.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:37:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Aug 2025 15:37:38 +0200
Subject: [PATCH v2 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
In-Reply-To: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6269;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=03EFWbjpjg66HUQuvdjKNzq7BijWLpJo3Z/rP3nASts=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBokLeovkLK5gfdw8hv7pgPaIQIDCZoH8A24Ibl5
 jOK3Z0ym9SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJC3qAAKCRDBN2bmhouD
 17QGD/9zWZnOOBadHXa33BmtSQnuMq7/+Pv6rNK+eHNpxWoPtTugalRVqUi3XabwvMcVMZZ00+g
 fsEsC63kBdQf/Noc3zkDmdnLiAs1QuqijrcnYUTg4VZEQE9+qiqnxPnyujs4G0UYJEMFWJWaCCv
 XoRZDKpbgHgtOISTLVqTbqdSbq4mT3iHZTDn9QCn4a7SQ+e1VBazas1++b3SPGiFcX3ShkwIS5F
 GUcRhUD2TmXIaqnDoWNaeKyhCAEig95vT9GQs1Ob3S+9nB3fhtKruxpiFv5qdS+s/xtRhMJSVpy
 lJa1I1wsFZ6CSVmPPizuHew8/BIUeHq50aAFaZOvGnGE80W6p7yn9DkrKgZDWHgSUPQOcUBVlOP
 ZFqpQI2v6ZyC50pmLynoOTI6aixp7T+pM4gk0+ilJxiAreGMTqgfjJRtnSQGVtn/23gXqqkWbW0
 ThcM1bFPuiAhDyzkWk6CkHafMKbr5KoLXXwdwrphjlULnnhfcL4j3Hdu7Jz3O6iLdz1ouk3nQrd
 8PvoWDCAaDIoYqDkzFPGKsKyp5+jXat0DjGOVKsT+LnfFfSowfIyOvzJKHdbzV/GiPqpF6S36fU
 RMpa3qQOz5LvcOKSPrv3RvrZQ3jdXRiSQ0y58IE1px151sqe54H0ASFPewKc218vIctG/G6jV+6
 obHE1A+Egr65sZA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add binding for Qualcom SM8750 Iris video codec, which comes with
significantly different powering up sequence than previous SM8650, thus
different clocks and resets.  For consistency keep existing clock and
clock-names naming, so the list shares common part.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c9a0fcafe53fbda15f284828af6b98a2ffc41e00
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -0,0 +1,186 @@
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
+allOf:
+  - $ref: qcom,venus-common.yaml#
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
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };

-- 
2.48.1


