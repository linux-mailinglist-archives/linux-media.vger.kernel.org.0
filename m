Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A5A2B121A
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 23:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgKLWty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 17:49:54 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42275 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgKLWtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 17:49:53 -0500
Received: by mail-oi1-f193.google.com with SMTP id w145so8280020oie.9;
        Thu, 12 Nov 2020 14:49:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1h5pw11FclMlhUn1vEdzA+VFKBuemUQTysAVNoWu1io=;
        b=TcTFl9KG+dcgVghJ580SIm1XAUuxt7TRqQzBk2ZNIpcSOYNRyCynmGEyFiv5UJWnfp
         sLDwys7N7orHjwSY7Z1TQxdUN2XQS2qoU/7wHYWR1ylcWPVeWED8q3XYlfqP9I6Ox3Ui
         QxbkPIftc6vOrMA3y6LcqvS/EdGOR8UoUmfkoG1pElrd6DLr8h19lalWVm+7lXl67Bk2
         /qMD6Ohl93XCKe0xDI9TCDMP/SHnCMRGxaEU2YoCBm/BnkkwxQW6pTER4df2uaco3oCD
         6oiWMS6qIat+NMK1FWTDWG2N6H0AdsV//ojGtC4F1P43wPBgeAgqEk9iD5APJC0cBavv
         kZ3A==
X-Gm-Message-State: AOAM530lUbuin/CY+qQsbJu5SJmtN2Ea4U0naNqOn0hp8D3dU7fZiuzZ
        I5IV/6koMZB2y6wGonX9IA3N5sPn1g==
X-Google-Smtp-Source: ABdhPJzme/G+7vwA/cbr6MkZIpPhXWS1pw7z+EcAlMvXyGpq5GcvbilRLjxi9WNFqqyh8AxWyy1fkA==
X-Received: by 2002:aca:518a:: with SMTP id f132mr69981oib.34.1605221392763;
        Thu, 12 Nov 2020 14:49:52 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id m3sm1512903oim.36.2020.11.12.14.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 14:49:52 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: dt-bindings: schema indentation fixes
Date:   Thu, 12 Nov 2020 16:49:51 -0600
Message-Id: <20201112224951.166313-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a few new indentation warnings found with yamllint (now integrated
into the checks).

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/adv7604.yaml       |  4 ++--
 .../devicetree/bindings/media/i2c/ovti,ov772x.yaml   | 12 ++++++------
 .../devicetree/bindings/media/i2c/sony,imx214.yaml   | 12 ++++++------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
index 3897af540ddd..407baddfaa1d 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
@@ -21,8 +21,8 @@ properties:
   compatible:
     items:
       - enum:
-        - adi,adv7611
-        - adi,adv7612
+          - adi,adv7611
+          - adi,adv7612
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index 63b3779d7289..6866c2cdac50 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -75,18 +75,18 @@ properties:
                 bus-type:
                   const: 6
             then:
-                properties:
-                  hsync-active: false
-                  vsync-active: false
+              properties:
+                hsync-active: false
+                vsync-active: false
 
           - if:
               properties:
                 bus-width:
                   const: 10
             then:
-                properties:
-                  data-shift:
-                    const: 0
+              properties:
+                data-shift:
+                  const: 0
 
         required:
           - bus-type
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 0f5e25fa4e9d..1a3590dd0e98 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -68,13 +68,13 @@ properties:
             description: See ../video-interfaces.txt
             anyOf:
               - items:
-                - const: 1
-                - const: 2
+                  - const: 1
+                  - const: 2
               - items:
-                - const: 1
-                - const: 2
-                - const: 3
-                - const: 4
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
 
           link-frequencies:
             $ref: /schemas/types.yaml#/definitions/uint64-array
-- 
2.25.1

