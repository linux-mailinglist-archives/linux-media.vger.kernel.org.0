Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A67712467
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 00:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfEBWBE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 18:01:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42710 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfEBWBE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 18:01:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D0E0428251E
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 3/4] media: coda: Replace the threaded interrupt with a hard interrupt
Date:   Thu,  2 May 2019 19:00:44 -0300
Message-Id: <20190502220045.14962-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502220045.14962-1-ezequiel@collabora.com>
References: <20190502220045.14962-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current interrupt handler is doing very little, and not doing
any non-atomic operations. Pretty much all it does is accessing
a couple registers, taking a couple spinlocks and then signalling
a completion.

There is no reason this should be a threaded interrupt handler,
so move the handler to regular hard interrupt context.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/coda/coda-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 39421ded5c63..a8848a4e927a 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2789,8 +2789,8 @@ static int coda_probe(struct platform_device *pdev)
 		return irq;
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, coda_irq_handler,
-			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
+	ret = devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
+			       dev_name(&pdev->dev), dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
 		return ret;
-- 
2.20.1

