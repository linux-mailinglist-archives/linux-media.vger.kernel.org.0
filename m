Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2DEF176107
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 18:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCBRaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 12:30:14 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38397 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgCBRaO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 12:30:14 -0500
Received: by mail-lf1-f66.google.com with SMTP id w22so219786lfk.5;
        Mon, 02 Mar 2020 09:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1QsztcmRjjgnJkOwfQvCXGGMgGg2RrrK0NJ3VxHJW/4=;
        b=fVHwvRCaCsXbRecBGXejJLb9N7iPAYXucEDy9h+xLbtB1kYFM/arTyVHUSdqN49v+k
         mC1SgQidUbZWF3u4Yv9X18OlFPELK5uKQvBvkJ/jZtTVnk2P1BKiOiDV12m6CkFaqXvE
         Og1gOVR40k3rjrYfS8ScMZUM5rW8r+SqJMyPNYzGYOk3BDRd5q+P6Sor0RZfqEr+giQj
         1OIvwm80w+An8IZOC4b7tm0/EeNBOi6RZ6cQL89JOLLKlqGD2da5tZY9ljXJZGAcJs8Y
         PXqS1/mYD7vPk08JC4M/Cpz1LRLAZlXRBH20n0Ys3ZXdFUf/48jaW9bwXu10pX7gNMc6
         HIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1QsztcmRjjgnJkOwfQvCXGGMgGg2RrrK0NJ3VxHJW/4=;
        b=Kxc13uDjxV4DHO6c+M7bGRQYPUN6CYjTAWdeBt0cmqIERmsjYbzgnmuTUMJ9LgK1dr
         wqTDhISS4la8AnMtLtN+4THXI4JE7QO187jpU/X3ukJUXoYEdcsrwLjO1LzA9jAEZujI
         U0HZJmEQcCYeqHEZb/VxL28QxZYjZxyAhel3wL3GQEmcAypvgoiTGM/ENaHWplRVw6zZ
         dNQ0Xp3fe9dXLIcziVtGOpuBC816l9x6k7P3TYgm12IRTwie8+a3u7GUNzT4ZpDhsKex
         trqGPkYzYsUtVMmENisaQRtPggqdxV5L5hjiqMiiXy37yTZvyJ3oPVuS0scezDoJSBUJ
         fNNA==
X-Gm-Message-State: ANhLgQ1quiK65YWsNoBKiGsBrHHyd2pCJumhes9gLBsw0VpTYrS3ASP/
        AquUXC7zpq7mavqE3HPmxpUtSqy2
X-Google-Smtp-Source: ADFU+vu0WpY1vxz5eZrr5DPZTQLOQlXDg86e3wFne7IsFgMqj6l6i7kxQRcftfKXZUNBC0C+UGMWVQ==
X-Received: by 2002:a19:fc18:: with SMTP id a24mr119917lfi.208.1583170212061;
        Mon, 02 Mar 2020 09:30:12 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id e8sm12734113lfc.18.2020.03.02.09.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 09:30:11 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: staging: tegra-vde: Use devm_platform_ioremap_resource_byname()
Date:   Mon,  2 Mar 2020 20:29:04 +0300
Message-Id: <20200302172904.460-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a new devm_platform_ioremap_resource_byname() helper in the
kernel now, which helps to make code cleaner a tad by replacing few
"boilerplate" lines of code with a single line. Let's utilize that
new helper in the VDE driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: Updated commit's message to make it more informative, as was requested
    by Dan Carpenter in the review comment to v1.

 drivers/staging/media/tegra-vde/vde.c | 55 +++++----------------------
 1 file changed, 9 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index e18fd48981da..d3e63512a765 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -949,7 +949,6 @@ static int tegra_vde_runtime_resume(struct device *dev)
 static int tegra_vde_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *regs;
 	struct tegra_vde *vde;
 	int irq, err;
 
@@ -959,75 +958,39 @@ static int tegra_vde_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vde);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sxe");
-	if (!regs)
-		return -ENODEV;
-
-	vde->sxe = devm_ioremap_resource(dev, regs);
+	vde->sxe = devm_platform_ioremap_resource_byname(pdev, "sxe");
 	if (IS_ERR(vde->sxe))
 		return PTR_ERR(vde->sxe);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "bsev");
-	if (!regs)
-		return -ENODEV;
-
-	vde->bsev = devm_ioremap_resource(dev, regs);
+	vde->bsev = devm_platform_ioremap_resource_byname(pdev, "bsev");
 	if (IS_ERR(vde->bsev))
 		return PTR_ERR(vde->bsev);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mbe");
-	if (!regs)
-		return -ENODEV;
-
-	vde->mbe = devm_ioremap_resource(dev, regs);
+	vde->mbe = devm_platform_ioremap_resource_byname(pdev, "mbe");
 	if (IS_ERR(vde->mbe))
 		return PTR_ERR(vde->mbe);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ppe");
-	if (!regs)
-		return -ENODEV;
-
-	vde->ppe = devm_ioremap_resource(dev, regs);
+	vde->ppe = devm_platform_ioremap_resource_byname(pdev, "ppe");
 	if (IS_ERR(vde->ppe))
 		return PTR_ERR(vde->ppe);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mce");
-	if (!regs)
-		return -ENODEV;
-
-	vde->mce = devm_ioremap_resource(dev, regs);
+	vde->mce = devm_platform_ioremap_resource_byname(pdev, "mce");
 	if (IS_ERR(vde->mce))
 		return PTR_ERR(vde->mce);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tfe");
-	if (!regs)
-		return -ENODEV;
-
-	vde->tfe = devm_ioremap_resource(dev, regs);
+	vde->tfe = devm_platform_ioremap_resource_byname(pdev, "tfe");
 	if (IS_ERR(vde->tfe))
 		return PTR_ERR(vde->tfe);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ppb");
-	if (!regs)
-		return -ENODEV;
-
-	vde->ppb = devm_ioremap_resource(dev, regs);
+	vde->ppb = devm_platform_ioremap_resource_byname(pdev, "ppb");
 	if (IS_ERR(vde->ppb))
 		return PTR_ERR(vde->ppb);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vdma");
-	if (!regs)
-		return -ENODEV;
-
-	vde->vdma = devm_ioremap_resource(dev, regs);
+	vde->vdma = devm_platform_ioremap_resource_byname(pdev, "vdma");
 	if (IS_ERR(vde->vdma))
 		return PTR_ERR(vde->vdma);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "frameid");
-	if (!regs)
-		return -ENODEV;
-
-	vde->frameid = devm_ioremap_resource(dev, regs);
+	vde->frameid = devm_platform_ioremap_resource_byname(pdev, "frameid");
 	if (IS_ERR(vde->frameid))
 		return PTR_ERR(vde->frameid);
 
-- 
2.25.1

