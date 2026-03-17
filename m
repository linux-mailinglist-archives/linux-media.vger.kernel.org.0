Return-Path: <linux-media+bounces-56015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO6AK44huWkrrwEAu9opvQ
	(envelope-from <linux-media+bounces-56015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:40:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2871D2A6FEA
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B57B83110343
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B065E3793D5;
	Tue, 17 Mar 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMaLkznE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2B737189E;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739944; cv=none; b=hqgsLeP7WORDqxyyZRqqzEDi8iDxoMh5KK1Mxtmgct0nWurvDwpiQgxw3ZFNFHyOFgGIu0X+h0gy7+FUr6HVLkmzPvKlAeq5Q7JtJKhclFaUbvd7LPfYkJaikFldonxtazyd0E1qUUvO/XNBbQnpZF3+ohouFQHjToRTtmYX/PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739944; c=relaxed/simple;
	bh=E+FPszRdejhinX/+jcYrzyDGa/sSKmQREurkfVw07l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqaQB5s085mDjioEHXyV2xK/zPaIt7K2zioHwCiSEgQG/z+eqN8LV+ZfNREAT6knHOO2qVMV0jylPHpPJjpyb7KCMvMyWYBwNFKrjNgVxabDs6WFC/ZbI/LBp+MzDIcnhPEpTDrgytFHFAS+0bgSbjf2Id7kSAL4gH/YlicB6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMaLkznE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6419FC2BCB1;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739944;
	bh=E+FPszRdejhinX/+jcYrzyDGa/sSKmQREurkfVw07l0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BMaLkznEgdJAHgH6vdLDg85V8SPx1JqSYJFfVeoZzR4Dwl0NIbXCl4LGxQP3nbPbk
	 aHcRD/IsmLiJx84LGfW3N2/KyhGOWYsL2ZQBxEN8cOBR7CRRemCNGKYQeYqSuVrLd3
	 ngdHfTvXjAc61w6soaTzuTC5eMV5dUsZR/9pEfmqr833w//G9drA8tcX7zT0MpJjK5
	 7XYtGKbWPcWI0kDjeeAB5U/dUZYyd144teL4/VTiykRI6hp+E+bI6AvbVW5PqPHQ2C
	 Bf6zkTY+mme3sXbz5GxpZ7gYVHSS74az9OonccLTizh4rdDZ58Zdv7BCcG6SUoAeG2
	 SdTpS/RpkLMEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575DBF3382A;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Mar 2026 10:32:26 +0100
Subject: [PATCH v2 8/9] arm64: dts: rockchip: add radxa camera 4k on rock
 5b+ cam1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v2-8-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=3967;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=/xz9Ovdx8s36O++AwAB8xnz6JsWAcvoIzDlRdwqiUzw=;
 b=k70GfUEwfQXAxmBZBbhrYlw6Q2J4Gj6ZtvJ5mdxNWq6jLN+ynr+onqXffiwsu20Im2vdI02ZY
 EMzIgP/gFONDXGHFrlGU2R4vzB1xdIKsgFlanm5/1BBhawxpuSGcF6H
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56015-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1a:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,collabora.com:replyto,collabora.com:mid]
X-Rspamd-Queue-Id: 2871D2A6FEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

Add device tree overlay for the Radxa Camera 4K (featuring the
Sony IMX415 image sensor) to applied on the Radxa ROCK 5B+
CAM1 port.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  4 +-
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 89 ++++++++++++++++++++++
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 77c587f43dda..191666821a80 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -200,6 +200,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam1.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
@@ -301,7 +302,8 @@ rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
 
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-4k-cam.dtb
 rk3588-rock-5b-plus-radxa-4k-cam-dtbs := rk3588-rock-5b-plus.dtb \
-	rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
+	rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo \
+	rk3588-rock-5b-plus-radxa-cam4k-cam1.dtbo
 
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-haikou-video-demo.dtb
 rk3588-tiger-haikou-haikou-video-demo-dtbs := rk3588-tiger-haikou.dtb \
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
new file mode 100644
index 000000000000..8e586950d0c0
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for the Radxa Camera 4K attached to the CAM1 port of
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
+	vcc_cam1: regulator-vcc-cam1 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam1_power0_en>;
+		regulator-name = "vcc_cam1";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	cam1_imx415: camera-sensor@1a {
+		compatible = "sony,imx415";
+		reg = <0x1a>;
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M4>;
+		assigned-clock-rates = <37125000>;
+		avdd-supply = <&vcc_cam1>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M4>;
+		dvdd-supply = <&vcc_cam1>;
+		orientation = <2>; /* External */
+		ovdd-supply = <&vcc_cam1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam1_rstn &mipim0_camera4_clk>;
+		reset-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
+
+		port {
+			cam1_imx415_output: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <445500000>;
+				remote-endpoint = <&csi4_input>;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	cam1 {
+		cam1_power0_en: cam1-power0-en-pinctrl {
+			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cam1_rstn: cam1-rstn-pinctrl {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&csi4 {
+	status = "okay";
+};
+
+&csi4_in {
+	csi4_input: endpoint {
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <445500000>;
+		remote-endpoint = <&cam1_imx415_output>;
+	};
+};
+
+&csi_dphy1 {
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
2.39.5



