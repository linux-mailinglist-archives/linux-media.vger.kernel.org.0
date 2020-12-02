Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F361C2CBBC5
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 12:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729742AbgLBLlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 06:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729736AbgLBLlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 06:41:46 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2233C0613CF;
        Wed,  2 Dec 2020 03:41:05 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id b144so803144qkc.13;
        Wed, 02 Dec 2020 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0xMIcHgw4ps2tQXJYXw+Nd9oOY/dH77H1V9h85c9cSQ=;
        b=LTHqXJAsmQMjYIQcb28+VhUahjFyncZkSXOw5RtzshMtQT9QARJmJqj5xD17Puf0GU
         nPtKoXSaO7/6BRq6DWPvENVo7GkAn5GEDc+3ECuRzU6qbKUOyBaQ/1+hXoQILEoIIK4V
         gP2tchdBpfmQXYYyZGiUZXPIX4xQ2dSsyywN46sTGWXzoT2YpQYvy/+5W7eCKpTGiOat
         oX93tW9hVfmjNcJ9aGantMITZjIfU494IsfcrKwAwBSCD+2aoWOQWCV5Z3f78ph+5cMk
         dvSsTQLL1bxOrGBLeUH85wS+E6pWfRMoVe/lX/aNbXKa1v4+cRkJ0g9W0CCx+FYzEYzT
         1jsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0xMIcHgw4ps2tQXJYXw+Nd9oOY/dH77H1V9h85c9cSQ=;
        b=eW8EHtSIt5RulBkijkqgNnNGo1AhUCqbdxameIP2gdNSqq2X1yWa8QcRimz5zuSTa3
         +v9Y5LMFhlrUvzm6E5ozPWvf+vfVNDrJ9oia4kBqhsbYXSbFimTbp50wIlDxz8hjekSF
         mBGT3iKElGYcCsZD2coBZkjBGP1fFzlUZ+gJM8B2lKJYY1zZfJPNjH4TWG8YkxsHOY4W
         QrI5K3I8kH/+TMWEAaChzI+31cgbwDDRSk26m1QOqeQQVgFgEDHvlV9x64p/ic5/Gasc
         8SACGQYyF9U0o/K70BwSEDHDU3tTkGoAPWIO6maOajbykq3mz+t1YO7cFmwXsDe1Zdx/
         ikKw==
X-Gm-Message-State: AOAM531SIJ+S4ZsDdBBsiwuZNZj80NssVtM/ioThCoNClZCSUCNSWmTe
        99uXFePG6nZjuD92geQqhKY=
X-Google-Smtp-Source: ABdhPJyhOBeJuXz6810EZpDb0zifaEJwpqsUnliduaxzYGwWvSOp87G2E41bm/tApoW703ZgtNZOCw==
X-Received: by 2002:a37:4e0f:: with SMTP id c15mr1931922qkb.449.1606909265060;
        Wed, 02 Dec 2020 03:41:05 -0800 (PST)
Received: from localhost.localdomain ([177.194.72.74])
        by smtp.gmail.com with ESMTPSA id g4sm1302480qtu.82.2020.12.02.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 03:41:04 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     p.zabel@pengutronix.de
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] media: coda: Convert the driver to DT-only
Date:   Wed,  2 Dec 2020 08:38:38 -0300
Message-Id: <20201202113838.21621-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
by removing the unused non-DT support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Forgot to Cc linux-media list.
Changes since v1:
- Drop include/linux/platform_data/media/coda.h and pdata - Hans

 drivers/media/platform/coda/coda-common.c | 27 ++---------------------
 include/linux/platform_data/media/coda.h  | 14 ------------
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 include/linux/platform_data/media/coda.h

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index d30eafea701d..995e95272e51 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -25,7 +25,6 @@
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <linux/of.h>
-#include <linux/platform_data/media/coda.h>
 #include <linux/ratelimit.h>
 #include <linux/reset.h>
 
@@ -3102,13 +3101,6 @@ static const struct coda_devtype coda_devdata[] = {
 	},
 };
 
-static const struct platform_device_id coda_platform_ids[] = {
-	{ .name = "coda-imx27", .driver_data = CODA_IMX27 },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(platform, coda_platform_ids);
-
-#ifdef CONFIG_OF
 static const struct of_device_id coda_dt_ids[] = {
 	{ .compatible = "fsl,imx27-vpu", .data = &coda_devdata[CODA_IMX27] },
 	{ .compatible = "fsl,imx51-vpu", .data = &coda_devdata[CODA_IMX51] },
@@ -3118,14 +3110,9 @@ static const struct of_device_id coda_dt_ids[] = {
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, coda_dt_ids);
-#endif
 
 static int coda_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id =
-			of_match_device(of_match_ptr(coda_dt_ids), &pdev->dev);
-	const struct platform_device_id *pdev_id;
-	struct coda_platform_data *pdata = pdev->dev.platform_data;
 	struct device_node *np = pdev->dev.of_node;
 	struct gen_pool *pool;
 	struct coda_dev *dev;
@@ -3135,14 +3122,7 @@ static int coda_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
-	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
-
-	if (of_id)
-		dev->devtype = of_id->data;
-	else if (pdev_id)
-		dev->devtype = &coda_devdata[pdev_id->driver_data];
-	else
-		return -EINVAL;
+	dev->devtype = of_device_get_match_data(&pdev->dev);
 
 	dev->dev = &pdev->dev;
 	dev->clk_per = devm_clk_get(&pdev->dev, "per");
@@ -3200,10 +3180,8 @@ static int coda_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Get IRAM pool from device tree or platform data */
+	/* Get IRAM pool from device tree */
 	pool = of_gen_pool_get(np, "iram", 0);
-	if (!pool && pdata)
-		pool = gen_pool_get(pdata->iram_dev, NULL);
 	if (!pool) {
 		dev_err(&pdev->dev, "iram pool not available\n");
 		return -ENOMEM;
@@ -3342,7 +3320,6 @@ static struct platform_driver coda_driver = {
 		.of_match_table = of_match_ptr(coda_dt_ids),
 		.pm	= &coda_pm_ops,
 	},
-	.id_table = coda_platform_ids,
 };
 
 module_platform_driver(coda_driver);
diff --git a/include/linux/platform_data/media/coda.h b/include/linux/platform_data/media/coda.h
deleted file mode 100644
index 293b61b60c9d..000000000000
--- a/include/linux/platform_data/media/coda.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2013 Philipp Zabel, Pengutronix
- */
-#ifndef PLATFORM_CODA_H
-#define PLATFORM_CODA_H
-
-struct device;
-
-struct coda_platform_data {
-	struct device *iram_dev;
-};
-
-#endif
-- 
2.17.1

