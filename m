Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF80F2DC0
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 12:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387811AbfKGLyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 06:54:16 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53395 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfKGLyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 06:54:16 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iSgMg-00024d-Cd; Thu, 07 Nov 2019 12:54:14 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH] media: coda: disable decoder crop selections
Date:   Thu,  7 Nov 2019 12:54:13 +0100
Message-Id: <20191107115413.28543-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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

Disable output side crop selections for the decoder.
This fixes the following v4l2-compliance complaint:

		fail: v4l2-test-formats.cpp(1576): IS_DECODER(node)
	test Cropping: FAIL

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index e648d4819a84..c5cd080125a4 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -933,7 +933,8 @@ static int coda_g_selection(struct file *file, void *fh,
 		rsel = &r;
 		/* fallthrough */
 	case V4L2_SEL_TGT_CROP:
-		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT ||
+		    ctx->inst_type == CODA_INST_DECODER)
 			return -EINVAL;
 		break;
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
-- 
2.20.1

