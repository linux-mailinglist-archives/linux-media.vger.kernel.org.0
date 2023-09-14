Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488D07A0C6C
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241182AbjINSRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241200AbjINSRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E214F1FFC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A3DA1ABC;
        Thu, 14 Sep 2023 20:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715343;
        bh=4bpyC9pjobkvzmVXDWgBSmPotzgXtw+9b8kmqYx5E58=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r0IGPgLANCnKxqNHrQUX0885ctuOmZgHB3wVooZsMwQdiWLHD4ZEWF7pIb8FGfU6p
         R3fjADZhrxsEDDaEWO2sJThKTRgW6vB3yREHr3vrYG8caxrPO5MhLH+q5zE2FcRIOV
         UAS2KSGoqInBuyf6DjjW0CnZcVMB1RtFRCBlrtQE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH 17/57] media: i2c: ov08x40: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:24 +0300
Message-ID: <20230914181704.4811-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev .s_stream() operation shall not be called to start streaming
on an already started subdev, or stop streaming on a stopped subdev.
Remove the check that guards against that condition.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov08x40.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 637da4df6901..1ea402550837 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2915,10 +2915,6 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	mutex_lock(&ov08x->mutex);
-	if (ov08x->streaming == enable) {
-		mutex_unlock(&ov08x->mutex);
-		return 0;
-	}
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

