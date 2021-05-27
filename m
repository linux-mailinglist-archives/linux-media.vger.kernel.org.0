Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7743932C0
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235560AbhE0PrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235767AbhE0PrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:47:02 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C75C061760;
        Thu, 27 May 2021 08:45:27 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id l3so846547ejc.4;
        Thu, 27 May 2021 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jjQPNqCTQeoJb7uBaprnmexAqxorLpiei4HoVtvtIYE=;
        b=TEf5M4grrCab6c7TWDS9Lg204KTx46/X8XZXDM6EYt3Ml+pQozoNl3JnkFTq/veML1
         12idKeMGDbopUxn2iuYLEMbFdjSFUvGe7BPxC5TGk+JtCxZ66RD2h1Jbgs4YQqGm79NS
         omIuQ7MVtaF+jN4Gq/cuSTD4SfcARykuj8Ex+MfRAR2S6Uj2PjetLEad6+9Ygj02HLWQ
         jaFIcpHZUW3aCVOPKt4+L2dY/8vmGCMNxBvR+b4VK68H/u0eN5MiGcEqIzv9+YAXI/9N
         WX9stbJ9u5HD9en2ya3SrPyCmikv+tPLGsDKoQCwQGRO0yLVmQ+LyDZYHm839lWQ3cjl
         2Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jjQPNqCTQeoJb7uBaprnmexAqxorLpiei4HoVtvtIYE=;
        b=ZTOXMBwpDw8eyFHHIlUId7+AG5MYaRq7elzPogEiFBbu2Lgo2avccp9HQBNrJiPlWM
         dTV7SfJL2chd1u9kSj7ptCmVoVWEgeit9AIWg4cP/+LLm8zLj/qZ6mQKiRbQwlS9o/fw
         ks91rwTiaupkGdVCz1CSdt7hd5BDwO13hICHsuX6rWQUvk2T3EmQ+daC0QUHsolV0EFN
         aRy3wc97zssTo6ia7Y8yPIN9qarZZClMwoXfV50DYX0RBcMfLAYkfNr9lRK7PkirS16r
         yS0+nwPb1QWWJPUaWhk0i3V5Pi5cdMmkVAyV66qXYm808Oo/OkR3+6IEoip80seH8YPo
         mZEg==
X-Gm-Message-State: AOAM530cTykPH/vlyrRZYDyV0dlk9tuBylVPi4HNtaVOFzlfgbaK5jqF
        sfSzEGKUIGfqD5UeZXQFJg==
X-Google-Smtp-Source: ABdhPJwknc0otwdXSFU0TLh7Bli4AZ5uIWD9znY6x2LsbNvmWlSzxgIxFDL9ll/Iy3i7ljzpAGH+Gg==
X-Received: by 2002:a17:906:fc4:: with SMTP id c4mr4760038ejk.111.1622130326371;
        Thu, 27 May 2021 08:45:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:26 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/12] ARM: dts: rockchip: add power controller for RK322x
