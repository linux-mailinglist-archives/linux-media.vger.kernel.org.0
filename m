Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7456532D476
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 14:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234444AbhCDNrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 08:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237747AbhCDNqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 08:46:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61A0C061761
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 05:45:57 -0800 (PST)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CBE08E6;
        Thu,  4 Mar 2021 14:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614865554;
        bh=mlBYD1S2Pgo8VjmNtOQxRqBFXi6KJVipuAOl1xTOHqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UvXaSrzC/iFRZYlOGScblgj8WOUAkP9ZYspWuxPS1JhoN28eedGCCLgMyrG9oZ1QF
         AGEhJcstTV0jEOh61jFNtUenMNtSMcau54QAvLzI1OFoCGsIXKbxvYDqw2vtgLp35f
         7hNmuvdokpevtBzWKX+FIvUgaWi2MSuYyk7cYSHY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 2/3] media: ti-vpe: cal: fix subdev mbus_code enumeration
Date:   Thu,  4 Mar 2021 15:45:20 +0200
Message-Id: <20210304134521.1825150-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304134521.1825150-1-tomi.valkeinen@ideasonboard.com>
References: <20210304134521.1825150-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_ctx_v4l2_init_formats() function does not handle error values
correctly when calling enum_mbus_code in subdevs, causing an infinite
loop if the subdev's enum_mbus_code returns some other error than EINVAL.

Fix the error handling.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 47bea40c64c2..dd02af40491f 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -591,15 +591,21 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 				       sizeof(*ctx->active_fmt), GFP_KERNEL);
 	ctx->num_active_fmt = 0;
 
-	for (j = 0, i = 0; ret != -EINVAL; ++j) {
+	for (j = 0, i = 0; ; ++j) {
 
 		memset(&mbus_code, 0, sizeof(mbus_code));
 		mbus_code.index = j;
 		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_mbus_code,
 				       NULL, &mbus_code);
-		if (ret)
-			continue;
+		if (ret == -EINVAL)
+			break;
+
+		if (ret) {
+			ctx_err(ctx, "Error enumerating mbus codes in subdev %s: %d\n",
+					ctx->phy->sensor->name, ret);
+			return ret;
+		}
 
 		ctx_dbg(2, ctx,
 			"subdev %s: code: %04x idx: %u\n",
-- 
2.25.1

