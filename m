Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C26C3932AA
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235184AbhE0Pq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235597AbhE0Pqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:46:53 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29BEC061760;
        Thu, 27 May 2021 08:45:16 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id a25so1365860edr.12;
        Thu, 27 May 2021 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H3e6CRdd0/EdKHGPL7BtIypEry6FkjdG9zyNOFKlRZY=;
        b=Zq414ODqOuxOqan5cRLla7EM1a09egGEdX54QCzdpcjPVdmU8GchM0oU1+D15vQJct
         iOAhZd3Rbqm9eCvq+lpewz3d0Kne2pSy2MCq+e3vUDLrzYbnOUYwHMblhoqTapYzRFm7
         FTIDWJ/wf3lMmlQ0SynMhFCTAAc2EHIBi9U7FXMBtEZ6BfMKrgiVdF5CZ0TyRPtLMS8I
         mKg4GmsFUI3rjf7z/18m8ENQ4hkfp0yOZyTQzAsMLa64Ip2FRe9IF/Z7wujDpWElomzM
         dv4u770vt+5zBzxgBC5o1bnoeVIO9Q/2PM4hsJv0bgWtkdNFeokOqnhL2XfHxw8lqJHe
         C25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H3e6CRdd0/EdKHGPL7BtIypEry6FkjdG9zyNOFKlRZY=;
        b=h7Od0U0MGGSFJtVVtaC5ESnjcSGTRvo0YGb2pSoTHQaxiySa1+LBags35lmpvSjHan
         /r2gytzZxOpkXMXgZ8KUKlds4XVWPn3uHgIiE1EAxJM+Up7regE4ysYtjCH26BecO2nt
         TvQcZFi76vjjEgEAjBBOGLqp04tXy3XKiMXG+bAYRhvoQes1tMgjZgtzImTZSQTBdSiT
         XHKofm9C51DhxybGZtHsynYtlzGqq2fJEGt6nSnfNDAP0EyMJ7EOtGq1AkZM1aL59WEP
         SBCfhrEc4jQ1kJxHj7IsKJ+7hNX1ed/wZdIsaD7kyyCReEMfavDUnAl4sB1RrrCFNZ4g
         SW5g==
X-Gm-Message-State: AOAM530bXDEuG7BPbOQTMlYrvnZ9OGaCSFb3jdKeMmUM5jHobjByoUZV
        RmdHoiA5bn0gMD7rn2yNOA==
X-Google-Smtp-Source: ABdhPJwWqRVBxukUfKDrH5kauhHqoAn2Igk5q1H89Q/2gzsKpczlUnRw6MdN4rCCTg6RzBydH6gacQ==
X-Received: by 2002:a05:6402:290:: with SMTP id l16mr1577478edv.186.1622130315457;
        Thu, 27 May 2021 08:45:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:14 -0700 (PDT)
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
Subject: [PATCH v2 01/12] dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
Date:   Thu, 27 May 2021 17:44:44 +0200
Message-Id: <20210527154455.358869-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document Rockchip RK3036/RK3228 qos compatibles

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

 Changes in v2:
 - collect Reviewed tag

 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index f14ae6da0068..ad1121620e15 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -45,7 +45,9 @@ properties:
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
               - rockchip,px30-qos
+              - rockchip,rk3036-qos
               - rockchip,rk3066-qos
+              - rockchip,rk3228-qos
               - rockchip,rk3288-qos
               - rockchip,rk3399-qos
               - samsung,exynos3-sysreg
-- 
2.27.0

