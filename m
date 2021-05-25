Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30904390550
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbhEYP0N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbhEYPZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:25:06 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0A9C06138C;
        Tue, 25 May 2021 08:23:03 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id i13so36714843edb.9;
        Tue, 25 May 2021 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ko27frDbBXLhAvgfacRGRR+4pUjzfALcpf9gK/LPa6o=;
        b=gvY/8YrnRNatJA/dSudBIKO9l/9Ko2aqFGsWwpgz3p++VlSDxsryN7GZkOcPiScdI5
         Z8m2KBZhuabszpIvvTI6h67J3ClD8n9hM02W6d5btsuyqRxG/PoaEU7cmyqiIqlB39Al
         W7aZ0GhMnhfOx86vMJSOswKnGK/r+G1+YS3eJ/QarYCkaRwf7AUGd9DFflMQejQkGllC
         DwE0+mglMa+g5PMqlsNhRlDuYqkcZL+wtgi5F8UfQd11AAkyxbMah+hpp03xsBMnHm4O
         xsN0NcV4h1UBlTLwO0vMwO8wL3fLjwUT5NgAwaOkFeRiQwVsLwMJH14dQz88CZR/+Xy9
         gEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ko27frDbBXLhAvgfacRGRR+4pUjzfALcpf9gK/LPa6o=;
        b=UtyR1zN9HMhQXWqgERYh1OKCxGVWDZFbq9paM5uM40oKgoEXdRlk8Vt/b8pDjV9KJU
         h7Ts+L2jHUDRxkaKOggnfzZW7tb3Fy6C4hoYwSrKPFJzjt0vB1S+Z/Q0dWlxjsBz6lQW
         SyNyIxQacVJRUucjTbmJEbpt+4bMYohiIPdCGRErA4m+0Pw1RSwGaBk37BnC1/KmcEbA
         NbnbWLS+tc1ggpxjrf/Lsse6LDtcpX7lveCgrdE+N0en3qTSDkcSw82CFCSH7B5tcwbC
         mmSyI5e3APEJGxqzFXc9hSUuqiZqH7mLNt4XCcCbWjwnXiL1K6AlfSUbmY05kYeVI2iG
         i4DA==
X-Gm-Message-State: AOAM530rKF1Fq8SAYv+aKRDPHYYWe93SyHCv8WncC6NE5SWxm1fkyHBf
        5WIFZGqYkOJhjIZd0Bv6nw==
X-Google-Smtp-Source: ABdhPJxaOWTiSa4p4wqC2Gva5726GgjctkSJ3UTwEY+X1I0Eb2deWBV7kEuBJcunzKKhyVivrRgjow==
X-Received: by 2002:a05:6402:1295:: with SMTP id w21mr31060225edv.60.1621956181896;
        Tue, 25 May 2021 08:23:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:23:01 -0700 (PDT)
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
Subject: [PATCH 10/10] media: dt-bindings: media: rockchip-vdec: add RK3228 compatible
Date:   Tue, 25 May 2021 17:22:25 +0200
Message-Id: <20210525152225.154302-11-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the RK3228 compatible for rockchip-vdec.
Also add the optional assigned-clocks and assigned-clock-rates
properties.

Checked with:
make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip,vdec.yaml

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 .../devicetree/bindings/media/rockchip,vdec.yaml       | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 8d35c327018b..fbcbc93dd1bd 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -15,7 +15,11 @@ description: |-
 
 properties:
   compatible:
-    const: rockchip,rk3399-vdec
+    oneOf:
+      - const: rockchip,rk3399-vdec
+      - items:
+        - const: rockchip,rk3228-vdec
+        - const: rockchip,rk3399-vdec
 
   reg:
     maxItems: 1
@@ -37,6 +41,10 @@ properties:
       - const: cabac
       - const: core
 
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
   power-domains:
     maxItems: 1
 
-- 
2.27.0

