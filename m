Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4510B1F8B90
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgFOABA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbgFOAA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:59 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BCA31262;
        Mon, 15 Jun 2020 02:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179228;
        bh=FJ3/5uOiegHperfjvCmlSOnMUCTbKlP8QngfeCSCkWw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DfE/Zc+vLm3zHEANym/7R0sX3XJiWVcJdCRaHr4NZxsE0VKpq5zrPMqKOF6J0iO2S
         k0FftGk0kJknhZqf6uzF2HUyM+Gnx7O4AL+/kHPeFq+G9lcwE40JgoTpKISHeFO0/q
         xqBZ1hsvu7bFAjTUfNjnycodWYUXLetcxu8GFytI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 040/107] media: ti-vpe: cal: Use ctx_info() instead of v4l2_info()
Date:   Mon, 15 Jun 2020 02:58:37 +0300
Message-Id: <20200614235944.17716-41-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the context-specific print macro to replace the last usage of the
v4l2_* print macros.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 10baca7cfcee..e353b1b0f6f9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1887,8 +1887,8 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	if (ret < 0)
 		return ret;
 
-	v4l2_info(&ctx->v4l2_dev, "V4L2 device registered as %s\n",
-		  video_device_node_name(vfd));
+	ctx_info(ctx, "V4L2 device registered as %s\n",
+		 video_device_node_name(vfd));
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

