Return-Path: <linux-media+bounces-29301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B530FA79E77
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 10:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 272677A4909
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 08:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1B3245002;
	Thu,  3 Apr 2025 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="pHOV/i/v"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B024418E;
	Thu,  3 Apr 2025 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670131; cv=none; b=PS6rILZAy4moNcWzlJNvflCkmE9vZ8tDv1aSjo8oKl8G0JlbE54oR+dDZQJRpdLipnZB8hrk9uxQGtSx/s0dpskcZZBtcZJqJL8GkgTjdGG25M1RbHdnsPLqD2NMbXs7eipzhjYExHZGRJwwnOtgKTDhDwLB8ijdqY68UwrdKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670131; c=relaxed/simple;
	bh=6UeImrUjl37SdxyeuQAJYtZXHbr2tkKpxiL+FtEBn8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThiH/CmijvOCxpmtRrMtmd/QYiO1QVijWo74ogkk4EkC+b0gqrGeClzsfphReLA7ipH6VEtlKxZGFfgJYa08msARkVVAnAfSSRBTKVdIo25FIg6+bALYLN0HFLrCWCj5iSqEr8gLJBdZFBq0WlWoS8H4dJENcLLRrfczwDDWfTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=pHOV/i/v; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=s+mVNH2Jzd5MpfRtJUFYaiaXymEwxkO8BqeNglQXZ1Q=; b=pHOV/i/vLrKquhdOPpRXyP5gmY
	Uf4v95z2aHElcgJyYkax/Ckyvjnm4Olbit7bclKUFJo3VH7c/EU2mLguwHG1NLrsZwIa9zjiEduBn
	IDCwZfDzmwlXlctFAqIAL5eMAX50ONhDbBNGcYSdi7mRAd5pLYEkh0W5M12RRHM0+Tq4=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:60368 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1u0Fbw-008Iud-9R; Thu, 03 Apr 2025 10:07:40 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 03 Apr 2025 10:07:35 +0200
Subject: [PATCH 1/2] media: dt-bindings: i2c: add Himax HM1246 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-hm1246-v1-1-30990d71bc42@emfend.at>
References: <20250403-hm1246-v1-0-30990d71bc42@emfend.at>
In-Reply-To: <20250403-hm1246-v1-0-30990d71bc42@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hello, this series adds support for the Himax HM1246 image
    sensor. The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an
    active array size of 1296 x 976. The datasheet can b Currently, only the
   [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: himax.com.tw]
  0.0 URIBL_DBL_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
                             dbl.spamhaus.org was blocked due to usage
                             of an open resolver. See
                             https://www.spamhaus.org/returnc/pub/
                             [URIs: himax.com.tw]
  0.0 URIBL_ZEN_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
                             zen.spamhaus.org was blocked due to usage
                             of an open resolver. See
                             https://www.spamhaus.org/returnc/pub/
                             [URIs: himax.com.tw]
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 Local_hs1_NotHoststar  Sender is not from hoststar.ch|de|com
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

Add YAML device tree binding for Himax HM1246 image sensor.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../bindings/media/i2c/himax,hm1246.yaml           | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8a67de7e3ffcaa9f1acfe443b1e36fffb79dbacf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Matthias Fend <matthias.fend@emfend.at>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1246.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1246-AWD 1/3.7-Inch megapixel SoC image sensor
+
+maintainers:
+  - Matthias Fend <matthias.fend@emfend.at>
+
+description:
+  The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
+  array size of 1296 x 976. It is programmable through an I2C interface and
+  connected via parallel bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: himax,hm1246
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input reference clock (6 - 27 MHz)
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low XSHUTDOWN pin
+    maxItems: 1
+
+  avdd-supply:
+    description: Power for analog circuit (3.0 - 3.6 V)
+
+  iovdd-supply:
+    description: Power for I/O circuit (1.7 - 3.6 V)
+
+  dvdd-supply:
+    description: Power for digital circuit (1.5 / 1.8 V)
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description: Parallel video output port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            const: 5
+
+        required:
+          - bus-type
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - iovdd-supply
+  - dvdd-supply
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
+        sensor@24 {
+            compatible =  "himax,hm1246";
+            reg = <0x24>;
+
+            clocks = <&hm1246_clk>;
+
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&hm1246_avdd>;
+            iovdd-supply = <&hm1246_iovdd>;
+            dvdd-supply = <&hm1246_dvdd>;
+
+            orientation = <2>;
+            rotation = <0>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&isp_par_in>;
+                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+                    bus-width = <10>;
+                    hsync-active = <1>; /* active high */
+                    vsync-active = <1>; /* active high */
+                    pclk-sample = <1>; /* sample on rising edge */
+                };
+            };
+        };
+    };

-- 
2.34.1


