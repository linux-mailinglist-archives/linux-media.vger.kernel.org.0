Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2923A7162
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 23:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhFNVfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 17:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhFNVfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 17:35:14 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0C2C061574;
        Mon, 14 Jun 2021 14:33:01 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id c5so15978714wrq.9;
        Mon, 14 Jun 2021 14:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f9dbK3SPswb07BrEY2/ZXQ/CO+EoTd0xHu/qANk6290=;
        b=hS7+kVbQTZkXh0Ibg/jF964OrrSQRt7JHcsz9U0SsUzMfHBFD+EZNv2+0QsJCdzS9i
         SHQ9CM2JJgGYFeMLqP9UxZWYIcgXex+HUL0H41qLRFb1+GaAs/jOjpw0aYyBMNZZSsi7
         eRfBnknFYLXp4zbxfi87hbSWN2v/hVmu7X85cj9JvbLiiFNvYKaR1SkoDcXeoBTVFQLO
         L2xFcbQOFNH5SgJBEmH5LizFaRzy7BWPo+EH9zqxmXaheKsNi1LF6sT4FLctVPsa5tcc
         +a4Jvskhvi2v3AME/nzMCUd0LRVWMkyK4tqY6nVV5f6ahsFpPlWKI7+ly9oHiPTjrT64
         1bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f9dbK3SPswb07BrEY2/ZXQ/CO+EoTd0xHu/qANk6290=;
        b=Q2EzYJ5AZRDGwsy4YtK4N4EQgoGfaJz/a1ExR9622l++pECNvT9Nk4qbvVCAqyohIG
         qU1PLL1R7EUHZ+Odj3sCPA7IWcjE37cdxI0x35KgbA0nhXHYUjmmTilL+M0/xM0xzSo5
         uJRHBKgcX11AMNR4iD34yUPRVPm1pJrE+2xdCM4kFiZ9h0/7In9MbSNG4qOG76f+0OYD
         FYtf1kMc0W5adOAiuU3EU9xLE+q10/qNQRG99snpE0jUk0+SQOI2MFfm97uyNSe9Usm3
         u16zVt0+r5iEANOdYYa3ZsRNIPTBydS1suQF6adCFnv0tjpznBLgEw9ANrKXvxgKOqPd
         jCWA==
X-Gm-Message-State: AOAM532NdrK3XIV6M3H3pRHLPeFVsLTQOfIx8FlKfMEFrgtkziBHJQKP
        9xlMzW4By0qMHXARPIgLGw==
X-Google-Smtp-Source: ABdhPJy8j9rxtU2OB2Tz33IdEGNoy70idPLjMglYh/VXsO80tQnvFscE3IXc5c3pultVzeR7dYgZFA==
X-Received: by 2002:adf:efc3:: with SMTP id i3mr21013616wrp.356.1623706380111;
        Mon, 14 Jun 2021 14:33:00 -0700 (PDT)
Received: from localhost.localdomain ([91.67.75.139])
        by smtp.googlemail.com with ESMTPSA id g23sm989525wmk.3.2021.06.14.14.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:32:59 -0700 (PDT)
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
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: media: rockchip-vpu: add new compatibles
Date:   Mon, 14 Jun 2021 23:32:10 +0200
Message-Id: <20210614213215.99389-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614213215.99389-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210614213215.99389-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add compatibles for RK3036, RK3066, RK3188 and RK3228. Also reflect the
changes to the additional clocks for RK3066/RK3188.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

 Changes in v3:
 - collect Reviewed-Tag

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

