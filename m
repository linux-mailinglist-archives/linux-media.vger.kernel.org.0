Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6C436C2CE
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237801AbhD0KQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235592AbhD0KOs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38FC561923;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=v3oOn6uPHJX4lDQc2LG+Rn/44BbALYGNkVgzHn1PdbQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QYf5fRS1/rmz22chlWb+8rQj+/GJB9Pbz8xRaWgozmM98EQdsWSk/e47nrliLEVH1
         GP0SmZ7t/GmzxEVU/i1oTmsCNTylnviKazpS63GKE+a6D6C/PBG8xYz3KPqEwO9Zt9
         yrnxQOJZdZfglalRIIs6EIWFLtGQLtpHTCi1yfNn9dv508Xcbu6LHo9YYYZLg9rRrR
         7+LCkoBCqj8litNqIwBaxKkVWsiVZKef9KT/M/HJW0Wkqng9NaW8b++Cu/EM8wfr9Q
         2ZIxyRig0h4Ce3x0qPMUatkV8NuIvx6H/f+XPgdw19+fbMk46R8UmmaYSv3x/cyj8Z
         g22ZunrliBA6Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j5G-OH; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 14/79] media: am437x: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:12:41 +0200
Message-Id: <98c638ac1c2c85c08afc14d63cface1cdbc508bf.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

