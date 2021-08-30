Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C2D3FBB75
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 20:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238481AbhH3SJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 14:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238465AbhH3SJS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 14:09:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4F2C061575;
        Mon, 30 Aug 2021 11:08:23 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id y6so27440430lje.2;
        Mon, 30 Aug 2021 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcseY+qtZ/IjcQloLwbPBGPptbdvikn0Z2Vb6xHjpXM=;
        b=Oq20zOGsyCYBDgFP6zD7gX08ZhhMJg4shGSTNPVd+klto7tShSkvOrWZXv1rLRGgp2
         odCHyScPnBCNe5c+hN9zjOvmLgreyOiwG4gxrANcVJfQKtpIyzQ3ugzDfAOiuZcmd00u
         q1DQI+y1WAozv8XlPsvvqW8Lbb+SsuyqMMtDZZ/7pZYJXCJw6tco/FdmAWiS5XPobwJT
         UTlvLdX761tVjtYZqeobEcsORFTsCWF8/uBKUeR1dxO2/7277FwFECAkpsCN8tzDMEpK
         xTuaqZiHR2xuZCxudjYAn9k5jb7oY6o9fV8RCjVclWqv1fgKw9cw6S5sDxZUfOYw9OJ4
         9gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcseY+qtZ/IjcQloLwbPBGPptbdvikn0Z2Vb6xHjpXM=;
        b=jvUqjkKbvsqU6zz/CWTaVaJideKZTJsb79iERDnJWAKShAS6EjhglG2J01W2pOr3al
         40BmOAopOzGhQLkBsK3XXNLx8f3NhqOWP0KQHwxU0bIEfxMnqDyymyRWQuYwOY9Vj5Wc
         v80BIXrM7vufSvc8dR2Kh4BVOza8oYffAg9jqSgHD3Y94Pb33P3cACLhAhgP2DJTdeC8
         8oHmQsjeCNVRrESCQRbb2L6JSiZ6/P3Jx8nVyfObCYkuEutekCgGwVTfiW1mnYFhvsi2
         ppAkbWMw3RVfXUAH8RTOziMdGHIa7+VPcWNkpkHOePjSrqeFS7qOnsxN6Wz2Bw+Ghxr0
         csBA==
X-Gm-Message-State: AOAM531Ov2ioIUkYLVs/N5H/XAeCvILVUf9oGp8gIa8dA6XcG/mL8w+1
        cPS3+jPxvJIIXIDu2fDQjXA=
X-Google-Smtp-Source: ABdhPJxphrh25Yv1GBTQg44hFGXBbULWXm9T/wKn3URGjgqT6xhOA4a0OBIPF3N3K4r2YReRITwA3g==
X-Received: by 2002:a2e:9852:: with SMTP id e18mr21208915ljj.173.1630346901454;
        Mon, 30 Aug 2021 11:08:21 -0700 (PDT)
Received: from localhost (37-145-211-218.broadband.corbina.ru. [37.145.211.218])
        by smtp.gmail.com with ESMTPSA id r13sm1862328ljh.61.2021.08.30.11.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:08:21 -0700 (PDT)
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] dt-bindings: phy: phy-rockchip-dphy-rx0: add support for tx1rx1 phy
Date:   Mon, 30 Aug 2021 21:07:53 +0300
Message-Id: <20210830180758.251390-5-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830180758.251390-1-mike.rudenko@gmail.com>
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RK3399 TX1RX1 D-PHY is not a child of GRF and uses reg, thus add
corresponding properties conditionally. It also requires DSI clock to
operate, so check for it. Since we now support both rx0 and tx1rx1,
rename the schema to rockchip-mipi-dphy-rx.yaml.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 ...hy-rx0.yaml => rockchip-mipi-dphy-rx.yaml} | 39 +++++++++++++++++--
 1 file changed, 35 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/phy/{rockchip-mipi-dphy-rx0.yaml => rockchip-mipi-dphy-rx.yaml} (65%)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml b/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx.yaml
similarity index 65%
rename from Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
rename to Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx.yaml
index 7d888d358823..f42319448fc9 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy-rx0.yaml#
+$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy-rx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Rockchip SoC MIPI RX0 D-PHY Device Tree Bindings
+title: Rockchip SoC MIPI RX0/TX1RX1 D-PHY Device Tree Bindings
 
 maintainers:
   - Helen Koike <helen.koike@collabora.com>
@@ -16,19 +16,28 @@ description: |
 
 properties:
   compatible:
-    const: rockchip,rk3399-mipi-dphy-rx0
+    enum:
+      - rockchip,rk3399-mipi-dphy-rx0
+      - rockchip,rk3399-mipi-dphy-tx1rx1
+
+  reg:
+    maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: MIPI D-PHY ref clock
-      - description: MIPI D-PHY RX0 cfg clock
+      - description: MIPI D-PHY RX0/TX1RX1 cfg clock
       - description: Video in/out general register file clock
+      - description: MIPI D-PHY DSI clock
 
   clock-names:
+    minItems: 3
     items:
       - const: dphy-ref
       - const: dphy-cfg
       - const: grf
+      - const: dsi
 
   '#phy-cells':
     const: 0
@@ -37,6 +46,12 @@ properties:
     description: Video in/out power domain.
     maxItems: 1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the general register file
+      (GRF), required for TX1RX1 MIPI D-PHY on RK3399.
+
 required:
   - compatible
   - clocks
@@ -44,6 +59,22 @@ required:
   - '#phy-cells'
   - power-domains
 
+if:
+  properties:
+    compatible:
+      contains:
+          const: rockchip,rk3399-mipi-dphy-tx1rx1
+then:
+  required:
+    - reg
+    - rockchip,grf
+
+  properties:
+    clocks:
+      minItems: 4
+    clock-names:
+      minItems: 4
+
 additionalProperties: false
 
 examples:
-- 
2.33.0

