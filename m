Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39400369F32
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbhDXGq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:35724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230471AbhDXGqL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00F5561490;
        Sat, 24 Apr 2021 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=vlWzPcglj3c5YNM8fjCOIG3b1giv6Ug3RyqxVuPOXCU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o3EHnDj8lhhvnbL6MRbpHKQ/z5hcFwYB1uy5+C27DD6o3NjrCIAnM8ePevlYORY1E
         vDCdRSv/aGJRGra5RwV34014Euwi8obXklrpKcV/B0nbgOrDzQJDukjCPF2dKYXtJx
         aRb17bfiiUsJsB3ed19jypufTmKuczryK+6CX/Z5eAGEblROp19TX6LRptFxkMdhxw
         SXgUcfLSF6tHZWkCs0N/w9Y40O6Bd1CjS+nfLgWiI+S6eJ7+oXwzkBBpXUPXzebuxA
         yF/oLgT53PzqbltJZ5DQX8XNegGPKaC7G+ohOZmkSSpePo0goIgxJUgHV1Io+vzjb2
         oDJCxo5PtSS2w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2k-004Jdu-Vn; Sat, 24 Apr 2021 08:45:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/78] media: rcar_fdp1: fix pm_runtime_get_sync() usage count
Date:   Sat, 24 Apr 2021 08:44:14 +0200
Message-Id: <b9387e2fb2cbc2c9f0ba90ca8068e009de5fe007.1619191723.git.mchehab+huawei@kernel.org>
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

