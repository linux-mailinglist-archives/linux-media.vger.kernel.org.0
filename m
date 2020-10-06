Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE51284A70
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 12:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgJFKoN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 06:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgJFKoK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 06:44:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9050C0613D1
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 03:44:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2BE9029A740
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 1/6] coda: Remove redundant ctx->initialized setting
Date:   Tue,  6 Oct 2020 07:44:09 -0300
Message-Id: <20201006104414.67984-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201006104414.67984-1-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ctx->initialized flag is set in __coda_decoder_seq_init,
so it's redundant to set it in coda_dec_seq_init_work.
Remove the redundant set, which allows to simplify the
implementation quite a bit.

This change shouldn't affect functionality as it's just
cosmetics.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/coda/coda-bit.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index bf75927bac4e..aa0a47c34413 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2005,21 +2005,13 @@ static void coda_dec_seq_init_work(struct work_struct *work)
 	struct coda_ctx *ctx = container_of(work,
 					    struct coda_ctx, seq_init_work);
 	struct coda_dev *dev = ctx->dev;
-	int ret;
 
 	mutex_lock(&ctx->buffer_mutex);
 	mutex_lock(&dev->coda_mutex);
 
-	if (ctx->initialized == 1)
-		goto out;
-
-	ret = __coda_decoder_seq_init(ctx);
-	if (ret < 0)
-		goto out;
-
-	ctx->initialized = 1;
+	if (!ctx->initialized)
+		__coda_decoder_seq_init(ctx);
 
-out:
 	mutex_unlock(&dev->coda_mutex);
 	mutex_unlock(&ctx->buffer_mutex);
 }
-- 
2.27.0

