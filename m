Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F1F4358EC
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 05:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhJUDVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 23:21:31 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:3730 "EHLO
        cmccmta3.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhJUDVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 23:21:30 -0400
X-Greylist: delayed 573 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Oct 2021 23:21:29 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb6170d9e724c-10784; Thu, 21 Oct 2021 11:09:27 +0800 (CST)
X-RM-TRANSID: 2eeb6170d9e724c-10784
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
        by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56170d9e370f-44539;
        Thu, 21 Oct 2021 11:09:27 +0800 (CST)
X-RM-TRANSID: 2ee56170d9e370f-44539
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     kieran.bingham+renesas@ideasonboard.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] media: rcar_fdp1: Fix the correct variable assignments
Date:   Thu, 21 Oct 2021 11:09:38 +0800
Message-Id: <20211021030938.51884-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the function fdp1_probe(), when get irq failed, the
function platform_get_irq() log an error message, so
remove redundant message here. And the variable type
of "ret" is int, the "fdp1->irq" is unsigned int, when
irq failed, this place maybe wrong, thus fix it.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/media/platform/rcar_fdp1.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 89aac6006..d79bf1461 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2289,11 +2289,10 @@ static int fdp1_probe(struct platform_device *pdev)
 		return PTR_ERR(fdp1->regs);
 
 	/* Interrupt service routine registration */
-	fdp1->irq = ret = platform_get_irq(pdev, 0);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "cannot find IRQ\n");
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
 		return ret;
-	}
+	fdp1->irq = ret;
 
 	ret = devm_request_irq(&pdev->dev, fdp1->irq, fdp1_irq_handler, 0,
 			       dev_name(&pdev->dev), fdp1);
-- 
2.20.1.windows.1



