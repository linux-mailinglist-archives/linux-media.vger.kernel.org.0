Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83FD550D19
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 23:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbiFSVZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jun 2022 17:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbiFSVZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jun 2022 17:25:35 -0400
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr [80.12.242.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CED57672
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 14:25:34 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id 32QFoWEgkdfes32QFoKAEl; Sun, 19 Jun 2022 23:25:32 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 19 Jun 2022 23:25:32 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Zheyu Ma <zheyuma97@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: tw686x: Fix an error handling path in tw686x_probe()
Date:   Sun, 19 Jun 2022 23:25:29 +0200
Message-Id: <c72fe5a6f5944820de52e4957bc1d804bd214a66.1655673905.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The commit in Fixes is incomplete. It has moved some code in the probe but
not all error handling path have been updated.

Now, ff request_irq() fails we must release some resources.

Fixes: c8946454ed96 ("media: tw686x: Register the irq at the end of probe")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/pci/tw686x/tw686x-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
index 384d38754a4b..af83ebf8eea4 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -337,12 +337,15 @@ static int tw686x_probe(struct pci_dev *pci_dev,
 			  dev->name, dev);
 	if (err < 0) {
 		dev_err(&pci_dev->dev, "unable to request interrupt\n");
-		goto iounmap;
+		goto tw868x_free;
 	}
 
 	pci_set_drvdata(pci_dev, dev);
 	return 0;
 
+tw868x_free:
+	tw686x_video_free(dev);
+	tw686x_audio_free(dev);
 iounmap:
 	pci_iounmap(pci_dev, dev->mmio);
 free_region:
-- 
2.34.1

