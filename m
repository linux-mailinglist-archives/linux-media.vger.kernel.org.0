Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7EC3932BD
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236898AbhE0PrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235747AbhE0PrB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:47:01 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F82C061763;
        Thu, 27 May 2021 08:45:26 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id f18so787206ejq.10;
        Thu, 27 May 2021 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LhbeDQNh446HkvhryvJVLbpk8j2uXvVEVcUkEuMHp2E=;
        b=FTTHLnFIpjK1cPpPtSC1xxfNnPb+BTJoSy4RBqhZ9LnS3jCXY3cJC7Msfwa5eCWWN+
         n9iJBvmcwloq5Hi3lMdjbDRhJyCs/4JQs3xeXUwm3nh4/XUzQxQhMrAcW27USTVZ12n0
         zeoccaf4855F4n8GvPahZpMxn9g3JzwyVV87n2yNckq//D7L3U4qG66a3aWX7NiwU/FA
         LbAKiYKtrRgaNSTj6lh+pnW7JfMBYcxnzENvZnz6X44QRLP0mifoqMIBN9VjYxtOMFVB
         EY4jttESEbgs7ipEK5z2a5643TnWz9HxaZMRAdBORuKIsQvOoj9Y9OENX5YRq9XhYxww
         Ixhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LhbeDQNh446HkvhryvJVLbpk8j2uXvVEVcUkEuMHp2E=;
        b=DYAT3Ib4Te0Zgsq3NjXRperHG+/VHmEyNd3eE8tFeuHNF3/cWugNpxYzhGliuZ+Z5v
         kzSKvmEPiebsdAeCpL9Q6lXcGjyhe9S2jlfLJ/9pBUcpgX2ba6iJZAwmO5GCuJAfSwNm
         is9TWYKmq/naxRjGWEYTSOdGtJ2aO2cQtSy6ilO/yNl6KnsQzbw/mGNX8JgbbiOB1Uju
         nETii/EUj/oUNXyFuoS8GiOAU20hiHQobGXGJXl/d7h9XF9fol6WEqnmNxo25lUQPMoZ
         hp8fV6LJMO5WYjYedeCGQ0qG/xZWKarzxjg6L2FjNven4RlQucermlCgEPy1EOhT2NvQ
         YkeQ==
X-Gm-Message-State: AOAM533lXqZJaNLFHgICRHJGPc5xSutq9z/ceuaqyb228klnNksO/T0o
        NAOaN4P+NVrE9Ybla4+Ep3M2a0I1/ghx
X-Google-Smtp-Source: ABdhPJxjTFNjhfpg3rolbz+my5h7GjiFMYspdhCyqZehvxpDPM6Pu3T20eVZaIpo6PThuHYTyYlGuA==
X-Received: by 2002:a17:906:5d0a:: with SMTP id g10mr4425737ejt.349.1622130325404;
        Thu, 27 May 2021 08:45:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:25 -0700 (PDT)
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
Subject: [PATCH v2 08/12] ARM: dts: rockchip: add power controller for RK3036
Date:   Thu, 27 May 2021 17:44:51 +0200
Message-Id: <20210527154455.358869-9-knaerzche@gmail.com>
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
RK3036.
Also add the power-domain property to the nodes that are already
present.
Note: Since the regiser offsets of the axi interconnect QoS are missing
in the TRM (RK3036 TRM V1.0), they have been taken from vendor kernel.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - moved power-domains property after iommus-property

 arch/arm/boot/dts/rk3036.dtsi | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index 9ccefa8282ba..76ab663eccf7 100644
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
@@ -124,6 +126,7 @@ vop: vop@10118000 {
 		resets = <&cru SRST_LCDC1_A>, <&cru SRST_LCDC1_H>, <&cru SRST_LCDC1_D>;
 		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vop_mmu>;
+		power-domains = <&power RK3036_PD_VIO>;
 		status = "disabled";
 
 		vop_out: port {
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

