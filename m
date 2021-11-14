Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B24B44FC2F
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234737AbhKNW1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbhKNW1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:27:17 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F50C0613B9;
        Sun, 14 Nov 2021 14:24:20 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id n12so28654661lfe.1;
        Sun, 14 Nov 2021 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OEY8Nv/ShgRU0be328a4aBs0udunklwNBMGijdPI63A=;
        b=cOgM5FYoqjFqOnpJE/4mVM0ZcNneFPxHhFY8ye/Nl3FL4D0U4Rt5EiQrhI8KlAp1zn
         4jLPgILJnHxHvKaB9GqRpjnuhmFbiRONmmu0ZNR5K3GZtBy+e9x1qvy4nwQ/6cLcqeo0
         k57SD88+ypVfGKq3wyQPPKeeXSH7B01b3h5G6GbhMJ5LOE0856ILNHLLtj4eMVT2rnCg
         F795q1L9ZN8UhSgkMAOR2LnU9ROgbOEzwQJCqWeeKYq5xyOGZVEecliRXGMCTxKRrAas
         cUp1Ve4YHpKiG2GXpZ5qX6UUQqg4Myh8r7lHnivGAlKbiUjums1EItKPqzbZQceW4DBb
         NUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OEY8Nv/ShgRU0be328a4aBs0udunklwNBMGijdPI63A=;
        b=BmKlOo9WsohQ29bM9IS8QNCdPg1jTsQeijRegjgIBvUiZCcyZuM68dSG30HcBOvEJB
         4k7NwGZQfkp/x5aH8UQP3A6klk4/q8yYZqExyCcSbJig0bhBEpE83o4YqSHRYSxRRVbM
         9Yy5ruLpFhGRmAXGtFVMWw7W4HzaWBshqKB7NnV5IR1hVrsQuKVvAD2KdEUR8LzJiuoJ
         ptZtcniMwOA3N/iES+mJGNLV60DlqnSlnfCPsXgbF+ahFyhfKSSLbqCBQ7AmqNm5UmSl
         TjA/fcy+HKYC/bd96fL/rByJilUigkx0Ln7MJCevUZgNXtXd+/TsiH8uwdGxFWoN5AWk
         TJ2w==
X-Gm-Message-State: AOAM533kxd813asTwKEKOIIvvfHVIyA/bf9QNA7royybi3uo9sUV5+N/
        HvipUUep7EczaAD/fw6Nikc=
X-Google-Smtp-Source: ABdhPJzW0nxDlZoObnVzlzn9JAha6ommfx0LkvsUcTy9htb9etg78w3p+CGJ7a5ztElCsuaTlpOO/w==
X-Received: by 2002:a05:6512:2289:: with SMTP id f9mr19798702lfu.619.1636928658479;
        Sun, 14 Nov 2021 14:24:18 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d6sm1223339lfi.52.2021.11.14.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:24:18 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] media: staging: tegra-vde: Reorder misc device registration
Date:   Mon, 15 Nov 2021 01:23:53 +0300
Message-Id: <20211114222353.22435-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114222353.22435-1-digetx@gmail.com>
References: <20211114222353.22435-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Register misc device in the end of driver's probing since device should
become visible to userspace once driver is fully prepared. Do the opposite
in case of driver removal. This is a minor improvement that doesn't solve
any problem, but makes code more consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index ba7ef280423b..404d963690c5 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1189,12 +1189,6 @@ static int tegra_vde_probe(struct platform_device *pdev)
 		goto err_gen_free;
 	}
 
-	err = misc_register(&vde->miscdev);
-	if (err) {
-		dev_err(dev, "Failed to register misc device: %d\n", err);
-		goto err_deinit_iommu;
-	}
-
 	pm_runtime_enable(dev);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 300);
@@ -1216,15 +1210,20 @@ static int tegra_vde_probe(struct platform_device *pdev)
 		goto err_pm_runtime;
 	}
 
+	err = misc_register(&vde->miscdev);
+	if (err) {
+		dev_err(dev, "Failed to register misc device: %d\n", err);
+		goto err_free_secure_bo;
+	}
+
 	return 0;
 
+err_free_secure_bo:
+	tegra_vde_free_bo(vde->secure_bo);
 err_pm_runtime:
-	misc_deregister(&vde->miscdev);
-
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
-err_deinit_iommu:
 	tegra_vde_iommu_deinit(vde);
 
 err_gen_free:
@@ -1239,6 +1238,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	misc_deregister(&vde->miscdev);
+
 	tegra_vde_free_bo(vde->secure_bo);
 
 	/*
@@ -1257,8 +1258,6 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	clk_disable_unprepare(vde->clk);
 
-	misc_deregister(&vde->miscdev);
-
 	tegra_vde_dmabuf_cache_unmap_all(vde);
 	tegra_vde_iommu_deinit(vde);
 
-- 
2.33.1

