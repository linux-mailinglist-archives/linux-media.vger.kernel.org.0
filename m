Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2DD2FDBA2
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733250AbhATU46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389532AbhATNv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:51:26 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E40C061359
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:45:03 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a12so23129994wrv.8
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BtUaBgkFL2g1sNP6lLiCG8alEE+v68nXFHhI4QSpldI=;
        b=YAZDgJTzrwi51ukylhKlDIYysP+bn878mAdv0kDjC2YWvBhqMXZzmKp4pVVDroN0z7
         SftA8HjHw8tfg2jDY0Jdr7TTZWY7hThF+aLW5d57fPQk5Nw4B9TXSNd5OepGL8ceorBC
         Pk4TjNfWqw/TYWSmocw0tiQwHe/dsbt9utVdca62vjtCO3wasDItu3GsnhZmZ/wyoOTm
         3W97gyBOo8FQ1IAqBln500ASZDBtiOr6545m4rfCs+jss25iHWka8uM6HmG2Trquvt/D
         McDVM7yzZDjD7/U172qxKNuGmlFvgptEs0m3bqPYplu9TeX05QVFHpUdy/VarmlKCfah
         uzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BtUaBgkFL2g1sNP6lLiCG8alEE+v68nXFHhI4QSpldI=;
        b=PyDTj2Q7Loaum01DEwYqn3ncGIFf/Cvd2CVQqU1u/cW9DGlhxNPd79CC1L1YEOsnO+
         fsAvRHZRdnTxVJJ8VcMprIbIxpzlkX+LoMR0Ub6o2sctQAmx2h8Jd29m8Ib2BJrz+axV
         5285lwz6L7P9yr4wjw8v3fgiBGsbddMDicSQau5SlpjEdQ9AmGkH85nbFj5uorGIIv04
         7m3oQtasRfD0XLUl9EuCTmxmGDDFMiSQCFz5At1GKT05N/6RF2IabeYg3tfMVvtEEh57
         DNxVW/VLuFd6apjjyhCEqyQKzpqEbhNPZp1FOLkRspYSWQFOYj+Ec+zVK0eEsZbpq/w0
         QkUw==
X-Gm-Message-State: AOAM532Kl6d5QSl+OeRquRktCs1o0NrPpF1NL/NS4SKjMnqVNIR5+ybz
        6QX/M4tGUxLEvweg4cs5NHz+Eg==
X-Google-Smtp-Source: ABdhPJywKAHAnsJIko83CbvExogR1mJ/kWKGEX5MCCWnXxPxY8nY2TXvb87/+Zsjyir4Y9xniLePaw==
X-Received: by 2002:adf:902a:: with SMTP id h39mr9330386wrh.147.1611150301757;
        Wed, 20 Jan 2021 05:45:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:45:01 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 18/22] media: dt-bindings: media: Remove qcom,camss documentation
Date:   Wed, 20 Jan 2021 14:43:53 +0100
Message-Id: <20210120134357.1522254-18-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This documentation has been incorporated in dtschema dt-bindings
for the devices supported by CAMSS and is no longer helpful.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../devicetree/bindings/media/qcom,camss.txt  | 236 ------------------
 1 file changed, 236 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt

