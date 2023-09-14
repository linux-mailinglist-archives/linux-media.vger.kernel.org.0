Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A313E7A0C74
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241166AbjINSRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241276AbjINSRc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740441FD7
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C6DD1ABC;
        Thu, 14 Sep 2023 20:15:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715354;
        bh=OpeQcGZZZtp+vB01IjNzCUHWT/FMUmFAJwu33tZL2+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fMfXFl0gWHNszBdfGywu66IvXB81D52YdqQYOMM+WcrzShTFCClkGbOcjo56pwGCf
         FGh6ftl29g4FUZCCZ0M5sJMzO+hKENugyCZKIjVxTYl96MMGqbfXixxu4IFl0Dt7Ko
         bx+xXe3geOrzqLPBxSrupT7cJpnk24+DiNiYKH3M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 25/57] media: i2c: ov5675: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:32 +0300
Message-ID: <20230914181704.4811-26-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov5675.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index d5a2a5f82312..f608ee0c0cec 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -949,9 +949,6 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (ov5675->streaming == enable)
-		return 0;
-
 	mutex_lock(&ov5675->mutex);
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

