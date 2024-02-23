Return-Path: <linux-media+bounces-5819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6118617F9
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 17:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E0A51C22A31
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 16:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE5512A14C;
	Fri, 23 Feb 2024 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oTMyS1vs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8AE128399;
	Fri, 23 Feb 2024 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705861; cv=none; b=I9nxYY/Xe8PaFbRQ6A4RSGrQ+PvMojPG+7mblV46ofgJHPGtVM/9jhiKGKfDe0m/ZkSdwa4b34KdhESiBCmD6TftZ/EWeO11U5YxFlgS4eUmmZMLDNB9ZxEw6XNChDfJkJzQ8jXD99W3SUsSZHttmzg242SHY9aSCUhjoBe9KbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705861; c=relaxed/simple;
	bh=Px3Vjxw9+J8AX53g9pj55xOK5XcLs+L/5hAUbiWZ5Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iq3L1Ux9LpGbqCOzIMTGq1Ec8o3hdV9RkEHtjE+MViFIJePV5MjQkWB8mVa7gEVmCHHsv8StO6wUsMH7gjLy1sCQlfunus4z/ULheJAkD3Wn1Fwy5vocJNKkZ+DYU7h9VptwltvnjLstKA9MWKStuZKO8HnnFmBHdL9TB84jFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oTMyS1vs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CDDC2311;
	Fri, 23 Feb 2024 17:30:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708705842;
	bh=Px3Vjxw9+J8AX53g9pj55xOK5XcLs+L/5hAUbiWZ5Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oTMyS1vsktX2nJQ2VZeVap0WLz4ktKnYpHlSMRbjsV1Zj/jifaXq/FTFYNm8LNKgF
	 3W3uTP821TGYSgSDB4DY+wsgeNQVM7qNkrW1tTxffMjh7LFfwK4L+VuD79FX+XnF6n
	 61occiqnWTvzXaMQmK5k/VNBn87uO4MRUc3oTTzs=
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
Subject: [PATCH v2 7/9] media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
Date: Fri, 23 Feb 2024 17:30:09 +0100
Message-ID: <20240223163012.300763-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
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
 .../bindings/media/raspberrypi,pispbe.yaml    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
new file mode 100644
index 000000000000..d7839f32eabf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,pispbe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi PiSP Image Signal Processor (ISP) Back End
+
+maintainers:
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+description: |
+  The Raspberry Pi PiSP Image Signal Processor (ISP) Back End is an image
+  processor that fetches images in Bayer or Grayscale format from DRAM memory
+  in tiles and produces images consumable by application.
+
+  The full ISP documentation is available at:
+  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm2712-pispbe
+      - const: raspberrypi,pispbe
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
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@880000  {
+             compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
+             reg = <0x10 0x00880000  0x0 0x4000>;
+             interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+             clocks = <&firmware_clocks 7>;
+             iommus = <&iommu2>;
+        };
+    };
--
2.43.0


