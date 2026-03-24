Return-Path: <linux-media+bounces-56852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIZIAFJswmmncwQAu9opvQ
	(envelope-from <linux-media+bounces-56852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:49:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8C306B9D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B70063165A03
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00FA3ED5BE;
	Tue, 24 Mar 2026 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="WqQZJlTJ"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC39C3E866F;
	Tue, 24 Mar 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348931; cv=none; b=OX6aZr32zMz6f4WUFUJSRaxXLEghXRht8Vi/+LWDePsp0f/oz41KWKgMZZUWDKsLM/flwVk/oXPZoieRMoU/zacFVMnGbgq9YGd9+0DnZkUBURwwNSCoDeW2JiKW29EaTgzGKnS3M54iNLMUNIxnmpikQQpn5YTobkWSi8u8uII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348931; c=relaxed/simple;
	bh=e85J5rUsoe9Pao8p/89snApfauekIyZ/IJ/pLZ0eD64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uW/rHQ2168cnDIgiuDBgaoRMasS+rTyNkGs0uPA5GDP/W6C/axvKfJEoTzo6G0YcQi1SdfX1KIFfq/Ao0W+Dz7/jy7VBunMfmf3aMoPYmtahomQPz7b7bPS2NbvfljMl3V8Rl4NlzICaPeWRkH5msVt9DIwxpWhnRc0AStRf9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=WqQZJlTJ; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mTUyUhXXKKVENA+BCW6Oy4v/BPRVcJfR8AUg1u1iA4M=; b=WqQZJlTJ3wLsSGBmiFj/fxlfx+
	JEsIqUu87HM3BTBCRvGdmrbPVNptTFNNgKX+4UMEJCcYEr4TFBPaJC0I7h4KFmLbTupX1TIyR5iZl
	eYcaFPBTWXhFPdgsUmlUYnuJvhWhGxta+Livmc/fmNsFflqKMUKyvX1xdj8nTsSgHisY=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55336 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w4zD3-00DIvK-JU; Tue, 24 Mar 2026 11:42:06 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Tue, 24 Mar 2026 11:41:40 +0100
Subject: [PATCH v3 6/9] dt-bindings: media: i2c: document Omnivision
 OV08D10 CMOS image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ov08d10-v3-6-1e44069cf91e@emfend.at>
References: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
In-Reply-To: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Add trailing \n to dev_* prints where missing. Signed-off-by:
    Matthias Fend <matthias.fend@emfend.at> --- drivers/media/i2c/ov08d10.c |
    34 +++++++++++++++++ 1 file changed, 17 insertions(+), 17 deletions(-) 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56852-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[emfend.at:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.36:email];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,emfend.at:email,emfend.at:mid,intel.com:email]
X-Rspamd-Queue-Id: 5DA8C306B9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for the Omnivision OV08D10 CMOS image sensor.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   2 +
 2 files changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6f2017c7512566d47fc04fbd4c672cb9633ca990
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov08d10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV08D10 1/4-Inch 8MP CMOS color image sensor
+
+maintainers:
+  - Matthias Fend <matthias.fend@emfend.at>
+
+description:
+  The Omnivision OV08D10 is a 1/4-Inch 8MP CMOS color image sensor with an
+  active array size of 3280 x 2464. It is programmable through I2C
+  interface. Image data is transmitted via MIPI CSI-2 using 2 lanes.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov08d10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK input clock (6 - 27 MHz)
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low XSHUTDN pin
+    maxItems: 1
+
+  dovdd-supply:
+    description: IO power supply (1.8V)
+
+  avdd-supply:
+    description: Analog power supply (2.8V)
+
+  dvdd-supply:
+    description: Core power supply (1.2V)
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
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@36 {
+            compatible = "ovti,ov08d10";
+            reg = <0x36>;
+
+            clocks = <&ov08d10_clk>;
+
+            dovdd-supply = <&ov08d10_vdddo_1v8>;
+            avdd-supply = <&ov08d10_vdda_2v8>;
+            dvdd-supply = <&ov08d10_vddd_1v2>;
+
+            orientation = <2>;
+            rotation = <0>;
+
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+
+            port {
+                ov08d10_output: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <360000000 720000000>;
+                    remote-endpoint = <&csi_input>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 750ac8c4a7b00cc6668d80fff60a2b54838bfa7c..f91dbc3f3ed0e5b303882c2f3893b70d154a5bef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19502,9 +19502,11 @@ F:	drivers/media/i2c/ov02e10.c
 
 OMNIVISION OV08D10 SENSOR DRIVER
 M:	Jimmy Su <jimmy.su@intel.com>
+R:	Matthias Fend <matthias.fend@emfend.at>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
 F:	drivers/media/i2c/ov08d10.c
 
 OMNIVISION OV08X40 SENSOR DRIVER

-- 
2.34.1


