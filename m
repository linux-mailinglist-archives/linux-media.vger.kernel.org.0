Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D24301276E4
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 09:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfLTIA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 03:00:26 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:33528 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbfLTIA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 03:00:26 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Dec 2019 13:30:23 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 20 Dec 2019 13:30:13 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 0AA35348A; Fri, 20 Dec 2019 13:30:13 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 1/3] arm64: dts: sc7180: Add Venus video codec DT node
Date:   Fri, 20 Dec 2019 13:29:18 +0530
Message-Id: <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds Venus video codec DT node for sc7180.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6876aae2..42c70f5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/clock/qcom,videocc-sc7180.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -66,6 +67,11 @@
 			compatible = "qcom,cmd-db";
 			no-map;
 		};
+
+		venus_mem: memory@8F600000 {
+			reg = <0 0x8F600000 0 0x500000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -1042,6 +1048,36 @@
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc7180-venus";
+			reg = <0 0x0aa00000 0 0xff000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>;
+			power-domain-names = "venus", "vcodec0";
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				<&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				<&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				<&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				<&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+					"vcodec0_core", "vcodec0_bus";
+			iommus = <&apps_smmu 0x0C00 0x60>;
+			memory-region = <&venus_mem>;
+
+			video-core0 {
+					compatible = "venus-decoder";
+			};
+
+			video-core1 {
+					compatible = "venus-encoder";
+			};
+
+			video-firmware {
+					iommus = <&apps_smmu 0x0C42 0x0>;
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
1.9.1

