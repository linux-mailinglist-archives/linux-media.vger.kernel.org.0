Return-Path: <linux-media+bounces-49029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CAECC9ADF
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 23:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2508A3043F61
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 22:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39D4311599;
	Wed, 17 Dec 2025 22:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="puMQ4GBY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y9g6wlZW"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155CF306B0A
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 22:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766009823; cv=none; b=U+nhaVdoBoGOvMmKx8H484IWh1GzfgEyLp+gLpSuZmGse0ie8N4vp2kj7mpBXcKdbQ2AGNpXtWdo7j6YiqR77dLOqlyg9DU+qQBUH6gYAFrBCLmLOyqEWW7KHto5sLeZQH7kWm1olvcq/oykLrb1xEYa2wP+7IwBoh7s91yhUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766009823; c=relaxed/simple;
	bh=J8ECuj6+j8mMmxDfB1ZJALIHx8Z19DYzko5f3uAfxAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MStgQ4vU/CwsN7yxV+tfs2jkxdVrLu2406UKp3eDgFD+KXUmFfcAm6j1tUTAwhsfpXwnnMKkYBrXgMiwrKfNQzgQNVKdgidMPwH+d7/lxZadZ/XCVN6wYkgtcwEXTxip6GVFMRequeyMaghxI/MQ9O2HtH1bLK1WdViMBGHpCpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=puMQ4GBY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y9g6wlZW; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 2D9FA1D00078;
	Wed, 17 Dec 2025 17:17:01 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 17 Dec 2025 17:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1766009821; x=1766096221; bh=B8+KcXjWiGFHg12E7CzNRvnOFH5NVc/Y
	/uAWLx/k/LY=; b=puMQ4GBYxY84AjWY3EOjqlifI43UjAVKsQM5p/Lgy5anwRPB
	v1aaz7auV6AiA+p4s6RaY6u/bY4na61xDQvwId4MvyYgW2ZPSl+f/mqXNpa6gQ9M
	UlTbBDX4yDA5u77hMqBo2aG3Jahf5IGbmdkgDst/+LS24/DpZXwDG1/rHDZOSuek
	XN0eaSZud/EeHNK6zRnaeoBMbtPyIVfWaam7rjFagHCZ3x7DGNKaFF/LxX3qFTP/
	kj+8Jx77PicK6+CBGtLby1A46LuvUr5M3T4dXvKykq85hvAOJddmXUos/irYFWCV
	58kreysggGhaCHXlHrSmH6qCKdI6gIHlRAvSXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766009821; x=
	1766096221; bh=B8+KcXjWiGFHg12E7CzNRvnOFH5NVc/Y/uAWLx/k/LY=; b=Y
	9g6wlZWyialUiDZ/Hz/YdikFVysKVCNRMk5PlRwaIgho9P80QEFbZ/VyBliZZiou
	lYJmPEFiDgNLmXS+dtbYYQ/HSIjiN+np0OHJ5KLFsKUTqBokZQ4fLv0XR75Y2cJV
	eLE6tWgrEt/MP0W3BNHQete3FQjH6QCLataOCUnco1Rkf6rz3uHhR5f2gspaRb/g
	Hi9ykvtU6YDCWTs3dBQreoAVxgybP+b0htwmRdJ3Kdg6EVmDEPEdKommn7Q1c4VE
	p4oOLJbVXq+d6ai69YSSp2oFh9GTAp1oXM4PXdwWu23iartjllhOLQffARbVHfXz
	nulNxztdSEw/mKFJldd9A==
X-ME-Sender: <xms:3CtDaQbadplKcemzddEQa8L9YXOgl0oxfTSCYXdj7ePsvZ6dgfGsYA>
    <xme:3CtDaZNGJCpzsUKCyamhGfYaesahMYS-bHQyt66bul3b4J91TV0QIAM6GFAHFMJwJ
    _QhulEYwznyP8J7W8Cmo6ygL9s_wKU-psSJ_6i86ImJ-ipxnR5CLg>
