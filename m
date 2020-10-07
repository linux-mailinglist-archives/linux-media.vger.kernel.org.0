Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1097D285CF6
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 12:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgJGKf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 06:35:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46282 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbgJGKf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 06:35:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id AD7ED29C191
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 1/6] coda: Remove redundant ctx->initialized setting
Date:   Wed,  7 Oct 2020 07:35:39 -0300
Message-Id: <20201007103544.22807-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007103544.22807-1-ezequiel@collabora.com>
References: <20201007103544.22807-1-ezequiel@collabora.com>
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
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

