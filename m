Return-Path: <linux-media+bounces-19637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E399DDB0
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 07:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CC581F21D1E
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 05:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1EF176FB4;
	Tue, 15 Oct 2024 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqiTrDqT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EEE17624F;
	Tue, 15 Oct 2024 05:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728971469; cv=none; b=XAEl5EYiFds3Z0Aa8u1B8+tl1tMpqw6eiGnm/HaYAN41fhqth3ZtFB+Oxj8oxP5nupt2wON/b391vngeIqBQfnFKAJUDFB/k2t9n/VDUVpDxXIOB8gQi4zb9hlG37SJkUxDteemMnFeWNit3fGp2V5qSfoLN9ypB+Ss2965B9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728971469; c=relaxed/simple;
	bh=9z79CZHfORyUo0CwCDnA69KDAINQEE5GH6qAMW2kIOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oxcW6Ah9DhY25qFKJNC8CIQL1CXG8uX8LcDQi6eokjx5CmotLViQEvhJpj5/G/RY0T2BNKtl2UDxmw1USs9EMFCGUTYbPU1WeR7eiX5ydYl44Xq+f7suq+58bbrk+S9Uf+eKlW3lv+k9rPwlYbrtPlEcz+PHjKVBhN8YkAxECPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqiTrDqT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fe02c386so524067e87.0;
        Mon, 14 Oct 2024 22:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728971465; x=1729576265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNAbTN8RA71hSBtuI3/4wQEd858WOlvRqsU6n4OiQuU=;
        b=lqiTrDqT8stbHspDU6J9jwXd+DI2Zoi/jNrJLYwrGE+EAQBjotFnZAWz2naQGgMpBl
         UGg07C583mMFh80wiF37tTa8MULorSJimJTSPuF1gKzrYWkirWvGzMl1PQJoIzTTji90
         PvYknc2EfKhepz8dpIXtjoYhSo+SncrD/7PBM6iP9Shr+Iz93vFPeQka/FeMbD+0hcUq
         57JCe8fTjMY3TZiudSB0qBHi/NvuNpjUcodd1jCbUABF3rZ3ypz5rSBV+2HEFmZYr7hp
         j/lgdncJfq8TGHjc5AJ1OBZPoFrYwTpMt2bIgzXvJS0DXTtU9ZyjCEzVC2mdTar6ISQ1
         m86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728971465; x=1729576265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNAbTN8RA71hSBtuI3/4wQEd858WOlvRqsU6n4OiQuU=;
        b=cvNfogk0+QRX5cI4gnrsGl+Q6VmoNX+DGFswOkxaw6y0cWEXu0SYOVYsmt/dz8zWLc
         48PgeMx5qaHnxgUBIEYo8WBZyt3+KkQY5t8gjfJupuRyXGTgclMyabpYukxCGhTRBWZq
         TpaYoL7jlkpXOWjv9/ybF7sUlgLTLRPmbxBREZVRKdwYYi3dZ0u0pSBWpT5znIymUSZ4
         1fwCaqbtw73WLYCnX1mb/PMF8iL/a3t7L/N6Rcyt/0ZGVr1vOWeywSJPmb6wbWo5cbpW
         rWG6Jb7FjyMAnHOV0M/UxtEhopoOd6Via1x5iiJwAZGw77XHHYvLxikyZISRS7vWKFD2
         y4NA==
X-Gm-Message-State: AOJu0YzXm+IhRJqs3mOgzKIZUgfxfAiTNqj2qJ36Pgyzd6r/SAEjl614
	j+jrZxl9yKaG/TvUeOOR9/4UxatIK14Tb4FUTvOw91aU8IwB5BmL5hyUjgbC
X-Google-Smtp-Source: AGHT+IF5tT9jLrZR2R9IgooUBrQFc6kfEXbGbj+o8QQY32l8QAzD9GEgRbRNQSBYz/8n4qg9Fw8e3g==
X-Received: by 2002:a05:6512:12d2:b0:533:4784:6aec with SMTP id 2adb3069b0e04-539d6edbc2cmr4058801e87.27.1728971464944;
        Mon, 14 Oct 2024 22:51:04 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00006862sm72546e87.200.2024.10.14.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 22:51:02 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add AR0233 camera sensor
Date: Tue, 15 Oct 2024 08:50:44 +0300
Message-Id: <20241015055044.4921-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241015055044.4921-1-eagle.alexander923@gmail.com>
References: <20241015055044.4921-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding for the onsemi AR0233 CMOS camera sensor.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v2: No changes
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


