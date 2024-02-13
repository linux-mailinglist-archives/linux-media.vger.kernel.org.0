Return-Path: <linux-media+bounces-5085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B134985332B
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 15:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18907B24C57
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A597A58128;
	Tue, 13 Feb 2024 14:29:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3579F5810D;
	Tue, 13 Feb 2024 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834599; cv=none; b=PHI8n8iFIfWw8c7HvSfMHCHwTkfK9MZnIuO3ezhMZzjI69ckP4fCwqHG6HYZ70y0CZs1YIpsz/5r73xRFjahV2JlySSCeojS8rrzGTTc4EHF9BadEjZmsZA+mO/SuhdkwP8ijAGJVCOCkqxz+eRBnrc2S01T5/9OhoDPLBBvZJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834599; c=relaxed/simple;
	bh=CR/4Ef5S+DNV+jbkc6W5sJuzza/MFifXUMGq8G9r/34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GanPDUD2GTamcPZk7b1VJAkkB3qDFKOXzlae72CFF36TpT0ZRUUv3XRf2AcQH1gdWEDDke7+/3bO/MykgJq7p5m+WpPEiyPpkPiLlCq0w8EaCwGxPFcEaPHBktPTGMJdFnJ9/hyN/HSlXqdvwY0LWfFinmVzM4jSo7BE106PGVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="197702700"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Feb 2024 23:29:56 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 204F34215B73;
	Tue, 13 Feb 2024 23:29:51 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/2] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU block
Date: Tue, 13 Feb 2024 14:29:41 +0000
Message-Id: <20240213142941.161217-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
References: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the CRU IP found in Renesas RZ/G2UL SoC.

The CRU block on the RZ/G2UL SoC is identical to one found on the
RZ/G2L SoC, but it does not support parallel input.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added Ack from Conor Dooley and Rb tag from Geert.
v1->v2:
 * Dropped the description from if/else block.
 * Dropped driver reference from commit description.
---
 .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index 1e72b8808d24..bc1245127025 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r9a07g043-cru       # RZ/G2UL
           - renesas,r9a07g044-cru       # RZ/G2{L,LC}
           - renesas,r9a07g054-cru       # RZ/V2L
       - const: renesas,rzg2l-cru
@@ -87,10 +88,6 @@ properties:
           Input port node, describing the Image Processing module connected to the
           CSI-2 receiver.
 
-    required:
-      - port@0
-      - port@1
-
 required:
   - compatible
   - reg
@@ -102,6 +99,36 @@ required:
   - reset-names
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g044-cru
+              - renesas,r9a07g054-cru
+    then:
+      properties:
+        ports:
+          required:
+            - port@0
+            - port@1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g043-cru
+    then:
+      properties:
+        ports:
+          properties:
+            port@0: false
+
+          required:
+            - port@1
+
 additionalProperties: false
 
 examples:
-- 
2.25.1


