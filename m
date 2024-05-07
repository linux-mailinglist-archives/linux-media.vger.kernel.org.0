Return-Path: <linux-media+bounces-11056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259E8BE801
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 17:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5BCA1C20A96
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71E616DEA7;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mjs29lxO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966116D9BA
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097332; cv=none; b=jf7hhiR7MD2Roe85p6Y4DaWYqrz/FJJ+kC3OJoS/JJ37Oq/h0Ijy77iDDoi7/EixilFkCFfdpeTx0s6AE8Xg3dfQaqWLE5z5FukwWU3om8flrmBllPk5KKi7UoOGi05Mv3Q67E5pJBPfhrksJlvHNJtd18Db3GIB8QYEhdV0gPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097332; c=relaxed/simple;
	bh=5GcCSNxUB2nNT9lCSh3AsMpAmCe/+f8zkisiEdAT35g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y4m//IT6JmH43YI7ng5ZN4KPCPM2DgQBYdxT1LrbTiYHkTCnD7ySNlLboYGFBS+0Dws1KqlgNcxsVWGmu+iXS5bp7PuS4B9tV1v32G3KM8Hx07i207TLtSPnRFSxXsvuF42u16Lz2+9Gf/GQOv5ovL0h/gybep9vxPx9BheFIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mjs29lxO; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbf618042daso6367274276.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715097329; x=1715702129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Zg5aDDMOyqW00delol8Ca3GL2MBNFcyQ9gNrBCTWcU=;
        b=mjs29lxOy2t5vtKl2r+ttbjlF8d2YaZQlsbA9ycYxuedbA34Tkw8Ji2Yit0HLCi+fe
         j4Tep37l0fnA5FVVY1JMY8ha5gL+6uRd4yoQ1dHJEjZ2kPXml0wA/Q8O0x2pSN47rh0C
         dpTqnVe+q+8AMGSegaI/d5Sww9rZ/51a/A4+bpVEjce4xZ094ArH1elyDB+CyYlR1ZlN
         EAkLYqSCBRX53oyd4jjnmXd5QRJaEDp7kALM9SRzNS2pWqkw/eBu1TW2O5KScbapE3hp
         Y+0m+NcjdqvO5EjNIqCyjZjpJ64y0tFfu1NLDep+EF9pc6lgjIHlyN4T5B96Uv9xDdoa
         g5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715097329; x=1715702129;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Zg5aDDMOyqW00delol8Ca3GL2MBNFcyQ9gNrBCTWcU=;
        b=owTWVPi4r7lmWWyRlPRQ+4+k47agi/ZugmxyEZdG/nfZRQTl5pboxQruAZHnGFKGx0
         VCSgzxDzisiuNdFXVGmT1IYh/KM6YFZVLUmIPsNpk90c+/oXhNOxOfSSmgDtxesyB4re
         MrfjyECajyojoOpXvox29a+E+k42RuKVjiq+Tw8SGOHt3MO+breJuS8xg31pMAAqCDqm
         +Q68PnkqSxErEsNWA4gyX2V8/lgFA3t/50d0CxCNHHGlP4Uhsu67TCKPAHYMsHwrKj0P
         bHVXSf8zURJoLarNpeZGrUgOqS8Jv1u0oGghk+lBFGqnNZalHzvGISibzidpoESMWHo9
         y+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuWuyn1VzsgaVcILq4z3yVdvJijDg0+3EsnYMSUOmULLzjE1bHswyz2N9bT0XiMIhW0M69HUhk6fI6Togn6T+a/A2BqXpcF2pQM8w=
X-Gm-Message-State: AOJu0YxyiOCnYenzLJ9UO3w4hhCNhNhLbBaw32JVdf6jOqSesUuxY9hc
	Ll4WWrDQ3SLP+IGfCq3b0H8oSSus9WTbi1UE/f2coFGJDUpZiufXN653tEz4kRFDBDW/J5D5hPj
	kbXya9bJnBA==
