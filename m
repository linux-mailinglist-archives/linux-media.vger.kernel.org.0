Return-Path: <linux-media+bounces-37626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D775FB0406E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AF10188DDC2
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E2724DD0A;
	Mon, 14 Jul 2025 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QV6u55Wu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891952E36E5
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500491; cv=none; b=cE3FIpowD2f4o8Sqq3au3XdZBhQYXP4bEj4ls0nZ9Tc4dSsuXKAjzul+FGa9phvJ25dVfa+P2wVHtM1IIq1eAm7qQoGeoUDl3yqle2ZoS7y4UhZTT46AAs4N/lhu/omhHz+xGZC+6zfla3mKw1Z7bhAWDy+Z2PEGkamBKW3djRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500491; c=relaxed/simple;
	bh=N0FiLOa/kCeu/NHGrIPyU79z0X8zCwU1KG+xS+vfyYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaLtHkOdP6S7Ixs0XRkuoKP4M8oV9USxC6dNhWxLvmBlT/Byn72skCf1xif/edzjYRoGAKyUgfOivJc+zynISrvMP91Mc8WawA6DvtV5+ItcctDTLIhmcen+4jYn8C7xkRC94nw1+2opSUPfgoSmfTsN+h529GSTi13AGUVtICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QV6u55Wu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-456127b9958so1480185e9.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 06:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752500488; x=1753105288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3lTuIh5S1FYvkQ1ZLooc79sNOGjgNo0+8qWLqGThgk=;
        b=QV6u55Wugnt59OWtvNc9f3gtvm9FCLJL2tiefrBBBe/ozOblVk50Gd5xIly7f2D0Uo
         GAqJNVuko0Ecj4GB6Q+omTTQNxnh6GLIh5XkuEcvE39sE7loLddbWNbWv7IEAsIWgTFx
         S51yR4llA2sP959ZBhUTSo46t9WnO6vdDHw8SQ+w5yE+rCsJ26SNgQK3MuxVtLbxxG5E
         f0uQQd7enmN755gQUzGMhCldCQBdkcTxATgo6kmQ66LeoE9Av+rAcuT6n6lpym2lyXoX
         VvrP2NZ9fAFexDmJLWlbwaP3YCSn1+A+soFJ5PV1LceQu90oRnwx24Y4jDquUR/DHWq8
         W3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500488; x=1753105288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3lTuIh5S1FYvkQ1ZLooc79sNOGjgNo0+8qWLqGThgk=;
        b=Dd49iQHtVQE7WjOPs7tk6aJ8RHXa3g/uYwNca6uR44LKkmc1RQfvXAKEsuVaSjKq8P
         Judl+6Pa1zykud9d25exSnBxATAb53+NyQh4EuEC82/J1ccb88M7EG43zNoR4f72RM6v
         M/RbwXyq4/Waee8wvSf72cqLc0XKloUeAojhgQkkcGGgW3H/D0f1JqrNduVvnsPjprME
         QW7aVOXks+k/GkVSOZNEEdqLGpD6BpJlmUcHm6Ry74lTQX++zdt0CSZw/rm9Wi/5yf9K
         XMUm9KFkIED82W/P5iByY2AQuBm12yFkPS4eEMh07ahOyt3qO98/vxsY1PD9dOKMnN85
         Z62Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtEEB8YoHowtWPRelqsgcg0VAWm4ioML6HRsVXJPEm0bCA9SSsXlrheVy2ykrKpMZGjjqr3M2u/0TdKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJnN3f4yptMbLa2FJZtOIRsY7hraMFNgrZna9o47cWqP6D2tOe
	WSFeBMYdUAmB8dJDRgttWlfuxUlBPnKenjhZqZPiPEA3nWM3QuLgSft5/lNfO5/ko68=
