Return-Path: <linux-media+bounces-41863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5BB45DE8
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D003A60D7F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0B9313288;
	Fri,  5 Sep 2025 16:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="e/lpQsFX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153CB313268
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757089230; cv=none; b=nsupmV90j77SsxFwUY806Ri096O805zRH1UX1doUsuj0qlFLuAfR+tyG9e5cAPYNW0FLBSj87ADyXNXNS2f5ImPq9Ek/gL9d1gQrs50s3yg1jUIrJKkAYvoKNRoP5Jg6f6jIKfG6eEI2pAWNHMne/FIGVAr2oUjjuBWhHlkJiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757089230; c=relaxed/simple;
	bh=1Ma0P84kMdX0KtHlfXVIGg61VZSElqS2BKBMDWGbg0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Axu8O0AwkJfuDhZszo4nqOOMbtYzPgKLR0OELuSR7dHcmMMi+0EHCocf8W1pIqI62rFhz8tw5I5hjh83AartgtCo2HO8OaOQs//4n+Zxo/rim8SoX00JkDZubSOD1WcY+7NGK9h7ATJ1FZC0oQWmUh5MP0zxvXwqZA18WeghDBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=e/lpQsFX; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1757089228; bh=heghjJ1ZyKj3HH53+DkN1wBdADEuuQYiJXxp+teA+vw=;
 b=e/lpQsFXZlNqbGDVDDxZcF1Rk3C3umT1w581sG5gDZ+b7rTxGVe+BVAtgD/oXzsBf9szQd4ut
 FUOjX0o4oGfLiJRzm9aNcSDGwt71Hj+ZDLZWfBP0hAx+LKkKVp69QSEnIrSI1oKbrEw+/4sTGL2
 a9EMnOIkgab0CKkSIYBuA9ylbvix+kqDoWDdKABRiO0beM1/P3QeRkPQPzPaNOP7dfJmQOzJpWj
 +vDZ5C5/rWecpikHVUpmvA6csAAjlE+bAlz8WtLsnY0qTjhA/S+MsQqob4V3ek92wMqlDsKc2Eu
 f8TbgM4ToZj0Z5kLXuOfxZdiPN0heo1fjF4r60swCj6w==
X-Forward-Email-ID: 68bb0dcb90d039a4fd84d728
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.13
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
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 7/7] ARM: dts: rockchip: Add vdec node for RK3288
Date: Fri,  5 Sep 2025 16:19:25 +0000
Message-ID: <20250905161942.3759717-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
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
Changes in v3:
- No change

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
2.51.0