diff --git a/Documentation/devicetree/bindings/media/qcom,camss.txt b/Documentation/devicetree/bindings/media/qcom,camss.txt
deleted file mode 100644
index 498234629e21..000000000000
--- a/Documentation/devicetree/bindings/media/qcom,camss.txt
+++ /dev/null
@@ -1,236 +0,0 @@
-Qualcomm Camera Subsystem
-
-* Properties
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: Should contain one of:
-		- "qcom,msm8916-camss"
-		- "qcom,msm8996-camss"
-		- "qcom,sdm660-camss"
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Register ranges as listed in the reg-names property.
-- reg-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: Should contain the following entries:
-		- "csiphy0"
-		- "csiphy0_clk_mux"
-		- "csiphy1"
-		- "csiphy1_clk_mux"
-		- "csiphy2"		(8996 only)
-		- "csiphy2_clk_mux"	(8996 only)
-		- "csid0"
-		- "csid1"
-		- "csid2"		(8996 only)
-		- "csid3"		(8996 only)
-		- "ispif"
-		- "csi_clk_mux"
-		- "vfe0"
-		- "vfe1"		(8996 only)
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Interrupts as listed in the interrupt-names property.
-- interrupt-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: Should contain the following entries:
-		- "csiphy0"
-		- "csiphy1"
-		- "csiphy2"		(8996 only)
-		- "csid0"
-		- "csid1"
-		- "csid2"		(8996 only)
-		- "csid3"		(8996 only)
-		- "ispif"
-		- "vfe0"
-		- "vfe1"		(8996 only)
-- power-domains:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: A phandle and power domain specifier pairs to the
-		    power domain which is responsible for collapsing
-		    and restoring power to the peripheral.
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: A list of phandle and clock specifier pairs as listed
-		    in clock-names property.
-- clock-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: Should contain the following entries:
-		- "top_ahb"
-		- "throttle_axi"	(660 only)
-		- "ispif_ahb"
-		- "csiphy0_timer"
-		- "csiphy1_timer"
-		- "csiphy2_timer"	(8996 only)
-		- "csiphy_ahb2crif"	(660 only)
-		- "csi0_ahb"
-		- "csi0"
-		- "csi0_phy"
-		- "csi0_pix"
-		- "csi0_rdi"
-		- "cphy_csid0"		(660 only)
-		- "csi1_ahb"
-		- "csi1"
-		- "csi1_phy"
-		- "csi1_pix"
-		- "csi1_rdi"
-		- "cphy_csid1"		(660 only)
-		- "csi2_ahb"		(8996 only)
-		- "csi2"		(8996 only)
-		- "csi2_phy"		(8996 only)
-		- "csi2_pix"		(8996 only)
-		- "csi2_rdi"		(8996 only)
-		- "cphy_csid2"		(660 only)
-		- "csi3_ahb"		(8996 only)
-		- "csi3"		(8996 only)
-		- "csi3_phy"		(8996 only)
-		- "csi3_pix"		(8996 only)
-		- "csi3_rdi"		(8996 only)
-		- "cphy_csid3"		(660 only)
-		- "ahb"
-		- "vfe0"
-		- "csi_vfe0"
-		- "vfe0_ahb",		(8996 only)
-		- "vfe0_stream",	(8996 only)
-		- "vfe1",		(8996 only)
-		- "csi_vfe1",		(8996 only)
-		- "vfe1_ahb",		(8996 only)
-		- "vfe1_stream",	(8996 only)
-		- "vfe_ahb"
-		- "vfe_axi"
-- vdda-supply:
-	Usage: required
-	Value type: <phandle>
-	Definition: A phandle to voltage supply for CSI2.
-- iommus:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: A list of phandle and IOMMU specifier pairs.
-
-* Nodes
-
-- ports:
-	Usage: required
-	Definition: As described in video-interfaces.txt in same directory.
-	Properties:
-		- reg:
-			Usage: required
-			Value type: <u32>
-			Definition: Selects CSI2 PHY interface - PHY0, PHY1
-				    or PHY2 (8996 only)
-	Endpoint node properties:
-		- clock-lanes:
-			Usage: required
-			Value type: <u32>
-			Definition: The physical clock lane index. On 8916
-				    the value must always be <1> as the physical
-				    clock lane is lane 1. On 8996 the value must
-				    always be <7> as the hardware supports D-PHY
-				    and C-PHY, indexes are in a common set and
-				    D-PHY physical clock lane is labeled as 7.
-		- data-lanes:
-			Usage: required
-			Value type: <prop-encoded-array>
-			Definition: An array of physical data lanes indexes.
-				    Position of an entry determines the logical
-				    lane number, while the value of an entry
-				    indicates physical lane index. Lane swapping
-				    is supported. Physical lane indexes for
-				    8916: 0, 2, 3, 4; for 8996: 0, 1, 2, 3.
-
-* An Example
-
-	camss: camss@1b00000 {
-		compatible = "qcom,msm8916-camss";
-		reg = <0x1b0ac00 0x200>,
-			<0x1b00030 0x4>,
-			<0x1b0b000 0x200>,
-			<0x1b00038 0x4>,
-			<0x1b08000 0x100>,
-			<0x1b08400 0x100>,
-			<0x1b0a000 0x500>,
-			<0x1b00020 0x10>,
-			<0x1b10000 0x1000>;
-		reg-names = "csiphy0",
-			"csiphy0_clk_mux",
-			"csiphy1",
-			"csiphy1_clk_mux",
-			"csid0",
-			"csid1",
-			"ispif",
-			"csi_clk_mux",
-			"vfe0";
-		interrupts = <GIC_SPI 78 0>,
-			<GIC_SPI 79 0>,
-			<GIC_SPI 51 0>,
-			<GIC_SPI 52 0>,
-			<GIC_SPI 55 0>,
-			<GIC_SPI 57 0>;
-		interrupt-names = "csiphy0",
-			"csiphy1",
-			"csid0",
-			"csid1",
-			"ispif",
-			"vfe0";
-		power-domains = <&gcc VFE_GDSC>;
-		clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
-			<&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
-			<&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
-			<&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
-			<&gcc GCC_CAMSS_CSI0_AHB_CLK>,
-			<&gcc GCC_CAMSS_CSI0_CLK>,
-			<&gcc GCC_CAMSS_CSI0PHY_CLK>,
-			<&gcc GCC_CAMSS_CSI0PIX_CLK>,
-			<&gcc GCC_CAMSS_CSI0RDI_CLK>,
-			<&gcc GCC_CAMSS_CSI1_AHB_CLK>,
-			<&gcc GCC_CAMSS_CSI1_CLK>,
-			<&gcc GCC_CAMSS_CSI1PHY_CLK>,
-			<&gcc GCC_CAMSS_CSI1PIX_CLK>,
-			<&gcc GCC_CAMSS_CSI1RDI_CLK>,
-			<&gcc GCC_CAMSS_AHB_CLK>,
-			<&gcc GCC_CAMSS_VFE0_CLK>,
-			<&gcc GCC_CAMSS_CSI_VFE0_CLK>,
-			<&gcc GCC_CAMSS_VFE_AHB_CLK>,
-			<&gcc GCC_CAMSS_VFE_AXI_CLK>;
-		clock-names = "top_ahb",
-			"ispif_ahb",
-			"csiphy0_timer",
-			"csiphy1_timer",
-			"csi0_ahb",
-			"csi0",
-			"csi0_phy",
-			"csi0_pix",
-			"csi0_rdi",
-			"csi1_ahb",
-			"csi1",
-			"csi1_phy",
-			"csi1_pix",
-			"csi1_rdi",
-			"ahb",
-			"vfe0",
-			"csi_vfe0",
-			"vfe_ahb",
-			"vfe_axi";
-		vdda-supply = <&pm8916_l2>;
-		iommus = <&apps_iommu 3>;
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				csiphy0_ep: endpoint {
-					clock-lanes = <1>;
-					data-lanes = <0 2>;
-					remote-endpoint = <&ov5645_ep>;
-				};
-			};
-		};
-	};
-- 
2.27.0

