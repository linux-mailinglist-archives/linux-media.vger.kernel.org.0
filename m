Return-Path: <linux-media+bounces-62650-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGyvMAbKEGpAdwYAu9opvQ
	(envelope-from <linux-media+bounces-62650-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:26:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF45BA6BA
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CD68301DC79
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6736A3914E9;
	Fri, 22 May 2026 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNG6Kc9D"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC3F38AC96;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484998; cv=none; b=QWaoB5VssTKiRuyvSNewtLUTz5gtJjNtKdjFAGpRJXZSQNUXwCDvzNoYThD/9TV7yH9m6N5YRdmH4dynApHw6B5CZrEUHJmARsQPtwaxpXK45c/bZsSy2/q2v+A4IziYs/+wIEImGK5cQQil7FqSwwEtDE6Y2hXfzJkm4H58fmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484998; c=relaxed/simple;
	bh=5GdndQH11O0jnQvspCfNA/O+zyU14vg0pR6Vqar72vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUi60vHiHxsrT4lpT6Da4WNHaWVI1Nsk+em4FCHvBjFAclivZYoVWAzg9wx7XLjR9IyZWwFOY08a8tqVsb1jQLwdPaQu3DywBweCTHKgI8rCydr/t6sO2CDVdVwlsYxzrwR21ycYLKec524UVlnYheceVvNUL6uPXxGlgmxV7qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNG6Kc9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19F89C2BCC6;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779484997;
	bh=5GdndQH11O0jnQvspCfNA/O+zyU14vg0pR6Vqar72vk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RNG6Kc9DQB/BK3j7ylCU+8Q11VmJe/exGVVJTG6T57SuKM9jWRzWwg2kIWfRXIbaY
	 6hPgzuJytHdAUbtuKrzW0t5HB38w1Ae4zLBI1sbRY8G73oMeWN8EIWMUN/XoEc7Lxe
	 6MKV2E4nt2yz0apC26wbC5A+jNtUEnOYTdXA9cpIzkXAz1fYPCXsiS/rOQKL5Ruazh
	 8W17CiE98drOKEnvn+WJ9bm4oO7Vq2qtApVpPUuYTafrxOkKpjsLCai0cXRoBj5LjC
	 JHpaTWrz7Nc2HxfKz37YMSSLhkjTJk77ver563IdJAqSJCaumG9Oscb5ahr0ebDL4u
	 aNWhbG/i5lKnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104D3CD5BB3;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 22 May 2026 23:23:12 +0200
Subject: [PATCH v5 6/8] arm64: dts: rockchip: add radxa camera 4k on rock
 5b+ cam0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rk3588-vicap-v5-6-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
In-Reply-To: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779484994; l=4379;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=3FVePkpPkw9zXNZmHFNf4wZoNKo/VGldfB5CgIPNdtw=;
 b=dXlPWHRhG7N7qb1aI6XvzLAM05XK0ttu4qAeAF2h57WMpeIbuiImP0+prMxXejmCJP5dLTbiA
 jKNx1T6L1CVC/GsMirVc7ClOPrcxHGNxMS73Q4pAD+YbooRpn2Xltzk
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62650-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,1a:email,collabora.com:replyto,collabora.com:mid,collabora.com:email]
X-Rspamd-Queue-Id: C2DF45BA6BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

Add device tree overlay for the Radxa Camera 4K (featuring the Sony IMX415
image sensor) to applied on the Radxa ROCK 5B+ CAM0 port.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 99 ++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cb55c6b70d0e569abd9efc4e88ff908b6a682cf1..d4ff476fb9814b18c74c6d59d73cf5d8e6ee9ca7 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -206,6 +206,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
@@ -321,6 +322,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
 rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
 	rk3588-rock-5b-pcie-srns.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-4k-cam.dtb
+rk3588-rock-5b-plus-radxa-4k-cam-dtbs := rk3588-rock-5b-plus.dtb \
+	rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-haikou-video-demo.dtb
 rk3588-tiger-haikou-haikou-video-demo-dtbs := rk3588-tiger-haikou.dtb \
 	rk3588-tiger-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..ee9ecf68a88663a04e1c33a718894490ef475203
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for the Radxa Camera 4K attached to the CAM0 port of
+ * the Radxa ROCK 5B+.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/rockchip,rk3588-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	savdd_cam0: regulator-savdd-cam0 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-name = "savdd_cam0";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	sdvdd_cam0: regulator-sdvdd-cam0 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-name = "sdvdd_cam0";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	siovdd_cam0: regulator-siovdd-cam0 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "siovdd_cam0";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx415: camera-sensor@1a {
+		compatible = "sony,imx415";
+		reg = <0x1a>;
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
+		assigned-clock-rates = <37125000>;
+		avdd-supply = <&savdd_cam0>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
+		dvdd-supply = <&sdvdd_cam0>;
+		orientation = <2>; /* External */
+		ovdd-supply = <&siovdd_cam0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_rstn &mipim0_camera3_clk>;
+		reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+
+		port {
+			imx415_output: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <445500000>;
+				remote-endpoint = <&csi2_input>;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	cam0 {
+		cam0_rstn: cam0-rstn-pinctrl {
+			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&csi2 {
+	status = "okay";
+};
+
+&csi2_in {
+	csi2_input: endpoint {
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <445500000>;
+		remote-endpoint = <&imx415_output>;
+	};
+};
+
+&csi_dphy0 {
+	status = "okay";
+};
+
+&vicap {
+	status = "okay";
+};
+
+&vicap_mmu {
+	status = "okay";
+};

-- 
2.47.3



