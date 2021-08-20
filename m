Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBA13F2415
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 02:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237066AbhHTAPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 20:15:36 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:35759 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234160AbhHTAPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 20:15:35 -0400
Received: by mail-oi1-f182.google.com with SMTP id r26so10889758oij.2;
        Thu, 19 Aug 2021 17:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzq658GIzlXLNiEg71IkbdOdbOfGxbcaRlXDMiaeykU=;
        b=jwdPILkP4PEDjvwDCTKPL/WXdjACvKL1QTSj5KtLiHl8rachyqt40FBr/wwp3Bba3X
         rQ7M3IrtlFlaZkKVZmfHQlo21eU9g4ssuqdXSARPFFEIxpEdPI1H2u7vgNl5YT8GXLU2
         PAlUgR2I1HW11s605yTLJq3MdvdrGTt9UN4f7wd/eWPj7tLcbdQSNqriyiN6mF7CN9XN
         yv9lQUV8qioc/FxzFiOgSAfxTiPmJXjAwXclcFNnObdAuRqCdKZRRKdNulMAvbJ54fDG
         g0VZjPlSsAqMA2Bz+RrItHm5xGgPZTjzFzt2LLDXGKEIDl1goBYl8vszGun59bjYbZyJ
         IdxA==
X-Gm-Message-State: AOAM530CukuEnIv7OfKF5Q6k+7Uc4qkE4I1RayVZfNPR9Q3onNbUMGqG
        l4im1HyzWYBKkfoy8IRkWQ==
X-Google-Smtp-Source: ABdhPJyd9W5yPhYhp8Db0Rpz8w0UNdkK4bytcA2Xi4Dj4BpdguNebcKovqtaUGd8DOIpJJpfaPzcqA==
X-Received: by 2002:aca:4b49:: with SMTP id y70mr1001083oia.16.1629418498709;
        Thu, 19 Aug 2021 17:14:58 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id c14sm1064943otd.62.2021.08.19.17.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 17:14:58 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] dt-bindings: media: Fix more graph 'unevaluatedProperties' related warnings
Date:   Thu, 19 Aug 2021 19:14:57 -0500
Message-Id: <20210820001457.1705142-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The graph schema doesn't allow custom properties on endpoint nodes for
'#/properties/port' and '#/$defs/port-base' should be used instead. This
doesn't matter until 'unevaluatedProperties' support is implemented.

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 2 +-
 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 2 +-
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 2 +-
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index 3e5d82df90a2..a2abed06a099 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -31,7 +31,7 @@ properties:
     maxItems: 1
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index ad42992c6da3..bf115ab9d926 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -38,7 +38,7 @@ properties:
 
   port:
     additionalProperties: false
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
 
     properties:
       endpoint:
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 881f79532501..cf2ca2702cc9 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -38,7 +38,7 @@ properties:
 
   port:
     additionalProperties: false
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
 
     properties:
       endpoint:
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 1edeabf39e6a..afcf70947f7e 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -38,7 +38,7 @@ properties:
 
   port:
     additionalProperties: false
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
 
     properties:
       endpoint:
-- 
2.30.2

