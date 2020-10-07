Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD16285CFA
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 12:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgJGKgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 06:36:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46312 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbgJGKgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 06:36:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9461429C191
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 4/6] coda: Clarify interrupt registered name
Date:   Wed,  7 Oct 2020 07:35:42 -0300
Message-Id: <20201007103544.22807-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007103544.22807-1-ezequiel@collabora.com>
References: <20201007103544.22807-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make interrupt naming more consistent by using a common
pattern for video and jpeg interrupts.

With this commit, interrupts are shown as:

29:          0          0       GPC  12 Level     coda-video
30:          0          0       GPC   3 Level     coda-jpeg

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index a72ea4bb37d7..487dd653b24a 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -3153,7 +3153,7 @@ static int coda_probe(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
-			       dev_name(&pdev->dev), dev);
+			       CODA_NAME "-video", dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
 		return ret;
@@ -3167,7 +3167,7 @@ static int coda_probe(struct platform_device *pdev)
 
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						coda9_jpeg_irq_handler,
-						IRQF_ONESHOT, CODA_NAME " jpeg",
+						IRQF_ONESHOT, CODA_NAME "-jpeg",
 						dev);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "failed to request jpeg irq\n");
-- 
2.27.0

