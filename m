Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA79D36C3CD
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbhD0K3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:48146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238099AbhD0K2m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0383361481;
        Tue, 27 Apr 2021 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519237;
        bh=v3oOn6uPHJX4lDQc2LG+Rn/44BbALYGNkVgzHn1PdbQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JEckz/fuxi4Yvs858mBbDa/aqLRqDtn9bj58CCmGAwK+QlqI37NtGR/Y+J/OXjsBP
         PNc65TsKhuzdT/yReKJQSOyQBpdMzZ3HgVk459MlonuhUKxN06+tIgvNT9Jaz3QfE/
         trGOaUWCkBkAAj8suBC9dpgUQjA3PnqAsf9lWiAqueppxgWDLid18DETKQP8NS5sUJ
         vX1DuVJFZrSRH+Pnwv+Ne0PkrDqGtAXPQHQRPQtlzPUbAiiFx4ilBStNbtSSQrgyhW
         /Sio56g1+Bv5UGnVUQL38bXFwNA+Ws2vC8338NGikS7/6p8sHMdeRjAOuJjko4MMG1
         pbDKV4IBvXrOg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvv-000nzt-JM; Tue, 27 Apr 2021 12:27:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 14/79] media: am437x: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:26:04 +0200
Message-Id: <657bba55e6afbb321b0f0c612d0b8f900e365594.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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
in order to properly decrement the usage counter and avoid memory
leaks.

While here, ensure that the driver will check if PM runtime
resumed at vpfe_initialize_device().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 22 +++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 6cdc77dda0e4..bced526f30f2 100644
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
 
@@ -2527,10 +2533,11 @@ static int vpfe_suspend(struct device *dev)
 {
 	struct vpfe_device *vpfe = dev_get_drvdata(dev);
 	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
+	int ret;
 
 	/* only do full suspend if streaming has started */
 	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
-		pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
 		vpfe_config_enable(ccdc, 1);
 
 		/* Save VPFE context */
@@ -2541,7 +2548,8 @@ static int vpfe_suspend(struct device *dev)
 		vpfe_config_enable(ccdc, 0);
 
 		/* Disable both master and slave clock */
-		pm_runtime_put_sync(dev);
+		if (ret >= 0)
+			pm_runtime_put_sync(dev);
 	}
 
 	/* Select sleep pin state */
@@ -2583,18 +2591,20 @@ static int vpfe_resume(struct device *dev)
 {
 	struct vpfe_device *vpfe = dev_get_drvdata(dev);
 	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
+	int ret;
 
 	/* only do full resume if streaming has started */
 	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
 		/* Enable both master and slave clock */
-		pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
 		vpfe_config_enable(ccdc, 1);
 
 		/* Restore VPFE context */
 		vpfe_restore_context(ccdc);
 
 		vpfe_config_enable(ccdc, 0);
-		pm_runtime_put_sync(dev);
+		if (ret >= 0)
+			pm_runtime_put_sync(dev);
 	}
 
 	/* Select default pin state */
-- 
2.30.2

