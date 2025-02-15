Return-Path: <linux-media+bounces-26186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B71A370CB
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 22:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35AFF7A04B2
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 21:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A9E1FCF6B;
	Sat, 15 Feb 2025 21:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Hwf8dBlP"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC21FCCED;
	Sat, 15 Feb 2025 21:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739653594; cv=pass; b=PGI1kgCfOi2cbaAxuiiKMnp8SSjnF9mZqTBASxE2VhFpEf+m1Ko8c/d6T146za3fS174+OpInXSCiGTO6RPa6fqZy+CWlvMZnvgSdqXNAkpuUVSmBoW3zXg8M/lbGS2/r/6qvrcZrHri7gzmoFSyX/8cNdAlQDp4U9zw0ofm+e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739653594; c=relaxed/simple;
	bh=9e1rDRhjtWx8RcwMZlExf40SAo2UlhVvfwW0sy8Zjso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9vemif8eJMk6zk50Po4wv6/sUoWO9w7p20InnAh3CRpL4uMYAPLLYuCKx1/F7f5Gp+2sXFL0Kv1r3v13SRzijLWEuHx9vf8YKC0NG3+IIxvN/cgvnsG2Al8RjNIXw+hLEKhSpWNqZfIGtaAvn2fQiD4tsXNXnOVSP1awfu5XkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Hwf8dBlP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739653543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=im+++1FCZGXGGcMqwUuTqhD3+gFNHa1gjKpktZj5fIDoitulyCfmGLokCID1OMdJtUbLD5yP+Xl3gBFHIFTCSHY9W78nIDIX0mLCJ0Q3xWadBpwF8IMaTwz92pVkOVp6zA9+5VFLvOiX+E6qhNPabKfR7Hw5UQ8/F6eUaHWdd08=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739653543; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iIPCjPu2+AmsIf/cCFUaH7Ayf0dQa1TgmFz1djm75zk=; 
	b=h6w41c+Kwo54XuFsSrNCmm9mpAQqBqDsQfcnb91bIU66t7nF9dp7s+8lPJkQuD3ATvG/QpN9UnrxBJaKFM/XE9rsCkEL0Ou2a0BpPFdzgycNxAuM+29vTLy1H1ONvPHqisruS9y3VJvEzYzIB/5lOKX62rjh8Xdh5DnHVy5GRXM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739653543;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iIPCjPu2+AmsIf/cCFUaH7Ayf0dQa1TgmFz1djm75zk=;
	b=Hwf8dBlPahcqIT00T6xoM5QwWA5iic4yw38V3vCe4skgbVehpmeX0mk+shS5Nnme
	ZRw0umP0oU6/ZK7AtWFc8DZ3XbOXs7hqRgjYnY6tbOeEHKMKDddDzWwnRvTOlWQDcqb
	BMNCy0s6rdofWpBuXpoBdP4PSAwdQmZZmKKq+fUc=
Received: by mx.zohomail.com with SMTPS id 1739653540909749.457708852657;
	Sat, 15 Feb 2025 13:05:40 -0800 (PST)
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
Subject: [PATCH v6 6/6] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
Date: Sun, 16 Feb 2025 00:04:17 +0300
Message-ID: <20250215210417.60074-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250215210417.60074-1-dmitry.osipenko@collabora.com>
References: <20250215210417.60074-1-dmitry.osipenko@collabora.com>
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