X-ME-Received: <xmr:3CtDaVZUn7-mOAPbKDWc6METlyH54XTYj6o4E5g24LRu-a3Sn8mMMCii-X7BzVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegfeejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghr
    ucghvghrnhgvrhcuufevjffpgffkfffgtfcuoegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghuqeenucggtffrrghtthgvrhhnpedvgfffveeihfffhfetffduuedvhfettdef
    kefghfffieehvdfftdetiefhtdetgfenucffohhmrghinhepuggvvhhitggvthhrvggvrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    tghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghupdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:3CtDaX16el5LTAPGMgCsFqU_lMTYCoIhJ2fCRu_ks5p9ufhl-qBJ2A>
    <xmx:3CtDabeIWR28aOi5hqI0fac6dKfvSMuFL4kgdVtbZ9QVOSXMvht8Sw>
    <xmx:3CtDaYGG1MW32naRJVUBymQADBcxBcFC2njN9748VA7xL2msw6jJ0w>
    <xmx:3CtDac29U6wmFIYrmj3Hf7g5DfsL_Qfeyj103HLQ3HVeneANNAIiTA>
    <xmx:3StDaQiPgIIds-eVyotddGN1QnbZ0v50C1yJA6YfhEpKVdPUsa6pgluC>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Dec 2025 17:16:59 -0500 (EST)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
Date: Thu, 18 Dec 2025 00:16:25 +0200
Subject: [PATCH 2/2] dt-bindings: media: i2c: Add ov2732 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ov2732-driver-v1-2-0ceef92c4016@schnwalter.eu>
References: <20251218-ov2732-driver-v1-0-0ceef92c4016@schnwalter.eu>
In-Reply-To: <20251218-ov2732-driver-v1-0-0ceef92c4016@schnwalter.eu>
To: linux-media@vger.kernel.org
Cc: Walter Werner SCHNEIDER <contact@schnwalter.eu>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766009816; l=3816;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=J8ECuj6+j8mMmxDfB1ZJALIHx8Z19DYzko5f3uAfxAM=;
 b=lA/ShU3QuORm170jhFW5MZD+hG8Tz1Rq5xCXx+dValaapOxrP9zl6+/SVFvlsjB5rtfXhMv9T
 dTwQbJM0vpVAWLV4Y5d/nJEkbW/lUNfnL4uou2QegdYJ2I3RfbR+Pic
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

Add bindings for OmniVision OV2732 image sensor.

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---
 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 111 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e2de925ff4e35adcdf428af57612a1a488203b06
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov2732.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV2732 Image Sensor
+
+maintainers:
+  - Walter Werner SCHNEIDER <contact@schnwalter.eu>
+
+description:
+  The OmniVision OV2732 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus.
+
+properties:
+  compatible:
+    const: ovti,ov2732
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XVCLK clock
+
+  clock-names:
+    const: xvclk
+
+  avdd-supply:
+    description: Analog Domain Power Supply
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  pwdn-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the pwdn pin. Active high.
+
+  reset-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the reset pin. Active high.
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov2732: camera@36 {
+            compatible = "ovti,ov2732";
+            reg = <0x36>;
+            clocks = <&ov2732_clk>;
+            clock-names = "xvclk";
+
+            avdd-supply = <&ov2732_avdd>;
+            dovdd-supply = <&ov2732_dovdd>;
+            dvdd-supply = <&ov2732_dvdd>;
+
+            pwdn-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+
+            port {
+                camera_out: endpoint {
+                  data-lanes = <1 2>;
+                  link-frequencies = /bits/ 64 <360000000>;
+                  remote-endpoint = <&mipi_in_camera>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 62bb866e4fed1187f8be12e7f41a175e0bdc701e..51dc820154c8515eebd7aa4ed9953521d8ee3050 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19312,6 +19312,7 @@ OMNIVISION OV2732 SENSOR DRIVER
 M:	Walter Werner SCHNEIDER <contact@schnwalter.eu>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
 F:	drivers/media/i2c/ov2732.c
 
 OMNIVISION OV2735 SENSOR DRIVER

-- 
2.51.1


