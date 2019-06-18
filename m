Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11C24A751
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbfFRQpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:46 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48643 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-Bj; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 02/28] media: coda: use mem2mem try_en/decoder_cmd helpers
Date:   Tue, 18 Jun 2019 18:45:09 +0200
Message-Id: <20190618164535.20162-3-p.zabel@pengutronix.de>
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

Use mem2mem try_en/decoder_cmd helpers to ensure consistent behaviour
with other video codec drivers.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index a5e0d5c1528e..e09d48170e5c 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1001,13 +1001,7 @@ static int coda_try_encoder_cmd(struct file *file, void *fh,
 	if (ctx->inst_type != CODA_INST_ENCODER)
 		return -ENOTTY;
 
-	if (ec->cmd != V4L2_ENC_CMD_STOP)
-		return -EINVAL;
-
-	if (ec->flags & V4L2_ENC_CMD_STOP_AT_GOP_END)
-		return -EINVAL;
-
-	return 0;
+	return v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
 }
 
 static int coda_encoder_cmd(struct file *file, void *fh,
@@ -1043,16 +1037,7 @@ static int coda_try_decoder_cmd(struct file *file, void *fh,
 	if (ctx->inst_type != CODA_INST_DECODER)
 		return -ENOTTY;
 
-	if (dc->cmd != V4L2_DEC_CMD_STOP)
-		return -EINVAL;
-
-	if (dc->flags & V4L2_DEC_CMD_STOP_TO_BLACK)
-		return -EINVAL;
-
-	if (!(dc->flags & V4L2_DEC_CMD_STOP_IMMEDIATELY) && (dc->stop.pts != 0))
-		return -EINVAL;
-
-	return 0;
+	return v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
 }
 
 static int coda_decoder_cmd(struct file *file, void *fh,
-- 
2.20.1

