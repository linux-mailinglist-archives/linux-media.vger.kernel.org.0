Return-Path: <linux-media+bounces-44876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B38BE85F2
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CC586E20A1
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28692E6100;
	Fri, 17 Oct 2025 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="f52saAm4"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C534DCCF;
	Fri, 17 Oct 2025 11:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700762; cv=none; b=H7rwAcRknlHf4XxnfkIVpZKwOACwExgHlzQ4nLTc/h/DRnDBjCkN958hTod/Duk02IMxcs5AVoGZIuHz4Sm/1zStaw4CwA827YfhlQqrbo8RYZgCgmS63V4J4PXV/sUEu/eUIOX+uMFHbjFa13/Gr4ckrtXxMs7Cgw/qbaV3sQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700762; c=relaxed/simple;
	bh=UMD3yj32alAZxfdhxOhbjfLNbCJOgUaS9iveV3RoUDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LM6W5uDeF/+KQov1tYZx1CDS++iGdW71+X7fZe+4jJVmMXyo0yBgFfqRkS+1QI7H6FULvAicXStuXeupJL4UVJKAuGZbPQGYRl/rIQgbjEv/gNmoUaaKqYlii9bH/nP7ir2CslzA6bCdGEfBYAbnTvZjCN+X45kNSAKMzSs/0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=f52saAm4; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NF493FoFragGV3LdPCYx8oX9W3X49AFYQ+YVybfW5gM=; b=f52saAm4puI4Tr3CxBQR+Pl3MO
	/o2vusb9hwOxJ9nA4fBZmQmZtNoo3DvIGgmBW84w0sZM2qFT9LFGxi6EtCjiADpfNjVKK9qr0GMKt
	IFDnl6rYUaut9zbTvaKngDNrBvj9BrI8epof5EEp5XsM4vhazJGDK/eYOOtJW3JfUzEY=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:52244 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1v9i1o-00Btdu-Oh; Fri, 17 Oct 2025 12:49:45 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Fri, 17 Oct 2025 12:49:38 +0200
Subject: [PATCH v4 1/2] media: dt-bindings: i2c: add Himax HM1246 image
 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-hm1246-v4-1-e3388ea2f08c@emfend.at>
References: <20251017-hm1246-v4-0-e3388ea2f08c@emfend.at>
In-Reply-To: <20251017-hm1246-v4-0-e3388ea2f08c@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Tarang Raval <tarang.raval@siliconsignals.io>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Jingjing Xiong <jingjing.xiong@intel.com>, 
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
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
    active array size of 1296 x 976. Currently, only the native RAW mode is s
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
                             Alignment (older systems)

Add YAML device tree binding for Himax HM1246 image sensor.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../bindings/media/i2c/himax,hm1246.yaml           | 113 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..90c9839fdcfd81eb208bfe5716c957c315081067
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
@@ -0,0 +1,113 @@
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
+          hsync-active:
+            default: 1
+
+          vsync-active:
+            default: 1
+
+          pclk-sample:
+            default: 0
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
+                    bus-width = <10>;
+                    hsync-active = <1>; /* active high */
+                    vsync-active = <1>; /* active high */
+                    pclk-sample = <1>; /* sample on rising edge */
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f7351fced572eff0a18038095ec1724047890b55..e415ebb3204472ccc41cfdaa52af000b7cb15771 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11162,6 +11162,13 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/misc/hisi_hikey_usb.c
 
+HIMAX HM1246 SENSOR DRIVER
+M:	Matthias Fend <matthias.fend@emfend.at>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
+
 HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org

-- 
2.34.1