Date:   Thu, 27 May 2021 17:44:52 +0200
Message-Id: <20210527154455.358869-10-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the power controller node and the correspondending qos nodes for
RK322x.
Also add the power-domain property to the nodes that are already
present.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - moved power node to appropriate position
 - added #power-domain-cells for RK3228_PD_GPU
 - moved power-domains property after iommous property

 arch/arm/boot/dts/rk322x.dtsi | 113 ++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 5774bc309eb7..42033909c606 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rk3228-cru.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/power/rk3228-power.h>
 
 / {
 	#address-cells = <1>;
@@ -190,6 +191,65 @@ io_domains: io-domains {
 			status = "disabled";
 		};
 
+		power: power-controller {
+			compatible = "rockchip,rk3228-power-controller";
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			power-domain@RK3228_PD_VIO {
+				reg = <RK3228_PD_VIO>;
+				clocks = <&cru ACLK_HDCP>,
+					 <&cru SCLK_HDCP>,
+					 <&cru ACLK_IEP>,
+					 <&cru HCLK_IEP>,
+					 <&cru ACLK_RGA>,
+					 <&cru HCLK_RGA>,
+					 <&cru SCLK_RGA>;
+				pm_qos = <&qos_hdcp>,
+					 <&qos_iep>,
+					 <&qos_rga_r>,
+					 <&qos_rga_w>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3228_PD_VOP {
+				reg = <RK3228_PD_VOP>;
+				clocks =<&cru ACLK_VOP>,
+					<&cru DCLK_VOP>,
+					<&cru HCLK_VOP>;
+				pm_qos = <&qos_vop>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3228_PD_VPU {
+				reg = <RK3228_PD_VPU>;
+				clocks = <&cru ACLK_VPU>,
+					 <&cru HCLK_VPU>;
+				pm_qos = <&qos_vpu>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3228_PD_RKVDEC {
+				reg = <RK3228_PD_RKVDEC>;
+				clocks = <&cru ACLK_RKVDEC>,
+					 <&cru HCLK_RKVDEC>,
+					 <&cru SCLK_VDEC_CABAC>,
+					 <&cru SCLK_VDEC_CORE>;
+				pm_qos = <&qos_rkvdec_r>,
+					 <&qos_rkvdec_w>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3228_PD_GPU {
+				reg = <RK3228_PD_GPU>;
+				clocks = <&cru ACLK_GPU>;
+				pm_qos = <&qos_gpu>;
+				#power-domain-cells = <0>;
+			};
+
+		};
+
 		u2phy0: usb2-phy@760 {
 			compatible = "rockchip,rk3228-usb2phy";
 			reg = <0x0760 0x0c>;
@@ -240,6 +300,7 @@ u2phy1_host: host-port {
 				status = "disabled";
 			};
 		};
+
 	};
 
 	uart0: serial@11010000 {
@@ -546,6 +607,7 @@ gpu: gpu@20000000 {
 				  "ppmmu1";
 		clocks = <&cru ACLK_GPU>, <&cru ACLK_GPU>;
 		clock-names = "bus", "core";
+		power-domains = <&power RK3228_PD_GPU>;
 		resets = <&cru SRST_GPU_A>;
 		status = "disabled";
 	};
@@ -556,6 +618,7 @@ vpu_mmu: iommu@20020800 {
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3228_PD_VPU>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
@@ -566,6 +629,7 @@ vdec_mmu: iommu@20030480 {
 		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3228_PD_RKVDEC>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
@@ -579,6 +643,7 @@ vop: vop@20050000 {
 		resets = <&cru SRST_VOP_A>, <&cru SRST_VOP_H>, <&cru SRST_VOP_D>;
 		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vop_mmu>;
+		power-domains = <&power RK3228_PD_VOP>;
 		status = "disabled";
 
 		vop_out: port {
@@ -598,6 +663,7 @@ vop_mmu: iommu@20053f00 {
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3228_PD_VOP>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
@@ -608,6 +674,7 @@ rga: rga@20060000 {
 		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA>;
 		clock-names = "aclk", "hclk", "sclk";
+		power-domains = <&power RK3228_PD_VIO>;
 		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
 		reset-names = "core", "axi", "ahb";
 	};
@@ -618,6 +685,7 @@ iep_mmu: iommu@20070800 {
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_IEP>, <&cru HCLK_IEP>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3228_PD_VIO>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
@@ -792,6 +860,51 @@ gmac: ethernet@30200000 {
 		status = "disabled";
 	};
 
+	qos_iep: qos@31030080 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31030080 0x20>;
+	};
+
+	qos_rga_w: qos@31030100 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31030100 0x20>;
+	};
+
+	qos_hdcp: qos@31030180 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31030180 0x20>;
+	};
+
+	qos_rga_r: qos@31030200 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31030200 0x20>;
+	};
+
+	qos_vpu: qos@31040000 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31040000 0x20>;
+	};
+
+	qos_gpu: qos@31050000 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31050000 0x20>;
+	};
+
+	qos_vop: qos@31060000 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31060000 0x20>;
+	};
+
+	qos_rkvdec_r: qos@31070000 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31070000 0x20>;
+	};
+
+	qos_rkvdec_w: qos@31070080 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31070080 0x20>;
+	};
+
 	gic: interrupt-controller@32010000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
-- 
2.27.0

