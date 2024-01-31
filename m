Return-Path: <linux-media+bounces-4519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD108444C5
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 17:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2672528B43A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 16:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBCC12BF17;
	Wed, 31 Jan 2024 16:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m+gxBDTh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336BD12BE8D;
	Wed, 31 Jan 2024 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706719653; cv=none; b=DDH1qZAbrYfTKIFx6BaKxVOBsopLy8IGgFtQkXJdOD70C02BUAp5fItKlLhifjNTm3x/h+hWf4PuqQWBjFrjlQfk05bp8xjVxJfDgoIAQ9vg/41EB5tfp1B9OTfSVreyauH9nGHlA3FdD6Pbc7Tfw4rhz/k6uBeIU6vS2HDJjGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706719653; c=relaxed/simple;
	bh=7pHB5n4BykflI50yxIFV4NZpNuizcPWZRqjqfy1VFrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BpiNWjL+NJL54G7BCcDMwymzfSpyBQCovHv7Un7g7dewZQE/kkJq06/PFKRIVujzT86jvBamvAal0pIGcgC51kJ+TzFITTQpWQsxrHckpkVcVD7mLyvP786p1LnfiIJLkn16PDCJwICD9Q0AdtEF8uaqqT46EsR6XHNn4VaiPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m+gxBDTh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA4D06508;
	Wed, 31 Jan 2024 17:46:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706719566;
	bh=7pHB5n4BykflI50yxIFV4NZpNuizcPWZRqjqfy1VFrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+gxBDThpOZHhjmmOqroSoMc4IarTWGoo+082ldYIzwV13ImfVwRyZXbavi+Eot6a
	 XvRxTzO0cpY0pBYLQesHQr2J1RbN4CChKyBZOU03/yQJCu+GS8aFPLidOrSS6mZqQK
	 UjtsrrFEBizJCq0Q2Er+7t256UIVsEWKioq/utaU=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Date: Wed, 31 Jan 2024 16:47:06 +0000
Message-Id: <20240131164709.810587-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131164709.810587-1-dan.scally@ideasonboard.com>
References: <20240131164709.810587-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the yaml binding for ARM's Mali-C55 Image Signal Processor.

Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../bindings/media/arm,mali-c55.yaml          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
new file mode 100644
index 000000000000..83000175aeda
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali-C55 Image Signal Processor
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+properties:
+  compatible:
+    const: arm,mali-c55
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    mali_c55: isp@400000 {
+      compatible = "arm,mali-c55";
+      reg = <0x400000 0x200000>;
+      interrupts = <0>;
+
+      port@0 {
+        isp_in: endpoint@0 {
+          remote-endpoint = <&mipi_out>;
+        };
+      };
+    };
+...
-- 
2.34.1


