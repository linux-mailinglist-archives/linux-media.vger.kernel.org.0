Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84E138E511
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbhEXLLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232787AbhEXLLS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:11:18 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7CF31575;
        Mon, 24 May 2021 13:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854577;
        bh=YfghHzsF6gYIJRzTdsee8m9IEv+OexZMN+IwMn07WeQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r7FvavykfF+csUMX138EZ5DZPUN8qBJQlHU98qaBRYoyv/vKDjagDF0LCIiZrO/2l
         mUTW8WeJr3fx/QG80sUgzrIGkjzFuAiKtGepdNR8bXRqmqLEmX0j6+iLE1n4ThOIIa
         yk4sdq5+c223IKavmLGV5lhDsH41bYRX5V9RHxBc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 36/38] media: ti-vpe: cal: add embedded data support
Date:   Mon, 24 May 2021 14:09:07 +0300
Message-Id: <20210524110909.672432-37-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for capturing embedded data from the sensor. The only
difference with capturing pixel data and embedded data is that we need
to ensure the PIX PROC is disabled for embedded data so that CAL doesn't
repack the data.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 17 ++++++++++-------
 drivers/media/platform/ti-vpe/cal.h |  1 +
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 62c45add4efe..fcc81024ae18 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -473,14 +473,17 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
 {
 	int ret;
 
-	ret = cal_reserve_pix_proc(ctx->cal);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
-		return ret;
-	}
+	ctx->use_pix_proc = !ctx->fmtinfo->meta;
+
+	if (ctx->use_pix_proc) {
+		ret = cal_reserve_pix_proc(ctx->cal);
+		if (ret < 0) {
+			ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
+			return ret;
+		}
 
-	ctx->pix_proc = ret;
-	ctx->use_pix_proc = true;
+		ctx->pix_proc = ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 42a3f8004077..29b865d1a238 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -88,6 +88,7 @@ struct cal_format_info {
 	u32	code;
 	/* Bits per pixel */
 	u8	bpp;
+	bool	meta;
 };
 
 /* buffer for one video frame */
-- 
2.25.1

