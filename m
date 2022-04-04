Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D909D4F1BE2
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 23:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379031AbiDDVSf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 17:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379160AbiDDQhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 12:37:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A19BE094
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 09:35:56 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nbPgI-0004CX-KQ; Mon, 04 Apr 2022 18:35:54 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Subject: [PATCH 7/7] media: coda: enable capture S_PARM for stateful encoder
Date:   Mon,  4 Apr 2022 18:35:33 +0200
Message-Id: <20220404163533.707508-7-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404163533.707508-1-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
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

Allow to call S_PARM with type == V4L2_BUF_TYPE_VIDEO_OUTPUT,
to fix the following v4l2-compliance test failure:

		fail: v4l2-test-formats.cpp(1413): got error 22 when setting parms for buftype 1
	test VIDIOC_G/S_PARM: FAIL

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda-common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index 33fcd8c7d72b..cd9ff2fa4147 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -1421,9 +1421,6 @@ static int coda_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct coda_ctx *ctx = fh_to_ctx(fh);
 	struct v4l2_fract *tpf;
 
-	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
-		return -EINVAL;
-
 	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
 	tpf = &a->parm.output.timeperframe;
 	coda_approximate_timeperframe(tpf);
-- 
2.30.2

