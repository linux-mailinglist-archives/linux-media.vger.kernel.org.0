Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7AB64FDB42
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 12:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241819AbiDLJ4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 05:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376701AbiDLHoU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 03:44:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BA015A25
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 00:29:09 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1neAxW-0006Y4-Q1; Tue, 12 Apr 2022 09:29:06 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] media: video-mux: Use dev_err_probe()
Date:   Tue, 12 Apr 2022 09:29:05 +0200
Message-Id: <20220412072905.1927550-1-p.zabel@pengutronix.de>
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

Simplify the mux error path a bit by using dev_err_probe().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v2: fix unassigned error return value
---
 drivers/media/platform/video-mux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index fda8fc0e4814..b31e5913a4cd 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -442,9 +442,7 @@ static int video_mux_probe(struct platform_device *pdev)
 	vmux->mux = devm_mux_control_get(dev, NULL);
 	if (IS_ERR(vmux->mux)) {
 		ret = PTR_ERR(vmux->mux);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get mux: %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to get mux\n");
 	}
 
 	mutex_init(&vmux->lock);
-- 
2.30.2

