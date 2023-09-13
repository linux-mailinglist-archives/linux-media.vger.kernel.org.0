Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30E3479F23C
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 21:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbjIMTjv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 15:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjIMTju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 15:39:50 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C215991;
        Wed, 13 Sep 2023 12:39:46 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-57328758a72so47393eaf.1;
        Wed, 13 Sep 2023 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694633986; x=1695238786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8D/pgNTc3BVf0DHz0XjJjKwO6Jo6hWT4KdmFPdaZck=;
        b=g6nxSri39nxJbWJkt3KHU9F+AdYMkQ4uk973ngebXsYfJUQN4ExR5B8O5++/80Zqjh
         1ScdRLhP7pLDsy65AlBvJTaR2s9xA2kckU9ltiAWXATQA07lY8rCeUff0du+dTd3iUEt
         VuzPoeFyhyY8SaWolWfYQTiran66A0TM4aSrgRbUI1U/DZ6qLVBjRKHIpZ5Ap/k+VR+k
         RiYFiJaF7U8wWZTHkWU1xzLnvJMl8Z1y8r623bfAEnBcQhUyh8EF+d2bMzXSee7RkSRe
         QJ56fDpeTc8J8Sm4dBCxDMACOkUclNmrs170Krk0S+uwARa+O9jh36I6mNWWRJOra9fn
         90gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694633986; x=1695238786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8D/pgNTc3BVf0DHz0XjJjKwO6Jo6hWT4KdmFPdaZck=;
        b=TKSPvZcCJe6HC9T/qPB0tAOJsBZ75WnPYoHa14le7REgY+Qk2cTmBWcJwKAZXgASi/
         4QI2zGMi0FDuBiQo/4SKebD2iPkUNPrNdXAarzHMIZ39sd9XIswfSl8JOVuDrtwzi8Ol
         2nM4GhTbz0sLTRYd0IIE86eERoCvPkWWHuPPDD63PKCynli/eOH4Rpux/etUJXfl/y8J
         GzZB2nnzArX/tGZjl92doNsKSZE5XttYhHbS0b5H7n6y0eKHIPBFyYKdm7WW5i5hlGdY
         dMNHi0YNPXoX18R2V/FfrCPGl5sy46Ekr6ktMgkGeziE5Jfj631CoGaSW7WP98AS7q3j
         Oclw==
X-Gm-Message-State: AOJu0Yx2bPt/9ZMVsUK7Nv6T0OWeMK08/KSsNwg+B2KoN2IU1AcgiIdl
        O/AFH+fjVs1vgpk5oXjdJJtwwmYDcGw=
X-Google-Smtp-Source: AGHT+IGPZx5X9XfuxLEd5//+B+akMLWBFq7kSqsyIXLcFsB6hG1mKrCyTEVq6199eRqXzFYGsavl+w==
X-Received: by 2002:a05:6830:6a1a:b0:6bc:a6d0:ab7 with SMTP id cz26-20020a0568306a1a00b006bca6d00ab7mr3431819otb.3.1694633985964;
        Wed, 13 Sep 2023 12:39:45 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1764:d532:27a2:10a0])
        by smtp.gmail.com with ESMTPSA id q21-20020a05683022d500b006bee51de9f6sm2059otc.18.2023.09.13.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 12:39:45 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sakari.ailus@iki.fi
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH] media: dt-bindings: ovti,ov772x: Make powerdown-gpios active-high
Date:   Wed, 13 Sep 2023 16:39:32 -0300
Message-Id: <20230913193932.1947918-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

The powerdown-gpios description mentions:

"Reference to the GPIO connected to the PWDN pin which is active high."

Improve the example by making powerdown-gpios active-high for consistency.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index 5d24edba8f99..5aec65b053af 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -114,7 +114,7 @@ examples:
             compatible = "ovti,ov7725";
             reg = <0x21>;
             reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
-            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
+            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_HIGH>;
             clocks = <&xclk>;
 
             port {
-- 
2.34.1

