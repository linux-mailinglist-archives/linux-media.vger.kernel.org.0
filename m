Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0578D18A273
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 19:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgCRSgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 14:36:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60403 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgCRSgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 14:36:00 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jEdXq-00011Z-Rx; Wed, 18 Mar 2020 19:35:58 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 4/6] media: coda: split marking last meta into helper function
Date:   Wed, 18 Mar 2020 19:35:34 +0100
Message-Id: <20200318183536.15779-5-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318183536.15779-1-p.zabel@pengutronix.de>
References: <20200318183536.15779-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Split marking the last metadata entry into a helper function to simplify
coda_decoder_cmd.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v2.
---
 drivers/media/platform/coda/coda-common.c | 36 ++++++++++++++---------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 09244696f132..a06765e69d63 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1152,6 +1152,26 @@ static int coda_try_decoder_cmd(struct file *file, void *fh,
 	return v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
 }
 
+static bool coda_mark_last_meta(struct coda_ctx *ctx)
+{
+	struct coda_buffer_meta *meta;
+
+	coda_dbg(1, ctx, "marking last meta\n");
+
+	spin_lock(&ctx->buffer_meta_lock);
+	if (list_empty(&ctx->buffer_meta_list)) {
+		spin_unlock(&ctx->buffer_meta_lock);
+		return false;
+	}
+
+	meta = list_last_entry(&ctx->buffer_meta_list, struct coda_buffer_meta,
+			       list);
+	meta->last = true;
+
+	spin_unlock(&ctx->buffer_meta_lock);
+	return true;
+}
+
 static int coda_decoder_cmd(struct file *file, void *fh,
 			    struct v4l2_decoder_cmd *dc)
 {
@@ -1196,22 +1216,10 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 				stream_end = true;
 			}
 		} else {
-			coda_dbg(1, ctx, "marking last meta\n");
-
-			/* Mark last meta */
-			spin_lock(&ctx->buffer_meta_lock);
-			if (!list_empty(&ctx->buffer_meta_list)) {
-				struct coda_buffer_meta *meta;
-
-				meta = list_last_entry(&ctx->buffer_meta_list,
-						       struct coda_buffer_meta,
-						       list);
-				meta->last = true;
+			if (coda_mark_last_meta(ctx))
 				stream_end = true;
-			} else {
+			else
 				wakeup = true;
-			}
-			spin_unlock(&ctx->buffer_meta_lock);
 		}
 
 		if (stream_end) {
-- 
2.20.1

