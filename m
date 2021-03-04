Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E3232D472
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 14:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239098AbhCDNq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 08:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234444AbhCDNqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 08:46:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D88C061756
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 05:45:56 -0800 (PST)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63FAC6F3;
        Thu,  4 Mar 2021 14:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614865553;
        bh=VKLckr2ePQ55xCYtgHQ1s0DA0rMlJyooC8hvSMu2xrc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iRK9O5PXR47wDLBhDYJWHP1PROb97fxlG7dJ2UhIldFVCzvrsPuD0kJFk3waCpfni
         wqgcJUir2qbdzb0XTJdUT6NHQkRS/YAF+YR/UPO4hH3+QEsROqj7559KDv7JaBJrZp
         pWTZY+lbN9a4a3o720vvbyhHJboP5Lhk7NROtW6o=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 1/3] media: ti-vpe: cal: remove unneeded assignment
Date:   Thu,  4 Mar 2021 15:45:19 +0200
Message-Id: <20210304134521.1825150-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304134521.1825150-1-tomi.valkeinen@ideasonboard.com>
References: <20210304134521.1825150-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_fill_pix_format() already copies mbus_fmt.field, so no need to do
it again.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 779f1e1bc529..47bea40c64c2 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -640,7 +640,6 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
 	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	ctx->v_fmt.fmt.pix.pixelformat = fmtinfo->fourcc;
-	ctx->v_fmt.fmt.pix.field = mbus_fmt.field;
 	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
 	ctx->fmtinfo = fmtinfo;
 
-- 
2.25.1

