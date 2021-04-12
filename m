Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D00435C555
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240581AbhDLLfz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240559AbhDLLfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:52 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B8F3E0A;
        Mon, 12 Apr 2021 13:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227334;
        bh=e52EFO+sNEc7iAbnTvyYw1dj7al5QKYrsYsCBus8eIE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tw4L+UU1yq8qIF/rzX7HkMu2HvTlOYwamF6xFEibNuefUqZc9nDXaxnJ37uAS1Op6
         RYBnJzI9/yMgcSrD74J4kbx9o+7yTlrw+Sg5CqDksVmTIACgzrkZMh2rA91z/u5mbs
         JPJ1ucyI76jUaR7tB+54C/16Yb8ZfmWSNYUPNpBU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 21/28] media: ti-vpe: cal: fix cal_ctx_v4l2_register error handling
Date:   Mon, 12 Apr 2021 14:34:50 +0300
Message-Id: <20210412113457.328012-22-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_ctx_v4l2_register() returns an error code, but the returned error
code is not handled anywhere. However, we can't really even handle the
error in any proper way, so lets just drop the return value and make
sure all error paths have an error print.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 16 ++++++++--------
 drivers/media/platform/ti-vpe/cal.h       |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 064efdc31b28..ea9b13c16a06 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -864,14 +864,16 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	return 0;
 }
 
-int cal_ctx_v4l2_register(struct cal_ctx *ctx)
+void cal_ctx_v4l2_register(struct cal_ctx *ctx)
 {
 	struct video_device *vfd = &ctx->vdev;
 	int ret;
 
 	ret = cal_ctx_v4l2_init_formats(ctx);
-	if (ret)
-		return ret;
+	if (ret) {
+		ctx_err(ctx, "Failed to init formats: %d\n", ret);
+		return;
+	}
 
 	if (!cal_mc_api) {
 		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
@@ -880,14 +882,14 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 					    NULL, true);
 		if (ret < 0) {
 			ctx_err(ctx, "Failed to add source ctrl handler\n");
-			return ret;
+			return;
 		}
 	}
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to register video device\n");
-		return ret;
+		return;
 	}
 
 	ret = media_create_pad_link(&ctx->phy->subdev.entity,
@@ -899,13 +901,11 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 		ctx_err(ctx, "Failed to create media link for context %u\n",
 			ctx->dma_ctx);
 		video_unregister_device(vfd);
-		return ret;
+		return;
 	}
 
 	ctx_info(ctx, "V4L2 device registered as %s\n",
 		 video_device_node_name(vfd));
-
-	return 0;
 }
 
 void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 8aa93c92193a..ad7d26c803eb 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -310,7 +310,7 @@ void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr);
 void cal_ctx_start(struct cal_ctx *ctx);
 void cal_ctx_stop(struct cal_ctx *ctx);
 
-int cal_ctx_v4l2_register(struct cal_ctx *ctx);
+void cal_ctx_v4l2_register(struct cal_ctx *ctx);
 void cal_ctx_v4l2_unregister(struct cal_ctx *ctx);
 int cal_ctx_v4l2_init(struct cal_ctx *ctx);
 void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx);
-- 
2.25.1

