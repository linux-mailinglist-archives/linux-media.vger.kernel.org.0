Return-Path: <linux-media+bounces-51751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGeDD9g6emlB4wEAu9opvQ
	(envelope-from <linux-media+bounces-51751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 17:35:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 670A2A5DAE
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 17:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BB6330DB8E2
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 16:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC7230F95A;
	Wed, 28 Jan 2026 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="BdWFFYXh"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A7331354D;
	Wed, 28 Jan 2026 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617697; cv=none; b=lEBYwlUW95gM6iiL7VKwSCuR6nv54iBoK7TN+Ie4C/XG/aQGzYqfKRgpHGaRT12TZAfk78ty1mb7+DUYUTg/vW95MSKrRqJWHBqv6qnT/4Qu6+UwDVInW0z4ToOGksg7S/tfgODcG5xkx6SMQR8s5YLdmysKVq2kUH0LgpSa8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617697; c=relaxed/simple;
	bh=G6q3oW0M0f9O0UYmp/stndFAtUliqjtgd4/oHmFw0tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9hwtmDeZdcVhtIxv/xuT+jNwlG1DqoF/AvVoPETGHcDaVL9zWHD2qyhggoribiQXu4F3I9o5zpznSVdB0NzzYHa/oyl7PByS8GVwyXFan2K6cTp1Hl9hOD7tgoMLol3fNpK58iEWa4OP6WN3D8/MVZ9vbyaxjkQMEhGCkY8sy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=BdWFFYXh; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+cBP+KYVq9B93eiPbaeYCk9i2Tvn6B/QrLXXxQSF3/0=; b=BdWFFYXhqwH8tBJF4YCgu0mwLi
	ITRTXqy0S1RueiFehF06yJz8bEDIpMEs/KpGU9EgpaB0YyybxY0BbWuHRl2rK+1dA44NzZ4Lq7ohK
	nCx12HecL3YkpJz4qEI5WiMrZnNwfDQwS0nRBto33q7dlMUCYPNCo1yDcU6wDDsc/vHQ=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:49569 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vl85O-000KBr-2r; Wed, 28 Jan 2026 17:08:06 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Wed, 28 Jan 2026 17:08:01 +0100
Subject: [PATCH v9 1/2] media: dt-bindings: i2c: add Himax HM1246 image
 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-hm1246-v9-1-f9c996486a95@emfend.at>
References: <20260128-hm1246-v9-0-f9c996486a95@emfend.at>
In-Reply-To: <20260128-hm1246-v9-0-f9c996486a95@emfend.at>
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
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 0.0
X-Spam-Bar: /
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hello, this series adds support for the Himax HM1246 image
    sensor. The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an
    active array size of 1296 x 976. Currently, only the native RAW mode is s
    [...] 
 
 Content analysis details:   (0.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  1.0 MNAG_GENERIC           BODY: Word match (generic)
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 URIBL_DBL_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
                             dbl.spamhaus.org was blocked due to usage
                             of an open resolver. See
                             https://www.spamhaus.org/returnc/pub/
                             [URIs: himax.com.tw]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: himax.com.tw]
  0.0 URIBL_ZEN_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
                             zen.spamhaus.org was blocked due to usage
                             of an open resolver. See
                             https://www.spamhaus.org/returnc/pub/
                             [URIs: himax.com.tw]
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51751-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,chromium.org,apitzsch.eu,siliconsignals.io,foss.st.com,intel.com,linaro.org,rowland.harvard.edu,gmail.com,ideasonboard.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emfend.at:mid,emfend.at:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,noorman.info:email,0.0.0.24:email]
X-Rspamd-Queue-Id: 670A2A5DAE
X-Rspamd-Action: no action

Add YAML device tree binding for Himax HM1246 image sensor.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../bindings/media/i2c/himax,hm1246.yaml           | 120 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 126 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a65488fcc643fd1e2b9435224813f35f2b4397c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
@@ -0,0 +1,120 @@
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
+          bus-width:
+            default: 10
+
+          hsync-active:
+            default: 1
+
+          vsync-active:
+            default: 1
+
+          pclk-sample:
+            default: 0
+
+        required:
+          - link-frequencies
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
+                    link-frequencies = /bits/ 64 <42200000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 752ccaea38b0ee74282e06f233463eba122fa92c..2ea776c417dd0ca3231713a827b421778c92d543 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11290,6 +11290,12 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/misc/hisi_hikey_usb.c
 
+HIMAX HM1246 SENSOR DRIVER
+M:	Matthias Fend <matthias.fend@emfend.at>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
+
 HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org

-- 
2.34.1


