Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72A336C6E8
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236734AbhD0NVS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:21:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235875AbhD0NVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:21:18 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EC2845E;
        Tue, 27 Apr 2021 15:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619529633;
        bh=7Iz4caLNEDfByE9lqqkUHl6vWLpQfaR85UOV4GY6zBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RTxp2in023vA4mvkcdp3T4fhhZZI0OpgXfGR6GTMhe6O1w7R1r4/UAk5V0kO9KziE
         1B9xbFqMR0JXM4XdssEW4O/0ZSMKuOkHnQtU17WpnzOSNNJ9/0iPNG3GWfS/ehkf6Y
         4Swk0Gk9HFKfBzx5rbH1nNc6DAu7mtPUNzBpBH2w=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 1/4] media: ti-vpe: cal: add embedded data support
Date:   Tue, 27 Apr 2021 16:20:25 +0300
Message-Id: <20210427132028.1005757-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
References: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
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

