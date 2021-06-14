Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178963A716B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 23:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhFNVgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 17:36:15 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:56174 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhFNVgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 17:36:14 -0400
Received: by mail-wm1-f50.google.com with SMTP id c84so167721wme.5;
        Mon, 14 Jun 2021 14:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9QHnLBSn4mcNqMxp8QVF3Qao55O3wZp9sNKhBopLdHs=;
        b=osePZG2TUPhPjy+s1iiijkxLLEkZQDWQjQk3reRkWhpjRfTx+hRIBf4JHnt9Vc0Kzb
         wCfmCry582cOJfxH8a2eACcxFDBYdanogP+mq9FNP6MrM32YXpt8IsmH5SJUrT9Z7NxA
         XDeK0ja7TSPLPEixDccyb9vyPmIz/Smm4goVTLzcvE0cBwYgQUh7nnN4HAKszH86nzRX
         akOTGPqnDeF1tLB64frtcmwtRUpQ497jCp+n90XDHpisQFirRu0v0RAtRmOnwjI0qV8I
         3xektr/s5h0n2IfIKHP099c9w+SXPBBVjjMHfOXZPC91+X799YByM5Pdd7p3x6tGCcU0
         Oo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9QHnLBSn4mcNqMxp8QVF3Qao55O3wZp9sNKhBopLdHs=;
        b=QR5ywnxTFCbGf76fjE/J+AoU5YS0ocqZ0xDshg8DTSGAwGKRvHvBRFjsUcY7i3D1UM
         wrdcDU7vg17LDsISvs3RxNeUxB7AaGUJvpjGeJ1Rujayd3AKlX7pm1bTeP2WxOEYFgDJ
         G58jqqnIqBiO2AOdaElv9FO0QI6pHlyW46TKLM/wZ3wUH++rcPTdt6MtRFVBkQDeWxiK
         SS5m/D/tuORkozd7uhV6sxvv7+umO0/VkAqK/a4/8Ixgby3PV3RUtru2SX5Qexu7fh6n
         qoQCu5gh+QR/tglkYopDR6lnCXcGjk9N1RKHyU7sWsBgDyeE5P/d+WPMGicbAZMy3PoX
         ebWQ==
X-Gm-Message-State: AOAM530MKGEBzmgdPLuaJ2aRZ8iHl05TfoE2VXQVDOtHhzRRW1sDqxvd
        ATAqpGGwMerQmkQxIEiqBA==
X-Google-Smtp-Source: ABdhPJyzUezQM2+VdSftiiyJ+qyD+KiSsxxLfOzjfe4ZfZLJuIa9FcvsPSKS8TDgExbBV2uit3eRzg==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr19097080wmh.84.1623706390660;
        Mon, 14 Jun 2021 14:33:10 -0700 (PDT)
Received: from localhost.localdomain ([91.67.75.139])
        by smtp.googlemail.com with ESMTPSA id g23sm989525wmk.3.2021.06.14.14.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:33:10 -0700 (PDT)
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
Subject: [PATCH v3 2/6] dt-bindings: media: rockchip-vdec: add RK3228 compatible
Date:   Mon, 14 Jun 2021 23:32:11 +0200
Message-Id: <20210614213215.99389-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614213215.99389-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210614213215.99389-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the RK3228 compatible for rockchip-vdec.
Also add the optional assigned-clocks and assigned-clock-rates
properties.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

 Changes in v3:
 - collect Reviewed-tag

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

