Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3D93737E2
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhEEJnc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:48574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232424AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47E3B61428;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=y4nTVWcCXCl2Tp3mRU3icn21BALZ6h0HNRov8iGkFYM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DEYZQXq1Ho1jN6BGBs+eKOlKgV7ZCVvxSQYeCPKEJ5K4Lh7t4nl1W1c+l0x4UeTiK
         h8MrIQBXplcLiiSN0Lfo0vTKuEWm1e+An1LwT9YLCPgLkM2Py+PJsNOzTOeRflsY2d
         y3m9g/SpZchkXgoKr5jTGM5Hn3b+bYrtjAnsOkapTJGXSrgj7aIUgn8BD5H6RnjcWN
         6kxuf1FVax86mJiIZNAaAtuOYy9McxN8OqJ+FS95V4tPRQmCgZiqijz7Bks076Ge+1
         ix6s4FMXk05rG/8OTO7IrJanBcxS+XUipl2oWfhEDO/p+q05AQOo2g/lNkOnMmbO6F
         gyFWR9l/tS74w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHwa-9X; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 16/25] media: am437x: fix pm_runtime_get_sync() usage count
Date:   Wed,  5 May 2021 11:42:06 +0200
Message-Id: <8688555079cf30f5848bb020b5ecf0b0132b2c7e.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

While here, ensure that the driver will check if PM runtime
resumed at vpfe_initialize_device().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 6cdc77dda0e4..1c9cb9e05fdf 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1021,7 +1021,9 @@ static int vpfe_initialize_device(struct vpfe_device *vpfe)
 	if (ret)
 		return ret;
 
-	pm_runtime_get_sync(vpfe->pdev);
+	ret = pm_runtime_resume_and_get(vpfe->pdev);
+	if (ret < 0)
+		return ret;
 
 	vpfe_config_enable(&vpfe->ccdc, 1);
 
@@ -2443,7 +2445,11 @@ static int vpfe_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	/* for now just enable it here instead of waiting for the open */
-	pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		vpfe_err(vpfe, "Unable to resume device.\n");
+		goto probe_out_v4l2_unregister;
+	}
 
 	vpfe_ccdc_config_defaults(ccdc);
 
@@ -2530,6 +2536,11 @@ static int vpfe_suspend(struct device *dev)
 
 	/* only do full suspend if streaming has started */
 	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
+		/*
+		 * ignore RPM resume errors here, as it is already too late.
+		 * A check like that should happen earlier, either at
+		 * open() or just before start streaming.
+		 */
 		pm_runtime_get_sync(dev);
 		vpfe_config_enable(ccdc, 1);
 
-- 
2.30.2

