Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4C3248635
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 15:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgHRNgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 09:36:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:45428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbgHRNf7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 09:35:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6452C206B5;
        Tue, 18 Aug 2020 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597757758;
        bh=axA6OGzpfyAZ/ezh8rhvucD/432ettQbcxBBNuhqQS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XeI/bnsFVetWO5lL/OkgNUHswpSU5zOg2XvqCYrdWkntnL+afrwkThFU8cKWd9s7Y
         OZIBPPYoklGiXzclyOpu6hpmv2GSI22XdYfjjjwmbqg/tdmYWf74w2VXe3qrlHbbwc
         4tCPlMNCZG/54dTWiilZEEMvI2yktQU+vTu+iQ2s=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-media@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] media: exynos4-is: no need to check return value of debugfs_create functions
Date:   Tue, 18 Aug 2020 15:36:04 +0200
Message-Id: <20200818133608.462514-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818133608.462514-1-gregkh@linuxfoundation.org>
References: <20200818133608.462514-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/platform/exynos4-is/fimc-is.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index a474014f0a0f..019bb47df915 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -756,18 +756,12 @@ static void fimc_is_debugfs_remove(struct fimc_is *is)
 	is->debugfs_entry = NULL;
 }
 
-static int fimc_is_debugfs_create(struct fimc_is *is)
+static void fimc_is_debugfs_create(struct fimc_is *is)
 {
-	struct dentry *dentry;
-
 	is->debugfs_entry = debugfs_create_dir("fimc_is", NULL);
 
-	dentry = debugfs_create_file("fw_log", S_IRUGO, is->debugfs_entry,
-				     is, &fimc_is_fops);
-	if (!dentry)
-		fimc_is_debugfs_remove(is);
-
-	return is->debugfs_entry == NULL ? -EIO : 0;
+	debugfs_create_file("fw_log", S_IRUGO, is->debugfs_entry, is,
+			    &fimc_is_fops);
 }
 
 static int fimc_is_runtime_resume(struct device *dev);
@@ -853,9 +847,7 @@ static int fimc_is_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_pm;
 
-	ret = fimc_is_debugfs_create(is);
-	if (ret < 0)
-		goto err_sd;
+	fimc_is_debugfs_create(is);
 
 	ret = fimc_is_request_firmware(is, FIMC_IS_FW_FILENAME);
 	if (ret < 0)
@@ -868,7 +860,6 @@ static int fimc_is_probe(struct platform_device *pdev)
 
 err_dfs:
 	fimc_is_debugfs_remove(is);
-err_sd:
 	fimc_is_unregister_subdevs(is);
 err_pm:
 	pm_runtime_put_noidle(dev);
-- 
2.28.0

