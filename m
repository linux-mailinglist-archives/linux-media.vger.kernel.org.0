Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C5036316
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 20:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfFESFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 14:05:49 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33430 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfFESFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 14:05:49 -0400
Received: by mail-qt1-f195.google.com with SMTP id 14so19101116qtf.0
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=flExMvfdSgH397GdI5FfZDyCl6NNrZuRE0/G3baXato=;
        b=ZkEFg9v5oi5T1ZdS8Cf6lyaDKEi1z14+2iJKmWQRrozAMnViyCGW3UUDTCUXk+hMgu
         jFDBodfkS+dnum4XzBgrsI+H7h3rxwDu0VH3pFi2fXoN4BwoYhJZ0YfmCY/hytBNW/gf
         ngQ+YWlnc4YVJrsKoC4jUUuxXbwFbUL2lcye2ohl6tDngLPsjFV3zDqvmQtRwaAgMJOi
         EwL9PoV/DhCungD/u4iHTt7DbR51BBENg3zHWMfB4wX5lH50PJ7aw9POQ8N0NDHMauXg
         WR0IeMmNQJxh+Cwp6TZvXwcoM76ZIRG5viAjy9IJ4rLpIeBSV+2l15IFqIiJoXxnn7l6
         yVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=flExMvfdSgH397GdI5FfZDyCl6NNrZuRE0/G3baXato=;
        b=WVOGYjTQqH0p+2Wivgi/3ITKG1+kYHcv/JygBVcg8lDDFrRwtmQLrRZ9RxmMOhCN5G
         l6q/iE++6rtr7BX9WQnt8EiCgbUo2uMHEpQ5EJ+qIbsGBwtUud7fmdlXobgY/J8F9B7D
         lbNQJFdTNkfMpvzPj0kpKg0hoeftSaP087+ejWc4A/L1tDlQDuyvet/OOZsdyMGOrhPW
         PRDfLlQTy3j2EE2K7gTgaWjSzW7ElIo9/obwrOahkvCFPjTKPQY1erqS3n0tGrYTdaDZ
         JtJWGPIZ29oV0+prZofWmoIvCoYZn9Kc6sdDiymjf8OcVwH9rGiwEA/gM1Np06oa7s+Q
         fDIg==
X-Gm-Message-State: APjAAAVntMWWrZ1gb8HIp0beiGRajnBEpoPczaB04bQN1bUGsnvMDYw3
        gGzG37LeyTb6HGiSxs+re5g=
X-Google-Smtp-Source: APXvYqwp07qvjdf28t7UAqfUFp7Hc6BCBdqzMBJ5fSfMzyMIJ2vlPl9ofEKeAp0fZrdMB8EOL07UhQ==
X-Received: by 2002:ac8:34f4:: with SMTP id x49mr30265981qtb.95.1559757948451;
        Wed, 05 Jun 2019 11:05:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id j26sm13819973qtj.70.2019.06.05.11.05.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 11:05:47 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     p.zabel@pengutronix.de
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: coda: Use devm_platform_ioremap_resource()
Date:   Wed,  5 Jun 2019 15:05:43 -0300
Message-Id: <20190605180543.8776-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/platform/coda/coda-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 751b0be1c2ea..de64040dad8a 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2814,7 +2814,6 @@ static int coda_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct gen_pool *pool;
 	struct coda_dev *dev;
-	struct resource *res;
 	int ret, irq;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -2846,8 +2845,7 @@ static int coda_probe(struct platform_device *pdev)
 	}
 
 	/* Get  memory for physical registers */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->regs_base = devm_ioremap_resource(&pdev->dev, res);
+	dev->regs_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->regs_base))
 		return PTR_ERR(dev->regs_base);
 
-- 
2.17.1

