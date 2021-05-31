Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25ECE39599F
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhEaLYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhEaLYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:24:39 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4DBC061574;
        Mon, 31 May 2021 04:22:59 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id c124so6091037qkd.8;
        Mon, 31 May 2021 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QdxY2TSl0gwzlhyshpBXtvrmDyNfej//+830SK0uF3E=;
        b=QB5MyuA0jJGqzpxu+ZEJsVG7xpKGL5beDN4U5l4eceeiKD+gJ6HZXrIbJOVXhmmotX
         DrhcxE2XWIaSnUV9o1UzuJpC/KzPfabOicscs59/h7W/Uemiei5L+/FcqVOLoOln6V7r
         NpFuGN+OQbziaUxKk4774vTVLAL/dV8BVHmx5j2lRok8kLYjYUC9gpDNkpEY9sck4Uox
         TLYpGhuIZDwrtRB+KDd2FkoV/pY4ooECedwGi+PdaGwEOrHuCfpUyUI3Sx/Wgq522hBF
         YQbjmrl1gqWXOYfaWQITmgKYQYMg9vXNZI8XdqdZKs4yXCT2NGKsP7mhG061R5cDfKpC
         E6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QdxY2TSl0gwzlhyshpBXtvrmDyNfej//+830SK0uF3E=;
        b=CBIh5tzJI7D1I6KdqmniBTazm7wC1uZEUMHegXA63HiQ8FnAJkqfOctU7kyYiHbY6X
         wjmADBzvL5uW+zhUxSM44jZLCpXcNOGv8+AeShgTu2FiU5KmYbQlg7NTW3/efhtDc+Ii
         IrqrJB5BFhZwjL9VjbmWETum67wCpu6XV6GTe78elmIL04XT1x+6cXWUdzjcpwIWC63x
         mPDgypjdXIj9ebm81F8rM2mIKhAySxiB+lDi8UqB0DYrhHYasG4hyleWlJFlNUAIMIY5
         7NyCn6QIXAHpdWZj86Xl/3AojoUkePYzyjmmsT5GOR5Hi2VV65+5nnT2+JEzM7sOZuqf
         mRzQ==
X-Gm-Message-State: AOAM532Tqs+rs2z9MMJDsop2EVgOLVk72TBZQNdWDEretBIH0J8xYKYa
        J2+ylo+4kf/pYqKxK0c5n5zDpo6fZ8KRKQ==
X-Google-Smtp-Source: ABdhPJxinxg32/xaSP8/JVn93NBl6Uh3GlIRFfwRr90KhHH2vm8S5vJ2gT/OLy5CkYUrNuaLfFGj7Q==
X-Received: by 2002:ae9:f310:: with SMTP id p16mr15703396qkg.267.1622460178449;
        Mon, 31 May 2021 04:22:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:df45:f91c:ea2e:9334])
        by smtp.gmail.com with ESMTPSA id h5sm9105480qkg.122.2021.05.31.04.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 04:22:58 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        frieder.schrempf@kontron.de, niklas.soderlund@ragnatech.se,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: adv7180: Introduce the 'reset-gpios' property
Date:   Mon, 31 May 2021 08:22:35 -0300
Message-Id: <20210531112237.706063-1-festevam@gmail.com>
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
Changes since v1:
- None

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

