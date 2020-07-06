Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB21215E9A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729921AbgGFSiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729777AbgGFSiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:10 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40B7A1959;
        Mon,  6 Jul 2020 20:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060676;
        bh=r6LGGN7pc3uEjjt1+gQj97oh66y2c/pBSHvoCJ/C71M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pi2o8DGIVhv6h7o4IECJ8ycl2BUhn6M9pRSc05oIoEKqjDxBh6GNGQySok//VBCCs
         YRSWGeD7AYyrAkNC9PzsHVzAvtY2TikZczT0hWmoCEUHPCOcVSh8PAnda9obpYpaYh
         U6XSsAEUa5F5+OTu4vlwH+y5fMeK8TthxM+/6FwU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 041/108] media: ti-vpe: cal: Use ctx_info() instead of v4l2_info()
Date:   Mon,  6 Jul 2020 21:36:02 +0300
Message-Id: <20200706183709.12238-42-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the context-specific print macro to replace the last usage of the
v4l2_* print macros.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 22679baec364..b55c8fb369a0 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1893,8 +1893,8 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
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

