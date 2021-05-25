Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC275390530
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhEYPYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhEYPYX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:23 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8961C06138A;
        Tue, 25 May 2021 08:22:52 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id c20so48019462ejm.3;
        Tue, 25 May 2021 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+0RnuC0ooSmKbb5ieKew3Le7GefbjO/yixv4+FcIHvM=;
        b=cxIjQV0zVUw5vf1js/4y83zt1j+6OvDreHZ8pb3YEbmQnA15xZ1ZTT4czXaZqudf4K
         XR8yP1lZj+JTgWvccj1EzxFyfUOVKkb/lTBMEZ7iK/T4aXBRoDxTL2hvqOylzzXIFCDe
         qa1WJj64FbTeKjVt2Z9H4GuA+j2oKQrpGlHueLuJ+DePLBaO3EnCLV3JS/jEMac+CXip
         L52EpI37JtI6i/SumSYQM7+n0rvd9Z1e2VhPkc9eIpexE+Jl+71jVbFEx1kmTwRzZAJT
         vWKSc0rxiKazkohVWGXDTULu1Q7qQ0WlwA+uFE486o1qqPou30cuLQTJyqnJCckSzjvL
         UFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0RnuC0ooSmKbb5ieKew3Le7GefbjO/yixv4+FcIHvM=;
        b=g2bMRmTAK7/JMVDq18xRV5LOOLPFHzc0unFrCtdSUwp8+wvSfMqDnNFc23L5bl9Xoc
         R5FR6s8Cp67UryBFgXygqcVO5M16YQyMcPF96cnn5AMZIbKjWobOLRq75IRIeX6iaXGI
         PmNZAA6e0JoikWRJ+zi6rXTwzPmIoft5S2cEWFQX3zB99HkTtdBtFEoIAT3bnmHR3wUX
         vuhASZkGWJIvRz/dDpl46JAi1AJnl2Bqy6pXOv/vELi4PXMonkzYo4OxD+qe9s1UJ6tR
         1EhunQ3vUKa47d4LV9UsgMAADdR5yT5RT6tuytT9ks6rcJoHhWEFEYobBseIBA8mhoo8
         9GvA==
X-Gm-Message-State: AOAM531JmvL0nCeEl/8W7GkfrIodmfiEAYhd7oKfAxqRsBK6uUk3bB2k
        1KuGPRF9DUaBkJPRTJx1eg==
X-Google-Smtp-Source: ABdhPJyzY6ziOl4Z+B6Ig9qAMCAompJ0AbXRnqU9cfG8nRRbiIhL9veqPe0Mx+fa0rpCIP7b8jRWUw==
X-Received: by 2002:a17:906:c0c6:: with SMTP id bn6mr28208995ejb.436.1621956171343;
        Tue, 25 May 2021 08:22:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:51 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 02/10] ARM: dts: rockchip: add power controller for RK3036
Date:   Tue, 25 May 2021 17:22:17 +0200
Message-Id: <20210525152225.154302-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the power controller node and the correspondending qos nodes for
RK3036.
Also add the power-domain property to the nodes that are already
present.
Note: Since the regiser offsets of the axi interconnect QoS are missing
in the TRM (RK3036 TRM V1.0), they have been taken from vendor kernel.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rk3036.dtsi | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index 9ccefa8282ba..370dd03939c0 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rk3036-cru.h>
 #include <dt-bindings/soc/rockchip,boot-mode.h>
+#include <dt-bindings/power/rk3036-power.h>
 
 / {
 	#address-cells = <1>;
@@ -111,6 +112,7 @@ gpu: gpu@10090000 {
 		assigned-clock-rates = <100000000>;
 		clocks = <&cru SCLK_GPU>, <&cru SCLK_GPU>;
 		clock-names = "bus", "core";
+		power-domains = <&power RK3036_PD_GPU>;
 		resets = <&cru SRST_GPU>;
 		status = "disabled";
 	};
@@ -121,6 +123,7 @@ vop: vop@10118000 {
 		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_LCDC>, <&cru SCLK_LCDC>, <&cru HCLK_LCDC>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		power-domains = <&power RK3036_PD_VIO>;
 		resets = <&cru SRST_LCDC1_A>, <&cru SRST_LCDC1_H>, <&cru SRST_LCDC1_D>;
 		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vop_mmu>;
@@ -142,10 +145,26 @@ vop_mmu: iommu@10118300 {
 		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_LCDC>, <&cru HCLK_LCDC>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3036_PD_VIO>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
 
+	qos_gpu: qos@1012d000 {
+		compatible = "rockchip,rk3036-qos", "syscon";
+		reg = <0x1012d000 0x20>;
+	};
+
+	qos_vpu: qos@1012e000 {
+		compatible = "rockchip,rk3036-qos", "syscon";
+		reg = <0x1012e000 0x20>;
+	};
+
+	qos_vio: qos@1012f000 {
+		compatible = "rockchip,rk3036-qos", "syscon";
+		reg = <0x1012f000 0x20>;
+	};
+
 	gic: interrupt-controller@10139000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
@@ -301,6 +320,38 @@ grf: syscon@20008000 {
 		compatible = "rockchip,rk3036-grf", "syscon", "simple-mfd";
 		reg = <0x20008000 0x1000>;
 
+		power: power-controller {
+			compatible = "rockchip,rk3036-power-controller";
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			power-domain@RK3036_PD_VIO {
+				reg = <RK3036_PD_VIO>;
+				clocks = <&cru ACLK_LCDC>,
+					 <&cru HCLK_LCDC>,
+					 <&cru SCLK_LCDC>;
+				pm_qos = <&qos_vio>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3036_PD_VPU {
+				reg = <RK3036_PD_VPU>;
+				clocks = <&cru ACLK_VCODEC>,
+					 <&cru HCLK_VCODEC>;
+				pm_qos = <&qos_vpu>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3036_PD_GPU {
+				reg = <RK3036_PD_GPU>;
+				clocks = <&cru SCLK_GPU>;
+				pm_qos = <&qos_gpu>;
+				#power-domain-cells = <0>;
+			};
+
+		};
+
 		reboot-mode {
 			compatible = "syscon-reboot-mode";
 			offset = <0x1d8>;
-- 
2.27.0

