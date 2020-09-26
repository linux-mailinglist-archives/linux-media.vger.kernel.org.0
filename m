Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B5F27992C
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 14:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgIZMyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 08:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729390AbgIZMy1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 08:54:27 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E08C0613CE;
        Sat, 26 Sep 2020 05:54:26 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j2so6846437wrx.7;
        Sat, 26 Sep 2020 05:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oGAMDzu1oh/T5IwloW98IBM0ob51dpv+k1Xbgc+XAso=;
        b=cVa20L3VE8PvMjR5n1k7BkYn0VMbDcnI63zk/3WZ55q/H9XdmNLPd2DiCzpjBbtoQU
         nscfr4eIsTTxbqmLY7QkSZhXX4yb0q4ClhU/ZKLWh7jAKWeyzrLsevVBUkgvbEFBAKqa
         48om8J5nYkLKyVl9qmjSQ+7aFknGYP4dA33x7AlybUbmS3hqJ+FfQttUYhTwsipNSZHL
         RqoQG/sObwdck5l2XszsPETpPa1GSH6TgsUTRyz2hvpqOvGXjBCSeABGA5PQMNac3yuC
         HmZjwt782AAFFnHk3GiUQLizI3gMk11ffq13vUtIEqxVS579zbi90P6lGGj34/tAr6dS
         Otew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oGAMDzu1oh/T5IwloW98IBM0ob51dpv+k1Xbgc+XAso=;
        b=Ex8iYewc7o2urQc4jjdpfODzCuBfXde1pbf3CWGsGlGrrRGl+neU8z+T3Mvt6uoCIl
         NAKpnClV7YIP32RYW4ptSngZ29CbGacDT5dnLGL4fcvz6wod0kGDh6i1VtPAZaCHJbHH
         ThwDdg925+N1gCto+gVSGcxk6JGs5L6SfI9DIS92JtmpolAfG36ttxtVn0F/Bf8luFwM
         FC19V9FKQrLfYRmmGrALxBizbLiRBzVSGrTrMeXWXIcILV6TYpUO6QDf+EYUAE41HrsI
         QkMGaUN3EJUk7ZO/InpculwtjMFSorcpPWn2mMuGFGBf5xYT3eUa5u/eCmrMQ39uA9b3
         Zqtw==
X-Gm-Message-State: AOAM530T0UT75KnopOQBdcdWGvV9EDkjd7YfoblXaTZsiB6VAOD5Pox9
        FTo9g8CiOp3Fh8XOFJU37Z4=
X-Google-Smtp-Source: ABdhPJxiUVggUq72LS85oBED7Pd1XwPC/2QasITtkhKkyvEu6pXLJ7CrYy7PnfvAYwjNQ+GKbY3m5g==
X-Received: by 2002:adf:eb04:: with SMTP id s4mr10106860wrn.81.1601124864889;
        Sat, 26 Sep 2020 05:54:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 70sm2617707wmb.41.2020.09.26.05.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:54:24 -0700 (PDT)
From:   kholk11@gmail.com
To:     stanimir.varbanov@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-media@vger.kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: dt-bindings: media: venus: Add sdm660 DT schema
Date:   Sat, 26 Sep 2020 14:54:12 +0200
Message-Id: <20200926125412.13024-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125412.13024-1-kholk11@gmail.com>
References: <20200926125412.13024-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add new qcom,sdm660-venus DT binding schema.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../bindings/media/qcom,sdm660-venus.yaml     | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
new file mode 100644
index 000000000000..78c4a4ec4fe3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sdm660-venus.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,sdm660-venus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus_throttle
+      - const: bus
+      - const: vcodec0_core
+
+  iommus:
+    maxItems: 20
+
+  memory-region:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  video-firmware:
+    type: object
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 2
+
+    required:
+      - iommus
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - video-decoder
+  - video-encoder
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
+        #include <dt-bindings/interconnect/qcom,sdm660.h>
+        #include <dt-bindings/power/qcom-rpmpd.h>
+
+        video-codec@cc00000 {
+                compatible = "qcom,sdm660-venus";
+                reg = <0x0cc00000 0xff000>;
+                interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+                power-domains = <&mmcc VENUS_GDSC>,
+                                <&mmcc VENUS_CORE0_GDSC>,
+                                <&rpmpd SDM660_VDDCX>;
+                power-domain-names = "venus", "vcodec0", "cx";
+                clocks = <&mmcc VIDEO_CORE_CLK>,
+                         <&mmcc VIDEO_AHB_CLK>,
+                         <&mmcc THROTTLE_VIDEO_AXI_CLK>,
+                         <&mmcc VIDEO_AXI_CLK>,
+                         <&mmcc VIDEO_SUBCORE0_CLK>;
+                clock-names = "core", "iface", "bus_throttle", "bus",
+                              "vcodec0_core";
+                iommus = <&mmss_smmu 0x400>,
+                         <&mmss_smmu 0x401>,
+                         <&mmss_smmu 0x40a>,
+                         <&mmss_smmu 0x407>,
+                         <&mmss_smmu 0x40e>,
+                         <&mmss_smmu 0x40f>,
+                         <&mmss_smmu 0x408>,
+                         <&mmss_smmu 0x409>,
+                         <&mmss_smmu 0x40b>,
+                         <&mmss_smmu 0x40c>,
+                         <&mmss_smmu 0x40d>,
+                         <&mmss_smmu 0x410>,
+                         <&mmss_smmu 0x421>,
+                         <&mmss_smmu 0x428>,
+                         <&mmss_smmu 0x429>,
+                         <&mmss_smmu 0x42b>,
+                         <&mmss_smmu 0x42c>,
+                         <&mmss_smmu 0x42d>,
+                         <&mmss_smmu 0x411>,
+                         <&mmss_smmu 0x431>;
+                memory-region = <&venus_region>;
+
+                interconnects = <&mnoc MASTER_VENUS &bimc SLAVE_EBI>,
+                                <&gnoc MASTER_APSS_PROC &mnoc SLAVE_VENUS_CFG>;
+                interconnect-names = "video-mem", "cpu-cfg";
+
+                video-decoder {
+                        compatible = "venus-decoder";
+                };
+
+                video-encoder {
+                        compatible = "venus-encoder";
+                };
+        };
-- 
2.28.0

