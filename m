Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9679F369F30
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbhDXGqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231202AbhDXGqM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0704761494;
        Sat, 24 Apr 2021 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=Z6R4eC5Q3SwWmdTS9TKqbcAW+1YcSH8gzpQPRiOs6uQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E60MZeLHd/O4FTxK+q0Wp7Ao/sS1av2z5NSMEgwb9eMnrleefz0a/8q8olnHXxyS2
         rtfnH4CVigKfztrYRERlhs5NyX91utcGyaR02yFzGnKe0joyU7L54W8lduG9hUgRGD
         afpZAcYbMI3/Chw4IkKMzbWyWp+6Z4MztE0Rd/ykH8Jt4qkXL/PWCzUJJC9h28xyOb
         6QT+mbIxVVxXg1CZzgOpVwUOUMXBe9aisRUsgfJ91Z2/MkrfPVlS8hAkt5+g+fndV+
         MvoRSZUseCKfW9/t9qLH9wlzCbhRgAp9rAJ6G5AZt7cHAfNCTr1te8sA2o3I0xi/BP
         nWpYkJSkxUkXA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Je6-3O; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 08/78] media: am437x:: fix pm_runtime_get_sync() usage count
Date:   Sat, 24 Apr 2021 08:44:18 +0200
Message-Id: <08ab4e29fa4ee0ac7102a7e130e5f14d4ee04440.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

While here, ensure that the driver will check if PM runtime
resumed at vpfe_initialize_device().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 6cdc77dda0e4..c0997d603880 100644
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
 
@@ -2443,7 +2445,7 @@ static int vpfe_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	/* for now just enable it here instead of waiting for the open */
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_resume_and_get(&pdev->dev);
 
 	vpfe_ccdc_config_defaults(ccdc);
 
@@ -2530,7 +2532,7 @@ static int vpfe_suspend(struct device *dev)
 
 	/* only do full suspend if streaming has started */
 	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
-		pm_runtime_get_sync(dev);
+		pm_runtime_resume_and_get(dev);
 		vpfe_config_enable(ccdc, 1);
 
 		/* Save VPFE context */
@@ -2587,7 +2589,7 @@ static int vpfe_resume(struct device *dev)
 	/* only do full resume if streaming has started */
 	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
 		/* Enable both master and slave clock */
-		pm_runtime_get_sync(dev);
+		pm_runtime_resume_and_get(dev);
 		vpfe_config_enable(ccdc, 1);
 
 		/* Restore VPFE context */
-- 
2.30.2

