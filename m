Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BEE305EFD
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 16:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbhA0PCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 10:02:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235254AbhA0O7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 09:59:35 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEABC061756
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 06:50:58 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id g3so3031598ejb.6
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qzLb3dT6AIr5kPF+4l03iCTcZCFsRv3qi5VvG9xB0Vk=;
        b=iI0fI7qSlWkJI34fsGIipcCElN7s+olGORAKPT4kHnmgovhq8eWOpD6Sr+kDkATRhY
         2AaMUp1sWtFATvIJlWgdqPxH0z5MOT58N26M0RNI5wsNUoXRt9o1uqiFkFh28o9vyhDe
         rTUv1YYy/1pjeTKX6I6qqYlmV6v5zrW1C3I+4xmid84eUw/aSJaVH8n9CUzwU2Ekn5BZ
         uP6ZfK/Rk8JE6zQYLXRzckZTW+Ev/s1tLlpa6Vse2420dTHmneqYWpW+X838LgtotTzu
         ihIJ8TN+Lc3fACIG6E+yj0H3zs8kTVXUq3+KW61B6cPGFEEaEW82fRYrTsme8opZL+Zh
         l81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qzLb3dT6AIr5kPF+4l03iCTcZCFsRv3qi5VvG9xB0Vk=;
        b=nf9z5HDAzPq66pg4nW4iHbQluWQjNEDGGPAm4Qza5RPGAGqXxz59LgHcfVmokPcMV/
         UjujjMXmCtMFa1ApZWIyhwX1uz6IxYPJOzuPRjdftbZrsR08F+C3FuyOFtgY63yTHEHy
         mT+CXLvbYtu8GcHeoTPy54+DzTJKtx3JKzJpdpJ9YfjmzVJkbicfZWZd7CeD7LqfCjpw
         sQDfFC5I6JAa0p/ZAvJ7kACCJ9kRWCq1hZdMJWozCjCHETkLgSSDG0igRTy4HsP54irZ
         DqwbMsISfB01CZlug9h4dS7M70GHb4P+3Aje3CAiVXPeVuDysG7825x3xsBQF9yy5pLa
         f8eQ==
X-Gm-Message-State: AOAM533wP4/6diFj6+y1/2YzTHZWt8S1XvWYNCu4hQNk9fV378j1or/9
        0NJhsMVytZ2hdtt6iDzad5iIvQ==
X-Google-Smtp-Source: ABdhPJw7orAlQeQEvopJ58JhnO4qHgly4zS3eHtvLSSgKkhExZEkEsURwA+kDEQnaM0YnvJWlto1hQ==
X-Received: by 2002:a17:906:7b8d:: with SMTP id s13mr7017238ejo.479.1611759057404;
        Wed, 27 Jan 2021 06:50:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:62e7:589a:1625:7acc])
        by smtp.gmail.com with ESMTPSA id ah12sm947799ejc.70.2021.01.27.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:50:56 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v3 20/22] arm64: dts: sdm845: Add CAMSS ISP node
Date:   Wed, 27 Jan 2021 15:49:28 +0100
Message-Id: <20210127144930.2158242-21-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127144930.2158242-1-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the camss dt node for sdm845.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1
 - Laurent: Fix subject
 - Laurent: Remove redundant regulator labels
 - Laurent: Remove empty line


 arch/arm64/boot/dts/qcom/sdm845.dtsi | 130 +++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bcf888381f14..1ead2c77d068 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3911,6 +3911,136 @@ videocc: clock-controller@ab00000 {
 			#reset-cells = <1>;
 		};
 
+		camss: camss@a00000 {
+			compatible = "qcom,sdm845-camss";
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
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
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
+			power-domains = <&clock_camcc IFE_0_GDSC>,
+				<&clock_camcc IFE_1_GDSC>,
+				<&clock_camcc TITAN_TOP_GDSC>;
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

