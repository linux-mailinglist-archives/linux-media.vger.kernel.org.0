Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA687A0C5C
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240765AbjINSRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237421AbjINSQ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:16:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985FF1FFE
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:16:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B37612B62;
        Thu, 14 Sep 2023 20:15:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715320;
        bh=eAxZb4rNImSo9YP2IDVbyLjqo8ZcKkcoaG1ND2QyOK4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J0UEPHhwbnQw4n0VF2D+kBQCePcD3UU17uzmy3yGtxSm2kxnzRsjqXZXIAnBPpQnX
         X/n2MGAgHo+4En6BHY9ytUGVwczP6wUUQcm4iTJehWMD6JpbFeQupq99so0TZ0tWiC
         3v5zHXEGP0npUIdCZa+2faLhBSgTBK8gd/gsj3Ps=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 02/57] media: i2c: hi556: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:09 +0300
Message-ID: <20230914181704.4811-3-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/hi556.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index fd56ba138739..2b00426c5826 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -976,9 +976,6 @@ static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (hi556->streaming == enable)
-		return 0;
-
 	mutex_lock(&hi556->mutex);
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

