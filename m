Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683BB4016AE
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 09:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239597AbhIFHBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 03:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238906AbhIFHB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 03:01:28 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB4FC061575;
        Mon,  6 Sep 2021 00:00:22 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 8so5830511pga.7;
        Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mx3nDhHb+cYhtgK78HeCOT8qRwLpEWC5Qetf1O8Tuw8=;
        b=iyGJFiG+erqh1x40HUTRMuDlfwZEmK40x94VbarencMHIO8m9WEtig5OPGoAdqwkN8
         Bw23SEFku3SVufdK+WF1Fyt0iQc3VGBl6K1jmxDjCfQIQNsM0++7Y5ibbSMS/LFN6g7V
         9VfGiV1ZldsC1mOTFW7/GhqjfrB8daaHlY1icR9YL083R7rsxiFO10fvCBWQ8I5h6xrW
         4PYplxoJExPZ0+hVgk0w7F5Dcpx+5v47y7V1pAsi2B3YtOgsMll1JmoKKLXh1W31Ih6y
         R8x2Sf0Xzf22tI0AXzT21DgsaenRy1BxPjcsMdJ2gaYDJ+fIdUl1kxG1Z4rkg5RiC6XQ
         s3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mx3nDhHb+cYhtgK78HeCOT8qRwLpEWC5Qetf1O8Tuw8=;
        b=WJ8rWSDJJ2+8hQRlO75sMMm67AwPDFFByoGUsP6G9W4pUNLDovqr9+did+3EfY+1C/
         a/tz5ipi1N1yGA+DZJx7RXXcc7O7+ncu9kXOBHqDfoyV4nx8D/BQD7XGHMygEKe5/4aR
         nPs84TaCMUOU+BRv4nMPTfxPv6s6FGYcZhfROcoWkFCX2qdmdFv9DKZ7PfU73R2VLuQF
         sn2a4lISeKIiO87pdAwvsd2ZKAFbkpTWiPDx4Vw9LDI0OjLCc9sf9RVhbH8MQZY/ZPu+
         hY6QJYvetzK4PnDhXj6C6IoSYFos0mdMOcH7geatqjoHXiic1QAhNGpPCkP3JQ20OG1Z
         BeeA==
X-Gm-Message-State: AOAM533cn4APp9w6AHVGopPbLzScx5WndBcEMSU/jMbp3GtUudLpHdsl
        lbhNQtIJ4iyvocfOuH/+HeE=
X-Google-Smtp-Source: ABdhPJxTmLde5whEnuajU/+gqaTHbvSiU5HaX7lFpiYl9/hN/9S/fhqzrXjRd8CamopoFbVVB44d3A==
X-Received: by 2002:a62:3342:0:b029:3b7:6395:a93 with SMTP id z63-20020a6233420000b02903b763950a93mr10627850pfz.71.1630911622352;
        Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
Received: from localhost.localdomain ([124.126.19.250])
        by smtp.gmail.com with ESMTPSA id u21sm8045403pgk.57.2021.09.06.00.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
From:   zhaoxiao <long870912@gmail.com>
To:     mchehab@kernel.org, khilman@baylibre.com
Cc:     narmstrong@baylibre.com, gregkh@linuxfoundation.org,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        zhaoxiao <long870912@gmail.com>
Subject: [PATCH] Media: meson: vdec: Use devm_platform_ioremap_resource_byname()
Date:   Mon,  6 Sep 2021 15:00:13 +0800
Message-Id: <20210906070013.7362-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: zhaoxiao <long870912@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index e51d69c4729d..8549d95be0f2 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -994,7 +994,6 @@ static int vdec_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct video_device *vdev;
 	struct amvdec_core *core;
-	struct resource *r;
 	const struct of_device_id *of_id;
 	int irq;
 	int ret;
@@ -1006,13 +1005,11 @@ static int vdec_probe(struct platform_device *pdev)
 	core->dev = dev;
 	platform_set_drvdata(pdev, core);
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
-	core->dos_base = devm_ioremap_resource(dev, r);
+	core->dos_base = devm_platform_ioremap_resource_byname(pdev, "dos");
 	if (IS_ERR(core->dos_base))
 		return PTR_ERR(core->dos_base);
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
-	core->esparser_base = devm_ioremap_resource(dev, r);
+	core->esparser_base = devm_platform_ioremap_resource_byname(pdev, "esparser");
 	if (IS_ERR(core->esparser_base))
 		return PTR_ERR(core->esparser_base);
 
-- 
2.20.1

