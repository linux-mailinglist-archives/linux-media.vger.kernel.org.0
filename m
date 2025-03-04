Return-Path: <linux-media+bounces-27441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0EDA4D763
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EA0C7A2F27
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 09:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E162040B0;
	Tue,  4 Mar 2025 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="JgOxIfg+"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957FA1FECCD;
	Tue,  4 Mar 2025 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078922; cv=pass; b=Yuqmzrqm0NS9t5KLLVw2CvQ0Pitms4n+ik8Kq/ewlN/OGRwH3n+si57C1DvF9Ceo7Hy4CIwqBgYwa9D3dUOMioRjzXEdWw8aNuf6cQFGE8j0zPGvKYVWL0061elaT1MAY2SAmj76mH++P22M1ChbH0W0E5VHbJLTCYaofppVdsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078922; c=relaxed/simple;
	bh=Tzln5mfY2+RK5itMGZHBVwz8YCtbE9sO6UpTnDQrDdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFYO1VvdOdmx5+JJwYW6R4eipo4zKlJw1RlkjzuHmGhekdlFVNFjnHM6/Jdwf6DeY/Q8GusSlVhP8vpK7mnL0XBu9xK2jF3DftbbxmX/0yCdmn2FJTC/ZK6wvrF2laPhBtYHCtqTVPi/i9NXoLhpKae+hF+7POCgvj7Ylr0S3EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=JgOxIfg+; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741078870; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dD/Ok6sPrF14Y6wmYH4DyacQnawDHnHiNAyAaizlbO+/D2byAWVi2S2Jugo5SRtipl/XHKo7GVokU8ptRoQRt/hDGAJYgd9m1Pbk93vUaU99jsqhWhkETwhi2ZNt+rI2xusUmyWgy2zs6o4eyaWiOtfYcbg9Y/fl1HocxfzM8U0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741078870; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/JMA7VJYsngtKi9ltZZXsV2uv0aQI0PgrBwadMgnHyg=; 
	b=KoJ4Vt1D84PCzljM7SZzsvsCgnGcaf6xZ52/RIgjovatYlqdMesVt5Faa7NwVqUo3NjnYJPUL7G6zdghXZcHDJ/4kI2zQwU08G1qUI+/0Q+MTwIPDMp4dgJ5RsC6zo5nQRLvv9bwfbYvRAoV4ki+zXW9Ro6IAcK5uEkSc1LPgLc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741078870;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/JMA7VJYsngtKi9ltZZXsV2uv0aQI0PgrBwadMgnHyg=;
	b=JgOxIfg+6NkyyO+Ow25M2B84D0c4+gmpnXTjb93TufVYcnr641mQY2GASN1y+4Qq
	USJVv0sftT+j7XvOQlJZU7hw+phd6D4UqAQ06aLrYBANdSG6LTAhCCM8VgKCdQfPZ6m
	YHrjm/yPkiyIGQhH+ArD7KIYHQibwMXGfbb24RR4=
Received: by mx.zohomail.com with SMTPS id 1741078868677681.6149198658607;
	Tue, 4 Mar 2025 01:01:08 -0800 (PST)
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
Subject: [PATCH v13 5/6] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
Date: Tue,  4 Mar 2025 11:58:18 +0300
Message-ID: <20250304085819.108067-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
References: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
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


