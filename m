Return-Path: <linux-media+bounces-65334-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B2SuJJDwOGpkkQcAu9opvQ
	(envelope-from <linux-media+bounces-65334-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:21:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5836ADA38
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=emfend.at header.s=mail header.b=fQSf9iAg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65334-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65334-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C350307D7F1
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0205438E8D3;
	Mon, 22 Jun 2026 08:13:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF0938E8A2;
	Mon, 22 Jun 2026 08:13:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116034; cv=none; b=gXaqBAu618v5ShNeuiesZG2KZA+yCxcOYcnbpEwk+oCjNew3ZPZ0QlnS4G/t8AquNd1s3TL9KDh6GBKVxcNq0Is1WHXWG56dMbSFfLBnNyFBji7q43HCGJamAVS7jTiKD1ifm2SVvlXCrW7R3rMLUbfsH2trSBy848FAYPB2+V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116034; c=relaxed/simple;
	bh=2BNwXS3LPjCMYV/fOiNYmm4xDE3RhoLJf9hh49SroDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IorOBTqm/NkCDo8nTLYCfQY0aJag3IrNggvs5CGh2tzYAKPfPrtCMTyUB/WeDvrcQoVpOIMUBRP27mMA1Xqxpqn2cjJT0rgM+t8jZytEMIsz3hEzjmWxnGANjT4ti1SiPIf5L3eqfWWyDBQZxzBIrWbAI3JbbiHBacBzqCx+Fts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=fQSf9iAg; arc=none smtp.client-ip=168.119.41.54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3GprQYH6ud9SDxXo3jqdoGYHCVTRlPg9/9mKdS+yzH8=; b=fQSf9iAgAhT3q2/TLOf40OKxYZ
	aGGP4ym97nCsI0pdNiKCA8+YqKfDX73TlMzF3DFhw2/x/KfIq1AuoQwh1uTDDBU911dFHvsJUWs6+
	6yzLTHml9BoGCzGJ6TteeKxCKNUk1ygCmZSnZoOFbOinfZtgZiMUqamhf8gqlj5ytg80=;
Received: from 194-208-226-106.tele.net ([194.208.226.106]:56822 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1wbZmX-00CzBn-Hg; Mon, 22 Jun 2026 10:13:26 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 22 Jun 2026 10:13:22 +0200
Subject: [PATCH v11 1/2] media: dt-bindings: i2c: add Himax HM1246 image
 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-hm1246-v11-1-c62ef9516ab1@emfend.at>
References: <20260622-hm1246-v11-0-c62ef9516ab1@emfend.at>
In-Reply-To: <20260622-hm1246-v11-0-c62ef9516ab1@emfend.at>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, 
 Walter Werner Schneider <contact@schnwalter.eu>, 
 Kate Hsuan <hpa@redhat.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 0.2
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
 
 Content analysis details:   (0.2 points, 5.0 required)
 
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
  1.0 MNAG_GENERIC           BODY: Word match (generic)
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.2 KAM_MANYTO             Email has more than one To Header or more than 25
                             recipients
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:ribalda@chromium.org,m:git@apitzsch.eu,m:tarang.raval@siliconsignals.io,m:andriy.shevchenko@linux.intel.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:dongcheng.yan@intel.com,m:bryan.odonoghue@linaro.org,m:stern@rowland.harvard.edu,m:jingjing.xiong@intel.com,m:heimir.sverrisson@gmail.com,m:mehdi.djait@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:hardevsinh.palaniya@siliconsignals.io,m:clamor95@gmail.com,m:p.zabel@pengutronix.de,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:xiaolei.wang@windriver.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:miguel.vadillo@intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hao.yao@intel.com,m:himanshu.bhava
 ni@siliconsignals.io,m:matthias.fend@emfend.at,m:krzk@kernel.org,m:conor@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[emfend.at];
	TAGGED_FROM(0.00)[bounces-65334-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,chromium.org,apitzsch.eu,siliconsignals.io,foss.st.com,intel.com,linaro.org,rowland.harvard.edu,gmail.com,ideasonboard.com,pengutronix.de,oss.qualcomm.com,windriver.com,schnwalter.eu,redhat.com];
	FORGED_SENDER(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noorman.info:email,devicetree.org:url,emfend.at:email,emfend.at:mid,emfend.at:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED5836ADA38

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
index efbf808063e5066004180c36af88cb1f32c76a80..c320e7e9a2bd88319945bfe1202bc891d35f0f7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11553,6 +11553,12 @@ L:	linux-kernel@vger.kernel.org
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


