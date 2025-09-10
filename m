Return-Path: <linux-media+bounces-42193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A114CB514FA
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84C055E0C2C
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE18331A05E;
	Wed, 10 Sep 2025 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="eWzpltn8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935E31691F
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502488; cv=none; b=WlLJEJrUMuh5IfqFJ00dr8k6SeFM/Q3zuRhYyVYTu89BlaBaM8rjT+1aJVAe6PaqWupYeQwOg/NHj17md7XgVoRjyJB8qXv19bqHWHZktxVhMoWARcb41RrnNAfvS8LPaIjAqUpYJlOQw99lZWNbF6G3mB4JzBQxD3Ym5XKk3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502488; c=relaxed/simple;
	bh=MrJ75K5TTGWsUdBgpB6wcSaOrHL0GEx8YvZLO6OHvZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZW8V7vU1nKj3BSFOfZv5PI6BJtKBrUWEGtKvEbQSc2eUjTEn6FYWY7pD8sf1ZEPp4WZFGJEAxQE+PkZAM4k+U9zNKXA3bU35HqDEAigHpoYTtgaTgcIrI11kT6PEzEDJXa7cGSC5kgbgeO8W2W+Ivmk3dfdYYMTev5bZcJVjeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=eWzpltn8; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757502484; x=1757761684;
	bh=WVAZkSDamM6pxbj/GVHH3PYvdQm8SxrqzkK9f4jXnr4=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eWzpltn87rCiyyQBJUp7vRnPZXNyU3H0OzGMPb6LPJkb61q32Zrteoq/uwCgjzwfa
	 uVFd3PYwEuFIIq7atpigf46P8ZL2pTBrlfQvwdcKGL4xYZ8QKm2AV05op6kbqSU7WY
	 N+OAWNaPM4rI/6QFVtjhczhUW9L3stNPuBFxhe3gjoJ1Ik5APcaXhQubQ7A4CTbM8W
	 BQgdjDmdE+MAbdWIIg3eNOd40fba6CDtAMHZJ1SSH/iALN5t8lLpd/fWy8RUN3kQyH
	 vW1qk9FOsHwcVVJzKkzGkMyBI5+CPtdYdu0o08c88q1HQD6BSb6knnqifYiXhFX4HL
	 g3/TtFNTlANew==
X-Pm-Submission-Id: 4cMHwc5yG7z2ScCt
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 13:07:40 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v4-4-1fc320488233@vinarskis.com>
References: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
In-Reply-To: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=MrJ75K5TTGWsUdBgpB6wcSaOrHL0GEx8YvZLO6OHvZk=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHY1i7Dd/wNV2TMgp7/s+PfduOR475Z84UuM//ueLxT
 d1eAx/9jlIWBjEuBlkxRZbuP1/TuhbNXctwXeMbzBxWJpAhDFycAjAR5wxGhvPensm6/BOZRP7q
 VEmGWNl0lk05mCiwiCHnGiNjTn+eBCPD7uPXChdOn3RV9nVGJEe93F+JWe/vX1q67/aZa6Zv77V
 GsAEA
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
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..3b3f7137689a6fa292ffe4fec8c1d1f20ee525bc 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -83,14 +83,11 @@ leds {
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
 			panic-indicator;
 		};
 	};
@@ -685,6 +682,9 @@ camera@10 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_rgb_default>;
 
+		leds = <&privacy_led>;
+		led-names = "privacy";
+
 		clocks = <&camcc CAMCC_MCLK3_CLK>;
 
 		orientation = <0>;	/* Front facing */

-- 
2.48.1


