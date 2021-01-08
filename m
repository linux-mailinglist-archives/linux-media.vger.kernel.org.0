Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FC72EF1FC
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 13:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbhAHMHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 07:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbhAHMHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 07:07:07 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1EEC061239
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 04:05:26 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id jx16so14144409ejb.10
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 04:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zenOUjj7fqdHVMcIyrfHAw9wRuBqaP3SJknWkeDXfZ8=;
        b=wlIwJPCQ24PZZzMz7cbeyPcdVaAXTz2foB4Kk3y1hwQQaCWNLA9TMXqy0ZEgVpjIcI
         BAVKvvWTu2JAjoh/y4A9/ZF1j1Cv7UqH21XCIPiPG07/W+OfykDUoHwxfmb4j8K5j1A+
         q9J3w1mlhE52BUcRq60nL475yHfh1cWN5bVeiow+FsuFipdIXzq1mDUj+SvPZCDL6VNd
         IsFKvRImamxAGNT/cM/p2xy+45yjFGnFB79ZvIKs9he/KWPbpTGgphC13ZLplo5wAsOS
         fM9dbs5uwQOqvmh1ZibfZTUe/MJEGuF+EcQnV3tWkVC18UuwyMO0pWDyV9Ju8tFDzeSY
         YI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zenOUjj7fqdHVMcIyrfHAw9wRuBqaP3SJknWkeDXfZ8=;
        b=PPEmLPZWEWwJz3JTtqMKCcc4dsAS9fUk6gDn0/dBycUHyJv02K5ioji78LNO14WMDG
         h+GwCLdfBhCRf4RhSCRUgarddsEyhOqwISMlKCKFbkF1UEEnPvcPMxyctGHoK8jC8lSP
         tsC4v81zPvoeFtWzfmjP+u8kPIJPDLODAIrAtxMzgVmuL1+nbFbbh/XoQ2NyXEg0zwvK
         UaGNXWG0XtlVTIOWh1Ahfv4LBUv9OjVbrA1khrYEwbCwE4NFIF3Y72zknBkVah7yc03C
         5gOIcNi3KdenZoUSzd0t+UmlqoypkB8IJIrc91FUo9eFVvqn2N29HpqWpZDy7toniHAf
         nNnw==
X-Gm-Message-State: AOAM530vTxuUTezhRggWT7xFH+ENMO2aOEb+8/lJ7T/u5dUyAlgJ2ytT
        2kfwZoKfQeSQFl6lNdWphvdksw==
X-Google-Smtp-Source: ABdhPJxl9WfyVp6H/rTQvYjnxl/ja0oMdb2MwIl78avaRgObY2HfUd3MYDBplw/hgwc4vfoGcbasVw==
X-Received: by 2002:a17:906:3513:: with SMTP id r19mr2349595eja.445.1610107524864;
        Fri, 08 Jan 2021 04:05:24 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:05:24 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 15/17] arm64: dts: sdm845: Add CAMSS ISP node
Date:   Fri,  8 Jan 2021 13:04:27 +0100
Message-Id: <20210108120429.895046-16-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the camss dt node for sdm845.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 151 +++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bcf888381f14..286d50fcd9a5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3911,6 +3911,157 @@ videocc: clock-controller@ab00000 {
 			#reset-cells = <1>;
 		};
 
