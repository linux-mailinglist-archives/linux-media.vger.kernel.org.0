Return-Path: <linux-media+bounces-42191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0CB514EE
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3A271700E7
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A09731A051;
	Wed, 10 Sep 2025 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="VPOkxCmm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C8314A99;
	Wed, 10 Sep 2025 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502483; cv=none; b=jiWYGL9KXF9+HQp37Uy0/USEq+s6eNHEojNeVbd2A+jnvben7tgFw0rYdawMHeF14RwqLvd2j6OrhKvNYRQ0vcBaoM3RIqMdw+uE3e80NzDDVyu5l6Yzj4cSXkDyNwTVmsl3lnPJvAcx8GOga1upmCUqhSod7MVUDAViIhEnHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502483; c=relaxed/simple;
	bh=O6kMD8HXSfTkDRewsR8EJQ27JNcIL0fez4Ni8uvB7kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtyeZMM6OvjNub1bus1h1klVwJ024qGaO7feWCXt8I4m8yaKhOmr6lvKmAJ26KJ3LtTJ8IvlXR+bHZ3FM2YN9FkHArtPBRoZD2McdjzSqhxQIPZoYAQy5KyiKW9tcPGC7GmxYpq2nPG8o7A3cG++C5MdNDHoynyUozWLJFcVYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=VPOkxCmm; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757502477; x=1757761677;
	bh=g4yIYgMlwfIYDvg+e1t36HW9ZkkuLGqLFC8H6k3D9N0=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VPOkxCmm2D0XCc5NONDIyKcf04iOECkn6CmscLfnBLn5bSmoJT7jKscbNriZcfQOq
	 INS82KHUTUISVetgyN56t91WdTXbyILksKe4eN17Cwxpx8NNelk6XZvgh6DPf297bt
	 pKdIyqWldGCigKwUTGzdNwQ32c2ckv8TRuNgY2xhrHCUjXF4eJ22Xb4TcjZ0VWmvXY
	 VsmwUtjVPzsCvxDHVt9BJviUbzdtqnssMumpzgVhqWLYf9KkyWsqJgCy2/VPGTOCnV
	 2gSTmXdTsFVScbkyXYP0QVjywbuS/in0a91MeQposDvzV3TzWs7AENgvLUD/nOdX3H
	 ijns3I6RswxyA==
X-Pm-Submission-Id: 4cMHwW2DTTz2ScCt
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 13:07:38 +0200
Subject: [PATCH v4 2/4] dt-bindings: leds: commonize leds property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v4-2-1fc320488233@vinarskis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2864; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=O6kMD8HXSfTkDRewsR8EJQ27JNcIL0fez4Ni8uvB7kc=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHY1iYeNicuYtWJP1ee1F29v1bH4/s6mt7e+781iWRj
 P6/vrk96ihlYRDjYpAVU2Tp/vM1rWvR3LUM1zW+wcxhZQIZwsDFKQATuR3GyLC1sH9717S3Bgyf
 VBQLpi72P5DbukD8jFLMJa1Zq+X/TPzHyLDo1nbdp5sv/ZiY+ctpn8iXM6vrAgzOJ4ocvnww+lT
 q/BdsAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

A number of existing schemas use 'leds' property to provide
phandle-array of LED(s) to the consumer. Additionally, with the
upcoming privacy-led support in device-tree, v4l2 subnode could be a
LED consumer, meaning that all camera sensors should support 'leds'
and 'led-names' property via common 'video-interface-devices.yaml'.

To avoid dublication, commonize 'leds' property from existing schemas
to newly introduced 'led-consumer.yaml'.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../devicetree/bindings/leds/backlight/led-backlight.yaml         | 6 +-----
 Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml | 5 +----
 .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
index f5554da6bc6c73e94c4a2c32b150b28351b25f16..8fc5af8f27f9eb95b88eeeee32ad4774f5f21106 100644
--- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
@@ -23,11 +23,7 @@ properties:
   compatible:
     const: led-backlight
 
-  leds:
-    description: A list of LED nodes
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
+  leds: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
index 8ed059a5a724f68389a1d0c4396c85b9ccb2d9af..5c9cfa39396b0ba89830e520ade108bfd1a3f12e 100644
--- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
@@ -17,10 +17,7 @@ properties:
   compatible:
     const: leds-group-multicolor
 
-  leds:
-    description:
-      An aray of monochromatic leds
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+  leds: true
 
 required:
   - leds
diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index cf7712ad297c01c946fa4dfdaf9a21646e125099..3ad1590b04966f52c3643543f4ab28f71ab59638 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -17,6 +17,14 @@ properties:
       An array of phandles, each referring to a flash LED, a sub-node of the LED
       driver device node.
 
+  leds:
+    minItems: 1
+    maxItems: 1
+
+  led-names:
+    enum:
+      - privacy
+
   lens-focus:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
2.48.1


