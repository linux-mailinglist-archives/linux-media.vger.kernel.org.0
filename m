Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9594D369F72
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhDXGrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233337AbhDXGqR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98D1261922;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=bbBhKTio+K3X9fPKV58F4G07rHzCE6SQVXwv0W77lPM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=foXr9f7O0LkJT3c5Ng2mqf88EYYhcNnfyNtoW8vXGmu10JJXSbb6CPf03R9H3FXvN
         mh7ghsAQZeTTfgsX6zhSUBPAwV70m0IC0yH2JN3IdULAO7b2+iHeCMO2YY0jNzsZzs
         fFRMpM4eVa+t7hv9M23B6Ix6fNXPj29QBCeejmFQdK+T04SXuzR1hGfTwdrzA3b2ch
         4PaeCWrTtqs5icw1oeAEjyUmlxFRHhUIRbQGZ8Va8+Lod4e58mDoBZW6fz3wTYEWVs
         +5Wbl3WC6/Zprh6U39nKAxvNXRMKytS/TIfcPLSPiakRoT6IBo9SuoBmdqqh4uuA7/
         lsRvpuP7rMhfA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2n-004JhN-8M; Sat, 24 Apr 2021 08:45:33 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 74/78] media: bdisp-v4l2: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:24 +0200
Message-Id: <a99597bc47bb5e1e6084a2ee77934a21633bcb85.1619191723.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index 060ca85f64d5..85288da9d2ae 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -499,7 +499,7 @@ static int bdisp_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct bdisp_ctx *ctx = q->drv_priv;
 	struct vb2_v4l2_buffer *buf;
-	int ret = pm_runtime_get_sync(ctx->bdisp_dev->dev);
+	int ret = pm_runtime_resume_and_get(ctx->bdisp_dev->dev);
 
 	if (ret < 0) {
 		dev_err(ctx->bdisp_dev->dev, "failed to set runtime PM\n");
@@ -1364,10 +1364,10 @@ static int bdisp_probe(struct platform_device *pdev)
 
 	/* Power management */
 	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "failed to set PM\n");
-		goto err_pm;
+		goto err_remove;
 	}
 
 	/* Filters */
@@ -1395,6 +1395,7 @@ static int bdisp_probe(struct platform_device *pdev)
 	bdisp_hw_free_filters(bdisp->dev);
 err_pm:
 	pm_runtime_put(dev);
+err_remove:
 	bdisp_debugfs_remove(bdisp);
 	v4l2_device_unregister(&bdisp->v4l2_dev);
 err_clk:
-- 
2.30.2

