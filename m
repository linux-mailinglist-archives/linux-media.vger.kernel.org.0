Return-Path: <linux-media+bounces-65677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qBdECi3DPWoK6QgAu9opvQ
	(envelope-from <linux-media+bounces-65677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 02:09:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B91966C938E
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 02:09:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=icloud.com header.s=1a1hai header.b="F/eoIxCM";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65677-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65677-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=icloud.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A80530338AB
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 00:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE66158DCF;
	Fri, 26 Jun 2026 00:09:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2003e-snip4-4.eps.apple.com [57.103.91.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135604CB5B
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 00:09:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782432551; cv=none; b=PUGTWh8oh/opjiB6YsR6uF/IdkNoOySxMBhp1PWuNMGp5pdsrPcB/Oa5KF/Pju07eh2ALK5muF5ymz+2JXkI2L5Po2uNcBYT0i4XRooMJ/7L2vjgicJkQ7CXofg7l/MgEtrXnRhciCGKDWTkcAVadYePQGZYABfZTRU82ALSZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782432551; c=relaxed/simple;
	bh=m50LFqe18OzZqqxCSAC25jQwqMSflKivfbdKZ33Ijus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAhZe3Onbt5jVHLCTv/iv3DN+yiACuMAi8+eitXwfrJBj62+gdwZ9oikN6N5xni1+VW3sMh/E07NYSTZeUaiI87V6IYsyCekG3GIZq+O0TO0Cv2McBa7QPy/6iN8wRcA7CwfLEzRJ42tIV6tqKk3IPzEnPavVhNnK4kCSssfoe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=F/eoIxCM; arc=none smtp.client-ip=57.103.91.175
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id 9112F180015D;
	Fri, 26 Jun 2026 00:09:06 +0000 (UTC)
X-ICL-RepId: 019f0142-3eba-7500-a9a8-e505d18a0724
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0EZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwddAEYJSANaBl4cQQhJAlUHWB9DFA5aA1QOXAQXG18CQh9bFUs4Wg5bBEcUFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782432549; x=1785024549; bh=B4AcYH5B6O8+NoA+MxsNR6sfejyxMi7Vty97TtI0/iM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=F/eoIxCMjmSTYURKg65/qvYh+WssH1vGGU4I1nyfSssU7amh8m6viTK9VAq80BFonKF0UjX/VqSHM1ot3cQjgoZ1t9T/PfMRREoNernnlzlqBNZJqT0wiITwulDzrmLlkKWd6/4Gf7hZaWxCTr1UMUR+mkbnqgXzjFXeGK5X3xXhMZ9p8wejzJzUPbw6b66ihWL70BQ/WuPgBGK6fMlsoaZ7RFH9YmDZUCyaYYi7W7pKegoEqfyVZtH+XIzwyhzvSUTraQrI5YI3HVJC6BjTo7l7kAGUgVNRhWyxllbfJ5s6ZpTJx2w5EgT/QIp85eVgYf8PZV1kkHQQW6cFvIEBcA==
Received: from bigre.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id 4AF09180029C;
	Fri, 26 Jun 2026 00:09:05 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	kernel@puri.sm,
	Vincent Cloutier <vincent@cloutier.co>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH RFC 2/4] dt-bindings: media: i2c: Add Samsung S5K3L6 image sensor
Date: Thu, 25 Jun 2026 20:06:58 -0400
Message-ID: <20260626000715.1111803-3-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R7Ncu8igebgugneeo8tkXJgKQ3BmbpgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDIwOSBTYWx0ZWRfX26mtGJMjG9Wd
 UWbHY0Lh3A1RdrqdYLMPcqeplFPW36AIWjs57J4ilUXcoUIqj5OEDc6/HLUx4ewbj1gZQdIRD0I
 H+399ZtYiO5SKzK6n5+eyqcME0Knd4B11zqfLgKUsmJJS1mFmpPpxnSS600ggCyhu3KaqHK/UTW
 nwUGKn3Y80Rd3KMIPP1Tb5JoCS5k6eaooNeiqnl+R2VfgMpurzmFueFwMZbpO8oqJ8AjUuhA8+G
 t6JuTOwRHh8PninUf/BIlbo/XnJb+sNcW4YWnfv9h8UmozveuGqHP6LNflmKW04u1PtGt6Zkjdz
 qGElCTFIKtI5kF8ESS4
X-Proofpoint-GUID: R7Ncu8igebgugneeo8tkXJgKQ3BmbpgM
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:kernel@puri.sm,m:vincent@cloutier.co,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65677-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[vincent.cloutier@icloud.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[icloud.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[icloud.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincent.cloutier@icloud.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloutier.co:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,icloud.com:dkim,icloud.com:mid,icloud.com:from_mime,puri.sm:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B91966C938E

From: Vincent Cloutier <vincent@cloutier.co>

Add a devicetree binding for the Samsung S5K3L6 13MP raw Bayer image
sensor.

This starts the upstreaming work for the Librem 5 rear camera path. The
binding describes the validated two-lane MIPI CSI-2 configuration.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:gpt-5.5
---
 .../bindings/media/i2c/samsung,s5k3l6.yaml         | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
new file mode 100644
index 000000000000..96150764b341
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3l6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K3L6 13MP MIPI CSI-2 image sensor
+
+maintainers:
+  - Vincent Cloutier <vincent@cloutier.co>
+  - Purism Kernel Team <kernel@puri.sm>
+
+description: |-
+  The Samsung S5K3L6 is a raw Bayer image sensor with a MIPI CSI-2 image
+  data interface and an I2C-compatible control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k3l6
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Reference to the sensor input clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  vdda-supply:
+    description: Analog power supply.
+
+  vddd-supply:
+    description: Digital core power supply.
+
+  vddio-supply:
+    description: Digital I/O power supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
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
+
+          link-frequencies:
+            minItems: 3
+            maxItems: 3
+            items:
+              - const: 537500000
+              - const: 600000000
+              - const: 625000000
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdda-supply
+  - vddd-supply
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@2d {
+            compatible = "samsung,s5k3l6";
+            reg = <0x2d>;
+
+            clocks = <&clk IMX8MQ_CLK_CLKO2>;
+            assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+            assigned-clock-rates = <25000000>;
+
+            reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
+            vdda-supply = <&reg_camera_vdda>;
+            vddd-supply = <&reg_camera_vddd>;
+            vddio-supply = <&reg_camera_vddio>;
+
+            orientation = <1>;
+            rotation = <270>;
+
+            port {
+                camera_out: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64
+                        <537500000 600000000 625000000>;
+                    remote-endpoint = <&mipi_csi2_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

