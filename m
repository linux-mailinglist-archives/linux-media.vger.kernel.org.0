Return-Path: <linux-media+bounces-27676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C044CA543BD
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E34CF17138D
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 07:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109751DDC2E;
	Thu,  6 Mar 2025 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="UHziL/gd"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1201D5ABF;
	Thu,  6 Mar 2025 07:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741246199; cv=pass; b=p4nr6UaKluUU17xXeCWslR7nq7RTD0nOhlHVXonkJtzlUW+62X2VAK7+NXZJlPlkYFVfOeqpv5A3OeDYKLf8UrgKAS6NW5alimaPg4L/BbRQ9nVKPF//JYPWMdHk4y84yqam1yS2of1GKO8BBSiUj2ZdrYApFYc1i81l0nZTXvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741246199; c=relaxed/simple;
	bh=Tzln5mfY2+RK5itMGZHBVwz8YCtbE9sO6UpTnDQrDdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2O4fRa8lm7HZ104q6FMZYQ7c0wv8MNDlYdQBnyc66ymIPXFG2dw+oZ8xEt550jMyidGx5hZSGQ94R61SdoF7ZjQBAh+LLOxkpB8nhp17edAWMnFapH28G6ndXBkxxUfZJKfD0rVcVVchEy9IMr9+Dr0WjuynVg6U2OxTXTTtzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=UHziL/gd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741246154; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TgAnvuJi/M2EqeVuHtK1NfH2cvlxKjVmptwzugdkJ6iuxw6SYhmyOaVXqrQt9T4F6p7gqr4C8f6p/fIbNnUNQmahWJSpeKTS96s2Z82DcinUPHqMzr8/mp1BiQY5hcVKNJcLfhDK1Fw69jzOuTiH7C0wB/II6KYdy7U3AaYdOd4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741246154; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/JMA7VJYsngtKi9ltZZXsV2uv0aQI0PgrBwadMgnHyg=; 
	b=BLBiU8Zo+WlYTaxyGz/EyyZlpoBNNIa3kPej7vqP786QdIPE52jsuLZIEcD6+UQhS2AAaE4lEu6UD670W2CWnOlseZj3uld4LN/a1D+/soMA0+Zys86ZDRXXRnatMrTHC8RID97dVd8joh31IwQ9FWsJhjSRgmnvDzExDS3BrrQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741246154;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/JMA7VJYsngtKi9ltZZXsV2uv0aQI0PgrBwadMgnHyg=;
	b=UHziL/gdK0NhB4hXPA7QNQvowRQ8l+sAW4BA0xTqv9eVLHrFQL34opfalvnjBV8+
	O1lfW1rMPbzxT6MZVn1sOaZEQ08eAS7Yk2n83VEWJOfDBI+uqqTowds78aRxaJrp64u
	60OI//jBMKJM9CUEs3KSOMOO2WlaRoZNRLrIujnM=
Received: by mx.zohomail.com with SMTPS id 1741246151654895.3875454252703;
	Wed, 5 Mar 2025 23:29:11 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v14 2/3] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
Date: Thu,  6 Mar 2025 10:28:41 +0300
Message-ID: <20250306072842.287142-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
References: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
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
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
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


