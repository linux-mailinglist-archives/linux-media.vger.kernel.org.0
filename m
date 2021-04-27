Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB33A36C2E0
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbhD0KQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:35420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235766AbhD0KPK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:15:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCE7E61951;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=ORhYQV8MaIIM9QGoq0fv1DmSrG26N8/lfMtTN/XnDlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ggOlyf1YNtPBHjycx93XL7+9/FJpqcXn1RjwwVtuYy1ppTBb8ut9ATtgAjEu8VsMg
         dWrKgO7UTs2MCJW1N6VISg4AC7FY/0wiaaiazic1WRTgT80Z/NS8jYHOO0qS2R31+J
         hMOrgznyM+GpxW3q1+L5g7lEKn14q7QYELvGFeUy8HBkH4HuK7XV8+5TcHl1uA+z+9
         hQI2tiIwFeUBNt1vKOwUZBhM6BRIlZcOp3khK6HiPYabOMGMay6v113afJvBRGMOX7
         6iOvJKql8hN36/6AgC6NaA3+A2zKAW2C+ArY7/nJQlgsMmJe+zEzHkaQ0V02zK2NSB
         qSnTGug2neRfA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j81-UR; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 71/79] media: s3c-camif: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:38 +0200
Message-Id: <77cb3497163bedc3a75555b4cca4cb980c7756b2.1619518193.git.mchehab+huawei@kernel.org>
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

