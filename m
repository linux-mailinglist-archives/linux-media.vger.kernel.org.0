Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD3E3CEFB6
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 01:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243129AbhGSWgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 18:36:48 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:36523 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385732AbhGSTIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 15:08:30 -0400
Received: by mail-il1-f171.google.com with SMTP id j5so17112595ilk.3;
        Mon, 19 Jul 2021 12:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GDUH5kKZnOHRCAbBYePTCiIA1/WaZH91n3x0Dno6HFQ=;
        b=pOBPpmIUxOFi9+EDBocKHUAb6m+mJ/KxYcJ63V9wxvHyP4BwmzWmz7B0bZ3Y4KYuQK
         ocf78dq0hez9lXKVRKEAZLSGqFA5n+OleUYZCk/2ZdRR5S6Ti9CqAicgdO0YZ0WX5cc8
         JxnhGe99DKIj1LywuwAQEy7YA9Of4lZsRU5i9aI1VSOUdiMfrqBOcMeOPuN7fKklvAxM
         xOlvwoTiZOShIiQwHLi7N3vhLrA1lbzuvY8BeWOsz8yipDAJcb4er1uRmtXqc/2LLiY8
         6kiz8+PGhKvXykZAyFSNFZ94sjP5caS5kFlK6DY2fYA8UOJTbTZRbUfjtJuEs0FoGexK
         TZcA==
X-Gm-Message-State: AOAM532glg2WgmxKxiUHyH8iOEWTZrXM9rxQvbDRaDtvd2ZJnXrBOvfy
        cSjjTrlhNtcVFbnIWSKD+A==
X-Google-Smtp-Source: ABdhPJxne2/ZNMI2QOulVi9xVIAfp9pBxOds/kvhM1c+nWxPLBJeFq+sM2PJlMNuUEgGjrxakSXCEw==
X-Received: by 2002:a92:d5cb:: with SMTP id d11mr17647954ilq.133.1626724133543;
        Mon, 19 Jul 2021 12:48:53 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id h10sm11306196ioe.43.2021.07.19.12.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 12:48:52 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] dt-bindings: media: Fix graph 'unevaluatedProperties' related warnings
Date:   Mon, 19 Jul 2021 13:48:50 -0600
Message-Id: <20210719194850.2410511-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The graph schema doesn't allow custom properties on endpoint nodes for
'#/properties/port' and '#/$defs/port-base' should be used instead. This
doesn't matter until 'unevaluatedProperties' support is implemented.

Cc: Eugen Hristev <eugen.hristev@microchip.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Ramesh Shanmugasundaram <rashanmu@gmail.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/atmel,isc.yaml      | 3 ++-
 Documentation/devicetree/bindings/media/microchip,xisc.yaml | 2 +-
 Documentation/devicetree/bindings/media/renesas,drif.yaml   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/atmel,isc.yaml b/Documentation/devicetree/bindings/media/atmel,isc.yaml
index 3e4bb8892d94..cd6d7af0c768 100644
--- a/Documentation/devicetree/bindings/media/atmel,isc.yaml
+++ b/Documentation/devicetree/bindings/media/atmel,isc.yaml
@@ -44,7 +44,8 @@ properties:
     const: isc-mck
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
     description:
       Input port node, single endpoint describing the input pad.
 
diff --git a/Documentation/devicetree/bindings/media/microchip,xisc.yaml b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
index 41afe2e5f133..086e1430af4f 100644
--- a/Documentation/devicetree/bindings/media/microchip,xisc.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
@@ -52,7 +52,7 @@ properties:
       of the data and clock lines.
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     description:
       Input port node, single endpoint describing the input pad.
 
diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
index 817a6d566738..2867d11fe156 100644
--- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
@@ -96,7 +96,7 @@ properties:
       Indicates that the channel acts as primary among the bonded channels.
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
     description:
       Child port node corresponding to the data input. The port node must
-- 
2.27.0

