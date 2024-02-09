Return-Path: <linux-media+bounces-4893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECA84FA1B
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE6A28CD48
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881061292E0;
	Fri,  9 Feb 2024 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uBKbO5Yb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E10E1292CD;
	Fri,  9 Feb 2024 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497340; cv=none; b=Dgf+kF7ZIyOsiuXpl01Zh48r2s2vlG8sHYiIgn1Ky1zyzVApWgRqNHnGFuePys+TkhzMEmpO/Qq5cSX1jVXdJpuu8yuc//JCn3XN/q0ZMawOBLlzMr5DRxB6+RSP9dYKUqCHcx9Jdll8/tHKhqDjWDHg/kTuPVpC3mFqrZO4cLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497340; c=relaxed/simple;
	bh=OAclkye9DDW6Yk4p5ah4fFY1jdMpkElB8mkQKR/nlSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bX84CI44GLJ/FRB+iqHfQvB7hLZ5RaWHjMt6wgER3npBAHDbtdvHVOw86SNwFuce/odz/f4qXfiazPQII5wrFm83KyDeDxMtJ5/m6vGsSZW4gEm+/oOm0pC2trKJ7WcB+a8z5jqld2zCpVjtRa/1BpCicsGrvK6gH+tcFO+j9sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uBKbO5Yb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A339C51A6;
	Fri,  9 Feb 2024 17:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707497244;
	bh=OAclkye9DDW6Yk4p5ah4fFY1jdMpkElB8mkQKR/nlSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uBKbO5YbBbywGpTBvZWsGbV4sS1R1vPrIidItviM0zwSyW7Qcf+XU3Ipp7xvPyZ8H
	 EcUpbWo4TSmJxtcnmS5TUy1LyZDtMIc6Z+FymJyJE90a0mL+woph0eZdZVmidf7077
	 yIgVnE998k4GAnLO6sA1b6+iBwkGERsMrkxcVG4Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 6/8] media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
Date: Fri,  9 Feb 2024 17:48:21 +0100
Message-ID: <20240209164825.166800-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
signal processor.

Datasheet:
https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../bindings/media/raspberrypi,pispbe.yaml    | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
new file mode 100644
index 000000000000..50111b87ad81
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,pispbe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi PiSP Image Signal Processor (ISP) Back End
+
+maintainers:
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+  - David Plowman <david.plowman@raspberrypi.com>
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
+
+description: |
+  The Raspberry Pi PiSP Image Signal Processor (ISP) Back End is an image
+  processor that fetches images in Bayer or Grayscale format from DRAM memory
+  in tiles and produces images consumable by applications.
+
+  The full ISP documentation is available at:
+  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
+
+properties:
+  compatible:
+    const: raspberrypi,pispbe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: isp_be
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rpi1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp: pisp_be@880000  {
+             compatible = "raspberrypi,pispbe";
+             reg = <0x10 0x00880000  0x0 0x4000>;
+             interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+             clocks = <&firmware_clocks 7>;
+             clock-names = "isp_be";
+             iommus = <&iommu2>;
+        };
+    };
--
2.43.0


