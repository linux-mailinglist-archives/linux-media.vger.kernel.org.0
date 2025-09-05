Return-Path: <linux-media+bounces-41811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9FB450B0
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61673A43E0B
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0734B2FE587;
	Fri,  5 Sep 2025 08:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="VBfMhe2F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823622FC026;
	Fri,  5 Sep 2025 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059217; cv=none; b=pOVXMyLE0jSnIimMXl5bUH1br7WB+ZS6JWOqXBNUYbOfQEjz1ViPpwqK4JyEELCE2JIV7kjckIGe/LWkOZIXDbo3XHojLZCsFegD5WBKJlUf26j5Iu0vTSZGi2nWfKgNBLMocTN5aKKadaMMaG6kpjosWGH2/s6sBeJ+iMsF1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059217; c=relaxed/simple;
	bh=kLPrQ659PXpBtUHxSKyrlCPL8odBGqiSsZ+49Xj2WT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrxcjsV1YpOR67dgcntRZ3JGDZl9fchqWvuaQmiFrqhDeVA+mrWKxGzzVWRDLfjx44SnPdboLaRxJ3G2OM6VJsyJXWeo3s1Ve6E75BfRxmxaFJ4eSSg321D88diGTgiQDMBoQQnpcNRVa9uN6PiacH3CrAE84foerD0IpsaNyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=VBfMhe2F; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757059208; x=1757318408;
	bh=BJo0FJum8sQrRT4jsiM538uClhfHDmbKIzs7j5jXPQc=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VBfMhe2FjrHeHJG53FiZ5vPPZ+AZ6DgtfeNSLJIKJTNA6nqgJT2MFiZu5zHAHPiAo
	 WkAfizok97IA3GPc1sML1fz8rrOf/2nMLq/j8X8eqFZVdmpPlMDhkE/dbDZZglA444
	 I+Ryi2EaRW9j8sS+m1YM5KVR+lQz0SRv0OvgoKS7S73N6aFhpa1jepFYU7xMlZGKmr
	 krKC9TvxD62F94MJcA7hatjSzNflML6MruPoKGe8x86TXQXykyDxkvLgjFLoCLDyyK
	 UeRd5CQdSEWhBUOTo95fvc8Sr8B0o9+fiNQu1eMLQz+eFFsvSnF2Zo7LWvw36H06iT
	 Yg/akqmCu+++g==
X-Pm-Submission-Id: 4cJ8050D40z2ScWX
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Fri, 05 Sep 2025 09:59:30 +0200
Subject: [PATCH v2 2/4] dt-bindings: leds: commonize leds property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-leds-v2-2-ed8f66f56da8@vinarskis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3023; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=kLPrQ659PXpBtUHxSKyrlCPL8odBGqiSsZ+49Xj2WT4=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBm7ZtTX877LP3guYc/u7lkf1hckTE5rDF0VHdJ2N+D00
 wvHT03Y1lHKwiDGxSArpsjS/edrWteiuWsZrmt8g5nDygQyhIGLUwAmIpHF8M9YNdZYddEO+VP1
 7naREvM7zu6x3ujhfNNNvk/44uaKi3KMDN3Ghnd/MjwpYPmxaXmcypyq1+3977pn2C1edHRdsHX
 KVD4A
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
 .../devicetree/bindings/leds/backlight/led-backlight.yaml          | 7 +------
 Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml  | 6 +-----
 .../devicetree/bindings/media/video-interface-devices.yaml         | 3 +++
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
index f5554da6bc6c73e94c4a2c32b150b28351b25f16..5e19b4376715eeb05cb789255db209ed27f8822f 100644
--- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
@@ -18,17 +18,12 @@ description:
 
 allOf:
   - $ref: common.yaml#
+  - $ref: /schemas/leds/leds-consumer.yaml#
 
 properties:
   compatible:
     const: led-backlight
 
-  leds:
-    description: A list of LED nodes
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
-
 required:
   - compatible
   - leds
diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
index 8ed059a5a724f68389a1d0c4396c85b9ccb2d9af..b4f326e8822a3bf452b22f5b9fa7189696f760a4 100644
--- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
@@ -17,16 +17,12 @@ properties:
   compatible:
     const: leds-group-multicolor
 
-  leds:
-    description:
-      An aray of monochromatic leds
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-
 required:
   - leds
 
 allOf:
   - $ref: leds-class-multicolor.yaml#
+  - $ref: /schemas/leds/leds-consumer.yaml#
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index cf7712ad297c01c946fa4dfdaf9a21646e125099..1e25cea0ff71da2cfd1c7c4642713199f3542c0a 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Jacopo Mondi <jacopo@jmondi.org>
   - Sakari Ailus <sakari.ailus@linux.intel.com>
 
+allOf:
+  - $ref: /schemas/leds/leds-consumer.yaml#
+
 properties:
   flash-leds:
     $ref: /schemas/types.yaml#/definitions/phandle-array

-- 
2.48.1


