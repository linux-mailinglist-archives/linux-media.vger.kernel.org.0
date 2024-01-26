Return-Path: <linux-media+bounces-4222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1D783DADD
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 14:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD204B22D62
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 13:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B091B96F;
	Fri, 26 Jan 2024 13:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC5A1B95B;
	Fri, 26 Jan 2024 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706275896; cv=none; b=ErjCVA3Fd0HcrV8wnHT76Isiq3wqqicCpIoOIHpXRKZds2sHrS99MelAeRCvNMsaQqijpTSXvHLTDY59lVod6IRoT89BLFHufkJnAwZI2YkAOoS8r0Jo1eJhxVLU8h/L9T2f4pT8E0Zsx35JqORCMsTMEGeX7BKzS5ne9iGmnUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706275896; c=relaxed/simple;
	bh=G0YbHSvhHbygRwbklrXB9ulhvywONDt1OTL6RMbcfho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O2X3hKO1LvIN500MmtgntIQVe7a1e1KTxP3h3QcHwbpbnfURirc5nSdUwuV+jqkvu1x/pHJPSToRbygXUk1RyM7V0rtyQYHs3t0xi8YUqj/kgOLXFgRQsVKKWWg63p1Q9dgtu4jFjJaQUs1hoJtXHPnOBba7Fbgj3p2m98wPrYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="195755058"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2024 22:31:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.117])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DD07E422D9B2;
	Fri, 26 Jan 2024 22:31:29 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/5] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU block
Date: Fri, 26 Jan 2024 13:31:13 +0000
Message-Id: <20240126133116.121981-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
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
---
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


