Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267CC3B1EE7
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 18:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhFWQqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 12:46:09 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:33660 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWQqI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 12:46:08 -0400
Received: by mail-il1-f174.google.com with SMTP id z1so3293209ils.0;
        Wed, 23 Jun 2021 09:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f6Vh/iMO+DL12gk9Tu+4KtypjSwMDw9fT0H6f4uw508=;
        b=dS6UVbdcEGRjr0ZWBsemNx4S518pkDhWOdsZjeQnED7WSFjSA5Qr5OeF59a4XE5Fwv
         geg4B2KERaokAqBRjn/BPd9Xhh9zG4dhTfPCXBtAdwwsTNjyA0Or+GjCSUXiAxdHRavQ
         7J59DtW1itrYoJ0XiNZtjPtMy9dboapGAQsClJOqHJEzsmjpjeOh4V1oQt7ylTxc3Pbp
         R9QFD1fmNqVjYFPgfYXepevu0eP7wb8z+f9xQcOv/dO4LPUpte9Mue8OCic14aRuePVo
         MUxYQ2PHBvP7lvZ7/qRaAnzoDt3tHrc7fD2SLcDenZe336LJ9GqkHM07RynYBID6fk9L
         5ZnQ==
X-Gm-Message-State: AOAM531mJjZ2pB13Dmrc1nPDzCHJIhVDCDmb+ogfxivYYLCypo3TM7HM
        lIteyTilyuUVttjzDfYr+VlpU2JMYQ==
X-Google-Smtp-Source: ABdhPJzHApVMwot/jy/0q5ve0eDOrSqnNTpZDBMsY1U/uDirxXIH3FcCW9b+mmg2QEA0GLhVu6WaTw==
X-Received: by 2002:a92:3f01:: with SMTP id m1mr263713ila.122.1624466629069;
        Wed, 23 Jun 2021 09:43:49 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id a11sm178698ioq.12.2021.06.23.09.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 09:43:48 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: Fix 'unevaluatedProperties' errors in DT graph users
Date:   Wed, 23 Jun 2021 10:43:44 -0600
Message-Id: <20210623164344.2571043-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In testing out under development json-schema 2020-12 support, there's a
few issues with 'unevaluatedProperties' and the graph schema. If
'graph.yaml#/properties/port' is used, then neither the port nor the
endpoint(s) can have additional properties. 'graph.yaml#/$defs/port-base'
needs to be used instead.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml    | 3 ++-
 Documentation/devicetree/bindings/media/i2c/imx258.yaml        | 2 +-
 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml   | 2 +-
 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml   | 2 +-
 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml   | 2 +-
 Documentation/devicetree/bindings/media/renesas,vin.yaml       | 3 ++-
 6 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
index 735d0233a7d6..674891ee2f8e 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
@@ -29,7 +29,8 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           Primary MIPI port for MIPI input
 
diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
index 515317eff41a..cde0f7383b2a 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
@@ -49,7 +49,7 @@ properties:
 
   # See ../video-interfaces.txt for more details
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 9149f5685688..246dc5fec716 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -45,7 +45,7 @@ properties:
 
   port:
     description: MIPI CSI-2 transmitter port
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 0699c7e4fdeb..b962863e4f65 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -45,7 +45,7 @@ properties:
 
   port:
     description: MIPI CSI-2 transmitter port
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index 27cc5b7ff613..f5055b9db693 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -37,7 +37,7 @@ properties:
 
   port:
     additionalProperties: false
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
 
     properties:
       endpoint:
diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index dd1a5ce5896c..4945a2f0eca6 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -118,7 +118,8 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           Input port node, single endpoint describing a parallel input source.
 
-- 
2.27.0

