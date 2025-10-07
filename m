Return-Path: <linux-media+bounces-43817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4904BC0C5B
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 10:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EEA33A3814
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 08:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48F32DFF33;
	Tue,  7 Oct 2025 08:33:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99D92DFA21
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826002; cv=none; b=LxSv71EruvJAXdU0R08h1U/PX6/7Yf8J75683cg4H26NOWxvoKKrhYhP3RTFTHYTRAXd59VFo7NwVU66gEHMvIMYDwEVRougoMFL18wkWdjU6rhQi7JKiB25iGHba+n+KM1+ECwfyNCB40o81/UY8vJC/ngjeBtV7L/VJUMHkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826002; c=relaxed/simple;
	bh=cGyFF4tPVGDvqStEHnWXHR1TbnkY/wuBQ12QbPLDcB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Loi8DB19OwBaY0XmgRIXLPByzv9HUVwxpAVS+BF1sCqmOfiAZQ09kQ7tJvSV0BXEKstaMab6/0OJvKUi88g70Xe8g/BZs9U37kEHweeO+1pFh22NX3562Vm6bwtBuKQK45UwUhsolibO06+P2wc0zqf6qzCyx3f4o/HRp8INcvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637z-0002Hb-Vv; Tue, 07 Oct 2025 10:33:00 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:08 +0200
Subject: [PATCH 15/16] arm64: dts: rockchip: increase rga3 clock speed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-15-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Increase the RGA3 clock speed to get the maximal possible frames
per second. By default the core and axi clock is set to 375Mhz.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 08885d9c19e0c104ab0f723ec161b83998cfb9c7..57e320267bb629893bb884bf4e8d6bbc22f8d628 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1179,6 +1179,8 @@ rga3_core0: rga@fdb60000 {
 		interrupt-names = "rga3_core0_irq";
 		clocks = <&cru ACLK_RGA3_0>, <&cru HCLK_RGA3_0>, <&cru CLK_RGA3_0_CORE>;
 		clock-names = "aclk", "hclk", "sclk";
+		assigned-clocks = <&cru CLK_RGA3_0_CORE>, <&cru ACLK_RGA3_0>;
+		assigned-clock-rates = <800000000>, <800000000>;
 		resets = <&cru SRST_RGA3_0_CORE>, <&cru SRST_A_RGA3_0>, <&cru SRST_H_RGA3_0>;
 		reset-names = "core", "axi", "ahb";
 		power-domains = <&power RK3588_PD_RGA30>;
@@ -1202,6 +1204,8 @@ rga3_core1: rga@fdb70000 {
 		interrupt-names = "rga3_core1_irq";
 		clocks = <&cru ACLK_RGA3_1>, <&cru HCLK_RGA3_1>, <&cru CLK_RGA3_1_CORE>;
 		clock-names = "aclk", "hclk", "sclk";
+		assigned-clocks = <&cru CLK_RGA3_1_CORE>, <&cru ACLK_RGA3_1>;
+		assigned-clock-rates = <800000000>, <800000000>;
 		resets = <&cru SRST_RGA3_1_CORE>, <&cru SRST_A_RGA3_1>, <&cru SRST_H_RGA3_1>;
 		reset-names = "core", "axi", "ahb";
 		power-domains = <&power RK3588_PD_RGA31>;

-- 
2.51.0


