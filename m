Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3CCF7A0C6B
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241180AbjINSRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241031AbjINSRT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840321FFC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C3FD15EF;
        Thu, 14 Sep 2023 20:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715341;
        bh=v1dDtGX8Hgn9Sfbq/eGJan/NW5mODkR4Lzg+s2/Z5po=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UpujOy7AzdjqcD444QYWC690CYr76HcgtuN51AEVPKDSMSHkAaSOyjhDtGomnYDef
         a4Ce7jObJIVq/EWxYmmxT2Vnf9l6qo5tiDZnb4ucK+yxf5xQ9QA+DwZgdWDIFLfM+I
         sdBk/kQkvsz9YTzdh2ronDm7aKkuULk9ZW2KhMoc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, Jimmy Su <jimmy.su@intel.com>
Subject: [PATCH 16/57] media: i2c: ov08d10: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:23 +0300
Message-ID: <20230914181704.4811-17-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov08d10.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 7d55d4ca24de..ef811711549c 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1103,9 +1103,6 @@ static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (ov08d10->streaming == enable)
-		return 0;
-
 	mutex_lock(&ov08d10->mutex);
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

