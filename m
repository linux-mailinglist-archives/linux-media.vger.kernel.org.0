Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8AF44FC55
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhKNWwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:52:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbhKNWvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:51:25 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477E6C0613B9;
        Sun, 14 Nov 2021 14:48:30 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b40so38353792lfv.10;
        Sun, 14 Nov 2021 14:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ImcZoW2Pqa7ZRY/8PEMeXuQQ0A4lrgRe4vr/rypxpxM=;
        b=hDm+hWyRQI66NSlBlRF3pXrbBPomci2YplEsAU3wgIVCOYTv2uClgrNw+wbic17+kj
         5xo5effVDq+wZ6ZhysDJ4vNNsPnpA/s//WRVrlMWai9sVeub2ulsYWS0r+82mR/wf388
         KvbOJ9ONvzJ4n6YB0ceRQPaV3jvfUD3Ocw4qJRPwkP1acynqV+5+Wv7E3NnmLmsLCevC
         TPZQYwPA9HbP+cQ7zCt/iYC3GCKMhkPKYPVVIKJKjyuyegSbTnLYvneEB9cRh2L9M/eH
         3uYkjZg9zKxRGabyFrFpfPd8TuH0B/usMxmweDYKvWy1I1a7Jx/US9KqH2uzGfLRSsdz
         a7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ImcZoW2Pqa7ZRY/8PEMeXuQQ0A4lrgRe4vr/rypxpxM=;
        b=2mMZRTSIIyQOPz/OZNRtxBRVhS5/58wmOanyMz9mY2/khP3GFmelL7AfjG3vBaSQWb
         2qpm3DHMQiuQl9fIyen0JjUcliODOnx9cGidzbLSaFKg3fiqgA3c9uslGdo/MxFOfgpM
         yAnENjukzrIsy/3PEKCXPWr9lsHWNF9bLEDp0cbqWDJDMSM6QjPParVP+OhXuEtP0cNq
         ZgntTFsNZLUhka+P1nM0LVVz7X4T4YEaQBmqD8lZih4uuCdnnx00L35Lt5SiukW/f9Lg
         5Y6wpJM/eJ1QzneWii5FKI/jHRjn9WXonLwdMjwiSEN/U4AoPnUmvHWqrBe2Kqtek4t4
         /J8w==
X-Gm-Message-State: AOAM531xSXJwYek+7QQALn4jGaewKF1cKuZfvpgvUiUcVw58Rb7vNXPt
        A3DxgdT5AUSb00y9iw9Ph4k=
X-Google-Smtp-Source: ABdhPJza0kexM3zW71JVQc6l5KmuNpf+eeMnHcB7U4RkNa3k2wzk30jArYTMgkgYnWxAnz+gAuXQ2w==
X-Received: by 2002:ac2:4907:: with SMTP id n7mr13887808lfi.86.1636930108582;
        Sun, 14 Nov 2021 14:48:28 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id h1sm1228591lfu.277.2021.11.14.14.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:48:28 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: staging: tegra-vde: Reorder misc device registration
Date:   Mon, 15 Nov 2021 01:47:32 +0300
Message-Id: <20211114224732.11550-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114224732.11550-1-digetx@gmail.com>
References: <20211114224732.11550-1-digetx@gmail.com>
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
index f4f65eb78d44..a8f1a024c343 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1193,12 +1193,6 @@ static int tegra_vde_probe(struct platform_device *pdev)
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
@@ -1220,15 +1214,20 @@ static int tegra_vde_probe(struct platform_device *pdev)
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
@@ -1243,6 +1242,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	misc_deregister(&vde->miscdev);
+
 	tegra_vde_free_bo(vde->secure_bo);
 
 	/*
@@ -1261,8 +1262,6 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	clk_disable_unprepare(vde->clk);
 
-	misc_deregister(&vde->miscdev);
-
 	tegra_vde_dmabuf_cache_unmap_all(vde);
 	tegra_vde_iommu_deinit(vde);
 
-- 
2.33.1

