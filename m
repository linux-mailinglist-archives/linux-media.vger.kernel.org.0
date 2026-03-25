Return-Path: <linux-media+bounces-57018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGQgGBTQw2nuuAQAu9opvQ
	(envelope-from <linux-media+bounces-57018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:07:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5857324788
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59CD93287C86
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769223D34A6;
	Wed, 25 Mar 2026 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeXKpmF+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32C73CFF6F;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439469; cv=none; b=GEqqoM0sjp5/JGzAVY2otfFyajoJkhNgQFLdC9UZNM2G4b/0O5gusrU7IZq/d1CwTL7qd9n58PsT4fP2Mrks9oT0q4VbXKEtLZsTthJtXjpW/1Xyv8oJxWknXab3reOoalpM61yf1O16LcprsJ8qHajESDFON6rS3oiMM074vfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439469; c=relaxed/simple;
	bh=JjjcPqq9H27QPxfBDMqXEuUsyUGVuGKEtryZAio5lrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tU3nFxRpXyN4SFgMwda5HjIpy36PLIP0BwSxFnngc4ndp6CfDd48fkWYJKgT88m8hncH9fU+kl2AkFv7SaMxDXJ5NG40jYWqHFdmQK0jN9qweklySzftTYCRRP/JP+fTz0gk8nYIfPffK3T+H+55KZ0KeCEnJgBl0dgdPg/Axds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeXKpmF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C84CC2BCB5;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439469;
	bh=JjjcPqq9H27QPxfBDMqXEuUsyUGVuGKEtryZAio5lrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oeXKpmF+Ssb56dhuDzTZ8bYVAw47TPYmo2I3Y6Br7BFQfxKeuFViWplqXXWHXjK1X
	 WAseVzxT4qGjF0tuLCJ7hfh6XGnIIFtb5TUxOKE8SpQFAzpHAj7NstAAmfi9nBneeA
	 wu5uBjc98bsGShuFkTG593kuJbslnJmngAhtSD6K3USiN5nTJZHKXeELpuS4CQ5qdW
	 PEtvBzFi2GOXvY9KNU7wtFQUk9YSI4KuSp8WYDbIySfoACV+hsgjxj7pJy6BTT5gRm
	 ocqILi1Km0p6+TVa6F3KTVxGV9oNdu2ALErviUJis0YenSFtuZ06LO2DahmR7MJr9I
	 iZ7ynjCe9YF4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592EE1093168;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 25 Mar 2026 12:51:07 +0100
Subject: [PATCH v3 2/9] media: dt-bindings: add rockchip rk3588 vicap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v3-2-e38e428868cc@collabora.com>
References: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774439467; l=6555;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=oa4KcT9fRYz9I8qYtj9tZE2sEkoYMSd4GpMdemZqn04=;
 b=/KDSFbVMYD09sLoLmNNsigUIQm54I9NYo0iabgQuiGDwRr508GdhthCGkPJOyS+aLQIO1ysV+
 6uuoRJpIvRaA8ILKyI4sIs5L72oIG2pxGKQzoZCAF8EMJDTCZ3vgsqR
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57018-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.10:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.3:email]
X-Rspamd-Queue-Id: B5857324788
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
To that end, make the existing rockchip,rk3568-vicap documentation
more general and introduce variant specific constraints.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 187 ++++++++++++++++++---
 1 file changed, 163 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 18cd0a5a5318..897ed00c239b 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -15,9 +15,15 @@ description:
   the data from camera sensors, video decoders, or other companion ICs and
   transfers it into system main memory by AXI bus.
 
+  The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
+  counterpart, but features six MIPI CSI-2 ports and additional connections
+  to the image signal processor (ISP) blocks.
+
 properties:
   compatible:
-    const: rockchip,rk3568-vicap
+    enum:
+      - rockchip,rk3568-vicap
+      - rockchip,rk3588-vicap
 
   reg:
     maxItems: 1
@@ -26,37 +32,23 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: ACLK
-      - description: HCLK
-      - description: DCLK
-      - description: ICLK
+    minItems: 4
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: aclk
-      - const: hclk
-      - const: dclk
-      - const: iclk
+    minItems: 4
+    maxItems: 5
 
   iommus:
     maxItems: 1
 
   resets:
-    items:
-      - description: ARST
-      - description: HRST
-      - description: DRST
-      - description: PRST
-      - description: IRST
+    minItems: 5
+    maxItems: 9
 
   reset-names:
-    items:
-      - const: arst
-      - const: hrst
-      - const: drst
-      - const: prst
-      - const: irst
+    minItems: 5
+    maxItems: 9
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -67,8 +59,15 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
 
     properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
       port@0:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
@@ -100,13 +99,75 @@ properties:
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
-        description: Port connected to the MIPI CSI-2 receiver output.
+        description: Port connected to the MIPI CSI-2 receiver 0 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 1 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 2 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 3 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 4 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 5 output.
 
         properties:
           endpoint:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
+      port@10:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the ISP0 input.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@11:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the ISP1 input.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
 required:
   - compatible
   - reg
@@ -114,6 +175,84 @@ required:
   - clocks
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-vicap
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+
+        clock-names:
+          items:
+            - const: aclk
+            - const: hclk
+            - const: dclk
+            - const: iclk
+
+        resets:
+          maxItems: 5
+
+        reset-names:
+          items:
+            - const: arst
+            - const: hrst
+            - const: drst
+            - const: prst
+            - const: irst
+
+        ports:
+          properties:
+            port@2: false
+
+            port@3: false
+
+            port@4: false
+
+            port@5: false
+
+            port@6: false
+
+            port@10: false
+
+            port@11: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-vicap
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          items:
+            - const: aclk
+            - const: hclk
+            - const: dclk
+            - const: iclk0
+            - const: iclk1
+
+        resets:
+          minItems: 9
+
+        reset-names:
+          items:
+            - const: arst
+            - const: hrst
+            - const: drst
+            - const: irst0
+            - const: irst1
+            - const: irst2
+            - const: irst3
+            - const: irst4
+            - const: irst5
+
 additionalProperties: false
 
 examples:

-- 
2.39.5



