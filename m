Return-Path: <linux-media+bounces-63856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i2b+CvZAImpFUQEAu9opvQ
	(envelope-from <linux-media+bounces-63856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:22:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA9644D4F
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:22:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=iTrIod4L;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63856-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63856-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87E9F304A937
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 03:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC829356747;
	Fri,  5 Jun 2026 03:20:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8632D7DE9
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 03:20:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629653; cv=none; b=gkSD+PdGbymS3ULiiyLLEGpjUsroZ+vpOK14FlqIM5vagCly5egbQ6xhE9TPj3cljfG7uAVoUfW85FN8zd6CLLPltlfx1l4z9GcLmlN6/PSAnylCxKD2Jhn3UNvew1ds13n8/h+j9xhrJL7L35+BkC+LhyVQP+iqEDlvpHyvmKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629653; c=relaxed/simple;
	bh=fJsXqFFHg8y8yucKAu+V9Ezs0IZST0HWeyG5e/QFCKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLVAaMpLAmuAnz6pdRhcdNBxtZeHX3igtdIYgthvGcICzhxRfQ66Nxs6VQkc+79/qGkexdqK8yOoPCTYWPK/X6p/FvvluSQKXF3bJ8kKAHnf2zPdj6n0irRqNDvc/44AtxsimPA/f78aeIcm+f0Mopc2J5ZKN7yJuPjkKCyIqXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=iTrIod4L; arc=none smtp.client-ip=136.144.136.11
Received: from submission12.mail.transip.nl (unknown [10.103.8.163])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4gWmsj16YGzTPNMM;
	Fri,  5 Jun 2026 05:20:41 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission12.mail.transip.nl (Postfix) with ESMTPA id 4gWmsh2lYPz3SJ37N;
	Fri,  5 Jun 2026 05:20:40 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Date: Fri,  5 Jun 2026 05:20:38 +0200
Message-ID: <066f05830969d868aa8ba199d6964a17b877f34d.1780601033.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780601033.git.github.com@herrie.org>
References: <cover.1780601033.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission12.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780629640; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=vh6BmXicCxdLCn5/moMDoi2dKU76VHJhGFbWDzmKQJk=;
 b=iTrIod4Lv+6JKdj9nf3sVIpJIpIcczuCW0da5FdXwGuD/RiCLhY+w+4G84DE3MoFEwecAq
 A9L3Sn+qG0oRHGqUWpfpTEH/Pn8So9Bj6kCvZSWmDgjwc45V0GlguNNRt1FCvLkAl5R8vF
 xLWgJ8w0MAz5BiJ9IVlTUQhwPR1VMs13GOonoyWp0YHmu75QIUJMixDEDEvvtNXxqT/F4C
 mObZIdgYnnlqp2vkNoSBDTyyPx1ZL06UE23u529h+Enpq6NMTQqIVDnF8pM6CeoIjhdw2o
 mcjljWaaKi50IQyXkH4TWjqjw9lAv2Fo108GyzbROrHCNwxVfgNL711a6A/B8A==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63856-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:github.com@herrie.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.103.8.163:received,31.184.93.180:received,136.144.136.11:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devicetree.org:url,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73DA9644D4F

Add the binding for the Aptina (now ON Semiconductor) MT9M113 1.3
megapixel SoC image sensor with on-die ISP. The chip is used as the
front (user-facing) camera on the HP TouchPad tablet and connects
to the host SoC over MIPI CSI-2.

The binding describes the chip's i2c address, optional reset and
standby GPIOs, the per-supply regulators (VDD, VDD_IO, VDDA), the
external clock input, and the CSI-2 endpoint pads exposed via the
"port" subnode.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../bindings/media/i2c/aptina,mt9m113.yaml    | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
new file mode 100644
index 000000000000..7fa7cb2fedf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/aptina,mt9m113.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aptina MT9M113 1.3 Megapixel CMOS Digital Image Sensor
+
+maintainers:
+  - Herman van Hazendonk <github.com@herrie.org>
+
+description: |-
+  The Aptina MT9M113 is a 1.3 Megapixel CMOS digital image sensor with
+  1280x1024 active pixels. It supports dual context operation:
+  Context A (640x480 preview mode with binning) and Context B (1280x1024
+  capture mode). It is programmable through an I2C interface and outputs
+  image data over a 1-lane MIPI CSI-2 connection.
+
+properties:
+  compatible:
+    const: aptina,mt9m113
+
+  reg:
+    description: I2C device address
+    enum:
+      - 0x3c
+      - 0x48
+      - 0x5d
+
+  clocks:
+    description: EXTCLK clock signal (24 MHz typical)
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Core digital voltage supply, 1.8V
+
+  vddio-supply:
+    description:
+      I/O digital voltage supply, 1.8V or 2.8V
+
+  vaa-supply:
+    description:
+      Analog voltage supply, 2.8V
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the RESET_BAR pin, if any (active
+      low).
+
+  powerdown-gpios:
+    description: |-
+      Reference to the GPIO connected to the STANDBY/PWDN pin, if any (active
+      high). When asserted, the sensor enters low-power standby mode.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            const: 4
+            description: MIPI CSI-2 D-PHY
+
+          link-frequencies: true
+          remote-endpoint: true
+          data-lanes:
+            minItems: 1
+            maxItems: 1
+
+        required:
+          - bus-type
+          - link-frequencies
+          - data-lanes
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdd-supply
+  - vddio-supply
+  - vaa-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "aptina,mt9m113";
+            reg = <0x3c>;
+
+            clocks = <&mmcc 48>;
+
+            reset-gpios = <&pm8058_gpio 29 GPIO_ACTIVE_LOW>;
+            powerdown-gpios = <&pm8058_gpio 30 GPIO_ACTIVE_HIGH>;
+
+            vddio-supply = <&pm8058_l15>;
+            vdd-supply = <&pm8058_l15>;
+            vaa-supply = <&pm8058_l14>;
+
+            port {
+                mt9m113_ep: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    link-frequencies = /bits/ 64 <384000000>;
+                    data-lanes = <1>;
+                    remote-endpoint = <&csiphy1_ep>;
+                };
+            };
+        };
+    };
+...
-- 
2.43.0


