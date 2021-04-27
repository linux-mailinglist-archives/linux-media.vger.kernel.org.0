Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C367636C39A
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235516AbhD0K26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235801AbhD0K2N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 879436141A;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=ORhYQV8MaIIM9QGoq0fv1DmSrG26N8/lfMtTN/XnDlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pWhEtfBuU+iaPtnpecEP0/LI/jxA0WIo9UTWcclJRH0K/NYiL0rpx0ZCJqAqEidOh
         A8g8d/0AYZ7JTWk+F2JB1pRmu1V6S/XCVwBB7Ttx7+6jszFrpe4ayC1iFofaxBHdfO
         Z+x4SQrf4i3+kzw8Y3EtBzSXkErF+7Xc0bGFa0h2WON+lrYp4KFfiwPNCFqidCIEkf
         /8iWl6LHQyyHyp0amqj/ybGl4nY3XMQ75Evnv8GdnZVT03GZflQAedFi4Aq9+9dnXx
         nIjn8sDYBGCIHzaTp9P56yId5WtHuboG5ppVXJiooSS1eS+YwvVY5FgACQcUGYvx+a
         MEYFMd08CI9Eg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o2e-Ae; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 71/79] media: s3c-camif: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:27:01 +0200
Message-Id: <a002bcaa2096cac125469b0188e5967d0e1892a0.1619519080.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/s3c-camif/camif-capture.c | 2 +-
 drivers/media/platform/s3c-camif/camif-core.c    | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 9ca49af29542..62241ec3b978 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -547,7 +547,7 @@ static int s3c_camif_open(struct file *file)
 	if (ret < 0)
 		goto unlock;
 
-	ret = pm_runtime_get_sync(camif->dev);
+	ret = pm_runtime_resume_and_get(camif->dev);
 	if (ret < 0)
 		goto err_pm;
 
diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index 4c3c00d59c92..e1d51fd3e700 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -460,9 +460,9 @@ static int s3c_camif_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		goto err_pm;
+		goto err_disable;
 
 	ret = camif_media_dev_init(camif);
 	if (ret < 0)
@@ -502,6 +502,7 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	camif_unregister_media_entities(camif);
 err_pm:
 	pm_runtime_put(dev);
+err_disable:
 	pm_runtime_disable(dev);
 	camif_clk_put(camif);
 err_clk:
-- 
2.30.2

