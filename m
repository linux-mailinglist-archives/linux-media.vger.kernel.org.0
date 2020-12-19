Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616BB2DEE8A
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 12:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgLSL1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 06:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgLSL1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 06:27:42 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15900C0617B0;
        Sat, 19 Dec 2020 03:27:02 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id x16so6945108ejj.7;
        Sat, 19 Dec 2020 03:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=w7bfMZw3OlzVmdxPUhFwa+L05rVOJFwc17cC0KrbB70=;
        b=F9RtDOYXu0jJz54KjSoV1lnH2k/gT7gWse7vPCb66cSSJNaMIXUyTuWKtiRZl7/U3t
         6YRBwFwZLfyDqg3xraL55Q4kDFhNWIGvNRns7TMl+K8YXoQsCVBQt7rTi/3ncugYtWrx
         b0M0akUOlAjaukWeZn6Nk4i67DzZcm5xTcUDkn2QFZ0hwQYqmCtKM8lfKHlv9t4i35jc
         TE6IPU+JcWrOLPeooudYVq1cm+kxxmRkotT0D7JDqm5Ac2XvWp71HjoYzXX4+ja0Mp9s
         16HXh25Uy13BdxjM67wa1sB1C6ck0lu+mlUWSdhC6e7z1EzBgILMZtfCtFSPv0khHVap
         6Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w7bfMZw3OlzVmdxPUhFwa+L05rVOJFwc17cC0KrbB70=;
        b=ZVMBOX/EEhgWdm9OJVXs7RxV5VUHQZhswKcvZ+IRUVNeLzGxgz3Kl14dAf2c8zZBbd
         yDrj6ZJwHmVqLpq1U/e+eiEjxZMLlTwJJwooqZKnKkNE3yCrATJDESvPs9sUB0VYjOKk
         XF+WwSjl5mNC9RmVIXZpEQEiQIQTIcvKlJXgpxzgdXQnTQxlYlzkBMzHNfws4l9RPE5G
         eBuPuXGGqsA0A89l6xCTEh+Rs0ZGrKR4zYK1c4vIcKqlnIUlGDZ3AQfyQaBQFKblKpc0
         3sD1kiQNXTrFaJeQu+W921euvuwNl5dTkfrZDWK8jV7KVztY4+ylOLSmzGuss6wrP1+A
         ocGQ==
X-Gm-Message-State: AOAM532A2nonrtHoxqv5TL95n2R7BOjzbrzBwbQTyqJyGFC8Xy3hP5sK
        FUzwjkklLZ6Rf5pMna7VO6E=
X-Google-Smtp-Source: ABdhPJxTO3GxjEeEfGLDh17vpE4kocndXhPi43Oo7WFCNnSItdhXmIQN6UWABtBYcBAG6gkhp4x4pg==
X-Received: by 2002:a17:907:6e6:: with SMTP id yh6mr8197457ejb.512.1608377220767;
        Sat, 19 Dec 2020 03:27:00 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id n17sm6651785ejh.49.2020.12.19.03.26.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Dec 2020 03:27:00 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, mchehab@kernel.org, jacob-chen@iotwrt.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/4] media: dt-bindings: rockchip-rga: add more rga compatible properties
Date:   Sat, 19 Dec 2020 12:26:50 +0100
Message-Id: <20201219112653.10705-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add more rga compatible properties.

"rockchip,px30-rga", "rockchip,rk3288-rga"
"rockchip,rk3328-rga", "rockchip,rk3288-rga"
"rockchip,rk3368-rga", "rockchip,rk3288-rga"

make ARCH=arm64 dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-rga.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip-rga.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
index dd645ddcc..a609b63bb 100644
--- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
@@ -21,7 +21,11 @@ properties:
       - const: rockchip,rk3288-rga
       - const: rockchip,rk3399-rga
       - items:
-          - const: rockchip,rk3228-rga
+          - enum:
+              - rockchip,px30-rga
+              - rockchip,rk3228-rga
+              - rockchip,rk3328-rga
+              - rockchip,rk3368-rga
           - const: rockchip,rk3288-rga
 
   reg:
-- 
2.11.0

