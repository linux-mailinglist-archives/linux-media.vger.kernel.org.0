Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1958A43B4D6
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 16:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbhJZOyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 10:54:52 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:30099 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233612AbhJZOyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 10:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635259948; x=1666795948;
  h=from:to:cc:subject:date:message-id;
  bh=hbJhp0/sw60fOOldoInBhAGBQJw+4TbdTVWu98hF2CM=;
  b=Z5Xuzy2cyVYS+vUIxwuQDjA3TUYzg7SWfuWCcFQDNgtkwuuRRXQennPX
   1V9NuNh/RkXTqHMujfCEJ6KUhIbnHloHxXaRJwQ9srJxTPAqXofuoqLmx
   5JGs23NO0fQxf7fo7uszOHImr+uRlv4rIMxL2SmdP41v3k+2jJdSJyU/y
   4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 07:52:28 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Oct 2021 07:52:26 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Oct 2021 20:22:11 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id B0AE221E0F; Tue, 26 Oct 2021 20:22:09 +0530 (IST)
From:   Dikshita Agarwal <quic_dikshita@quicinc.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mchehab@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v7] arm64: dts: qcom: sc7280: Add venus DT node
Date:   Tue, 26 Oct 2021 20:22:02 +0530
Message-Id: <1635259922-25378-1-git-send-email-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Add DT entries for the sc7280 venus encoder/decoder.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
changes since v6:
    fixed checkpatch errors.

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 365a2e0..e4988ea 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -129,6 +129,11 @@
 			no-map;
 		};
 
+		video_mem: memory@8b200000 {
+			reg = <0x0 0x8b200000 0x0 0x500000>;
+			no-map;
+		};
+
 		ipa_fw_mem: memory@8b700000 {
 			reg = <0 0x8b700000 0 0x10000>;
 			no-map;
@@ -2675,6 +2680,76 @@
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc7280-venus";
+			reg = <0 0x0aa00000 0 0xd0600>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
+				 <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CORE_CLK>,
+				 <&videocc VIDEO_CC_MVS0_AXI_CLK>;
+			clock-names = "core", "bus", "iface",
+				      "vcodec_core", "vcodec_bus";
+
+			power-domains = <&videocc MVSC_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC7280_CX>;
+			power-domain-names = "venus", "vcodec0", "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>,
+					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "cpu-cfg", "video-mem";
+
+			iommus = <&apps_smmu 0x2180 0x20>,
+				 <&apps_smmu 0x2184 0x20>;
+			memory-region = <&video_mem>;
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+
+			video-firmware {
+				iommus = <&apps_smmu 0x21a2 0x0>;
+			};
+
+			venus_opp_table: venus-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133330000 {
+					opp-hz = /bits/ 64 <133330000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-335000000 {
+					opp-hz = /bits/ 64 <335000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-424000000 {
+					opp-hz = /bits/ 64 <424000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-460000048 {
+					opp-hz = /bits/ 64 <460000048>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+			};
+
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sc7280-videocc";
 			reg = <0 0xaaf0000 0 0x10000>;
-- 
2.7.4

