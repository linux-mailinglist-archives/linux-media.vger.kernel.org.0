Return-Path: <linux-media+bounces-41944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D2B4814B
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 01:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FC7617D421
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 23:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D1924678E;
	Sun,  7 Sep 2025 23:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="Q61wUY98"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4750423C4F3;
	Sun,  7 Sep 2025 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757287112; cv=none; b=cEzCeNp82TWyA36mREQILnWuIAxYa8KI+t8Gk3+e/JAIM6J1MxV3MWP9yt3yuWW9+BETFLnusIGYv7x9uj3rXaVOzM8xd7TsXj2xpdp5gIC0ZNIEPnlrIO22xzXEiUH1wuQ28+R9T+gKOIQVTbgdVPbvomPWcgxqn12YQs3/aqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757287112; c=relaxed/simple;
	bh=FDaW+KMG0SfKYAHwpy7yJNT1x/XSMWz+beB/dGcZHo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6tWrH1eF+/gZmcE86zPBXjD5QrRimQh2rtfy5G67aWBJ3/9hlYv4jxlbf+LObQWQ8X9at63iO+ZB2myMnY4OJGdm2H/VqY3p+O/t/AvN86Bx2e9TgVedjlg6YCtjwfXfhdwVVlC0BFFqDFrOpDokBNkK/7299H6bmjm801/+VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=Q61wUY98; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757287102; x=1757546302;
	bh=PhhYtIqKN2PYzCqhs14PuKEhGXRgdAp3KlX4hxKM0TY=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Q61wUY98RVM/tluTfCJii2PQU//ploTQP86eib1eahsgwz0JwOMzsr7UKqiNB/EuS
	 IQa2OuYjxTP1AltGHBufR4LGj0//vfH9bbezj8RlttH3ey6iwhqlHC8wI5YuYKba8/
	 wDLUmAiPDC7d+BjApx3u/2VF3/QPgTIx8+mHsHDePudFeV5EOfw6FWcuNRAZy1kXJJ
	 9LLEKycm5jbWpSJk2JDsegqF7AJdiUXDeViJU1TSbvXXngrAvqkXc/0uSOw6YnmxB0
	 uLI76bxfK3oXskuH/7G6NWyhDDKyn8JttkyYBZgo+T91Q7Tyx9UzHMO30vizU1QOYp
	 is4NngsO8SdJg==
X-Pm-Submission-Id: 4cKmGj10tMz1DF4K
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 08 Sep 2025 01:18:06 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-leds-v3-4-5944dc400668@vinarskis.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
In-Reply-To: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
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
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=FDaW+KMG0SfKYAHwpy7yJNT1x/XSMWz+beB/dGcZHo4=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBn7hLb9+dgp7HXtqfLjRxpBKx8+mnhdyDgiQN3pZWFd3
 jQu10c6HaUsDGJcDLJiiizdf76mdS2au5bhusY3mDmsTCBDGLg4BWAiezgZ/qee3bTk0c/GRDmt
 pd+yF3qlzFl+OMGgNmr78ZqJmwWeH3Bk+O87V27ypaiFPMyfZVVTfVZvDthmZJubOEE3a3KZSNR
 0ZWYA
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
index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..ef5c7cbeda68c7eb4745cd2ec01eaacf9a83040a 100644
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
+		led-names = "privacy-led";
+
 		clocks = <&camcc CAMCC_MCLK3_CLK>;
 
 		orientation = <0>;	/* Front facing */

-- 
2.48.1


