Return-Path: <linux-media+bounces-4086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1CA838E55
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 13:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 702E4B220B0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 12:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31955EE61;
	Tue, 23 Jan 2024 12:17:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E605DF01;
	Tue, 23 Jan 2024 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706012258; cv=none; b=nf53AIIRdwNWP0mvFb+EMASnnq+C8WtoAVLwIet9Z/yl/51NCtk4MvjUTzn+fJjyU4O6eEmP/7Qh48kZCa7zW+q6874WPBmfK1riZBXE/m2S2R8+Mtg9sNs0ARMMGeWp5fkD1BXSJJYNh61ga9oyfdlh8aDsRDC/OzxxkrVBJGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706012258; c=relaxed/simple;
	bh=XV6JeJqKsP1EoDzA6dhJAxC1K5gB1JItoKWRJnWdCHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCsuTlyIxuNDzuJYbnJ8J/NFnadhnDcbFRUq6EGwmiWgn7XO6g4ZC38jqAQ5JaLoNOAMQ7llv3SVgEGq5Xjh1YCTZx+XsuOPzkCvM1N2LkrzILbmN1quUzhIrWQufnDw6p2jnNgB2c2aPW9vuxzWnTSYKTmqOjPVbK1cXx5frZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="191434795"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2024 21:17:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2819A420E34F;
	Tue, 23 Jan 2024 21:17:30 +0900 (JST)
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
Subject: [PATCH 2/5] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU block
Date: Tue, 23 Jan 2024 12:17:17 +0000
Message-Id: <20240123121720.294753-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
References: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
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

No driver changes are required as generic compatible string
"renesas,rzg2l-cru" will be used as a fallback on RZ/G2UL SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/media/renesas,rzg2l-cru.yaml     | 43 +++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index 1e72b8808d24..7015a01fc1bc 100644
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
@@ -102,6 +99,44 @@ required:
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
+          properties:
+            port@0:
+              description: Parallel input
+            port@1:
+              description: CSI
+
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
+            port@1:
+              description: CSI-2
+
+          required:
+            - port@1
+
 additionalProperties: false
 
 examples:
-- 
2.25.1


