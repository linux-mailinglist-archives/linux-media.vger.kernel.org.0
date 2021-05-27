Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3633932B2
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235753AbhE0PrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235641AbhE0Pq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:46:57 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2450C061574;
        Thu, 27 May 2021 08:45:20 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id h20so873031ejg.1;
        Thu, 27 May 2021 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rke4zQwPvrSuSlZA5HEJuyAjP5qkfCV7I4D9cjIxs6c=;
        b=IhhLJkbkySu4cWqS/Z/H/bB43kxmugCm8uX3SDcB3PMk2zlyRWdOPl294qaSyXcV1O
         Tnvo76yHG68UM2kWcagmaTUeM/nPwpueD4DPDJxgR8lO4TjE596+77kIMHDBL7Psu7DY
         w4UL3X3/4x6wbVkRD1CiU+TWL2K0r8E671J6TojDcLIKyjgsgvYMZvq/hdDhTILx0uTw
         HLaMoZgpG5UF3JPJOzUKw8bY/eGktXDu3tGuxwbbur/4IXj5zJ00D53vL5EIuZ+1Pzuy
         9ld8KCmw0KQY+KGPIDL05NUYPKZAK487zuL4HacIqM+OilwsYHsVes+2VTp6rUu4Ym4N
         TITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rke4zQwPvrSuSlZA5HEJuyAjP5qkfCV7I4D9cjIxs6c=;
        b=nCWc7C+tnv1jLnnMtwMYw/Nbp52hYYLmv2wi7szgoWAvciUkxKrR0eIJo8lqevoP7q
         H0/dzqMbKVF9hQLYUlHeNKm9DbDsCm/FUw9puP99DJbBqFJ+ALj02MBrb3j6JEFe2xua
         lQAUumKGbqeCUfJ2gzm/lYgZcNN96uYxqUuZ0B1bbhVOm3yi6p+hky5ehbNk8racuuvI
         XNibCig40SuNFjDQwAWON82eqaT2tpFXWCe1WgUOpobXZmYwsqZ7qcy+C22ao2QbXCiV
         ZjT/zm6sRMAszKkAOWm4dpVQNUaUqyRzyxkHk5mxRlxt7UxMeTH8LiTxGQqICzqZAmc8
         R2Ww==
X-Gm-Message-State: AOAM531KTfiIOxJ6tkPtg1QJctyYBfWZyTX9speS0hxUL8oCk5wR7rBX
        C0NY5JabTXfC8snjuKKfYQRrzMLSPdKh
X-Google-Smtp-Source: ABdhPJzDcSXjNz+YkIfCR+PlqAt+rPGWLPKLLQIrDZ52/YW4NUrVZD3RIgSXYkQPeuRufNcoJOB7Nw==
X-Received: by 2002:a17:907:7747:: with SMTP id kx7mr4525224ejc.400.1622130318547;
        Thu, 27 May 2021 08:45:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:18 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/12] dt-bindings: media: rockchip-vpu: add new compatibles
Date:   Thu, 27 May 2021 17:44:45 +0200
Message-Id: <20210527154455.358869-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add compatibles for RK3036, RK3066, RK3188 and RK3228. Also reflect the
changes to the additional clocks for RK3066/RK3188.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - fix order
 - fix indentation
  
 .../bindings/media/rockchip-vpu.yaml          | 33 ++++++++++++++-----
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index c81dbc3e8960..b88172a59de7 100644
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
+          - rockchip,rk3036-vpu
+          - rockchip,rk3066-vpu
+          - rockchip,rk3288-vpu
+          - rockchip,rk3328-vpu
+          - rockchip,rk3399-vpu
+      - items:
+          - const: rockchip,rk3188-vpu
+          - const: rockchip,rk3066-vpu
+      - items:
+          - const: rockchip,rk3228-vpu
+          - const: rockchip,rk3399-vpu
 
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
+          - const: aclk
+          - const: hclk
+      - items:
+          - const: aclk_vdpu
+          - const: hclk_vdpu
+          - const: aclk_vepu
+          - const: hclk_vepu
 
   power-domains:
     maxItems: 1
-- 
2.27.0

