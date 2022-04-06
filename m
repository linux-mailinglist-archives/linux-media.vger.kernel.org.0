Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288B24F5EB4
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 15:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiDFMvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 08:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiDFMuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 08:50:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D869D06B
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 01:54:09 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nc1QV-0000IQ-I1; Wed, 06 Apr 2022 10:54:07 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Subject: [PATCH 3/3] media: coda: jpeg: start streaming without valid header
Date:   Wed,  6 Apr 2022 10:53:53 +0200
Message-Id: <20220406085353.2369313-3-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406085353.2369313-1-p.zabel@pengutronix.de>
References: <20220406085353.2369313-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stop bailing out on JPEG header parsing errors during streamon.
This allows userspace to provide valid output buffers later and
fixes a v4l2-compliance streaming test failure:

		fail: v4l2-test-buffers.cpp(1429): node->streamon(q.g_type())
	test MMAP (no poll): FAIL

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda-common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index 9000377e592f..63adbbdc1638 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -2011,9 +2011,13 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
 		 */
 		if (q_data_src->fourcc == V4L2_PIX_FMT_JPEG) {
 			buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-			ret = coda_jpeg_decode_header(ctx, &buf->vb2_buf);
-			if (ret < 0)
-				goto err;
+			coda_jpeg_decode_header(ctx, &buf->vb2_buf);
+			/*
+			 * We have to start streaming even if the first buffer
+			 * does not contain a valid JPEG image. The error will
+			 * be caught during device run and will be signalled
+			 * via the capture buffer error flag.
+			 */
 
 			q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 			q_data_dst->width = round_up(q_data_src->width, 16);
-- 
2.30.2

