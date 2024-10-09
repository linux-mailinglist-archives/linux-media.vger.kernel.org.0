Return-Path: <linux-media+bounces-19304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671599639B
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 10:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51D0DB28071
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 08:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4058818DF6B;
	Wed,  9 Oct 2024 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrdlMpeW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71F4188733;
	Wed,  9 Oct 2024 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463409; cv=none; b=qCCz3sT84wnx3bj6nUK8+RYueAwpeX3h89gRB10cO9VjLIm/yhtfTQAHU/p+iaFWy0VCV5zOjC6fO8Meoi/Frg2uVEpmti1uW0cM1MiG1IrN3E5O964IIFIX6LJ5eAMICXY2iGRZxeTHOkaMwSHz1uF1HLTzSzv/wQ5CizOTZmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463409; c=relaxed/simple;
	bh=84VDh5BSxeTCK3sciTIuSjrjAL1H9NZ1H1VNY4JA3ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YhLIGFXz4fUJaU7CLzjyXUKx+y4BRFwThSIx61I7eNpShl4lvdg/P4vIbUMfGV6S6jbwaS2pxskjVWi8svfHWRgINpANCPUwHbtkJKwyGum5Ez+niX0Wy/uCelQTJS4wJnhKq8ZykC58OeIcMQIkJpk2jCdX7KseKdMZ5YSuV2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrdlMpeW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5398c1bd0b8so630167e87.0;
        Wed, 09 Oct 2024 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728463405; x=1729068205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBWr3Lj5WaBWimT9lzl9DI4bcFIvTmaxJH5kiMLrYIM=;
        b=NrdlMpeWMgaRIxoYD0d7mJlkj8Iu994uhZKQGI29olVyTXBWlSqT6daoJ5f7t9vvqT
         PCXMqurv+a9TnybFbnjnVGqhXNGmhGZORwLak7ff7C2scqtMD2UrxfjqTRansk85GDtn
         dWYjeC2SC4RG4P6eZKRC28b8gy15HpgIIWDXXhObBypjdIn7JZkrAyyNUCyRykZGEccu
         B9gnZHk4W/xvhztCQUSnLEZPJp3bsnqnD2TGC4EbFZJBoTerD5pFPfsFxsVfxQAhRMCW
         QWbKk5d2d03VAiIIGHGWjdMLBBsAxeTUZuDyC7BmBLwhf34cv5FCbmW/mo/XDXpxmKZv
         lOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463406; x=1729068206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBWr3Lj5WaBWimT9lzl9DI4bcFIvTmaxJH5kiMLrYIM=;
        b=Iuwl80IsqOE+By/6JYq4lj4Fo7OfpSjIEia6q4mCJXoDzs8c0C+tLNB6DOiARGnNXB
         hf4NOeu2r+HFPgiKnot6uYa16RO1ZqL+z+coPkzgIg8bIevUvfdXhXVfEZO53oUEZAN9
         LsalITF8OHdb3ffR0cwzlN54MMgBtZXwab86lNTIqBgbz4/kGnDNwklblHSEwhnylKfH
         G9FI+xpaovwGWRqokA/3WIlrvkzzDRNFmIWwlGgx98pB6pza0UxNDlxvIiaQbXvBxkHW
         hgwl2L5QpiQ7/90ZfVpcvbFVYGPwiF0LGi5JOKUwM7yrTuc7ApsYSsEXmhNNU+Kvz8rr
         vo+w==
X-Forwarded-Encrypted: i=1; AJvYcCXl1XxpDuYZBQ/HFHqKEMD1vlmIXaiCinVMEStuDIh2rT3L6tXYsxvR9gmvSzfRfF+8EZnm5c7g0mwV@vger.kernel.org
X-Gm-Message-State: AOJu0YwLgY5y/D9WYs2QLDU4Z1w1zjACssaaFMB7pzXmvQgFwn/AimkX
	ibSDrFLVROQesiVaVb2R87n8PsUGZ6UNhND1+H8lPr7tDuAr+r0F4RUPOKrK
X-Google-Smtp-Source: AGHT+IGvOzQUVeIIuXBX2DNPiIGDpqiNHiOpcwsF8imG2o9H0HrVW66tIDO7kGFQY554O1spq7s0lw==
X-Received: by 2002:a05:6512:b1e:b0:539:8cbf:516c with SMTP id 2adb3069b0e04-539bdade576mr1874438e87.17.1728463405237;
        Wed, 09 Oct 2024 01:43:25 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23c6csm1439507e87.187.2024.10.09.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:43:23 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 2/2] media: dt-bindings: media: i2c: Add AR0233 camera sensor
Date: Wed,  9 Oct 2024 11:43:04 +0300
Message-Id: <20241009084304.14143-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241009084304.14143-1-eagle.alexander923@gmail.com>
References: <20241009084304.14143-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding for the onsemi AR0233 CMOS camera sensor.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 .../bindings/media/i2c/onnn,ar0233.yaml       | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0233.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0233.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0233.yaml
new file mode 100644
index 000000000000..fa8a4e63a2a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0233.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ar0233.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AR0233 MIPI CSI-2 sensor
+
+maintainers:
+  - Alexander Shiyan <eagle.alexander923@gmail.com>
+
+description:
+  The AR0233 is a 1/2.5" CMOS digital image sensor with MIPI CSI-2 and
+  I2C-compatible control interface.
+
+properties:
+  compatible:
+    const: onnn,ar0233
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extclk
+
+  vaa-supply:
+    description:
+      Supply for the VAA analog voltage (2.8V).
+
+  vaapix-supply:
+    description:
+      Supply for the VAA_PIX pixel voltage (2.8V).
+
+  vddio-supply:
+    description:
+      Supply for the VDD_IO I/O digital voltage (1.8V/2.8V).
+
+  vddphy-supply:
+    description:
+      Supply for the VDD_PHY digital voltage (1.2V).
+
+  vdd-supply:
+    description:
+      Supply for the VDD core digital voltage (1.2V).
+
+  reset-gpios:
+    description: Reset GPIO, active low.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      Video output port.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            const: 4
+
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
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
+        camera@10 {
+            compatible = "onnn,ar0233";
+            reg = <0x10>;
+
+            clocks = <&clk27m>;
+            clock-names = "extclk";
+
+            reset-gpios = <&ser0 0 GPIO_ACTIVE_LOW>;
+
+            port {
+                ar0233_out: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <375000000>;
+                    remote-endpoint = <&ub953_csi_in>;
+                };
+            };
+        };
+    };
-- 
2.39.1


