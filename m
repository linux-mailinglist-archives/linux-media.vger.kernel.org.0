Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4763A65F9
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbhFNLrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:47:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58338 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbhFNLqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:46:13 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BD8B5EC5;
        Mon, 14 Jun 2021 13:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669857;
        bh=/GCe4WxbuPYUpFpor5q6wvjiITeRVxN8SWt4S7rpTHI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tXW+xTstPLizxgDSeBeB6i3ItaaHBh40R7ZV/vxtMpzAmf2pNUF3yHyVvhsbADNek
         hFgNllrQ5o/h+oMoKK3j5/24hll9fE6moLO9SrbuybylAFx0ZgB/KjjbplQtGBqKCf
         sOrUOh2nrQeDk0fVgDME4Se3jqhIhs25FchUDwAI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 35/35] media: ti-vpe: cal: add embedded data support
Date:   Mon, 14 Jun 2021 14:23:45 +0300
Message-Id: <20210614112345.2032435-36-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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
index cce627c5519c..05bdc6d126d8 100644
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
 
-	ctx->pix_proc = ret;
-	ctx->use_pix_proc = true;
+	if (ctx->use_pix_proc) {
+		ret = cal_reserve_pix_proc(ctx->cal);
+		if (ret < 0) {
+			ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
+			return ret;
+		}
+
+		ctx->pix_proc = ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index d3e89d2ee10f..527e22d022f3 100644
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

