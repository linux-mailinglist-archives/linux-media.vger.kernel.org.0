Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCFF2B6FAA
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 21:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731404AbgKQUHz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 15:07:55 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41998 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731388AbgKQUHz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 15:07:55 -0500
Received: by mail-oi1-f194.google.com with SMTP id w145so23955008oie.9;
        Tue, 17 Nov 2020 12:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fL3muEXmXVcZEZGAGIFkkiLrEeaqM4V7qB0k/56I+OE=;
        b=KPiNURShYhiQkUtc7T08x8+TlubU95kxwvl0yNaaM4mcJ6G51rf4Q+ZydQOsh5R/Gc
         b6CdpNzKhsBAs/RaUrENctbg7/dJkXrgETlHSH0KSWlJbhGl3lyWpKBwmzLcjKfD1FJM
         /CRb5ZTnBAj5Jd6c4pjt6oeJ1EImp6c/pHTpXgOEDSRKww5SNha0rN3/aqPY5/5VZJ7/
         cwXjyAZWVs6D/J3Uwm/LaiAYxB2swphC3Uar8b5chP/MEtblhCc92MhzLWX+QspTrpEP
         y5tpgU9WNOQOB5XFvThh/AsqGxFxF/t/9scrRr8ntOeNB6wSICJMRDO804x62ikdmfgd
         XFLA==
X-Gm-Message-State: AOAM531RYsPSHM49bx+Wg3TiLVhh9t32V5bunNoUa9TVQKieJxr40kws
        cHt5F2eU3z9u6GNA1KKCpA==
X-Google-Smtp-Source: ABdhPJyu5ptGI9RabW0aiyO9kzYMNb3MM9woVa4EcjZhb19iUw2NCo5Gs/wPUQu6V05KEAxuvxxgCw==
X-Received: by 2002:aca:4b0d:: with SMTP id y13mr532262oia.160.1605643673962;
        Tue, 17 Nov 2020 12:07:53 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id x8sm6783898ooc.44.2020.11.17.12.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 12:07:53 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Subject: [PATCH v2] media: dt-bindings: coda: Add missing 'additionalProperties'
Date:   Tue, 17 Nov 2020 14:07:52 -0600
Message-Id: <20201117200752.4004368-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'additionalProperties' is now required by the meta-schema. Add it for
coda. As a result, 'interrupts', 'interrupt-names' and 'power-domains'
need to be reworked to be defined at the top level.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/coda.yaml       | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
index 7bac0057faf7..36781ee4617f 100644
--- a/Documentation/devicetree/bindings/media/coda.yaml
+++ b/Documentation/devicetree/bindings/media/coda.yaml
@@ -44,6 +44,21 @@ properties:
       - const: per
       - const: ahb
 
+  interrupts:
+    minItems: 1
+    items:
+      - description: BIT processor interrupt
+      - description: JPEG unit interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: bit
+      - const: jpeg
+
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
@@ -59,6 +74,8 @@ required:
   - clocks
   - clock-names
 
+additionalProperties: false
+
 allOf:
   - if:
       properties:
@@ -68,34 +85,17 @@ allOf:
     then:
       properties:
         interrupts:
-          items:
-            - description: BIT processor interrupt
-            - description: JPEG unit interrupt
+          minItems: 2
 
         interrupt-names:
-          items:
-            - const: bit
-            - const: jpeg
+          minItems: 2
     else:
       properties:
         interrupts:
-          items:
-            - description: BIT processor interrupt
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - fsl,imx6dl-vpu
-              - fsl,imx6q-vpu
-    then:
-      properties:
-        power-domains:
-          $ref: /schemas/types.yaml#/definitions/phandle
-          description: phandle pointing to the PU power domain
           maxItems: 1
 
+        power-domains: false
+
 examples:
   - |
     vpu: video-codec@63ff4000 {
-- 
2.25.1

