Return-Path: <linux-media+bounces-49869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D60CF1329
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 19:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B87E30047A5
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 18:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274F42D9ED1;
	Sun,  4 Jan 2026 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVPIv6n/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670042D94A3;
	Sun,  4 Jan 2026 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767551532; cv=none; b=G0/v7f3YlO34IFkVlLLibDYfDBpz+UJhxI0f+u3cyruDjdGz+1JZJnu8ZgXAeiBNg7rHBcC7r7/9XfqKgDdSXXduc55TyOAWJC4IQ3Ikr6IC6sLxYVrfKuT8GA41ltIF1jxOmo68ASv+Qx92CDwHx9QA74rUEAAARZaShR6hf/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767551532; c=relaxed/simple;
	bh=rql7s+Zl1etzKj85pplfgbT1iHnjJ7cBh7TmKymqEko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z5gH6dfNBNF2zYZIekZOQ9diHJ/TpL/lel4iJEaKl4KfOnmcJZ4xdJOr1HBcXHHI0iTx/hOaWXb5J+we+xjIjXeKHPf9LBeXnR2DcuCJ0u0RdrGp0RjuSI3gfrzQ9hSV+e04gPI3s1ztW1SmB2AXVcktGCYo3WHCU8EV/2EspoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVPIv6n/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8E13C4CEF7;
	Sun,  4 Jan 2026 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767551532;
	bh=rql7s+Zl1etzKj85pplfgbT1iHnjJ7cBh7TmKymqEko=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=GVPIv6n/NIsM44fjQ0BrgY+b4/KBcyOBuh3CeqvMI+tn1f21cRhxI8CPs40j6yTCo
	 smIRIKtgs5kWwR7PbHo8vwVYXTxjVnLQVJBy5QEWGIB8ayaSfRDBUJJ5QUpktE1mxG
	 FqGkdiha0ECQY/a6Dn79vUEgVwPsPp4cwJBkMx9bgY+dMHwyJ6DMsQTxApnsHEYfJj
	 a/7aPJbTaAy6l5jnyKA/LokqE9/AX3F5AkSwaY4PLE+kAHdBXVffi3F8nuTtNATKUr
	 Da41QUJuLdkPebxEx5yk1yz/KyEf5+8TmJT7bG8ITo3+ozWsQSY6DQOQ2H3x0RQF7k
	 tF1PmW4j/PXyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0576C2A069;
	Sun,  4 Jan 2026 18:32:11 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 04 Jan 2026 19:31:53 +0100
Subject: [PATCH v9] arm64: dts: qcom: msm8939: Add camss and cci
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260104-camss-8x39-vbif-v9-1-0d47c7afbb2f@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIABiyWmkC/23Py2rDMBAF0F8JWldBD4+l6Sr/UbqQ9YgFTRSkV
 KQN/vfKphQXezkDc+6dJyk+R1/I6+FJsq+xxHRtA74ciB3N9expdG0mgglgwBW15lIK1Q+JtA4
 xUFQQAmiOHDVpV7fsQ3ws4tt7m8dY7il/LQGVz9tfS7CNVTll1HBhXc9YbwKeLiZ+pHRM+Tzby
 yEyvX8YWgOLwTHXuZO5xft3sePRf5K5RhXraNgKogm9kw4smNBBv45eALkC5E53OVewyB2HYQC
 3BdQfwJnY+UE1ALn3evDWGQ3bH/RK2Kugm6Cg07JDqQLY/8I0TT+8ZCHG7wEAAA==
X-Change-ID: 20250517-camss-8x39-vbif-975ff5819198
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767551530; l=9414;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=4vLknzvfLXgTa/DO2IF2xxAc+HnFpKPaiuGsteMNYyc=;
 b=/e3diAOrNlnQ+IY+JqdCnSfWgUwVo6S7Sm7K8vxYhf+IYuJtaKdxnWkhfd1ayQODRKCdCkndC
 xkPqBII/P4pBWzyTvW2dv+fSvigEWUu5ahXNcAbXWDTNevRBqPYUDaw
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Vincent Knecht <vincent.knecht@mailoo.org>

Add the camera subsystem and CCI used to interface with cameras on the
Snapdragon 615.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
[André: Make order of items the same as in 8916]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
This series adds CAMSS support for MSM8939.  It's mostly identical to
MSM8916, except for some clocks and an additional CSI.

To fix black stripes across sensor output, and garbage in CSID TPG
output, 2 VFE VBIF register settings are needed.  So the 2nd patch adds
helper functions to do just that.

Patch 1: documents qcom,msm8939-camss DT bindings
Patch 2: adds helper for VFE VBIF settings
Patch 3: adds CAMSS_8x39 version in CAMSS driver
Patch 4: adds camss and cci in msm8939.dtsi
---
Changes in v9:
- Drop applied patches 1-3
- Rebase on latest next/master
- Link to v8: https://lore.kernel.org/r/20251030-camss-8x39-vbif-v8-0-754834937f5c@apitzsch.eu

Changes in v8:
- Remove unavailable .link_entities callback [1] to fix build error
  [1] https://lore.kernel.org/all/20250903002255.346026-2-vladimir.zapolskiy@linaro.org/
- Link to v7: https://lore.kernel.org/r/20251028-camss-8x39-vbif-v7-0-91ee8becda85@apitzsch.eu

Changes in v7:
- Fix revision (previous submission was wrongly labelled v1)
- Pick up tags
- Rebase on latest next/master
- Link to v6: https://lore.kernel.org/r/20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu

Changes in v6 (was wrongly labelled v1):
- Move bindings patch to the beginning
- Make the order of {reg, clock, interrupt} items the same as in 8916 +
  append additional items
