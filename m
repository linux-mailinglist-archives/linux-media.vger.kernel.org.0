Return-Path: <linux-media+bounces-35671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1B0AE49ED
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C340E3AAD02
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF862BEC50;
	Mon, 23 Jun 2025 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FRsClA47"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D5E2BEC20;
	Mon, 23 Jun 2025 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694871; cv=none; b=s/zOEXv2keLSOQ4BsGoOUumcD1h3QN56f+gaSKN2P1PDD5E44ToyuyVzX+7RN1WJHlF0787GmvEjEkDPCGMYLsAIammT0RtuimPnbvZWGuVRckVDOoRpUIxwYab3sYf1bTwoyCdgS79TZJrHfL8S3eDMYE9q/s0ux1cVY1K1eeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694871; c=relaxed/simple;
	bh=2JOkEWj2nxlL4OQAWq+ph3hM6u/KePKw05vuGP16VR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d39kkQL1K+PPxsyNb3TDWNTJBUS05sLRM+faGISCFpU/fWe9nL4ZvcU9vMYx9titLWDZoXnsFL1rWJrxDA64wpq8OAcwhmxSOKhueh1KCm+1/LmBIy2ioPtmjabso4dUEZo4JDXX8n9nGnl3FOpeaYYt1ScIe4fEXLaBdi98+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FRsClA47; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694867;
	bh=2JOkEWj2nxlL4OQAWq+ph3hM6u/KePKw05vuGP16VR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRsClA47ngXTTKiZxLgNCplltBR8QgvCb55gfYhNvdjZHNFfWm3SaazcLx8yHn/Hj
	 BWLT4SsKQrGoukpvKTrw6gFAyS31FrErp9fD1q6k4AYROedh2R8Eti3NuaIGd0y9Yb
	 6zJDgrV5X8nUFLkyM0CDVAet38ePMdm+/jYPVBQ+g6iLeZ+SwqCt6lEqT7lu3s8RRm
	 9mDJxZntfrTswh29u+7nr/xrPSH4XcbbuACuqhQcpBiQsijqjbNuVaanxVr8HWKyaW
	 R8Tc15Xwuk8Yup2FGW06r8srTejUjLnfkAe4rekDg4ZMD9qJSNdv2tWVv/Yb5C9jKx
	 NDtDxbDnj+Yog==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CA4B17E06BF;
	Mon, 23 Jun 2025 18:07:44 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/8] media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
Date: Mon, 23 Jun 2025 12:07:15 -0400
Message-ID: <20250623160722.55938-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Rockchip RK3588 Video Decoder bindings.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/media/rockchip,vdec.yaml         | 77 ++++++++++++++++++-
 1 file changed, 74 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 08b02ec167557..e9b82dc05fd1d 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -10,13 +10,14 @@ maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
 description: |-
-  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
-  HEVC an VP9 streams.
+  Rockchip SoCs have variants of the same stateless Video Decoder that can
+  decodes H.264, HEVC, VP9 and AV1 streams, depending on the variant.
 
 properties:
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
+      - description: The function configuration registers base
+      - description: The link table configuration registers base
+      - description: The cache configuration registers base
+
+  reg-names:
+    items:
+      - const: function
+      - const: link
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
2.50.0


