Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9995E7A0C6D
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241200AbjINSRX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241218AbjINSRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BC31FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65D3B87E7;
        Thu, 14 Sep 2023 20:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715344;
        bh=Wkq78RO/IgLtHN/GVdb0Qyf4zRJgliIEmDwZ2YFPjZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O/u9dByRTkIw3nxAzbxYW+0nMDKddpnbpbGfW0npoSFqtQ8bxaO6xgMSwVcj1IdSz
         HHy87uh+NvBCgQpUXkscE0PPmQ8HCP93KGUrT/KSFZZDiSze9j+cgyS6DbT5OVcb/I
         14LY+yyxeKKKKXq+1pM2PLwOzWVWrYFf5Km1M3mI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 18/57] media: i2c: ov13858: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:25 +0300
Message-ID: <20230914181704.4811-19-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov13858.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 35652b362347..b90ce338a47a 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1467,10 +1467,6 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	mutex_lock(&ov13858->mutex);
-	if (ov13858->streaming == enable) {
-		mutex_unlock(&ov13858->mutex);
-		return 0;
-	}
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

