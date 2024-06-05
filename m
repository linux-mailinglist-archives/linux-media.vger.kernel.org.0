Return-Path: <linux-media+bounces-12588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEA8FD1E7
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 17:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73BBE1F2759A
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 15:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B191815216F;
	Wed,  5 Jun 2024 15:41:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA8214D71B;
	Wed,  5 Jun 2024 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717602098; cv=none; b=mHKNnhMynebExrxmQKh+jmOJeebz3l+8zg7O29wUVA7OHgLCOr7cTW6zzP/I9iaeAwTI97G8SqYZxK/lWQEz0LdgxivTU1L3exK5omUEMu7Cp0aDEY3W3VbgHX1bsjCZOi6YSOeATC9IiELwQ5IAiHAxI9+6mY01i2f/6LNgcPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717602098; c=relaxed/simple;
	bh=vPSlS4fxtyW7yYrkjtRzst1VQs8ZPYLyKvCuLEmEwUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RUn56VS7qG0QR2817DpGVjzAzLcMaaYuv+GJROPeUVqwrROOs0K6CO2hNQ5E2q2gCMKUpvVeeHNeNFvx7ims8Hr6Ed7WNLr5D3eGEBIuN4v4yj9kVVN9B3a+eVyferNSVFVshBhcSwiUTq+p8+oizvdAxxLM67EksyD11uGmmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,216,1712588400"; 
   d="scan'208";a="210791040"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Jun 2024 00:41:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.154])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A4D2040062C0;
	Thu,  6 Jun 2024 00:41:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v3 RESEND 2/2] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU block
Date: Wed,  5 Jun 2024 16:41:15 +0100
Message-Id: <20240605154115.263447-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605154115.263447-1-biju.das.jz@bp.renesas.com>
References: <20240605154115.263447-1-biju.das.jz@bp.renesas.com>
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
v3->v3 resend:
 * No change, just rebase.
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


