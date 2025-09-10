Return-Path: <linux-media+bounces-42203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BDFB51667
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 14:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E3CC1C81065
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C301D288538;
	Wed, 10 Sep 2025 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="p7IRNMTT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861E293B73;
	Wed, 10 Sep 2025 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505692; cv=none; b=XoV06cF0O8dBX3cUFmIc4prV21BATUJMiL+fuNHOSNnHJibQRKrnkl+ubDssH7rqjHj9b3AQRGnpxRvuTGWzBXbIMCnI2KckvCEASonBk2NyWN3CJJ2pna797jooNN/3ifHFY68c85dWRgfjgRzHwH0/hfWLwxSZ+EtiXAZohlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505692; c=relaxed/simple;
	bh=O6kMD8HXSfTkDRewsR8EJQ27JNcIL0fez4Ni8uvB7kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqRP0s2jWFADmrgPfIO5FCAN4dbKG7QdjfYJAiddFl9S9F5KTFE9V/K6YSdEWYVNkfbQRcLZZE4DYDN0/gxyVdFPZMXWJrizoeWoGF82zQRZHH2L6WETyhYV4CWAYfzQzlKwTgfOsbEEf04yVzc5FEH58uNpnf+smCKH2nre/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=p7IRNMTT; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757505687; x=1757764887;
	bh=g4yIYgMlwfIYDvg+e1t36HW9ZkkuLGqLFC8H6k3D9N0=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=p7IRNMTTiJl2LyJfkEQIZ2XpSpxRp+anjfbmRmxw1BGwOAdQp4nP6TQNGiWUslFqv
	 OCqW9+7NgVUGVwcaH5rd619qXOT8y+igy8cNSu4BbYRXZNkP94/JsA81LZ2OuNoWzK
	 kyoLN0h+r6mHC7cUBS1bxG3m3kANvUYfA9rzHVb9FMb/IxoBJhcQwtjDmCpSTw3Ern
	 X2EvDCMvI50LRBdJ01H8i7YvK2swFGbiFwOtBJCKfGrAeqfrKHvI17IMxXOPJAMtU8
	 Onleh1zrpjp2OaqJrRiDEKQykAkTr4ky+EX5lek6EA55idT9gBtIF7hXdSKagtNB/0
	 YMarn1oQki//w==
X-Pm-Submission-Id: 4cMK6D4HVgz2ScCs
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 14:01:09 +0200
Subject: [PATCH v5 2/4] dt-bindings: leds: commonize leds property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v5-2-bb90a0f897d5@vinarskis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2864; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=O6kMD8HXSfTkDRewsR8EJQ27JNcIL0fez4Ni8uvB7kc=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHM/rDCvzOngyMsHBRO7D1h6xug1FgyfJ5H5yX//GNT
 7rOq7Cho5SFQYyLQVZMkaX7z9e0rkVz1zJc1/gGM4eVCWQIAxenAExk0lVGhttXkw9LfWYtsxYJ
 1tLtEtO4lsogPCvkmrya2DrnZbWeNxgZPrQJ/hKJ4j58JXSJ8t6gwtPuCuVz15p4TDy6+rTZ3mW
 L+QE=
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


