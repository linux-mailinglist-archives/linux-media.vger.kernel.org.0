Return-Path: <linux-media+bounces-28751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFECA70C22
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 22:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07FA7177B38
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 21:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C534426A09F;
	Tue, 25 Mar 2025 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FMEbMeYr"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57926A086;
	Tue, 25 Mar 2025 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742938419; cv=none; b=N7UaeqzgpAwxnP2gRtlM1UBFqKpEk/UnJf14VMnY86tsA2uLxMZuhzUwVh1x9odG/HCfujeuhfeeeOKSSoIcbHAfgPJ98oAoVGP7duUVQptiEMKps65/WbkY07p/shdFxJGr86xfnIE6QS3eGJOv6bZXNdiGxzQtEEwzrcMjUiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742938419; c=relaxed/simple;
	bh=/9mhkK7PNkdR6KIwtO7Gr+XPvYbLrV1O3pMYp3QMHt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOrCEQqWyFOysVcjauEKggsanzxO+d7p45WMiVpJVMQOnjLH0mVmNgCG1wY8E94CBYsRDXya+1rdRVM3dhIrl63TA8yNDD+hiGzhaXiqFIC2IJO+Ulok45Ca1Omyu0Gdyn/jiminGUez/eyjwiR3GTBdoiqV15xsRKuScZrgZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FMEbMeYr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938415;
	bh=/9mhkK7PNkdR6KIwtO7Gr+XPvYbLrV1O3pMYp3QMHt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FMEbMeYrM51V7OWwm5V12+2suv9QhNG+1is80XCOL6tsMHtu3TsLDQO3NRDxb7E0s
	 xQnPMXcfmc228flM3oazzjlIm11WQrvWc0ZmvPrjYzRaX5CGbnsyics0HttYe2Q8mU
	 T57SR9CTVeFKykJOr97sq15b4K49d2/3r/prdAs13hpjPXo1d/vZTIOuEzJcQq7LoC
	 nixddaBMSzEQvRCJqTR+ZidigwDxZhUqBNqGKt/wJ3HrGprT3v+bHENpcIL+4VrsO2
	 J+plHD7hh42fuXJkC0AREkT9cJ3JEQ2pT4NOQdlEsCmygm6r4ZGho9gO/kp9nvzTCj
	 1K+fDgQfkb3TA==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD36D17E0F94;
	Tue, 25 Mar 2025 22:33:31 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v4 5/6] media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
Date: Tue, 25 Mar 2025 17:22:21 -0400
Message-ID: <20250325213303.826925-6-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325213303.826925-1-detlev.casanova@collabora.com>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
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
 .../bindings/media/rockchip,vdec.yaml         | 73 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 08b02ec167557..bb79499bebb09 100644
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
@@ -24,35 +25,72 @@ properties:
           - const: rockchip,rk3399-vdec
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: The link table configuration registers base
+      - description: The function configuration registers base
+      - description: The cache configuration registers base
+
+  reg-names:
+    items:
+      - const: link
+      - const: function
+      - const: cache
 
   interrupts:
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
+      - const: axi
+      - const: ahb
+      - const: cabac
+      - const: core
+      - const: hevc_cabac
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
@@ -61,6 +99,39 @@ required:
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
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+        resets:
+          minItems: 5
+        reset-names:
+          minItems: 5
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names: false
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+        resets: false
+        reset-names: false
+        sram: false
+
 additionalProperties: false
 
 examples:
-- 
2.49.0


