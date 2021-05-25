Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528AC390546
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhEYPZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbhEYPYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:38 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DF4C061348;
        Tue, 25 May 2021 08:23:01 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id t15so36736347edr.11;
        Tue, 25 May 2021 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ijn2PRPL849+JSabWw86AQic424WRwZ5K5EVNCYn+dM=;
        b=UnJHnkWW66vvZYjMiXcIOKwIXMHwm/QXQ0MkI2C4XmjPc57aMdGG+Bc3x+EDLBF81S
         l5Jcgt7SM0O9ZoeWJosMgoxX3QBgDxUSoIzgnmV6teH6iEgk9HlSi6udW8y3MQ0gJQzv
         UyYjeHVCIYke6ZVqwevqifvjBWCvzhsl5K5X9zvsNsiq9SRQIG+zhN2oHTgEhB/eePV9
         45tzDnpbMoUWevsOzFlZNDy5/+6XJgsOjGbbTmU+RKUQZSwUwwBEYqJ4/FGEji+B13Ax
         CRPyAA2o/rOKGWXBlc9K1qUnHki0zx9D4gXR8vsZ1sTcK3U7QB5zqIDukhrLHh5M7foP
         T+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ijn2PRPL849+JSabWw86AQic424WRwZ5K5EVNCYn+dM=;
        b=UEU+YmbVTfbsPqU6RIJkUQrhQZnsmGg3PjCLOb/hzPWNAEqYVw1/lS1sZ8VvA3qj+R
         WFnuWgwAM3x41U8NBykVKW8P9abGjQk72yHFVQu+1ZfO8u1zyu6dkXv8kclnoc/t44Yi
         rLy+2nsNyboUd3v29QonwgH5Zz1imxIFxiJDB/mmy4R+W1vQ3BGcjaMlzz0Lfzb2FPpy
         ABtrjuREVcY2WD2Xy2NN6zOn+ad0tiq9IU1/Xqy9EjHREEnIYvd1M3atSpugrgDC14vz
         7PEIUtaTKpGCZSamQMsiM0V3Au5t1cMDBlTjGKO2cuNuzg0Y9b31H3WZj2mQU3dvLXMJ
         2rxw==
X-Gm-Message-State: AOAM530KRkkaziqVlkIo9wQ6qTY/YMsRLc8TUP56znql2MEOtqneY5PM
        v2JUYQlI09RrqwOMAGQpow==
X-Google-Smtp-Source: ABdhPJxduAKmZWou/QxRJ6a6frDpt322X1s543PlVcFZw2wMuMVoUj7bTlccXKiF69JNF3SV/S8oRQ==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr31484310edq.201.1621956179889;
        Tue, 25 May 2021 08:22:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:59 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 08/10] media: dt-bindings: media: rockchip-vpu: add new compatibles
Date:   Tue, 25 May 2021 17:22:23 +0200
Message-Id: <20210525152225.154302-9-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add compatibles for RK3036, RK3066, RK3188 and RK3228. Also reflect the
changes to the additional clocks for RK3066/RK3188.

Checked with:
make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-vpu.yaml

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 .../bindings/media/rockchip-vpu.yaml          | 33 ++++++++++++++-----
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index c81dbc3e8960..91a3278f33c2 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -15,10 +15,19 @@ description:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3288-vpu
-      - rockchip,rk3328-vpu
-      - rockchip,rk3399-vpu
+    oneOf:
+      - enum:
+        - rockchip,rk3036-vpu
+        - rockchip,rk3066-vpu
+        - rockchip,rk3288-vpu
+        - rockchip,rk3328-vpu
+        - rockchip,rk3399-vpu
+      - items:
+        - const: rockchip,rk3228-vpu
+        - const: rockchip,rk3399-vpu
+      - items:
+        - const: rockchip,rk3188-vpu
+        - const: rockchip,rk3066-vpu
 
   reg:
     maxItems: 1
@@ -35,12 +44,20 @@ properties:
           - const: vdpu
 
   clocks:
-    maxItems: 2
+    oneOf:
+      - maxItems: 2
+      - maxItems: 4
 
   clock-names:
-    items:
-      - const: aclk
-      - const: hclk
+    oneOf:
+      - items:
+        - const: aclk
+        - const: hclk
+      - items:
+        - const: aclk_vdpu
+        - const: hclk_vdpu
+        - const: aclk_vepu
+        - const: hclk_vepu
 
   power-domains:
     maxItems: 1
-- 
2.27.0

