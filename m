Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F31B2CBF5A
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730270AbgLBOQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730230AbgLBOQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 09:16:27 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B633C0613D4;
        Wed,  2 Dec 2020 06:15:41 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id d5so1081762qtn.0;
        Wed, 02 Dec 2020 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JO5G/IkG6GgPh3ghyr43j2FVouwU32gJN/Z35d3g1/g=;
        b=ocw9Po0rQLS9w8cOPfIUJoA23zi1yY7lunB+qRmwbjj7zkJdWBXpZ4kvTNPvOBG5Ec
         Ko4TTJzA7A0bK/yHbHdSdO+ouwlZITLm+jg+ZO+g+UNF1p3iH8UITqiiIvg60g18l0aH
         02evKYq0oAspTBNH1NDcIxW01L2pB4x6Gb2JPnMqu7HODb0xp0/uQsE+cFUi8/5RRDVe
         C2vMAAJvb+BS1O9SPuNwPu/R1pUNhcaOcHLLmJc2W8vMRWOu6Awk1I5lWwo6wkZ7T2rm
         XdkkQpNF5qhQ49WTjbg0tlfkFWdwc24McHt/xqW8jB3x6/Xsf6fwcW7PW2uKnHkyKqeq
         ublQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JO5G/IkG6GgPh3ghyr43j2FVouwU32gJN/Z35d3g1/g=;
        b=P72XkkUwRCS/SOCw51UOkxa0Wf4FW1/jqpUONewBgWFRbIXYLEZJPtrp5DEdK95HU5
         FwAmxZZHslwhEjv6dzpBBpgoJ1lhi5lLytOfTs7azOVs3OgHmVyvULC4EueaLuoM7bUq
         bClgY39NfdOxRn4enY+Ny5tVmynAE/pAAk9LIlmH9AenbNh3mVjyBjb/osHdN2foyQo8
         hA9XDHzy9hIxfLo5J10T6e/J5OSfsmAz28CdxmaKGJd/FT2C6H/mDawn4VHr1Mo/fvaR
         QTZI0Ys7CTzIuWpLXYAd87hLWPYG9StSaUq+jJvmHL0X9+XYpOR2cnnd2GQWMr4+Yuw+
         IGdA==
X-Gm-Message-State: AOAM530uHxabXHJGeil6XbBuc5AL43cxRI3+h2TdYw3BFqyUsW2/w4LA
        1ojq1+qmcgg1Kzdz7/shVGA=
X-Google-Smtp-Source: ABdhPJy8By0l+UMxGhj61GjcBko/xRKvQNeNOtG5KwPxxHHneaQG6eE5WQZtdwGQn4R6UygG4L80Fg==
X-Received: by 2002:ac8:120c:: with SMTP id x12mr2749121qti.1.1606918540477;
        Wed, 02 Dec 2020 06:15:40 -0800 (PST)
Received: from localhost.localdomain ([177.194.72.74])
        by smtp.gmail.com with ESMTPSA id v5sm1671168qkf.133.2020.12.02.06.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 06:15:39 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     p.zabel@pengutronix.de
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, andy.shevchenko@gmail.com,
        linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4] media: coda: Convert the driver to DT-only
Date:   Wed,  2 Dec 2020 11:13:26 -0300
Message-Id: <20201202141326.32645-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
by removing the unused non-DT support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v3:
- Add a explicit OF dependency - Andy

 drivers/media/platform/Kconfig            |  2 +-
 drivers/media/platform/coda/coda-common.c | 27 ++---------------------
 include/linux/platform_data/media/coda.h  | 14 ------------
 3 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 include/linux/platform_data/media/coda.h

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index ffffef2267f4..9fdbfea06087 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -201,7 +201,7 @@ if V4L_MEM2MEM_DRIVERS
 
 config VIDEO_CODA
 	tristate "Chips&Media Coda multi-standard codec IP"
-	depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_MXC || COMPILE_TEST)
+	depends on VIDEO_DEV && VIDEO_V4L2 && OF && (ARCH_MXC || COMPILE_TEST)
 	select SRAM
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
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

