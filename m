Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5AD119D72B
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 15:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403834AbgDCNGS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 09:06:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39718 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403802AbgDCNGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 09:06:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id p10so8439339wrt.6;
        Fri, 03 Apr 2020 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4SOzz1DmBA7mljFUWMggCDnfrvoqqdJY//N8mPAQhYE=;
        b=n4oq1vKlwlBna9oy0F1xJ+XJqlPWCBvFuIV8OwA5dMCdovlp8WWH0qxUaXFHiG3Ba7
         EgbdcftsRMgnpFruqG84PWe1JpwfrIIvSLVW4UNQ8eeBGKW5gqoKKqGZYQBgtLiSr9aq
         foQFVK4H7/mFGwRnMANlYBdNaEIFemBMpybVAi5Ab4Kz3d5caXNgwI9nnMkK/iZz9s+q
         7TNJAa+qMqptwzD+DGoeI7lTSPGT0m1aXgomOFlMgYBBs7oEeH4E3fN+xUOt6DolnTUk
         eV9IxiJe917H3X51DhnnlvpcUhIx7Pi0tsntSf3mGfdj8gTlMPgMoccczujiLOcfREtD
         7hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4SOzz1DmBA7mljFUWMggCDnfrvoqqdJY//N8mPAQhYE=;
        b=ETwHfRZigKcoeG9QJz4pd2rE+EN9jNYdOCYMmSzYeh4QOeSLyBReIgLqmNzxQGr12H
         5+pLJkhzD7ALfRrbTLjh9UJD/Wn+Mmi4eDS3lPvxeHOweOrp9a13DczL9RQjZ8tPXAu2
         inMSPaRExjbCUsJcGPDA22VWnOddbIJIh0XCYEn/yk1XiMyNzGBClf9TReNrO8QLqppT
         +VcElAfS33IsVaScczLsUPyYCcU9zHh7qCBC75pBoGtUzeZ71bqu/ZkI9x5jMFFP81XH
         M/esyqdb5EiNeYtO0LgRKyCjls4VXQGBcRq6dXAISuaXh/fVtaNVnjT/frVDUc32IKGh
         wJXg==
X-Gm-Message-State: AGi0PuaKdKa7RLw+VRxwgsw636rIwz+5VWnXnifNAObZ7H+/DYYortgZ
        7zfZz0R4JIFscQlBV3sVqdw=
X-Google-Smtp-Source: APiQypJxcRsi2W0wZr2Apx763AJcizS2Tq6i4fWAc5H1frqyVroHXfPYrCZUbCFO4LE17/gl19G4Tg==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr8767392wrq.282.1585919176335;
        Fri, 03 Apr 2020 06:06:16 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id o9sm7036093wru.29.2020.04.03.06.06.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2020 06:06:15 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     jacob-chen@iotwrt.com
Cc:     ezequiel@collabora.com, mchehab@kernel.org, robh+dt@kernel.org,
        heiko@sntech.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: media: rockchip-rga: add power-domains property
Date:   Fri,  3 Apr 2020 15:06:07 +0200
Message-Id: <20200403130607.6138-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200403130607.6138-1-jbx6244@gmail.com>
References: <20200403130607.6138-1-jbx6244@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the old txt situation we add/describe only properties that are used
by the driver/hardware itself. With yaml it also filters things in a
node that are used by other drivers like 'power-domains' for rk3399,
so add it to 'rockchip-rga.yaml'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip-rga.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
index 3b110b574..dd645ddcc 100644
--- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
@@ -39,6 +39,9 @@ properties:
       - const: hclk
       - const: sclk
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 3
 
@@ -63,6 +66,7 @@ examples:
   - |
     #include <dt-bindings/clock/rk3399-cru.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
     rga: rga@ff680000 {
       compatible = "rockchip,rk3399-rga";
       reg = <0xff680000 0x10000>;
@@ -71,6 +75,7 @@ examples:
                <&cru HCLK_RGA>,
                <&cru SCLK_RGA_CORE>;
       clock-names = "aclk", "hclk", "sclk";
+      power-domains = <&power RK3399_PD_RGA>;
       resets = <&cru SRST_RGA_CORE>,
                <&cru SRST_A_RGA>,
                <&cru SRST_H_RGA>;
-- 
2.11.0

