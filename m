Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C1F36C26F
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235486AbhD0KOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235246AbhD0KOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC08F613C5;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518430;
        bh=vSVgVx9oCI4BykR40BTa4+7tin+dlK2U4+Benc8+UkQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DHeOYgg17IAhtKf2kG3l5ENtWblBsn9K//nDeh3BI5v8/jaPW/tPDqgJPSy/cOetP
         2ITKnyUMUnRbs0QofKRleV3Nm2SCKuVDgi8OJloO7UgTyOiCpHycLx2GqtFa2WA61q
         uVlgSsAxagmWMh9CL8UF33VbGYDzyLoCTGzxGr/BNxoHmoAkscZEu8TQhpOgABJwAn
         om3V9/pdHBgO67UyuHQMGuRz7xebZt1z4eK8LDoh/U/VRhpFDRkhJTCdzcdDQ4ilID
         FYHnhXzeR6DqiRz4R9Z0jH07yVCT/aPh9L3PG8IQ1Y07FuJ/YJ3psHKyQszyoymlGL
         2C2wg2iZ+0lMQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j54-K8; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 10/79] media: rcar_fdp1: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:12:37 +0200
Message-Id: <449ab92cf6920f1d66cb831e15d92aed7f5b7192.1619518193.git.mchehab+huawei@kernel.org>
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

