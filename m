Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0700660155
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 14:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbjAFNeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 08:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbjAFNdg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 08:33:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE8E777FF
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 05:32:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A18C3A25;
        Fri,  6 Jan 2023 14:32:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673011961;
        bh=X0dFH/gmunl388tMMCumMCn9tAyvU3iA4YGBSbMoUA4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oeXxF8FlcEp/bqRYzv+A71TKyP602ossAAkvtG2K65b83DRCt2y8KM+s256ArlzGD
         sWQCM+5dcEyc0yUZ1umaN89K41hY/EIqFVEixaNUv1mbzv2ARNplpjW1kwRcSflbaA
         +54ZcLo5Nk+agU0Gp0KLT6jwbeBLpRyvYyjY4ODc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 6/6] media: imx-pxp: Use non-threaded IRQ
Date:   Fri,  6 Jan 2023 15:32:27 +0200
Message-Id: <20230106133227.13685-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
References: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/nxp/imx-pxp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index e4d7a6339929..28a222c8fe86 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1814,8 +1814,8 @@ static int pxp_probe(struct platform_device *pdev)
 
 	spin_lock_init(&dev->irqlock);
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
-			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
+	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler,
+			       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev), dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
 		return ret;
-- 
Regards,

Laurent Pinchart

