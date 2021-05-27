Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EFE3934DF
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 19:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbhE0ReG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 13:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbhE0ReF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 13:34:05 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BCDC061574;
        Thu, 27 May 2021 10:32:31 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id t20so783407qtx.8;
        Thu, 27 May 2021 10:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwyD75rzyb1MrNkWNGANetxR5fjFir6hRju5tqmz7wk=;
        b=t6pshkjXHNlOODqwgFdY8JAJ1pv1C3sGHm8RKZt1HBUNisj3jqWBkvVcR6bBFxJF+5
         aNzZhNz8ngVrDZgk3iGVBR7wLA1AkvH+8iZb6CUaEyoPec+UXjdz5u0CTH40EuVSGwk5
         mCIMB6HsGy2wtG/N1zQCqWENPYoHJ4C4XK1Xx5vPtExd/le1g5IAfMu6vy2hIrgJDkUo
         tDOlNL9zhvVlyTlbJgWGk+FGkR+luLKerx3wNaRdsGNL0Hz7Q8Gd5YDYQQVf64IH+bf8
         UXhaOQNkuxfhQsqo+YM4y1OjM41Iumq1z0o/SDYUT6MnuIZp/nPnrRpkfJXUQrPxlIRn
         B3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwyD75rzyb1MrNkWNGANetxR5fjFir6hRju5tqmz7wk=;
        b=DpP+CgwvEA+GxXS3n3Z62n8+ojVZXhgxEHPf4Tm+mhYmrmG8QH0oYZguGhrGbpAE7j
         El0vWTxC+0hmXetkynXYz9/IpUZzHCUiVuK9TsYQaRr4F9cpvOD0qXlJQQcyqKrNLCXk
         D+JrpqnpspffZ3t25+bvhMscXwt/gKbxWveEw/gLqo7H26a4qic3rz3tUnVRwHsYePhB
         +ktKL8DaLGcdZytcTWSVzxj1osU0+QOq0zpCYlWqJ1cR+4hkZPfYfMoj3P3OVbf17dSr
         L0f5ON85tok8sbBUSeFkW7X49CYmeVO4oA6W3idSGlZ5qQ77GjsYgS3XsKXseQwL3B71
         Dcxw==
X-Gm-Message-State: AOAM533y/+v0WCVDh7icY3uvPBtTdk0gJdU0wTnGDqlta4jTMskDtdZ0
        oc/ycD5EM2jtmaWQLyzyQFs=
X-Google-Smtp-Source: ABdhPJy8TGHNpxugwCUOfNh7IKW8METeHEyGcHLsR1Mkv5mzsb7lNNbUWXYS2CXoyqImW0Hi/9I2XA==
X-Received: by 2002:ac8:5a8f:: with SMTP id c15mr4088636qtc.162.1622136750708;
        Thu, 27 May 2021 10:32:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:a1cb:22e7:5e60:5887])
        by smtp.gmail.com with ESMTPSA id m15sm1715117qtn.47.2021.05.27.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 10:32:30 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, matthew.michilot@gmail.com, tharvey@gateworks.com,
        linux-media@vger.kernel.org, slongerbeam@gmail.com,
        niklas.soderlund@ragnatech.se, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: adv7180: Introduce adv,adv7182-force-bt656-4
Date:   Thu, 27 May 2021 14:32:08 -0300
Message-Id: <20210527173209.3874124-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Captured NTSC video would be out of sync when using the adv7280 with
the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) need to
be configured properly to ensure BT.656-4 compatibility.

Introduce the 'adv,adv7182-force-bt656-4' property to allow the ADV7280
behavior to be consistent with the ADV7180, where BT.656-4 timing
is used.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index bcfd93739b4f..83e47b0c9fa2 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -35,6 +35,11 @@ properties:
   powerdown-gpios:
     maxItems: 1
 
+  adv,adv7182-force-bt656-4:
+    description:
+      Indicates that ADV7182 should output a BT.656-4 compatible stream.
+    type: boolean
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
 
-- 
2.25.1

