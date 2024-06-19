Return-Path: <linux-media+bounces-13733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E967B90F194
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4864AB23FF3
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABE078C91;
	Wed, 19 Jun 2024 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IyXxw512"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B77F48C;
	Wed, 19 Jun 2024 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718809282; cv=none; b=hbdwtD6Ho49oIFpAfwvwm7KCvVNBCM28kBs89mOxRp94qtYVrePJz8k70MQxfcs0GdW3SyNlcidoTHSOHxLldOZjgqfqRNecHWw4efWM96GF33t721tHOZ/k7fP4AkAMNiy0xRatyrXpvA3QopgfQpdttoYR1W0sgqUljyjEiXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718809282; c=relaxed/simple;
	bh=1z6lF3a2haAL4uzEgyYmi5w0gQOd0Ru6HiKwTfg7DFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVx9XD/j3ItxsVpJNl9nE78RAeTnmp9q4bjRue1pek1MAR7BR2AqrojJ2Siv6ZJHiCgnkaBPjvkzcfGMIL461JU0xxoiv7+CjG1A/JffVUm5Z6va+vxMi89sigdZTvfXPrZuUKdnLjAjoc8v8ILOIaQX2FscdhRU/l5J4v5zHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IyXxw512; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718809278;
	bh=1z6lF3a2haAL4uzEgyYmi5w0gQOd0Ru6HiKwTfg7DFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyXxw512VWnnzmvoNy5Kk5Z2rl1LR9ZWLLV5TMkaOovgeCvVpx7bC217+8hgK6N13
	 zoz0apYBnq6mQJEAH+WMzGvLGpDTt47ykdL1C9ZYFFzx4u7xVNZt0sigAXdu97kAy+
	 x9QDJfaYLHtLqab1DUeLmwjSHrPcrcmVbV5OxVh0jAu73QrIr/4x85JSFJR3cPglL3
	 BRMmbCJCRycE2WGQIvXz31IuOc3Vjn39wy8WYxXaymmrRTqBE/cUE9g+kAZrwGX1q1
	 dNv5EyOPhxkV7M+ak1rNCLrgGAPpaA36e9BxtEzboB/3qwfWAQEN3sRAstnsuw7iKT
	 zGqkqyGdqqrYQ==
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4B82537821A9;
	Wed, 19 Jun 2024 15:01:14 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alex Bee <knaerzche@gmail.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 3/4] media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
Date: Wed, 19 Jun 2024 10:57:20 -0400
Message-ID: <20240619150029.59730-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619150029.59730-1-detlev.casanova@collabora.com>
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Rockchip RK3588 Video Decoder bindings.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../bindings/media/rockchip,vdec.yaml         | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 08b02ec16755..22cb62faaa9b 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - const: rockchip,rk3399-vdec
+      - const: rockchip,rk3588-vdec
       - items:
           - enum:
               - rockchip,rk3228-vdec
@@ -30,29 +31,56 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 4
     items:
       - description: The Video Decoder AXI interface clock
       - description: The Video Decoder AHB interface clock
       - description: The Video Decoded CABAC clock
       - description: The Video Decoder core clock
+      - description: The Video decoder HEVC CABAC clock
 
   clock-names:
+    minItems: 4
     items:
       - const: axi
       - const: ahb
       - const: cabac
       - const: core
+      - const: hevc_cabac
 
   assigned-clocks: true
 
   assigned-clock-rates: true
 
+  resets:
+    items:
+      - description: The Video Decoder AXI interface reset
+      - description: The Video Decoder AHB interface reset
+      - description: The Video Decoded CABAC reset
+      - description: The Video Decoder core reset
+      - description: The Video decoder HEVC CABAC reset
+
+  reset-names:
+    items:
+      - const: rst_axi
+      - const: rst_ahb
+      - const: rst_cabac
+      - const: rst_core
+      - const: rst_hevc_cabac
+
   power-domains:
     maxItems: 1
 
   iommus:
     maxItems: 1
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to a reserved on-chip SRAM regions.
+      Some SoCs, like rk3588 provide on-chip SRAM to store temporary
+      buffers during decoding.
+
 required:
   - compatible
   - reg
@@ -61,6 +89,24 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-vdec
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+
+        resets:
+          minItems: 5
+        reset-names:
+          minItems: 5
+
 additionalProperties: false
 
 examples:
-- 
2.44.2