+		camss: camss@a00000 {
+			compatible = "qcom,sdm845-camss";
+			reg = <0 0xac65000 0 0x1000>,
+				<0 0xac66000 0 0x1000>,
+				<0 0xac67000 0 0x1000>,
+				<0 0xac68000 0 0x1000>,
+				<0 0xacb3000 0 0x1000>,
+				<0 0xacba000 0 0x1000>,
+				<0 0xacc8000 0 0x1000>,
+				<0 0xacaf000 0 0x4000>,
+				<0 0xacb6000 0 0x4000>,
+				<0 0xacc4000 0 0x4000>;
+			reg-names = "csiphy0",
+				"csiphy1",
+				"csiphy2",
+				"csiphy3",
+				"csid0",
+				"csid1",
+				"csid2",
+				"vfe0",
+				"vfe1",
+				"vfe_lite";
+			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "csiphy0",
+				"csiphy1",
+				"csiphy2",
+				"csiphy3",
+				"csid0",
+				"csid1",
+				"csid2",
+				"vfe0",
+				"vfe1",
+				"vfe_lite";
+			power-domains = <&clock_camcc IFE_0_GDSC>,
+					<&clock_camcc IFE_1_GDSC>,
+					<&clock_camcc TITAN_TOP_GDSC>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				<&gcc GCC_CAMERA_AXI_CLK>,
+				<&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+				<&clock_camcc CAM_CC_CPAS_AHB_CLK>,
+				<&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				<&clock_camcc CAM_CC_SOC_AHB_CLK>,
+				<&clock_camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSIPHY0_CLK>,
+				<&clock_camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				<&clock_camcc CAM_CC_CSIPHY1_CLK>,
+				<&clock_camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				<&clock_camcc CAM_CC_CSIPHY2_CLK>,
+				<&clock_camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				<&clock_camcc CAM_CC_CSIPHY3_CLK>,
+				<&clock_camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
+				<&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
+				<&clock_camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
+				<&clock_camcc CAM_CC_IFE_1_CLK>,
+				<&clock_camcc CAM_CC_IFE_1_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				<&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
+				<&clock_camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_LITE_CLK>,
+				<&clock_camcc CAM_CC_IFE_LITE_CLK_SRC>,
+				<&clock_camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				<&clock_camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				<&clock_camcc CAM_CC_IFE_LITE_CSID_CLK_SRC>;
+			clock-names = "gcc_camera_ahb",
+				"gcc_camera_axi",
+				"camnoc_axi",
+				"cpas_ahb",
+				"slow_ahb_src",
+				"soc_ahb",
+				"cphy_rx_src",
+				"csiphy0",
+				"csiphy0_timer_src",
+				"csiphy0_timer",
+				"csiphy1",
+				"csiphy1_timer_src",
+				"csiphy1_timer",
+				"csiphy2",
+				"csiphy2_timer_src",
+				"csiphy2_timer",
+				"csiphy3",
+				"csiphy3_timer_src",
+				"csiphy3_timer",
+				"vfe0_axi",
+				"vfe0",
+				"vfe0_src",
+				"vfe0_cphy_rx",
+				"csi0", /* renamed to fit naming-scheme of older hardware */
+				"csi0_src", /* renamed to fit naming-scheme of older hardware */
+				"vfe1_axi",
+				"vfe1",
+				"vfe1_src",
+				"vfe1_cphy_rx",
+				"csi1", /* renamed to fit naming-scheme of older hardware */
+				"csi1_src", /* renamed to fit naming-scheme of older hardware */
+				"vfe_lite",
+				"vfe_lite_src",
+				"vfe_lite_cphy_rx",
+				"csi2", /* renamed to fit naming-scheme of older hardware */
+				"csi2_src"; /* renamed to fit naming-scheme of older hardware */
+
+			iommus = <&apps_smmu 0x0808 0x0>,
+				 <&apps_smmu 0x0810 0x8>,
+				 <&apps_smmu 0x0c08 0x0>,
+				 <&apps_smmu 0x0c10 0x8>;
+			status = "disabled";
+
+			interconnects =
+				<&gladiator_noc MASTER_APPSS_PROC
+				 &config_noc SLAVE_CAMERA_CFG>,
+				<&mmss_noc MASTER_CAMNOC_HF0
+				 &mmss_noc SLAVE_EBI1>,
+				<&mmss_noc MASTER_CAMNOC_HF0_UNCOMP
+				 &mmss_noc SLAVE_CAMNOC_UNCOMP>,
+				<&mmss_noc MASTER_CAMNOC_HF1
+				 &mmss_noc SLAVE_EBI1>,
+				<&mmss_noc MASTER_CAMNOC_HF1_UNCOMP
+				 &mmss_noc SLAVE_CAMNOC_UNCOMP>,
+				<&mmss_noc MASTER_CAMNOC_SF
+				 &mmss_noc SLAVE_EBI1>,
+				<&mmss_noc MASTER_CAMNOC_SF_UNCOMP
+				 &mmss_noc SLAVE_CAMNOC_UNCOMP>;
+			interconnect-names = "cam_ahb",
+				"hf_1_mnoc", "hf_1_camnoc",
+				"hf_2_mnoc", "hf_2_camnoc",
+				"sf_1_mnoc", "sf_1_camnoc";
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

