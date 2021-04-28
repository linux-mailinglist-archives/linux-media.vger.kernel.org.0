Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64AD736DA06
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240296AbhD1Oxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240269AbhD1Ox3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0EE461447;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621563;
        bh=vSVgVx9oCI4BykR40BTa4+7tin+dlK2U4+Benc8+UkQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IjmvDkezJvua0hzghdBZ4nL75WLBAmx7//xkI7b0W/JXRMiVDeYzNgmx38tXV6rku
         2q68MMjEiNSRUwocDaahV8E0WBTtGDrvkm8d6v+ORAoUXoy+S9eKyGbvHPmYTzrsCN
         eSZufzbPLh+8YA1rodM3dX3zHPoH0mlG71MUW7LVl8VrwLLxZapIP3SvpTTOy2YG//
         +IdV1llrv2lUlxrSAluaiNTWrVadyvKZohfQJ0U5ee90AstCGV1sYU+jJTX17V2M7a
         ZV12rplqUy8Gv8Is3Nqj0ojpD43bBz44OSk4aP7/TMKJe8LkybBF4Uimksyv1CVLLz
         yf2W3T81gkrrQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dq7-ST; Wed, 28 Apr 2021 16:52:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 11/79] media: rcar_fdp1: fix pm_runtime_get_sync() usage count
Date:   Wed, 28 Apr 2021 16:51:32 +0200
Message-Id: <6fb49df1ba7c80c2e6c51fb95322e025243ce36c.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
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

Also, right now, the driver is ignoring any troubles when
trying to do PM resume. So, add the proper error handling
for the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rcar_fdp1.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 01c1fbb97bf6..c32d237af618 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2140,7 +2140,13 @@ static int fdp1_open(struct file *file)
 	}
 
 	/* Perform any power management required */
-	pm_runtime_get_sync(fdp1->dev);
+	ret = pm_runtime_resume_and_get(fdp1->dev);
+	if (ret < 0) {
+		v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+		v4l2_ctrl_handler_free(&ctx->hdl);
+		kfree(ctx);
+		goto done;
+	}
 
 	v4l2_fh_add(&ctx->fh);
 
@@ -2351,7 +2357,9 @@ static int fdp1_probe(struct platform_device *pdev)
 
 	/* Power up the cells to read HW */
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(fdp1->dev);
+	ret = pm_runtime_resume_and_get(fdp1->dev);
+	if (ret < 0)
+		return ret;
 
 	hw_version = fdp1_read(fdp1, FD1_IP_INTDATA);
 	switch (hw_version) {
-- 
2.30.2