X-Google-Smtp-Source: AGHT+IFl69D5om/H+B54ETJ2PMG3nixPpLSKdXlaMOhDwBY7IXqpN0xGnNqZTl237/xQEoI2pJqnIU8A60Nk+w==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:1007:b0:dd1:38ec:905d with SMTP
 id 3f1490d57ef6-debb9e0bdeemr176276.11.1715097329468; Tue, 07 May 2024
 08:55:29 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:12 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-10-panikiel@google.com>
Subject: [PATCH v3 09/10] media: dt-bindings: Add Intel Displayport RX IP
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add dt binding for the Intel Displayport receiver FPGA IP.
It is a part of the DisplayPort Intel FPGA IP Core, and supports
DisplayPort 1.4, HBR3 video capture and Multi-Stream Transport.

The user guide can be found here:
https://www.intel.com/programmable/technical-pdfs/683273.pdf

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../devicetree/bindings/media/intel,dprx.yaml | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml

diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Docu=
mentation/devicetree/bindings/media/intel,dprx.yaml
new file mode 100644
index 000000000000..01bed858f746
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel DisplayPort RX IP
+
+maintainers:
+  - Pawe=C5=82 Anikiel <panikiel@google.com>
+
+description: |
+  The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
+  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
+  capture and Multi-Stream Transport.
+
+  The IP features a large number of configuration parameters, found at:
+  https://www.intel.com/content/www/us/en/docs/programmable/683273/23-3-20=
-0-1/sink-parameters.html
+
+  The following parameters have to be enabled:
+    - Support DisplayPort sink
+    - Enable GPU control
+  The following parameters have to be set in the devicetree:
+    - RX maximum link rate (using link-frequencies)
+    - Maximum lane count (using data-lanes)
+    - Support MST (using multi-stream-support)
+    - Max stream count (inferred from the number of ports)
+
+properties:
+  compatible:
+    const: intel,dprx-20.0.1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: MST virtual channel 0 or SST main link
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+            properties:
+              link-frequencies: true
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              multi-stream-support: true
+
+            required:
+              - data-lanes
+              - link-frequencies
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 0 or SST main link
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 1
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 2
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 3
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dp-receiver@c0062000 {
+        compatible =3D "intel,dprx-20.0.1";
+        reg =3D <0xc0062000 0x800>;
+        interrupt-parent =3D <&dprx_mst_irq>;
+        interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+
+        ports {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            port@0 {
+                reg =3D <0>;
+                dprx_mst_in: endpoint {
+                    remote-endpoint =3D <&dp_input_mst_0>;
+                    data-lanes =3D <0 1 2 3>;
+                    link-frequencies =3D /bits/ 64 <1620000000 2700000000
+                                                  5400000000 8100000000>;
+                    multi-stream-support;
+                };
+            };
+
+            port@1 {
+                reg =3D <1>;
+                dprx_mst_0: endpoint {
+                    remote-endpoint =3D <&video_mst0_0>;
+                };
+            };
+
+            port@2 {
+                reg =3D <2>;
+                dprx_mst_1: endpoint {
+                    remote-endpoint =3D <&video_mst1_0>;
+                };
+            };
+
+            port@3 {
+                reg =3D <3>;
+                dprx_mst_2: endpoint {
+                    remote-endpoint =3D <&video_mst2_0>;
+                };
+            };
+
+            port@4 {
+                reg =3D <4>;
+                dprx_mst_3: endpoint {
+                    remote-endpoint =3D <&video_mst3_0>;
+                };
+            };
+        };
+    };
+
+  - |
+    dp-receiver@c0064000 {
+        compatible =3D "intel,dprx-20.0.1";
+        reg =3D <0xc0064000 0x800>;
+        interrupt-parent =3D <&dprx_sst_irq>;
+        interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+
+        ports {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            port@0 {
+                reg =3D <0>;
+                dprx_sst_in: endpoint {
+                    remote-endpoint =3D <&dp_input_sst_0>;
+                    data-lanes =3D <0 1 2 3>;
+                    link-frequencies =3D /bits/ 64 <1620000000 2700000000
+                                                  5400000000 8100000000>;
+                };
+            };
+
+            port@1 {
+                reg =3D <1>;
+                dprx_sst_0: endpoint {
+                    remote-endpoint =3D <&video_sst_0>;
+                };
+            };
+        };
+    };
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog


