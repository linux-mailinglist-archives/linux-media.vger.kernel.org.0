Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6266684F9
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 22:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240505AbjALVFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 16:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241146AbjALVEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 16:04:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD84410F6
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 12:48:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3973492;
        Thu, 12 Jan 2023 21:48:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673556533;
        bh=G4FvuR0pfbQIJW78/roAca3lVmTzxbiW36ChAXf4GrM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z2WjNDRFKv725BHWO9xSqvLKjfA86kvSGgFZVVJb5NBM9fIiCC60cN3FbjfUSen4N
         ISvEKNENt+NXV2GWIgPnXPtN3zkfWd/tLCfgiuBsVpGhvGjCnpGNZ2vIxnv4x0qhog
         +JYccCz3Z/X5qeJY+4dXCzqh2o5V3r9Kz3ul7B5w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2.1 7/7] media: imx-pxp: Use non-threaded IRQ
Date:   Thu, 12 Jan 2023 22:48:52 +0200
Message-Id: <20230112204852.16282-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230112172507.30579-8-laurent.pinchart@ideasonboard.com>
References: <20230112172507.30579-8-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to use threaded IRQs with the PXP, as the interrupt
handler doesn't need to sleep and doesn't perform any time-consuming
operation. Switch to regular IRQ handler.

This fixes lockups of the PXP noticed on i.MX7, where the PXP would stop
generating interrupts after a variable number of frames (from a few
dozens to a few hundreds). The root cause is however unknown.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes since v2:

- Drop IRQF_TRIGGER_HIGH
---
 drivers/media/platform/nxp/imx-pxp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index aaafaf37439c..e18cfbb6e721 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1812,8 +1812,8 @@ static int pxp_probe(struct platform_device *pdev)
 
 	spin_lock_init(&dev->irqlock);
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
-			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
+	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler, 0,
+			       dev_name(&pdev->dev), dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
 		return ret;
-- 
Regards,

Laurent Pinchart

