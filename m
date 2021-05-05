Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F79F3737ED
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbhEEJnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:48634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232508AbhEEJnR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D202C61606;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=M0OqSRKx2VDTT/SgJ4SCHzlR1P9bOrIaMFlW3Y8TQtY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lGkPIrfAbN2wWagXexzVBCK7498s77sROlr6HSps02NghpSyC9yLpER7LAgKV9IM0
         rhm6m8HtFE0aCp9L8tpM7bMNLdVeRxw7h1DBOUuPJZBSWkmC/TrWU6Y4vnpg1qylWM
         vaT3Z1zBQgV1uOqOml0XelQtwQ52k0Wq47vnm0doUwqjrdRRDStlSoGiRzuDJ1zEEs
         1620rDDoYZJZygKhkvYmlvKxM8AUySmMXNAVtbmUsKleSX0Gq+NSeepxOT8P/bDoQb
         BZeL8rsde6hDQvdVUOVmkDqH199FAlMWKN1IXFtuhC+QhrltTUXYCv4qaKjE5iKzgo
         t5bBkosHKLImw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHwO-46; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 12/25] media: rcar_fdp1: simplify error check logic at fdp_open()
Date:   Wed,  5 May 2021 11:42:02 +0200
Message-Id: <c9e7c9b02841c149b0127a7658d2a3e2828cfb90.1620207353.git.mchehab+huawei@kernel.org>
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

Avoid some code duplication by moving the common error path
logit at fdp_open().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rcar_fdp1.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 01c1fbb97bf6..d26413fa5205 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2117,9 +2117,7 @@ static int fdp1_open(struct file *file)
 
 	if (ctx->hdl.error) {
 		ret = ctx->hdl.error;
-		v4l2_ctrl_handler_free(&ctx->hdl);
-		kfree(ctx);
-		goto done;
+		goto error_ctx;
 	}
 
 	ctx->fh.ctrl_handler = &ctx->hdl;
@@ -2133,10 +2131,7 @@ static int fdp1_open(struct file *file)
 
 	if (IS_ERR(ctx->fh.m2m_ctx)) {
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
-
-		v4l2_ctrl_handler_free(&ctx->hdl);
-		kfree(ctx);
-		goto done;
+		goto error_ctx;
 	}
 
 	/* Perform any power management required */
@@ -2147,6 +2142,12 @@ static int fdp1_open(struct file *file)
 	dprintk(fdp1, "Created instance: %p, m2m_ctx: %p\n",
 		ctx, ctx->fh.m2m_ctx);
 
+	mutex_unlock(&fdp1->dev_mutex);
+	return 0;
+
+error_ctx:
+	v4l2_ctrl_handler_free(&ctx->hdl);
+	kfree(ctx);
 done:
 	mutex_unlock(&fdp1->dev_mutex);
 	return ret;
-- 
2.30.2

