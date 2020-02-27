Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D333A17262C
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 19:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbgB0SKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 13:10:05 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43408 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729385AbgB0SKE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 13:10:04 -0500
Received: by mail-lj1-f196.google.com with SMTP id e3so225135lja.10;
        Thu, 27 Feb 2020 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JGTvTC5n1dMFf5hqfM1JJ/BZi1c+ZQ0aixXc9pKVWyk=;
        b=KrJU7X7EIvMKlUEtbUymzld9J6xlBT5wJtUGvAAIKW08mCZFRtSfx8xOROqfuexZjm
         JgzdQMJpcoKGAr9Sz0TRp3hECEd10uyGdfVINUEuFhgyEKnBX9Q9acsGmO0XTXw/D6Y0
         GYZwtvYYoQslELF2RcyKz7DfbPy0XW2QIJ8gF4gokZGJp1fHhMyvKVOyRsERN8IJIVRU
         IHkV/XDshgvI537t6WLPZnMMYSFkLkpFiBmmM8E+LRQmqRD0fDSL4yKDt20D3tRmK3sP
         p4jIXT6QFwM5U/myoCIPV5M3bcSJKp8O/zr3UOuVSQQo+sKXF59tPU52HlPpgGkFPRd2
         4t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JGTvTC5n1dMFf5hqfM1JJ/BZi1c+ZQ0aixXc9pKVWyk=;
        b=PPluVwlod+vuM5zQoqDcZ6Ac4P4qvVDiz8liXdm3d9ap91e7ZVjQvX0y+7jPrauUoH
         sL6sAmeBWHt6xItcHjlevS383rLjqeVFNcN9ybmdUmLPnrIJX2OaWpeJ0EXmA67qOsji
         r6YqFwBv9InOaykGmNUYbO/BxGOgbCD9edJYXdwS9s1bsiFJvQEMbDNJOCnyO9bUCKM+
         hZLHadFfVyBRkexwQwaJRMH90Q8JWnKj+q/tw0zC71Innv/FU214Pj7qu58LWO9djh1n
         hOJQRc0xpLKdxGvu5v8iKrlu8alFmCUg6ykGTnayZWza20xvJKjc831YutEDbbnypC5n
         ZmCw==
X-Gm-Message-State: ANhLgQ0lTz6/58iUOUkT07q2q/zwjr2wBjESAVAf09Me4KQDmYpods0I
        2id7R0OqboTjG0gGdgU89EA=
X-Google-Smtp-Source: ADFU+vt7VurT8NSU0ruym6CjuKGiA65tRemHtqoeZ3SAziIhDR/LByjtv7S5fyvspcm5O9WPA2qWbQ==
X-Received: by 2002:a2e:9748:: with SMTP id f8mr208065ljj.178.1582827002155;
        Thu, 27 Feb 2020 10:10:02 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id t6sm3222170lfe.47.2020.02.27.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 10:10:01 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: staging: tegra-vde: Use devm_platform_ioremap_resource_byname()
Date:   Thu, 27 Feb 2020 21:09:15 +0300
Message-Id: <20200227180915.9541-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This helps to make code cleaner a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
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
2.24.0

