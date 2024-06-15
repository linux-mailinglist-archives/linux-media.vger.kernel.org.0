Return-Path: <linux-media+bounces-13294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33984909576
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 03:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EEF31C20CB5
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 01:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD2E15AC4;
	Sat, 15 Jun 2024 01:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xX7O7lql"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9EF107A0;
	Sat, 15 Jun 2024 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718416710; cv=none; b=OIDkWjcCATH8yr0BiNn7WOh3x5tiN9Pl/7oZKZelDpnCyQU738FIKC21RasIbf4XbgbEEoTkSwCg8R/bV9A+xBCKVEUP2wIVs30egeTdgoi/7Cn1z/UmIbD0phXhqxOeBcT4dmnSA7QflpK1A0g+ZgJaLOxwtdE4jaqR8QxnkNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718416710; c=relaxed/simple;
	bh=lk/SGaXH3eWpr32pis0Vh/iqYeLju2pSXUZws1AEuts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpHcvLdGjTa864nrFhNfbIsc4oREdYzqeLbQMQjuyo1yltjUA5tQV0Zuy6IDt/YuMdfIZon/Az2Wz6I6HIMYzXYXzghhqQ9+EMnOJA9S1FbOkY5AXazweTkKkRMd4VLjfXv4JAGH/5ETqMkRwR7lEXtcw6q2Qg4W4+OE4+eaNok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=xX7O7lql; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718416707;
	bh=lk/SGaXH3eWpr32pis0Vh/iqYeLju2pSXUZws1AEuts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xX7O7lqlEpm3V8Y+fTQ0jjcCZVt3BsOgSg/Mpcpbtx2FBJ02E0eCC7ntl8vyKmJWv
	 We6bEMBmijAKJxMQm5wa+rEbie3bWk969L9S3Ys888TCm9EMN/4QBWgQGvFrJ2FNwj
	 10fxgLq9RbQj+ijOquaYrw+ZOTZaObiI0gnm2N5asz45PssmvkokvTpHSncNCd226c
	 bFx/RgDBQ8fow5a3SFv5eKleg5H7/4JWV4TquHryVFXEdNDv2P20lYk5j5yY2BU2zd
	 aTXnNc25K6eKd0YD/Wtr0UiaTD3dADSVUiyu0MHvg8XgAjNu2uRTkJzTrrUanKM/Tt
	 s+goGcga1ZXyg==
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5187E37821C7;
	Sat, 15 Jun 2024 01:58:24 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)
Date: Fri, 14 Jun 2024 21:56:29 -0400
Message-ID: <20240615015734.1612108-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240615015734.1612108-1-detlev.casanova@collabora.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the rkvdec2 Video Decoder to the RK3588s devicetree.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |  4 ++++
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 19 +++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index c551b676860c..965322c24a65 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -503,6 +503,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&rkvdec0 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
index feea6b20a6bf..2828fb4c182a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
@@ -321,6 +321,10 @@ typec5v_pwren: typec5v-pwren {
 	};
 };
 
+&rkvdec0 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 0fecbf46e127..09672636dcea 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -3034,6 +3034,9 @@ system_sram2: sram@ff001000 {
 		ranges = <0x0 0x0 0xff001000 0xef000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		rkvdec0_sram: rkvdec-sram@0 {
+			reg = <0x0 0x78000>;
+		};
 	};
 
 	pinctrl: pinctrl {
@@ -3103,6 +3106,22 @@ gpio4: gpio@fec50000 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	rkvdec0: video-decoder@fdc38100 {
+		compatible = "rockchip,rk3588-vdec2";
+		reg = <0x0 0xfdc38100 0x0 0x500>;
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
+			 <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
+		clock-names = "axi", "ahb", "core",
+			      "cabac", "hevc_cabac";
+		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
+				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
+		assigned-clock-rates = <800000000>, <600000000>,
+				       <600000000>, <1000000000>;
+		power-domains = <&power RK3588_PD_RKVDEC0>;
+		status = "disabled";
+	};
 };
 
 #include "rk3588s-pinctrl.dtsi"
-- 
2.44.2