- Drop R-b tags from bindings and dts patches as order of items was
  changed
- Link to v5: https://lore.kernel.org/r/20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org

Changes in v5:
- Patch 1: no change
- Patch 2: no change
- Patch 3: (bindings)
  - Fix alphanumerical ordering wrt. underscore (Vladimir)
  - Add 1.2V mention to vdda-supply description (Vladimir)
  - Correct vdda-supply regulator name for 1.2V in example
  - Add empty line between properties and child node (Vladimir)
  - Remove clock-lanes property in example (Vladimir)
- Patch 4: (dtsi)
  - Apply ordering and isp node unit address changes from patch 3.
- Link to v4: https://lore.kernel.org/r/20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org

Changes in v4:
- Picked up tags
- Patch 1:
  - Fix alignment to match opening parenthesis (Bryan)
- Patch 2: no change
- Patch 3:
  - Wrap line at 80 chars (Krzysztof)
- Patch 4: no change
- Link to v3: https://lore.kernel.org/r/20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org

Changes in v3:
- Patch 1:
  - Use braces around multiline (Bryan)
  - Rename vfe_vbif_reg_write to vfe_vbif_write_reg (Bryan)
  - Get rid of switch block on CAMSS version (Bryan)
- Patch 2:
  - Get rid of switch block on CAMSS version (Bryan)
- Patch 3: no change
- Patch 4: no change
  - Tried to get rid of CCI camss_ahb but this resulted in device
    freeze+reboot (Konrad)
- Link to v2: https://lore.kernel.org/r/20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org

Changes in v2:
- Patch 1:
  - Fix devm_platform_ioremap_resource_byname line to not end with
    opening parenthesis (media-ci/1-checkpatch)
  - Move camss-vfe-4-1.c handling of VBIF previously in patch 2 here
    (Dmitry)
- Patch 2:
  - Declare regulators in PHY entries, not CSID ones (Bryan)
- Patch 3: (bindings)
  - Fix bindings checks for new errors (Rob)
  - Fix properties ordering, code-style and example (Krzysztof)
  - Sort reg-names, clock-names and interrupt-names alphanumerically (Bryan)
- Patch 4: (dtsi)
  - Move #address/#size cells before status (Konrad)
  - Aligned CCI with msm8916, thus removing ispif_ahb mention (Konrad)
    If "camss_ahb should be unnecessary", it's still required by qcom,i2c-cci.yaml
- Link to v1: https://lore.kernel.org/r/20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org
---
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi        | 146 +++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
index adb96cd8d643..659d127b1bc3 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
@@ -11,6 +11,10 @@
 #include "msm8939.dtsi"
 #include "pm8916.dtsi"
 
+&camss {
+	vdda-supply = <&pm8916_l2>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&pm8916_l2>;
 	vddio-supply = <&pm8916_l6>;
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index eb64ec35e7f0..d4d7b0c9206c 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1436,6 +1436,145 @@ mdss_dsi1_phy: phy@1aa0300 {
 			};
 		};
 
+		camss: isp@1b0ac00 {
+			compatible = "qcom,msm8939-camss";
+			reg = <0x01b0ac00 0x200>,
+			      <0x01b00030 0x4>,
+			      <0x01b0b000 0x200>,
+			      <0x01b00038 0x4>,
+			      <0x01b08000 0x100>,
+			      <0x01b08400 0x100>,
+			      <0x01b0a000 0x500>,
+			      <0x01b00020 0x10>,
+			      <0x01b10000 0x1000>,
+			      <0x01b08800 0x100>,
+			      <0x01b40000 0x200>;
+			reg-names = "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "ispif",
+				    "csi_clk_mux",
+				    "vfe0",
+				    "csid2",
+				    "vfe0_vbif";
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				 <&gcc GCC_CAMSS_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE_AXI_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI2RDI_CLK>;
+			clock-names = "top_ahb",
+				      "ispif_ahb",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "csi0_ahb",
+				      "csi0",
+				      "csi0_phy",
+				      "csi0_pix",
+				      "csi0_rdi",
+				      "csi1_ahb",
+				      "csi1",
+				      "csi1_phy",
+				      "csi1_pix",
+				      "csi1_rdi",
+				      "ahb",
+				      "vfe0",
+				      "csi_vfe0",
+				      "vfe_ahb",
+				      "vfe_axi",
+				      "csi2_ahb",
+				      "csi2",
+				      "csi2_phy",
+				      "csi2_pix",
+				      "csi2_rdi";
+
+			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csiphy0",
+					  "csiphy1",
+					  "csid0",
+					  "csid1",
+					  "ispif",
+					  "vfe0",
+					  "csid2";
+
+			iommus = <&apps_iommu 3>;
+
+			power-domains = <&gcc VFE_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		cci: cci@1b0c000 {
+			compatible = "qcom,msm8916-cci", "qcom,msm8226-cci";
+			reg = <0x01b0c000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_CLK>,
+				 <&gcc GCC_CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb",
+				      "cci_ahb",
+				      "cci",
+				      "camss_ahb";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+					  <&gcc GCC_CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>,
+					       <19200000>;
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-names = "default";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpu: gpu@1c00000 {
 			compatible = "qcom,adreno-405.0", "qcom,adreno";
 			reg = <0x01c00000 0x10000>;
@@ -1500,6 +1639,13 @@ apps_iommu: iommu@1ef0000 {
 			#iommu-cells = <1>;
 			qcom,iommu-secure-id = <17>;
 
+			/* vfe */
+			iommu-ctx@3000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x3000 0x1000>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			/* mdp_0: */
 			iommu-ctx@4000 {
 				compatible = "qcom,msm-iommu-v1-ns";

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20250517-camss-8x39-vbif-975ff5819198

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



