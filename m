Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C28AE4A767
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730089AbfFRQqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:46:04 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42047 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-P8; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 13/28] media: coda: do not enforce 512-byte initial bitstream payload on CODA960
Date:   Tue, 18 Jun 2019 18:45:20 +0200
Message-Id: <20190618164535.20162-14-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
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

On CODA960, sequence initialization can succeed if less than 512 bytes
are ready in the bitstream ring buffer.
On other variants, warn about too small payload in start_streaming.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index b30945fa0a70..dc9bce896003 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1790,7 +1790,9 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
 			coda_fill_bitstream(ctx, &list);
 			mutex_unlock(&ctx->bitstream_mutex);
 
-			if (coda_get_bitstream_payload(ctx) < 512) {
+			if (ctx->dev->devtype->product != CODA_960 &&
+			    coda_get_bitstream_payload(ctx) < 512) {
+				v4l2_err(v4l2_dev, "start payload < 512\n");
 				ret = -EINVAL;
 				goto err;
 			}
-- 
2.20.1

