Return-Path: <linux-media+bounces-5012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 218578514E6
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 14:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C0E6B2474E
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 13:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA3A4D9E8;
	Mon, 12 Feb 2024 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vrROLVyI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6CC4CDE1
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743679; cv=none; b=XDzWZvfU0vjymGJDb15Zke5P0uc8GyjPK6B76Cke0I3x81YZC7NbmSbDOtGJcy7qM+C6zekKhQxZ0XGE2SNUB+5+YWVoSK01QWqlv8iNWJoUgmQUkbYOCMdvu+3TeVaGBZ8p1/INf7Xwt756HuMPNEz101MTlLewsQt0Cg4/ig0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743679; c=relaxed/simple;
	bh=IrOdF2IkBl2jU+cs6JkBmakSjiXX4Bcd9lmtDOI7FSE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S07qub9QdG+BDZlcVVUEelkVlK5/aX4hBUYuiruZ3RIvBQePloL04pdpXeBkb3EA3tFpMKSuMAYJZZXWL598ow8oc9cB81Z9QFvPcHNc55K6/Inh7o65gkhrUbaxv4+TrAfUTLOWCtcutYVIQqVaEFxft3cfYVIHT2gE9SKE2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vrROLVyI; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-33b14a51861so1588250f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 05:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707743675; x=1708348475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weAbudB3k3wPqp+4oDt/WoN+euSYJ/f5cRIeaqwfqjk=;
        b=vrROLVyIUc69oKVb/Bvw5eOwovBUGYXKKzKUT/25HPfN0B6IteVu+BQ++koOzHbXfx
         TBwJpYFJrqeWTuTNQy+rcgBRzxYPBt/klLvADjNcRcVN8rB0vU543aYI//jr2K3D3W1Q
         8GKCpCVJkDpwVaWjFFX019frbnJZbX3VhSCg8SIjBvR9EU74Hsy1svR7MZn20paPnaby
         SkUR+tDYJswUdeMQyIW/YkXd+V20xCCpNy5Ciq02xKEa6GwSJQgOjr2POGVrr+EpBZyU
         +9eVm1+6fl75VqgMYTJ3Q00YRjE6qeCZxLqT941GAYEvyyfXRzZeO8SbuCskZLpXZvMp
         ESnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743675; x=1708348475;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=weAbudB3k3wPqp+4oDt/WoN+euSYJ/f5cRIeaqwfqjk=;
        b=AmiYBrspPUg4uoAW2kEHIjLzyOHvNOmVS0FDFTP8DrZ7tvhE2ALzHPNZZMMh/6dmbN
         refqZOmyVjRZXuqO219MqGpy7UZNmf3zuMetr9L0mOmBEO1GMuXPpm0MuSImfW2RImUq
         SZlBS1ZWBTwpg9i2TekuQ3qJYkb+MU9x1Wcij157BOv9r6Yuv0mi9Wu1b8EboQ9L2W7K
         04i86caxsXX4+KxYI5Eto0oRdLjBZaHWmudF0M4iEtjFg3DAFfFYHEYb83rJhCvf2MV2
         CXRYJ+FMVETF367fDGdBTYtnvbeGyievXt8bu6SGfSd+8+CCggqV8+7diDhbT2gR9dh4
         tvxw==
X-Gm-Message-State: AOJu0YyARdTfvS5kTOgoZTFbYsQCinf3k+4rExDXM4xYyoJ0K9Y49ow6
	MuwMo4Dd2GW8u20li0KxSCM06wwhJDNB5gfnd688ryGlJgjJ42iHv1u36eZnJRTM5pQsmV04cqJ
	zhp05p1ktRQ==
X-Google-Smtp-Source: AGHT+IFZySJWx+sJiH1D/tqRLGTEXs/l+QZVWepQz6m1RRZuOBSja+jh8SjmiG4dW0L1Nwzda60ddfO2GObytg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6000:a16:b0:33b:6489:a97d with SMTP
 id co22-20020a0560000a1600b0033b6489a97dmr13629wrb.14.1707743675651; Mon, 12
 Feb 2024 05:14:35 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:22 +0000
In-Reply-To: <20240212131323.2162161-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-9-panikiel@google.com>
Subject: [PATCH 8/9] media: dt-bindings: Add Intel Displayport RX IP
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
capture and Multi-Stream Transport. The user guide can be found here:

https://www.intel.com/programmable/technical-pdfs/683273.pdf

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../devicetree/bindings/media/intel,dprx.yaml | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml

diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Docu=
mentation/devicetree/bindings/media/intel,dprx.yaml
new file mode 100644
index 000000000000..3ed37e0a4a94
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
@@ -0,0 +1,125 @@
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
+properties:
+  compatible:
+    const: intel,dprx
+
+  reg:
+    items:
+      - description: core registers
+      - description: irq registers
+
+  interrupts:
+    maxItems: 1
+
+  intel,has-mst:
+    type: boolean
+    description: The device supports Multi-Stream Transport
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: SST main link
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 0 or SST main link
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 1
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 2
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      required:
+        - intel,has-mst
+    then:
+      required:
+        - ports
+    else:
+      required:
+        - port
+
+additionalProperties: false
+
+examples:
+  - |
+    dprx@c0062000 {
+        compatible =3D "intel,dprx";
+        reg =3D <0xc0062000 0x800>,
+              <0xc0060f80 0x10>;
+        interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        intel,has-mst;
+
+        ports {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            port@0 {
+                reg =3D <0>;
+                dprx_mst_0: endpoint {
+                    remote-endpoint =3D <&fb_mst0_0>;
+                };
+            };
+
+            port@1 {
+                reg =3D <1>;
+                dprx_mst_1: endpoint {
+                    remote-endpoint =3D <&fb_mst1_0>;
+                };
+            };
+
+            port@2 {
+                reg =3D <2>;
+                dprx_mst_2: endpoint {
+                    remote-endpoint =3D <&fb_mst2_0>;
+                };
+            };
+
+            port@3 {
+                reg =3D <3>;
+                dprx_mst_3: endpoint {
+                    remote-endpoint =3D <&fb_mst3_0>;
+                };
+            };
+        };
+    };
+
+  - |
+    dprx@c0064000 {
+        compatible =3D "intel,dprx";
+        reg =3D <0xc0064000 0x800>,
+              <0xc0060fe0 0x10>;
+        interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+
+        port {
+            dprx_sst_0: endpoint {
+                remote-endpoint =3D <&fb_sst_0>;
+            };
+        };
+    };
--=20
2.43.0.687.g38aa6559b0-goog


