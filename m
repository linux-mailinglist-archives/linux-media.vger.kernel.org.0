Return-Path: <linux-media+bounces-26715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E6A410DD
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4E35171E11
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973A718A6D7;
	Sun, 23 Feb 2025 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="PZjIDHxA"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624AA189B9D;
	Sun, 23 Feb 2025 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740335349; cv=pass; b=isYC++zTKC9MtUvNBvHh4uKDyL3xBkPQm/N7o0BuUVpgRVMzwQSLNBx5CGg48AJbGeeQNeP2H7THeb3AZhjuG3Hn52R1DSQim/OfZuNEholFKlQ9usoBMi973B5owAAoOzaw4g8XjTtCLiTpoUPkaCkUktdwOu6XfwcRoW9m5Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740335349; c=relaxed/simple;
	bh=9e1rDRhjtWx8RcwMZlExf40SAo2UlhVvfwW0sy8Zjso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptoYvl5kby8tCcJ5WUm+wkhRDhGDsIVGLvl4nSkVgiwpvzD2BmLl+aX96f6GfVQCUNifzaAhjOCglzfr3xfprU6LjXrGPE08FfGtaYXyCAnV6XybAI/7yan08eOoRTsFvu46Q+2YmcERgRMTKu7fAOSYonajSgrWdMjbi6xQuYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=PZjIDHxA; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740335306; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cL4JaMAa7tvCMV2YcOmcOO/bK4Q+iWWEzNd+06z1PeUsT+/y7f3MRsL5nmrTudQfj4D0TzkVtUZMv9TaRimtwt8BXslYh3S4e96H2mGNoTcYFyQmraHB30uONdYx/NXZiU3gSAGr7gXtIgQcyY/n/NINvTCINK9PQGxOoCbnxVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740335306; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iIPCjPu2+AmsIf/cCFUaH7Ayf0dQa1TgmFz1djm75zk=; 
	b=cyLBLlpJcwCpCrAKPtovB5xMsr2LvlGllseRb8K34VbStL40Pc6lD/YZWGYgmK1lF4TWNErJqq4qbmpLHAMa78mtnL9Fu0cD4owIE/qYKbypZEFcO1bXKiwrPdvdRp2Pa/rqz3mzFgTLoWtAVyL+Gi+O9KDWRTiH0U1B4zdrpvE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740335306;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iIPCjPu2+AmsIf/cCFUaH7Ayf0dQa1TgmFz1djm75zk=;
	b=PZjIDHxAT92MMwPJRiUP6uXYiE6ZiMCqUVMoVa1/BVvlnmspFZcgPMbjkFZVa254
	Pv80bPZmtqpm7RtutAqd1nbnmsWHmTl3i8n9pABkEz80isEpwMXJN6ZQy0VTHldVnSm
	X7wujA3St2Uo6fPydQC/MUT9hI/9uvPrMoC/Egkg=
Received: by mx.zohomail.com with SMTPS id 1740335304668991.4732596987989;
	Sun, 23 Feb 2025 10:28:24 -0800 (PST)
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
	Tim Surber <me@timsurber.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v9 6/6] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
Date: Sun, 23 Feb 2025 21:27:10 +0300
Message-ID: <20250223182710.314587-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250223182710.314587-1-dmitry.osipenko@collabora.com>
References: <20250223182710.314587-1-dmitry.osipenko@collabora.com>
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


