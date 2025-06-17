Return-Path: <linux-media+bounces-35073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53721ADCB92
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80E6E3BD3A3
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625982E6D36;
	Tue, 17 Jun 2025 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyNvtZJT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD82DE1E7;
	Tue, 17 Jun 2025 12:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163153; cv=none; b=mgrgkGyrlZ8hnTHujJK9bLW+iKodJ9nDOO6Vd2Vb0vmh/rZZRJTGtdkHS5BlUSh7j5M7gr9NJCrj4q2pYUSb9QY50l2Il72QPL1iUjjcwx90iM/iMtdbo3VAtA3vJ/D+haZKbBuwsmyBUY6fphiV/Hmbk10wnguHQX6JS6Pr55Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163153; c=relaxed/simple;
	bh=cGUtX2I1TX5Mw8HpaioqDUtXETjbLf4kkml849rWcMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bE4ozO7wIEIMrvCx/s1eIYJlpbZOuWokx7wd7RWs1uUV4fNdJ+tm06yyR+vIRVQFLZraeyAZiNZRULAN0BPgTI1BkLJVpAqhjpUMTHpY9pUxmJ2GLu4BvZKP3l3g2NnYzPFXvjajWzSyZBlaC1GDZ8Q1xkGNhmqCdrb2xDERjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyNvtZJT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAB0C4CEE3;
	Tue, 17 Jun 2025 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750163153;
	bh=cGUtX2I1TX5Mw8HpaioqDUtXETjbLf4kkml849rWcMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oyNvtZJTwe9Sz99WD7ShA0zGmfxgCcGdao99HLk5tN2X7y9ZIuE3MRpyrrb9jceRh
	 yiwI99sW5tqLk5h1Ru3IkHwCOvD4IweIb63HB51RBw/52H7UUhuX1Op9WWcF4qpsfu
	 e3nUtmNP6rjwfrVWX+slB0Gyypk/I6gHPj38+7yWsJBQahxG86TA6w9hBWQzqqoDP5
	 kBN6wYvaJFbFIuDCppupW4CvLMZ5B+bY1Jud3hv/pq6FAWDVryyUhluw03rq+pyDPy
	 RGFPYsoiuk+I2NRo27StaMb80N5sahwaO09wkxNON9Uf8/bx1FP1t2VJ/dBSZjt6Fn
	 UR7yReJXNk+pg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 17 Jun 2025 14:25:40 +0200
Subject: [PATCH v5 1/2] dt-bindings: reserved-memory: Introduce carved-out
 memory region binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-dma-buf-ecc-heap-v5-1-0abdc5863a4f@kernel.org>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
In-Reply-To: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cGUtX2I1TX5Mw8HpaioqDUtXETjbLf4kkml849rWcMw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmBcScDQ08LhRWeOOWxxC70UXuiE/+Gm/KtO60MXi++8
 jfn7tn3HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiyn2MDT945obO67y+iPtX
 7l6Oz6v5Lv9r0HYQ3TV9V0HJ4ZunGn8s+sYWNuPEujDZaRyf9BhPpDDWaX8MiX9r0vHAt3hb0cT
 or54eV4SrWjYlc6fZ3lVbcPb7WyvhLYWCqUbt9Rsnf/l+i1sSAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Some parts of the memory can be dedicated to specific purposes and
exposed as a dedicated memory allocator.

This is especially useful if that particular region has a particular
properties the rest of the memory doesn't have. For example, some
platforms have their entire RAM covered by ECC but for a small area
meant to be used by applications that don't need ECC, and its associated
overhead.

Let's introduce a binding to describe such a region and allow the OS to
create a dedicated memory allocator for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../bindings/reserved-memory/carved-out.yaml       | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9ab5d1ebd9ebd9111b7c064fabe1c45e752da83b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/carved-out.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Carved-out Memory Region
+
+description: |
+  Specifies that the reserved memory region has been carved out of the
+  main memory allocator, and is intended to be used by the OS as a
+  dedicated memory allocator.
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    const: carved-out
+
+  reg:
+    description: region of memory that is carved out.
+
+allOf:
+  - $ref: reserved-memory.yaml
+  - not:
+      required:
+        - reusable
+  - not:
+      required:
+        - no-map
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        memory@12340000 {
+            compatible = "carved-out";
+            reg = <0x12340000 0x00800000>;
+        };
+    };

-- 
2.49.0


