Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCEC04F5ED1
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 15:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbiDFMu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 08:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbiDFMuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 08:50:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B61B32
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 01:54:08 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nc1QV-0000IQ-1Z; Wed, 06 Apr 2022 10:54:07 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Subject: [PATCH 1/3] media: coda: jpeg: set buffer error flag when header parsing fails
Date:   Wed,  6 Apr 2022 10:53:51 +0200
Message-Id: <20220406085353.2369313-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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

If decoding fails because  the output buffer does not contain a
valid header, set the error flag on the returned capture buffer.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda-jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda-jpeg.c b/drivers/media/platform/chips-media/coda-jpeg.c
index a72f4655e5ad..9e3e05434b96 100644
--- a/drivers/media/platform/chips-media/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda-jpeg.c
@@ -1353,7 +1353,7 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 		src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 		dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
-		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 
 		v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
 		return ret;
-- 
2.30.2

