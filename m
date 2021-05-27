Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A633932B0
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbhE0PrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235560AbhE0Pq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:46:57 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA0DC061763;
        Thu, 27 May 2021 08:45:21 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id l1so818511ejb.6;
        Thu, 27 May 2021 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+Q+v8tjGsClifKrRX6YME+wGEX80m4HSKqkKdEmGcE=;
        b=VDF3+TvmtGGen52NbTl7a7Tn+6vQTyJSdl/nx+6URQMR8itcYzsUdbXT8e4NHaTIcX
         rGLfHQ9UwLXeViY1045m5rcBT4piBmKxSMpQUwadM6l7yxp4KWv+HBauA9p3Sc+IZDex
         56h6KAVr9Ec3hCxnJY8i305LVrxL1JGb5OJd/3gKiqyYz1+M2wZzSoaz2vd+AQ2gV33N
         gKTHHNUClGgrTeNcK5voixRN5E5CvSKu9PWXGfFwSP4bOjrp3ZVdnYo0d9PUuR3hmBjU
         wvNHYh5kGWkFUqjdUJyIyapeMYYIw1zupClmY4os/MzISwX5TnUY6ZrHLXLrlmrtLky8
         8iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+Q+v8tjGsClifKrRX6YME+wGEX80m4HSKqkKdEmGcE=;
        b=L9wJREs+rD+Ht6oJ4pDknW0IbAFkDWkh3VScIUpeBaeLL/2vEWPRId61hFi+5FUEnh
         jG0KIR/bDOH9OYtPE8zCiephdijujjKGl/5dA/6y1CEM1c2Sv20u2r2b/hAWoJzD8V/3
         O3wGD+8qvvPJdFYVPJ9AmgBc0XctBY6cRsUo7NSmOK2pJ9aov3uroK4ixt17WikcXg2S
         Iz8J92ZwaW5gnkwawyBCqVh4SQune1IPHslKLg3OGOaeNTzir8VK3t1mV55DKa6RNZfu
         XNNS1GRbfKp4LCPN6433HDobxS7AW5o9Z/0hkAHPXSabtMOWH1bOOhukPNplBPDX+aJA
         MHfg==
X-Gm-Message-State: AOAM530T+Ca6sDqk3yE9AUv2OliBaso95QF/1EOjXD+dOBkOq0oNuu7A
        3WJJpxg6sGEDucH3ttvKqA==
X-Google-Smtp-Source: ABdhPJwAZR48KAJhXbIVNmjuR0dmbAEOT7kiGts3kMqaCThBlmD0MEwO6eTtepn/Dcuq2dYtElhqgQ==
X-Received: by 2002:a17:906:2844:: with SMTP id s4mr4509443ejc.263.1622130320169;
        Thu, 27 May 2021 08:45:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:19 -0700 (PDT)
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
Subject: [PATCH v2 03/12] dt-bindings: media: rockchip-vdec: add RK3228 compatible
Date:   Thu, 27 May 2021 17:44:46 +0200
Message-Id: <20210527154455.358869-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the RK3228 compatible for rockchip-vdec.
Also add the optional assigned-clocks and assigned-clock-rates
properties.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - fix indentation

 .../devicetree/bindings/media/rockchip,vdec.yaml       | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 8d35c327018b..089f11d21b25 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -15,7 +15,11 @@ description: |-
 
 properties:
   compatible:
-    const: rockchip,rk3399-vdec
+    oneOf:
+      - const: rockchip,rk3399-vdec
+      - items:
+          - const: rockchip,rk3228-vdec
+          - const: rockchip,rk3399-vdec
 
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

