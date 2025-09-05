Return-Path: <linux-media+bounces-41810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B65B450AD
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DC331C232C7
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB85E2FE566;
	Fri,  5 Sep 2025 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="byR/Ou5J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA91F4262;
	Fri,  5 Sep 2025 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059217; cv=none; b=ATGcm+iw5X028i/Ma1NHGWWMbqXsvx8nBcCP7VCa3caHunhCOdN69CM0N6H/znyeDR63jlQxOz2QoE1KKcqJuE++m2Wx17GhmBulwR4r7L6uzq5FcU2JgUIDB2fIAHxU8vhFzrTendP5BwsEPHebEk0bqeyM3xbbmNbNvetXY2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059217; c=relaxed/simple;
	bh=edWT6KdBWyksJJHrbWQQWgcHw91Jmbb/HxPT7wxRo/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ni6vsdKJ/1BynGhoTh9a6UPs/LLl5NMKwZoNiFpyukuZ4eWFVnz/NhPvoKUy13eYeE3rp7RBYFWBSBl1MxVYYd3PbfQ+0gSpgpjyqyT62GG10TU7tccE3t9991yR7h0VF+MsexRfipgFIxwUHgqROIsC/Tv0uqeWMvnDYGvbZE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=byR/Ou5J; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757059213; x=1757318413;
	bh=91qDt4aSXmfJHmp9z9JEKedQZehuTGRF2Qw0y+ToL4c=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=byR/Ou5JsdLbXUMHPk15tlUl0O7VgudGiQrUKw+EObIXH5Kg24RKVpnurvOBc6qsp
	 Wlz0VIc2Xq8xkSuurQiMBWj7en4ol4ksaUvRzzI0eBWNLRmczZ5tIqfz4TgsGkVbw8
	 6oCW7lvNQBEOe0hE0PlZ1+gRvjYdPUnHuuc9O5kNFeHoLJTcg1ybR2Jm43jLILUWYm
	 UwaAAK/Ie6/6nmbZf8z3tmur8MLWKPe4htq1ntv54uP+HkOW1FBrnFUcrkFDFz0fpt
	 oIFzuUmci8/YFdEO7Nu8BGAVtsRtIu/DrxoHoxPJoc2sWQZetLGkK1Vj3lVtonHkei
	 BQGdVBg0R8fMw==
X-Pm-Submission-Id: 4cJ80B4J0gz2ScWP
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Fri, 05 Sep 2025 09:59:32 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
In-Reply-To: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=edWT6KdBWyksJJHrbWQQWgcHw91Jmbb/HxPT7wxRo/w=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBm7ZtQn+QrvYmBferxhro26SRLDQ/c7UwVnzq4QytJWM
 OleJRreUcrCIMbFICumyNL952ta16K5axmua3yDmcPKBDKEgYtTACYS957hn+UtoyaP4xP8Ikv5
 vZlWvHkX0snO9OXInZqTnK8jD8p4PWFk2BPx1l09o+pyA2/fxKd/6kMUi9tzTM7zuU2y+ZU1a+k
 VZgA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Leverage newly introduced 'leds' and 'led-names' properties to pass
indicator's phandle and function to v4l2 subnode. The latter supports
privacy led since couple of years ago under 'privacy-led' designation.
Unlike initially proposed trigger-source based approach, this solution
cannot be easily bypassed from userspace, thus reducing privacy
concerns.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..03801b174713cb9962c10072a73e9516abc45930 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -83,15 +83,11 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_indicator_en>;
 
-		led-camera-indicator {
-			label = "white:camera-indicator";
+		privacy_led: privacy-led {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_WHITE>;
 			gpios = <&tlmm 28 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "none";
 			default-state = "off";
-			/* Reuse as a panic indicator until we get a "camera on" trigger */
-			panic-indicator;
 		};
 	};
 
@@ -685,6 +681,9 @@ camera@10 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_rgb_default>;
 
+		led-names = "privacy-led";
+		leds = <&privacy_led>;
+
 		clocks = <&camcc CAMCC_MCLK3_CLK>;
 
 		orientation = <0>;	/* Front facing */

-- 
2.48.1


