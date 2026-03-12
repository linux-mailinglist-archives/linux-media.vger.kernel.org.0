Return-Path: <linux-media+bounces-55501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PKrCm7WsmlDQAAAu9opvQ
	(envelope-from <linux-media+bounces-55501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:06:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CC273E89
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF01330391D4
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 15:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A263B95EB;
	Thu, 12 Mar 2026 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7rPprZF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4531400C
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327918; cv=none; b=UL3lH9ZPDsOJ6tKZrHdkeJYzdd99WcGUWBdq6IBB1jbmGfrutR/lMCbWUxQk0OOGQ8V6fwPCI2cQozq/N3JMIrjJnTs65HJ+iZWASBaxmMF8hQ4F+HXoir/GmcFDxyYNvcUuAGfmTGuyRRiAmUAOeCswep9mc6o61lZUt6Um0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327918; c=relaxed/simple;
	bh=RNegquDP9ZAvanXafZvoUaSklOxtzsNxpKAL4uAng6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7UhfxS8MvcEzCc6+56qKTsVD6VhipO4XkvmB0RLeqsrg9CQiXcRTncKoso2WuQhupvMI6pGIAyQ18PPQuDi37PrtfDkK+8IkGmuCev5c4Q0NsYeavPW3dABcPRA9YBj44MxK/cM0PB0K0G11Ua18ksXtGVezwKGP8Ancd45H1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7rPprZF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so1468273e87.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773327915; x=1773932715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Mn2HYD2huymUotK4Suh+ped+Jj4U2qnf8+TCMKloyQ=;
        b=D7rPprZFW3Zv3XJKKAZazQGno6+Lm+U7uEkTXavAQICEBYJ6XAplbcNYGLxKG0Xvj6
         WLkqql4L3s/JM8skvT/HJBClb6Ix8t43MWxDeGaMyz1LuT0FM7obdBaHsqV4jH2CluLS
         fsEQZj/WpLHJgVNtj0EJDwYWbrmyM3W0ah1qqjuTpN1CFIjH1MhPp/be9STqOWHYlbtF
         ZgEAcSAPQKOO3RhZTYdDatDSx9iZpeQ3UJiPIdcpjuOYSzdYRNCGl5FXBwBo4DI8chjG
         88Bu795yx91TxHdAkyvu6oRzFvXvqd8JBdfUs7unYHHEqsQsDFctwW/cFOA/WVlcGUmT
         nPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773327915; x=1773932715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Mn2HYD2huymUotK4Suh+ped+Jj4U2qnf8+TCMKloyQ=;
        b=U66LF7HBXWvFNbNW5aNuugX3Pp3XR2pZ/ORPk9bWrjFdYjsmOZ3zL+OzaGdcPlbG2O
         oH1eSft8F1PGp/imx4rNhUaZjbzZapFwWSBeGO1p+Zhk3Mocm8ZLvsvLmNXDIwM+T1FW
         k3kjgI2WuxqyEzEFeP2/1BjwHmDsyBkq62xiiG9Ub46mD0vepLVMTDqwOHehz4S8o/vV
         ghVVh3puOHWD5nDuot0et2GqJizXu2ZdnOnTo/MZSuSBh9l6Wuc5yZtedE0e20kKjrmv
         XbOwgwQ3TBHcu9ggQRaeRyWS/dTNO1hXI8DJUE+3IriH6YLF2ogmjWPT0MCgyPE4071E
         aK1A==
X-Gm-Message-State: AOJu0YzweDZccyXkxMDieJ5Inc7/tVm6n5izh2Ixw5GqfO7mBPPTvm/m
	6nJPQvzNt48kgMxqDGLikaXINHGWkc70MjlkKZXKumuL1klZNvmuDAuUj4cMU4aOzYM=
X-Gm-Gg: ATEYQzwGqVFEknb1+AT5CrtGFa2cdo/kVNKOSQViD8BIGP7lKWz9bvMcBjm317Lbg0z
	CV/h0+yANq17fVF1ex4kE9hB2dp6dWFr6z4jZV039sG3oO1BLVuqTqNr/948ccx7tj0AoGFC+83
	LBANrlNaIOJSxHMHv/cepX+FmDh3PGim1esricGWxTUIux7bZvsTESkQR5zcf5gK5hqdu7+EUTD
	oJ0zwxtdUT28ZuHzDy8Tg4yHJ9n89qkjkwEoRovanuKHPC/6Y1t/aGLe7h9pV5V2LPbPnRjJDO6
	o85qqdwoKuhtaiPO0LYl4hGqP3gmLL8NQSJINkufUD/PRBaAixH/oxIL2fUYteUu3WTEnWFdjaz
	k5Qvz4Xzmz3u9x9eWxr0I5eDGUe79xh7DrANZxXdvOY8KIaoUDXXF85y2t1ZFaANEXRz1JVDfB1
	xCH6GYkRNPhfUolAEEoIonsixaFLQx22S6iqkbmfg=
X-Received: by 2002:ac2:4846:0:b0:5a1:253a:9cdb with SMTP id 2adb3069b0e04-5a156dccbdamr1614494e87.48.1773327914790;
        Thu, 12 Mar 2026 08:05:14 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156034364sm1000197e87.40.2026.03.12.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:05:14 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add Sony IMX662 sensor
Date: Thu, 12 Mar 2026 18:04:36 +0300
Message-ID: <20260312150437.1091195-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,soho-enterprise.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55501-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1a:email]
X-Rspamd-Queue-Id: 0A4CC273E89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree binding documentation for the Sony IMX662 CMOS image
sensor. The sensor features a native pixel array of 1936x1100
(effective 1920x1080) and supports MIPI CSI-2 output with 2 or 4 data
lanes, RAW10/RAW12 formats, and both colour and monochrome variants.
The link-frequencies property accepts up to eight values corresponding
to the allowed MIPI data rates.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 .../bindings/media/i2c/sony,imx662.yaml       | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml
new file mode 100644
index 000000000000..9a4c5333828e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx662.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX662 CMOS Image Sensor
+
+description:
+  The Sony IMX662 is a 1/2.8-inch CMOS image sensor with a pixel
+  array of 1936x1100 pixels, capable of 1920x1080 resolution at up
+  to 90 fps. It supports MIPI CSI-2 output with 2 or 4 data lanes,
+  RAW10/RAW12 output, and both colour and monochrome variants.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sony,imx662       # Colour variant
+      - sony,imx662-mono  # Monochrome variant
+
+  reg:
+    maxItems: 1
+    description: I2C device address
+
+  clocks:
+    maxItems: 1
+    description: Master clock input (xclk).
+
+  reset-gpios:
+    maxItems: 1
+    description: Sensor reset (XCLR) pin, active low (optional).
+
+  avdd-supply:
+    description: Analog 3.3V power supply (optional).
+
+  dvdd-supply:
+    description: Digital core 1.1V power supply (optional).
+
+  ovdd-supply:
+    description: Digital I/O 1.8V power supply (optional).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: CSI-2 transmitter port
+    additionalProperties: false
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+        properties:
+          data-lanes:
+            description:
+              Number of MIPI CSI-2 data lanes. Supported values: 2, 4.
+            minItems: 2
+            maxItems: 4
+            items:
+              enum: [1, 2, 3, 4]
+
+          link-frequencies:
+            description:
+              Allowed MIPI link frequencies in Hz. The list may contain
+              one or more values; the driver selects the highest supported
+              frequency compatible with the number of data lanes.
+            minItems: 1
+            maxItems: 8
+            items:
+              enum: [297000000, 360000000, 445500000, 594000000,
+                     720000000, 891000000, 1039500000, 1188000000]
+        required:
+          - data-lanes
+          - link-frequencies
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
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
+        camera@1a {
+            compatible = "sony,imx662";
+            reg = <0x1a>;
+            clocks = <&clk24m>;
+            avdd-supply = <&reg_cam_avdd>;
+            dvdd-supply = <&reg_cam_dvdd>;
+            ovdd-supply = <&reg_cam_ovdd>;
+            reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx662_out: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&imx662_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.52.0


