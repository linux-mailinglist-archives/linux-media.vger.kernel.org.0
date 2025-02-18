Return-Path: <linux-media+bounces-26311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD94A3A62A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 19:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A00A1896DFB
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 18:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F0B27424C;
	Tue, 18 Feb 2025 18:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="KezsOagY"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCFA1F5844;
	Tue, 18 Feb 2025 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904586; cv=pass; b=L0/gfouQ8pgSZ3/qtiUdqLyNTow8TKDiWXSNJK4oBhGoH11VJI+QbYtUyNoZs0xYiB48jKtv8W4ClXjZKYrss0dIA9tNXLLdvCTEeoUlou/8Q7jcBk8fZUFrLaNKXP1cpzYunMr5DMeWt6oKzVJeKvM7Xj9kmp9alRtG5jNKRxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904586; c=relaxed/simple;
	bh=9e1rDRhjtWx8RcwMZlExf40SAo2UlhVvfwW0sy8Zjso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCWxE9DC0eZPyfbzq72OhMplTjdzh+nHQTcxgMzEjRh+rd4JSlsF6P0yBC2raU2pw6wp4kGJ1zvdYKjwa1O4tHD4kNKcxlHYZ7HaJ4pNaT1fYJvjeODlOMnk0QIitocE6+tk9Dt1ejEoSLRhDSTQPUwNN0ej4K6qlZxjJXoeueM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=KezsOagY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739904470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SFbINEkgfo/EjRGQA6rv/e6E1w9SnSqlY7gHYKVzwjXjoKhCAcJbqcmPdIJwEjH2LxH7lfJ9xsBXS7WhCDHzW4t4p1k3HyQF0zdd0gRKvlix4G/kFo8IAh5iZCfs3PbJEMy+tW2awjmbzM+3lreQll+qP9qdOvwQD58BzaXAFrc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739904470; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iIPCjPu2+AmsIf/cCFUaH7Ayf0dQa1TgmFz1djm75zk=; 
	b=BiLA6n50tNn0Zy0UCuq87cnay53sIAfZ9w3a4Hm7HJGd6Tp0IaOxtzNyiQTwinfP870IuN8rtpTTjHJphfv6NEdtmwtZ/T15tVADzqGc0M6KG6uxfGdslPxUYrEL6Knbv2VN5VYoweBkmCtrHBTQ23Qd1sKH3MuxTfKGyFyFYAU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739904470;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iIPCjPu2+AmsIf/cCFUaH7Ayf0dQa1TgmFz1djm75zk=;
	b=KezsOagYRIjDGPaa1ukaoWCC2dtYDxmSDpWhwWA+H1kw7wgty8GgsOiWva7N1STj
	++uhbfis2YHydYUJ26OanC+6H9blUdIJSRIpzBMO1CCWiGI/lN/3zMiIgnuMR4RKkpy
	Ynw+JvEGvLrJzkCmedkocIzP8sGHsriB10kKOfOE=
Received: by mx.zohomail.com with SMTPS id 173990446851452.29048163591244;
	Tue, 18 Feb 2025 10:47:48 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>
Subject: [PATCH v7 6/6] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
Date: Tue, 18 Feb 2025 21:44:39 +0300
Message-ID: <20250218184439.28648-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218184439.28648-1-dmitry.osipenko@collabora.com>
References: <20250218184439.28648-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The Rock 5B has a Micro HDMI port, which can be used for receiving
HDMI data. This enables support for it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 .../arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d597112f1d5b..377824e69e20 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -220,6 +220,18 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	status = "okay";
+	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	memory-region = <&hdmi_receiver_cma>;
+};
+
 &hdptxphy_hdmi0 {
 	status = "okay";
 };
@@ -377,6 +389,12 @@ &pcie3x4 {
 };
 
 &pinctrl {
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.48.1


