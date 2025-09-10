Return-Path: <linux-media+bounces-42205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604EB51671
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 14:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3A941C845FC
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18D531AF3B;
	Wed, 10 Sep 2025 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="nxKIfJms"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9564831A541;
	Wed, 10 Sep 2025 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505697; cv=none; b=DBTxQfPmBGVsJ5o5jFyrExhp8zbveWAj9wJJv/WnVLA67sO+6QeEpbZTJ2kYuyJSzu/PRl3aHEBGc0nlFYXadD6Jz8BhpFBSRNU0/IHSMe2YQQ43VVwMITnRiKygGf1/RbAp+Djh4lWsLVxl6McLYcEmrQmomaoZLAwoFAcgSu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505697; c=relaxed/simple;
	bh=MrJ75K5TTGWsUdBgpB6wcSaOrHL0GEx8YvZLO6OHvZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxSDRm8ua2DAZPHm+HWoB28wbZMgrBSpxHY7TQyajRThobv8R89aE7LEDG6iGorpCzgN//5uttV2B3kHt1W5JiN7lDreKLanLpdLf5RbI5YqrfdrmDPWGwy+kykh4ialP6ebhqHsLTVh65Nj2xkBHkrACli36b2dvKcGPBfSzSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=nxKIfJms; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757505693; x=1757764893;
	bh=WVAZkSDamM6pxbj/GVHH3PYvdQm8SxrqzkK9f4jXnr4=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nxKIfJms1/EPDF2HS5xwwb92MGQcXOgW2xAGSYKO/aN/nXCtVgdV3Enh+sRkKQUCW
	 GJKVFanLebo5nyF8tsDPxP1ZcVI7WkSVHgCdJ24MF70Jgfj415Q68R6DMCv6/DXkRV
	 621U8c31AWGcuCDgahqmXkLmctcUaynRXqFKJTrXtEvOwpMGKzjesvdHy0EgwhIHOR
	 7+oNt9iwzgFR3DuHD57ZitUZokapfRDD8/hnyw4C98CSHb/7o/Vb792ZawfF9K5t6c
	 iFulP+8RheD46veqhco7YwO7VdCyJ4v/ArX+4evMd1H55kzMxZsiOtJfcRbIBs82Q9
	 uaY5OE7SPUUIw==
X-Pm-Submission-Id: 4cMK6L5h8sz2ScCs
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 14:01:11 +0200
Subject: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
In-Reply-To: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
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
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=MrJ75K5TTGWsUdBgpB6wcSaOrHL0GEx8YvZLO6OHvZk=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHMyZI+928Yv/w+vEmlnVHGMUzT96w4z3xpjjAf0fiw
 iVm4VeVOkpZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBEonYzMry5dl/8gPvelMuL
 ZLWYY9kOrpq5e/+lqzohM8uP/ZuRVOjKyHCOm938QuKrFRNtdtgKT1mwYN7krlWSkpJ53VV+hR9
 ipHgB
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


