Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DC4379870
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 22:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbhEJUgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 16:36:24 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:33339 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhEJUgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 16:36:22 -0400
Received: by mail-oi1-f170.google.com with SMTP id b25so11763045oic.0;
        Mon, 10 May 2021 13:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nL2nMaqiBYSydQqnUrjLbS0U3ekSRPwP+itlQ42UQbw=;
        b=bQDWMWZ7KcrP/0c7Lg7ohq6gZTdQEdlPikMrI2EXBy7VloYQc5uvYAokkZhyFoqjmP
         jjPWd93XsJhRGBttSZ4d63o9/N42Wd3S3dDStW8r8G6rd3jPXjrCtIOMFZfO/Hsmz4Je
         1f5CzA7F2MS06otRCIyWpRGskDW5TQOgDgX7bNE1ZRO6vqzjQ6qIERUPXaqaS8nfYKZM
         02yUOIbVWr3XPGYG1LM0w1qy68vqb0FfwlXbZJ9HAS6LjINv9NAbeQdt4Oj95LowGj2H
         6I/1d5elCzJhgyERT/rFG/xELOMvct2uvi7FScHCPlg+1fdTxVRHdOwNwZWicNUsVs6S
         z7rg==
X-Gm-Message-State: AOAM531BvTiy7QPFfdOJF5k5IOIZs5afzK+HLDsm8E8UcU4FpLDeQi9f
        VtL7WWWEhkiOzUGvCbBjdKqUJP4Ggg==
X-Google-Smtp-Source: ABdhPJy6vFD/t0RPzeoEBuRS6wR6+HMPpOFG9W2xfxD3a6X5Lte04IgzMY74HQukR2eKdm8VuLNh7g==
X-Received: by 2002:a05:6808:8ee:: with SMTP id d14mr788010oic.18.1620678917302;
        Mon, 10 May 2021 13:35:17 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id i130sm2866508oif.49.2021.05.10.13.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:35:16 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: media: renesas,drif: Use graph schema
Date:   Mon, 10 May 2021 15:35:14 -0500
Message-Id: <20210510203514.603471-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the renesas,drif binding schema to use the graph schema. The
binding referred to video-interfaces.txt, but it doesn't actually use any
properties from it as 'sync-active' is a custom property. As 'sync-active'
is custom, it needs a type definition.

Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ramesh Shanmugasundaram <rashanmu@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/renesas,drif.yaml          | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
index f1bdaeab4053..ce505a7c006a 100644
--- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
@@ -99,32 +99,26 @@ properties:
       Indicates that the channel acts as primary among the bonded channels.
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
+    unevaluatedProperties: false
     description:
-      Child port node corresponding to the data input, in accordance with the
-      video interface bindings defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
-      The port node must contain at least one endpoint.
+      Child port node corresponding to the data input. The port node must
+      contain at least one endpoint.
 
     properties:
       endpoint:
-        type: object
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
 
         properties:
-          remote-endpoint:
-            description:
-              A phandle to the remote tuner endpoint subnode in remote node
-              port.
-
           sync-active:
+            $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1]
             description:
               Indicates sync signal polarity, 0/1 for low/high respectively.
               This property maps to SYNCAC bit in the hardware manual. The
               default is 1 (active high).
 
-        additionalProperties: false
-
 required:
   - compatible
   - reg
-- 
2.27.0

