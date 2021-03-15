Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CA833C10A
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233582AbhCOQDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbhCOQC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:02:58 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DB7C061762
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:02:58 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bm21so67134375ejb.4
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e1bnSWt5MMNpThTKCIXrOcxPbJgiUNydKLLGRuN4+hI=;
        b=kT0YmF8BxYmCrr/a1wKIywHDzZePAxPDCrJ/a8vApVgvCXkoz9D171iyQjj1zSTFYR
         +VOiQRSxRh4pQMZdVdqLOL3dPutJZnOgxIlaEz78ndf/ZCmsI1Lp7OpFoxtxOHmEv1rQ
         lhi2caJFIreWVvPk0ozOSyPk6ujyaaSyEdafitKAI26Y1PnWxAjk7Q4GINSwQhsdfanC
         QKN3dZqDV02RlUyOIK2ql5FJob/mezSynrCO3RW2BqvyJ6+Ms95UZ9kpkad+f0FuEg3I
         1d0YitqMgb6xU5GKsUWF/1QZqhteY8BridHzOFy0msO8M3VFnwywQRcVZLq0tc1bdChz
         emXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e1bnSWt5MMNpThTKCIXrOcxPbJgiUNydKLLGRuN4+hI=;
        b=JotAl9MlnHOH7pb6j7cIxKvkigPAWB2WGUAPls/EqgQ4h2p8N6yX7odVZt3vDT7/KE
         L3UTWOmi03mJ1kRe5ObjcxfStcI8gLx9kCyCsPRsWRoeOJL8PtTlWKucPz+5qT+xif8X
         DCr0qRs2oCjHZl9m1YDyouGiBP8km8ePf5BbyDquLm0W3bswrP4S8NSToz/aUUhXaA3d
         aCn/JY45r8T8AE/3mtODitmd9FkVNINaHlvGsFp7hsZTe3dNQ2AYo1IinjJkipPW8Y3x
         MxI61TH2kmFFHCOKF0+eN8chwbkuPAKczGSNL564qwtC2KjvdhtxtifF/Shv43dm0Q/s
         fr4g==
X-Gm-Message-State: AOAM532AXMzxvK3BMKjU0fiBR4+I7JHAGtGcx2jOUGSHlHmgdHsxni5E
        idrjykkkY3aD/FQRRFxHAaowbA==
X-Google-Smtp-Source: ABdhPJz6zQQiO/obYQo2XPVfUEq/H/XTyasnbz8emAK/MqYagsWHCevJTGFClexV9N5jH8QaZ37t4A==
X-Received: by 2002:a17:906:719b:: with SMTP id h27mr24065681ejk.123.1615824176807;
        Mon, 15 Mar 2021 09:02:56 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:02:56 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 20/22] arm64: dts: sdm845: Add CAMSS ISP node
Date:   Mon, 15 Mar 2021 16:59:47 +0100
Message-Id: <20210315155942.640889-21-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the camss dt node for sdm845.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v1:
 - Laurent: Fix subject
 - Laurent: Remove redundant regulator labels
 - Laurent: Remove empty line

Changes since v3:
 - Fixed ordering of IRQs
 - Add newlines for better readability

Changes since v5:
 - Andrey: Add r-b


 arch/arm64/boot/dts/qcom/sdm845.dtsi | 135 +++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..36cf4503664c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3909,6 +3909,141 @@ videocc: clock-controller@ab00000 {
 			#reset-cells = <1>;
 		};
 
+		camss: camss@a00000 {
+			compatible = "qcom,sdm845-camss";
+
+			reg = <0 0xacb3000 0 0x1000>,
+				<0 0xacba000 0 0x1000>,
+				<0 0xacc8000 0 0x1000>,
+				<0 0xac65000 0 0x1000>,
+				<0 0xac66000 0 0x1000>,
+				<0 0xac67000 0 0x1000>,
+				<0 0xac68000 0 0x1000>,
+				<0 0xacaf000 0 0x4000>,
+				<0 0xacb6000 0 0x4000>,
+				<0 0xacc4000 0 0x4000>;
+			reg-names = "csid0",
+				"csid1",
+				"csid2",
+				"csiphy0",
+				"csiphy1",
+				"csiphy2",
+				"csiphy3",
+				"vfe0",
+				"vfe1",
+				"vfe_lite";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "csid0",
+				"csid1",
+				"csid2",
+				"csiphy0",
+				"csiphy1",
+				"csiphy2",
+				"csiphy3",
+				"vfe0",
+				"vfe1",
+				"vfe_lite";
+
+			power-domains = <&clock_camcc IFE_0_GDSC>,
+				<&clock_camcc IFE_1_GDSC>,
+				<&clock_camcc TITAN_TOP_GDSC>;
+
+			clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+				<&clock_camcc CAM_CC_CPAS_AHB_CLK>,
+				<&clock_camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
+				<&clock_camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				<&clock_camcc CAM_CC_IFE_LITE_CSID_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSIPHY0_CLK>,
+				<&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				<&clock_camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSIPHY1_CLK>,
+				<&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				<&clock_camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSIPHY2_CLK>,
+				<&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				<&clock_camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSIPHY3_CLK>,
+				<&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				<&clock_camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
+				<&gcc GCC_CAMERA_AHB_CLK>,
+				<&gcc GCC_CAMERA_AXI_CLK>,
+				<&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				<&clock_camcc CAM_CC_SOC_AHB_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
+				<&clock_camcc CAM_CC_IFE_1_CLK>,
+				<&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				<&clock_camcc CAM_CC_IFE_1_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_LITE_CLK>,
+				<&clock_camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				<&clock_camcc CAM_CC_IFE_LITE_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				"cpas_ahb",
+				"cphy_rx_src",
+				"csi0",
+				"csi0_src",
+				"csi1",
+				"csi1_src",
+				"csi2",
+				"csi2_src",
+				"csiphy0",
+				"csiphy0_timer",
+				"csiphy0_timer_src",
+				"csiphy1",
+				"csiphy1_timer",
+				"csiphy1_timer_src",
+				"csiphy2",
+				"csiphy2_timer",
+				"csiphy2_timer_src",
+				"csiphy3",
+				"csiphy3_timer",
+				"csiphy3_timer_src",
+				"gcc_camera_ahb",
+				"gcc_camera_axi",
+				"slow_ahb_src",
+				"soc_ahb",
+				"vfe0_axi",
+				"vfe0",
+				"vfe0_cphy_rx",
+				"vfe0_src",
+				"vfe1_axi",
+				"vfe1",
+				"vfe1_cphy_rx",
+				"vfe1_src",
+				"vfe_lite",
+				"vfe_lite_cphy_rx",
+				"vfe_lite_src";
+
+			iommus = <&apps_smmu 0x0808 0x0>,
+				 <&apps_smmu 0x0810 0x8>,
+				 <&apps_smmu 0x0c08 0x0>,
+				 <&apps_smmu 0x0c10 0x8>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		cci: cci@ac4a000 {
 			compatible = "qcom,sdm845-cci";
 			#address-cells = <1>;
-- 
2.27.0

