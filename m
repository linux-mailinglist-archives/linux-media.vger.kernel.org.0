Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01D83952E1
	for <lists+linux-media@lfdr.de>; Sun, 30 May 2021 22:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhE3UqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 16:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhE3UqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 16:46:16 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5066AC061574;
        Sun, 30 May 2021 13:44:38 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id k19so6682985qta.2;
        Sun, 30 May 2021 13:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQuLdzF/GeC8fi6lsIXUBhkIwnI4byxBee++wZ1+mZ0=;
        b=tBj4xHbprXC899hu5uK8xS1ah3CUV0tIYjvbnPya+N3a1VZvQsZdpRzpBrbNI/4app
         PvveuCAycTIJa4p3p6o5SxBCsiEEukJYO8lVO9Ys+EBnu3oQSn8vPEbUgT8WIq+jhGgV
         FrHttgXtQp/jj5Cfx+8KojSQbUzh/WqdZIG4kHRuDE9B5h3RG0EnncCLjy2gXcRRqo4I
         nfXW2NSfii6tsnr5selfN1eH6MTVTR3jzxMsk7DnB/WgcC+U7GPG+N969xO/hJZMrF79
         jvcY1MR9GLzdqk6/+5xRVOp++Un1wYZ6urNmORLF4dlVvBGalR2/ZmnA5Oo0F64/oXpd
         Q+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQuLdzF/GeC8fi6lsIXUBhkIwnI4byxBee++wZ1+mZ0=;
        b=fpHwXTZc8CctlFKA/HfIayaU1lBMwdApofG22MKOMyqYYTBhoIP7/VkK2oZRM5DEjM
         i0ANVa8uQAWXyq71NV3aRFYsuDTL8+j2IGDZ/avF7nTaEWF3KVtA7bfYitk+oBPSUZ7H
         chcS3XZO42RYYOxpl88v6ljTB000jIiVBh0R5YnovHB72QS75mCVEMb+Hr4dWPYRwh3O
         o6BTw2XPIKHX1uvAGs/8UGCqtktz/IaGoaziNmO7oRdZPS4wIpUi9VbXlx3fv7iZJUyf
         2loWyTwSQauhfFKJzJSyos2EfS7XCOpcD9ZC3yLQIlO30my2kssHKji7476ijIW0qNQA
         wfKg==
X-Gm-Message-State: AOAM5321KBwBww/SdD/HB6RHQEXQJ48SPLf3z3BxBnLGs1p25kHF2aR6
        8u3hHK6YsW1/p+2vMwGt7aQ=
X-Google-Smtp-Source: ABdhPJydf2i98PwZj/Q55xvkS6r/N78cfxlfuHSz1WBDS2zOonM0t1L9R+OBsUxMuanr8p3nVkqOnw==
X-Received: by 2002:a05:622a:89:: with SMTP id o9mr12011224qtw.339.1622407477499;
        Sun, 30 May 2021 13:44:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:3dc6:a286:1b00:8f0a])
        by smtp.gmail.com with ESMTPSA id m14sm7192666qti.12.2021.05.30.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 13:44:36 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        frieder.schrempf@kontron.de, niklas.soderlund@ragnatech.se,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] dt-bindings: adv7180: Introduce the 'reset-gpios' property
Date:   Sun, 30 May 2021 17:44:08 -0300
Message-Id: <20210530204410.676831-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce the 'reset-gpios' property to describe the GPIO that connects
to the ADV7180 reset pin.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index bcfd93739b4f..1f1aa46f5724 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -35,6 +35,9 @@ properties:
   powerdown-gpios:
     maxItems: 1
 
+  reset-gpios:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
 
-- 
2.25.1

