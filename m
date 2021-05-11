Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF03937A960
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 16:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhEKOe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 10:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbhEKOe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 10:34:58 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9074EC06175F
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 07:33:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id m12so30127189eja.2
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fEsnV5/PLwt/6bHEOK62lgG5k074PWDC2L+nXDsQMj4=;
        b=2B5WfW0PBmzhxfYoxBblPEpyvpGC5zf2MMzpmLA2qNQE79LtMSQPC1cGpSvu4FnARc
         zEWKb/Z6WMmqSQSlqZeqqXmXTOAEl6Nj3t5wykGn7DfvjcoHrzomuExs2LuwF9RO3SEW
         12h+yArLVacunhkZ+9CbKHB7B61H8Pc6b9bgOWV8PMBaDDXaLYcXFwTFQ13zD4vfBmGv
         /gxyGV00OhwUUtcdevvruVT9K86Vz0k76yjZqeXTQFdhTy1Oni68Ir2uZKw00d0ptYS8
         /gUonY4aJ9ENGB/qmhGMvxcnqG02CfptXBSm7MoGeSfSzVV0VhGxwdSeGWiL6nPRvpXO
         lqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fEsnV5/PLwt/6bHEOK62lgG5k074PWDC2L+nXDsQMj4=;
        b=EmepKrndvTivakJgRMRAxna2e5L0EJTkQZNjrEk4pyeASyHLjo2wkHYMKyuVjtGePh
         ZXfCNZbxvCJouNqUpkhBCAy0Rm7tVO0S+bXZzDlEuQgo2j+5vNWgpxOxv9ks5tQkE1mj
         dusAt4zajLH3tnltEB0cLXYKctK5sW74Ja3ORB1riMUhUP/XFnabcQDQ8CoBp35zZwSs
         EoXtl34cyaUGHUHVFevuGHAkFyV5jyZqteLC1lTbcrzEdHpdvpKWeNktEcTf6+etiLy0
         pxB2EEXOfvrxnkmw43zU0slB+fzWNmAOAaRSnruF40xTBbz8sDzSanXLp/NfdLrI0yea
         JL0Q==
X-Gm-Message-State: AOAM531kUk6dDyYHQlEwvUSfoV5OhdoY2POa+Xp968G+6jHYnSLklKNg
        Uug/umqHcH4BiLMUZbACT5xS9Q==
X-Google-Smtp-Source: ABdhPJz63OHh7AYFiqCZii8KRrxI3FR+o7VeaDmM9Y5way694aajhinueyWzdmn519gWiHGKmXma7g==
X-Received: by 2002:a17:906:8588:: with SMTP id v8mr32000972ejx.550.1620743630340;
        Tue, 11 May 2021 07:33:50 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id pw11sm11753284ejb.88.2021.05.11.07.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 07:33:49 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] media: dt-bindings: media: renesas,vin: Add r8a779a0 support
Date:   Tue, 11 May 2021 16:33:32 +0200
Message-Id: <20210511143332.3469877-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document support for the VIN module in the Renesas V3U (r8a779a0) SoC.
The V3U is different from other SoCs as it have 32 instead of 8 (most of
Gen3) or 16 (V3H) VIN instances. The VIN instances are also connected to
a new IP the R-Car ISP Channel Selector.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Update commit message documentation.
---
 .../bindings/media/renesas,vin.yaml           | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index dd1a5ce5896cef13..5ba06b0f030b4030 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -51,6 +51,7 @@ properties:
               - renesas,vin-r8a77980 # R-Car V3H
               - renesas,vin-r8a77990 # R-Car E3
               - renesas,vin-r8a77995 # R-Car D3
+              - renesas,vin-r8a779a0 # R-Car V3U
 
   reg:
     maxItems: 1
@@ -111,7 +112,7 @@ properties:
     description: VIN channel number
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
-    maximum: 15
+    maximum: 31
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -187,6 +188,29 @@ properties:
           - required:
               - endpoint@3
 
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port node, multiple endpoints describing all the R-Car ISP
+          modules connected the VIN.
+
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Endpoint connected to ISP0.
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Endpoint connected to ISP1.
+
+          endpoint@2:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Endpoint connected to ISP2.
+
+          endpoint@3:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Endpoint connected to ISP3.
+
 required:
   - compatible
   - reg
-- 
2.31.1

