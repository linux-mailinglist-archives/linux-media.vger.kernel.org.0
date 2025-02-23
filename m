Return-Path: <linux-media+bounces-26700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E9A4107D
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDD213B80A3
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 17:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC12718F2CF;
	Sun, 23 Feb 2025 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="TGDv9Lfb"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68941607B4;
	Sun, 23 Feb 2025 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740332031; cv=pass; b=KK8T90Kj8CUFwGDfnHnVPLuRorZQeUQdR1YKqNjmw3ps+Ndh8L28Oh4wCdNz88bRhliyIjJVqNswc97bY6KKw6G9OMNTBxCjRUGLAdTrIGdIp3OeNbv9zhOEq/YTARCwWvHEcq0SDndbuHToxhh90+m0oHNgnKWxVjCpDxAvlCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740332031; c=relaxed/simple;
	bh=9e1rDRhjtWx8RcwMZlExf40SAo2UlhVvfwW0sy8Zjso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTPoVfUc+8ZUKi4nRFIVohPbLTk7+935UapHr3clkx/Bb1hUR9u9Ut25pDpZqLk1BnW8ZbTIMNZngtnwIG/ltjQjH9FATJrWjNXDlSCDslMSr4MADm6IxQ0qoQYOXjt0XFG103eZIEWQTSFZIgC4Yl9lGEv1GSB3zD48HsrWQT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=TGDv9Lfb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740331995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GV71px/iMtYpz1fgoqWPtAUFHFgH6bMWXkyCPwKgRpUT7nr07DNRsA8mAM38B6Q7HdZZQGKZyFQ+2efUfcgVLIyDyr1VGrlYiOriOR7pHEMFuRwdvRa7qrClkYVTkxYnQU5tJmweb9YP0PiaN/QuxSvY6ye2xzYLHysmDuZKyOk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740331995; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iIPCjPu2+AmsIf/cCFUaH7Ayf0dQa1TgmFz1djm75zk=; 
	b=BSyfbf3GB65cWAV4fisJfbpZGMl2Xh4TnWz1AyjBgBYzQ9EX38LNlI0wf0cz0BZILi7ERKXRR4BIvcTtvCcYiRDdTpdSsB9YuiOcugRt9MQ/dnIXQO4eUseA3UZU2OxLwGHr7edkSVA5HfgXXpjoy7QsdnwG4L4048+hn0Fpjmo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740331995;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iIPCjPu2+AmsIf/cCFUaH7Ayf0dQa1TgmFz1djm75zk=;
	b=TGDv9LfbbRPyY8nX2VtbtTGpDgTE4lIbdW8M26iAETvejqQjr4k1BUU/P5vUj59s
	fB2Rr04I507sSirguQhVXPla3ehZIfRZ9VGIa0Gab+Dk4lOlvqLoGaKojiGEunU0a3U
	M1svlHLdg7nnA3CohGQmLznBPo9tfRkeYpx3YDtM=
Received: by mx.zohomail.com with SMTPS id 1740331994974877.7597302947063;
	Sun, 23 Feb 2025 09:33:14 -0800 (PST)
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
Subject: [PATCH v8 6/6] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
Date: Sun, 23 Feb 2025 20:30:19 +0300
Message-ID: <20250223173019.303518-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250223173019.303518-1-dmitry.osipenko@collabora.com>
References: <20250223173019.303518-1-dmitry.osipenko@collabora.com>
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


