Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DB43B1EDE
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 18:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhFWQpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 12:45:20 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:46593 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWQpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 12:45:20 -0400
Received: by mail-io1-f53.google.com with SMTP id b14so4221282iow.13;
        Wed, 23 Jun 2021 09:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Al7RaRuJAOOhZdeBrUbtixgpg0qZTkAJUNiukyI7afE=;
        b=RMNvsRFN9WSVF+2zJ+CGOkLpMnfgM4GGuA2C7VnvOl5kHN3XuhLs8cOyoKGoeKNew8
         rLpX8pMbOOzBVTQAk37PO0wDGFFU4anwh336NZhGGL7Knxm8APNYAiitEkYwSZm9HWqg
         G0oPAg8LRBaaDWxM2mg9KPFYFwo2BGeGyKDUvLOLdRqMup4+tMisZlQ+OgSLfHL/jNd9
         YML16COayt/Gga5q7+AKCaEdIK92mRRaifk+6ptPpp/pbfghZ/tX3Njh34Xi1Ri69WNp
         3YjGzJKI/H/uTiy+2vXcO2JtgPDOChmWzH/2HRoL7FaIn2mCnsL+BpRQjhnP4IGpZbq7
         g2qw==
X-Gm-Message-State: AOAM531knPYkeCaM9pQx41zDaIgbXiLHW0MpVURHDXhagilYhBC8bf8p
        Dzq4eg4hghICgley22CyNakxonQO/w==
X-Google-Smtp-Source: ABdhPJyd7tuKvvwSsNFbtxPzmedj9fHtl8sWC10E7Roz5oKIm5yP8FI803LiWwHjc4qqox+PRunceA==
X-Received: by 2002:a05:6638:3594:: with SMTP id v20mr462345jal.25.1624466581299;
        Wed, 23 Jun 2021 09:43:01 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id j18sm214501ila.9.2021.06.23.09.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 09:43:00 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] dt-bindings: media: adv7180: Add missing video-interfaces.yaml reference
Date:   Wed, 23 Jun 2021 10:42:56 -0600
Message-Id: <20210623164256.2569839-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The adv7180 binding is using 'bus-width' property, but doesn't document it.
Add a reference to the video-interfaces.yaml schema to properly document it.

Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index bcfd93739b4f..3ce4af143a3a 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -36,7 +36,13 @@ properties:
     maxItems: 1
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
 
   ports: true
 
-- 
2.27.0

