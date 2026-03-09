Return-Path: <linux-media+bounces-54980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIg9MIsHr2knLwIAu9opvQ
	(envelope-from <linux-media+bounces-54980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:46:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8F23DD53
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 057393014895
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 17:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C9529898B;
	Mon,  9 Mar 2026 17:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="YW85HxKO"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474E42D5C83;
	Mon,  9 Mar 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078381; cv=none; b=rOiwoDEBJX3CPbU2t5TlnNg8IMT6EnAbzhGpxpFfMUqh5ZFv9QdReCwiI/JXyl/D9pC5seuwb/Qf+aw5pRcT+bWyo3J0cDTIgwPwU21kh96UBBML2bhjzFJQsktOJbHpz5lccRNXzhip7iGJnGyDcjnvJf2xbU5fpS43WuvzBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078381; c=relaxed/simple;
	bh=ju7xtfN9l5Pbn7N1x7rxBWWSAYKtME0kw18+9Vip2Fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJmx0CaAxU6hNstUc+uYS+YSvyMkzt4tlBQgOWwVpzxZ+e2P+ICVjvaSORFuIEXT7m+lzfTzuOW07e2Ba2smu7KtgHvBh4ObHPA0wHdrRDd1/bq0pLtZKlLQz3zoCzYUcH+i2APUAgPWcOaAZiww1+T0WDpBXxu1Pd6wG551UCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=YW85HxKO; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hRESx7xuRJ/KQSMJSNKjdLfRjrGEx2DOxEodrO3UBK4=; b=YW85HxKOosF8TcoJICnr3igl0S
	3744nasbC2vLn1h933g9A5pHO5sa+ImET2x38rURMjvMF5Q0b96LeWMi78mOagXY/rIDHfx2ZJoQx
	+gHJZKzFvMZBZOnXh1oXpXqaRCT4Vynv7HVxZN/aJcBxe0OzKycqZkBund3WklVJc0qk=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:56968 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vze4S-00Dxnt-MT; Mon, 09 Mar 2026 18:07:09 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 09 Mar 2026 18:07:08 +0100
Subject: [PATCH v2 6/9] dt-bindings: media: i2c: document Omnivision
 OV08D10 CMOS image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-ov08d10-v2-6-81f8b5d99984@emfend.at>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
In-Reply-To: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
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
X-Rspamd-Queue-Id: D8F8F23DD53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54980-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emfend.at:mid,emfend.at:email,intel.com:email,0.0.0.36:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add bindings for the Omnivision OV08D10 CMOS image sensor.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..96dbf61cf7c188544f4120216ae2b8e0155128b7
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
+  - Jimmy Su <jimmy.su@intel.com>
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
index 55af015174a54e17cc7449e5a80b6cdc83aa6fde..2484d0bcc1f09582828cafbdb7d45dd12b55af60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19505,6 +19505,7 @@ M:	Jimmy Su <jimmy.su@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
 F:	drivers/media/i2c/ov08d10.c
 
 OMNIVISION OV08X40 SENSOR DRIVER

-- 
2.34.1


