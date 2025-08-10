Return-Path: <linux-media+bounces-39361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB6B1FC6D
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 23:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F02E165E79
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 21:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD73E2868BA;
	Sun, 10 Aug 2025 21:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Er6MjEwA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BC2877F3
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 21:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754861178; cv=none; b=T/zQ5QhScGhK/FzVCq9qhmzQ5xa3EUclbpSd2eY5U+DhrBN48mHdTm2qGB/QCmh+KBP9M8Neaopw4XAF8ksmlqCCDqkvXsHEIZjbEcpiZx4ApV/Lh7UO6tmBU9A9/byhKVMXDELYVFfttec1cL8XDajzEBlFvN+I5aPgRUqeP/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754861178; c=relaxed/simple;
	bh=j/0HUCC9UQO2b5hmneXIzzL1sJVjj+vQaO3XQEYR95A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdDG0MOLZREf/bnBQLJRbrDMgOuNigc6+Orghr6YHgu2O0pIb0b80yf9N/nSVxdhkD2CAerqRJMy2ornGemjYhWy85bv3owWYi25GLTf06Hot/OfZ3sh+o2KRSvD00Qhw/o750rAC4g/6RmKYlS6Rxw+zU6PfKs9CegN7pJg85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Er6MjEwA; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1754861175; bh=+VzcJ1IEVCXH+ZaLujNTdec9bYkNu+r+vgyiKcJcdgY=;
 b=Er6MjEwAK7RkMn+vP8dCCsgDjVUJd6DnIxKKPwXrYS+B9qlJmK0YKP22bxTiz7NyShmqHsA76
 PjOtwpe2XWS+wxtSYk6w2pV/ZAx7qn8coV42L+sHgQ50HNv5KIZwnvSLz7Dl0TKKe5u/McGrWmN
 bDhjpueRtTruF6d+nG7KYV4exP5AtEmiRbbTPmlryhI5BPrSBbKktyuAIWh+gi1xhUdelKaWHZ5
 OrEMyoMnWOWY3I6nmUYfCIYtPxtylYxMSKz0U0G1/dBej4ZTFuF9iE3uHu6nrnfNDdaIIjiMP5P
 KWDRU23ND87SPslKVcRE4Yg4GCfDw+F6NlEFyFfraHbA==
X-Forward-Email-ID: 68990e74797ab89627792492
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 7/7] ARM: dts: rockchip: Add vdec node for RK3288
Date: Sun, 10 Aug 2025 21:24:37 +0000
Message-ID: <20250810212454.3237486-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810212454.3237486-1-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Bee <knaerzche@gmail.com>

RK3288 contains a Rockchip VDEC block that only support HEVC
decoding. Add a vdec node for this.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 arch/arm/boot/dts/rockchip/rk3288.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288.dtsi b/arch/arm/boot/dts/rockchip/rk3288.dtsi
index 42d705b544ec..eab0c9a2d482 100644
--- a/arch/arm/boot/dts/rockchip/rk3288.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288.dtsi
@@ -1293,6 +1293,21 @@ vpu_mmu: iommu@ff9a0800 {
 		power-domains = <&power RK3288_PD_VIDEO>;
 	};
 
+	hevc: video-codec@ff9c0000 {
+		compatible = "rockchip,rk3288-vdec";
+		reg = <0x0 0xff9c0000 0x0 0x440>;
+		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_HEVC>, <&cru HCLK_HEVC>,
+			 <&cru SCLK_HEVC_CABAC>, <&cru SCLK_HEVC_CORE>;
+		clock-names = "axi", "ahb", "cabac", "core";
+		assigned-clocks = <&cru ACLK_HEVC>, <&cru HCLK_HEVC>,
+				  <&cru SCLK_HEVC_CABAC>, <&cru SCLK_HEVC_CORE>;
+		assigned-clock-rates = <400000000>, <100000000>,
+				       <300000000>, <300000000>;
+		iommus = <&hevc_mmu>;
+		power-domains = <&power RK3288_PD_HEVC>;
+	};
+
 	hevc_mmu: iommu@ff9c0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9c0440 0x0 0x40>, <0x0 0xff9c0480 0x0 0x40>;
@@ -1300,7 +1315,7 @@ hevc_mmu: iommu@ff9c0440 {
 		clocks = <&cru ACLK_HEVC>, <&cru HCLK_HEVC>;
 		clock-names = "aclk", "iface";
 		#iommu-cells = <0>;
-		status = "disabled";
+		power-domains = <&power RK3288_PD_HEVC>;
 	};
 
 	gpu: gpu@ffa30000 {
-- 
2.50.1


