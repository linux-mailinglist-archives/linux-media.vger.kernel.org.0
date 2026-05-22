Return-Path: <linux-media+bounces-62647-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDbEOB/KEGpAdwYAu9opvQ
	(envelope-from <linux-media+bounces-62647-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:26:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C33F5BA6D3
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2769F30433C4
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58AB38E8BA;
	Fri, 22 May 2026 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXfMFFxN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDEF389107;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484997; cv=none; b=lvJx3/oC5yc1L2t1JFvQnGydfJ8GZEPo5bE78i8mrJAsBXIzK61gKuaxAJqU/jh816uziw4CLw9/BDTk7Kx4kpvV3Wp/uk0hNAOGvaQpc8/kO2/41Nl5F/LH80e7lb5KfbIOGwKf+eZHlDJi6Oo5N4JzCedJ62irv5jEgAnzgMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484997; c=relaxed/simple;
	bh=NVSWHAFR1LsCrLz77aschyKwNIXtNKkr5g0+WCuZBCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2hiv17Os+tXiMJ02eTbUmewybdXrZ5w/fmNRtp0bsyYxikXXNBs5K/vNYjMo2AEMZvcUdQ1WmMZdHbULuIjvss9Ee7h6cQnBfvehhgMftPUmwFOijU/c6fgW7TxaE/sI2JJI+qEDvAip5IA1eCWLMWo9lRypFOzsNm5J+2C7Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXfMFFxN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B819DC2BCC7;
	Fri, 22 May 2026 21:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779484996;
	bh=NVSWHAFR1LsCrLz77aschyKwNIXtNKkr5g0+WCuZBCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nXfMFFxN6vCjqLQaJm86dEdDlga29hcHc6tS1APgc6BWhfG+S7P0VAogiZB3BO2Gz
	 buBo3+U8nedC2kENfMJb253Hg1n1x51t4qywIirMyiFR0BZTCBxuTcB9loIH/w20d4
	 bXLs/NVgJGGJYOA8byPTyiNJhAbjYavrHHWFAvWtj4Sq0UgIHXvOSXS0vV4x2KgO77
	 6kExmI49nzSgOnIMOx0CHSR2haIl+oJWpi6QMDcCR+c+aHB+fn3Q2NH/8Y0j2a9dMT
	 QS20wpjjzVwDt1+j7zgcN2x2qOBr5vr33TNcNQNXOVc/s4Ne4XdFelqzC6SWkklKq+
	 DSpTFlGwbkaZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83D8CD5BB7;
	Fri, 22 May 2026 21:23:16 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 22 May 2026 23:23:08 +0200
Subject: [PATCH v5 2/8] media: dt-bindings: add rockchip rk3588 vicap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rk3588-vicap-v5-2-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
In-Reply-To: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
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
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779484994; l=6436;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=im+o/JIpnBODW83u7tZJGsEttv7DKCVZnFjWMn7O7Ds=;
 b=/9Z4cuEnd7E2AIBT2dyZPM9JBgN6OunMh7RhUwHCZ/PZLElRjwjqMv8Rei8T6aofmB//fOg0r
 TuvyywQ8ME3AQR6gN+dTh21InrQQ0GhQcVSzs+vDFX6Bfz7HO+bl0WS
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62647-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5C33F5BA6D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit. To
that end, make the existing rockchip,rk3568-vicap documentation more
general and introduce variant specific constraints.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 173 ++++++++++++++++++---
 1 file changed, 154 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 18cd0a5a5318174910e04f6ef7558c92cbfec899..080b64503b1bc44d0cfa796db8ec0eb369ed4c52 100644
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
@@ -26,11 +32,8 @@ properties:
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
     items:
@@ -38,25 +41,19 @@ properties:
       - const: hclk
       - const: dclk
       - const: iclk
+      - const: iclk1
+    minItems: 4
 
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
@@ -67,8 +64,15 @@ properties:
 
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
@@ -100,13 +104,75 @@ properties:
 
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
 
         properties:
           endpoint:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
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
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
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
@@ -114,6 +180,75 @@ required:
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
+          maxItems: 4
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
+          minItems: 5
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
2.47.3



