Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79404215E98
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbgGFSiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729915AbgGFSiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:08 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C96A818EE;
        Mon,  6 Jul 2020 20:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060674;
        bh=d+8AEJahpGxXBoICSykd/VajUMwmiIQYy3hFd9lykRE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TaTuvtGp5rv9bJcAFA+LVywuLHMFzwSRXliZbCcM2XqK2VPeP6R9SxjsErG286tTd
         AsA+Q+nTgt6aL79fQqKtAZvg6RYDaWrdo+FYuwSn7lAYJNjvWSXhUMSSDg/Z6P7N2i
         qobJ26uOdxXyFT5sLThKUW9ma1qwK91nwv5kYGMo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 040/108] media: ti-vpe: cal: Get struct device without going through v4l2_device
Date:   Mon,  6 Jul 2020 21:36:01 +0300
Message-Id: <20200706183709.12238-41-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of retrieving the struct device for the platform device from the
v4l2_device, get it from the platform device directly. This prepares for
cleanups related to v4l2_device handling.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 028479498c07..22679baec364 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1868,7 +1868,7 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &ctx->mutex;
 	q->min_buffers_needed = 3;
-	q->dev = ctx->v4l2_dev.dev;
+	q->dev = &ctx->cal->pdev->dev;
 
 	ret = vb2_queue_init(q);
 	if (ret)
-- 
Regards,

Laurent Pinchart

