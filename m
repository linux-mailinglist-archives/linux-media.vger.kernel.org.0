Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4566B31D870
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhBQLbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhBQL2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:28:51 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FE1C0698DB
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:31 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id d8so7952917ejc.4
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/Jqd9P/qG2Oy9zB9PDoKfslhWcTitwufsz46gku894=;
        b=sFza79PeLPYJA9UZ0/8v6Qfjpfl7u0gMqFbRwrDEG0H0q4xku34ISUlrGUKqo9/Qc8
         /FO1JcjaPkkh7qFA05bh+Kk3NavKyMQpd7fwEk4us9rjZXy+x7SIw1/eKcPkl9yAO/mi
         gU650P1H54XhmzzAA+xR2tqTCxEjKJm+fK2XtuUcXMs+SEXvWYIwoPJAb7Yo/VVld46C
         lmm6iCv8JIIihg492iID0HtLzuO465u3yyw9329SARp4EHs7J2iq30rKXV/s/t/lREw3
         QD1bo3wsBZm19LL4/cX/uDV7FpVKyJxAFCW+DivgCRIoet8Uw4cYcD8nKcGaZ49oEbyk
         4ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/Jqd9P/qG2Oy9zB9PDoKfslhWcTitwufsz46gku894=;
        b=Gvza77MkodNv1W8lT98a9El3PpfaC/KO9tB8JVrMoH3R8BRFT+6k9VAHciO15AsfaO
         cBmzPWeqH+9rzXhk6IUXWvdPniYPSpLcZ/8yOTvTZZDujdZu/chhV2yFyFOFDZbgJ4Zo
         b8NKsBOGQOKCZgSbq6FR8kSVnr1SO4U40yUYU6S8blL8GfxbyeNAt+lSKhlc3YB6BCz8
         AZ4RKQybajzq3UthrFi/DIAkOXi33k65tEEbzNrbheE2MqrClJuVfiDV+PNuIYLwlGFL
         mwwD5ksZLNpDftmNzQRJWNleKMImOYmatt1afjz2/UMmVS4w83yEFWV69JGV+78cR4/H
         1DFw==
X-Gm-Message-State: AOAM533LfS3K9N2YOL7lFyfH2RcO3hLbOmgnlQFmrDqUlZvIkpzFAOse
        xl+Mi83Btgof/Z3s4xRJk7w7ww==
X-Google-Smtp-Source: ABdhPJyl4kA7Gn7CXc5Sk5K3gaExmwViZlYZyN3vDaf9w26KoTCAgc8UN/g4882oRwM5E2rK63BNTg==
X-Received: by 2002:a17:906:46c4:: with SMTP id k4mr13621289ejs.169.1613560949736;
        Wed, 17 Feb 2021 03:22:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:29 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 19/22] media: dt-bindings: media: Remove qcom,camss documentation
Date:   Wed, 17 Feb 2021 12:21:19 +0100
Message-Id: <20210217112122.424236-20-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This documentation has been incorporated in dtschema dt-bindings
for the devices supported by CAMSS and is no longer helpful.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