X-Gm-Gg: ASbGncv451PttLj85cHcmqhIGyLZFhS+nHZ6jbZOMIjUElFrQsYeWf7yNMcwjPk903k
	nlFuzLcb7wGEpFRtEkDeRCnkvDkn7RzuLbAH5oHg4ov1PrrHhN0FamTzs6UAQLpEIy8Gg7Rt04X
	GcihvzVFDyhwvj2bw3uoPpMIE0AouVDCjSCMAW6LPmvO6IO/rphAgRV0Mbw3I6TThrbNYWx4oih
	Rlv9ivmMe1viEcv6WxUM7diX2QdwU4EnFQKwm9P6bVj1j4bGFoLmAFg7gP3Lc2EKcUNyq3K1VI/
	ZlivFr1AZoV6qhnLmaKi8TiDUM1XNDTvsxS6RmBiwjPXMp7r52ywm0LvqpvTdm0v7iwL1RkoZrX
	JlVm7cndeoefvyPsDpIOj88p3rZU7Oo0P2FZE
X-Google-Smtp-Source: AGHT+IH/77wC4xERgT8TAu9P3Ccruj4NUXxcgbWHiYjWBnWtXjpKgbx1wOWS/M5as07m/W20VeF+2g==
X-Received: by 2002:a05:600c:a282:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-4556f8ab34dmr32154685e9.3.1752500487677;
        Mon, 14 Jul 2025 06:41:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b176f87sm31371375e9.35.2025.07.14.06.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:41:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 14 Jul 2025 15:41:16 +0200
Subject: [PATCH 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750 video
 codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-sm8750-iris-v1-1-3006293a5bc7@linaro.org>
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
In-Reply-To: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6219;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=N0FiLOa/kCeu/NHGrIPyU79z0X8zCwU1KG+xS+vfyYI=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGh1CQKiOm+mc5Q+Va+s3HmFSNGF5yoCEIUFNlmbMDGhPpsqw
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJodQkCAAoJEME3ZuaGi4PXbWQQAID+
 xZCeBSMm+EMQ8CIDDCSkQ7/DStICm4MCpBI5Iu9fQTTRFH4EIka6D3HSFweyVPmdRrQYy01QMms
 R35U3A2jMd3AH5wr4aVym1J3Aa6yzfY30Mjm8PiwfhJpKSPdd+o614P5sVrbaaRAcHoIvnyp5Ij
 3PT1MbrDwocUa6grgzOBbaBDvssM0xRV+KSWdKdpoKhy0i+RH3k1neyTEBJddJ8DPfjfXSzNyYD
 cFbRlGScipOCN+Q3PZvAETgbfqmHmxLH/DLrDfQt5WHXLBmYHNNRL4ThKCKhMrPN+pb//cxh5++
 JgaQ/KymDH5+ojRCjVjVw2TkXfv8JMEUSLn7Yh82+ryCILJ4y2KqGQjDt8/orBkhB+sCESBexhu
 4Dsa2eV+yR4qczGaBzWHSOB3INFvqtJx6l4JxlkTstO+6j47ZtSCNNjn8ungwNm/DrOZ1ftwumV
 WmXmx1rPo8/HwxBO+wUcicoO4d4Px+t/z4v+Tq6LaGHElfDSRddLJhyB36ZEG+P0AcmAL6ywq4+
 /JGiTuOR93nnnCDpayfsnpq6YQcEy35KuRniORJ4YT1sRb15uJz/WOtfRSFFH9+pW42fUfHbATO
 dpg4IL1O85wjWrNld0YO84pOVJ5Zjn3iExT9Bvqw8zSXuYTf1DOcfOR+FI8g4wDU/JxFAau/4eL
 frwXp
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add binding for Qualcom SM8750 Iris video codec, which comes with
significantly different powering up sequence than previous SM8650, thus
different clocks and resets.  For consistency keep existing clock and
clock-names naming, so the list shares common part.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e767ebae7c4022d406d61a7bf606b8d878d8632e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -0,0 +1,186 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8750 SpC Iris video encoder and decoder
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
2.43.0


