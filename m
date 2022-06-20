Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C3C5526FA
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 00:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236558AbiFTWcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 18:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236331AbiFTWcG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 18:32:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E651D0D3
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 15:32:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o3PwA-0000yT-A1; Tue, 21 Jun 2022 00:32:02 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o3Pw6-001iov-FR; Tue, 21 Jun 2022 00:31:59 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o3Pw7-00GItB-3W; Tue, 21 Jun 2022 00:31:59 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, kernel@pengutronix.de
Subject: [PATCH] hantro_v4l2: ignore enum_framesizes for non-coded formats without postproc
Date:   Tue, 21 Jun 2022 00:31:50 +0200
Message-Id: <20220620223150.3885812-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
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

When codec_mode is HANTRO_MODE_NONE, then vidioc_enum_framesizes should
return with -EINVAL. At least when hantro_needs_postproc returns false.
Which is the case for encoders. But with the latest postproc scaling
patch this is not the case anymore. This patch is fixing this.

Fixes: 79c987de8b35 ("media: hantro: Use post processor scaling capacities")
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/staging/media/hantro/hantro_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 22ad182ee972ca..0eb0873d383678 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -124,8 +124,11 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	}
 
 	/* For non-coded formats check if postprocessing scaling is possible */
-	if (fmt->codec_mode == HANTRO_MODE_NONE && hantro_needs_postproc(ctx, fmt)) {
-		return hanto_postproc_enum_framesizes(ctx, fsize);
+	if (fmt->codec_mode == HANTRO_MODE_NONE) {
+		if (hantro_needs_postproc(ctx, fmt))
+			return hanto_postproc_enum_framesizes(ctx, fsize);
+		else
+			return -EINVAL;
 	} else if (fsize->index != 0) {
 		vpu_debug(0, "invalid frame size index (expected 0, got %d)\n",
 			  fsize->index);
-- 
2.30.2

