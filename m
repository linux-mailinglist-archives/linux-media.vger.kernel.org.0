Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01CCB7A0C5E
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240909AbjINSRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240824AbjINSRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD2E1FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:16:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB41F2F6C;
        Thu, 14 Sep 2023 20:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715324;
        bh=bR3ME9c4+i32bvAV0L2n/YR4gk4bSmeKSBZvGUW+OUY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mqsPRiOWv/uuLq9jCWaY5QQnxzV1T4pjQjisyARchPAhC0U4CVnPiF0KIVJ/0DjQ2
         fH6mHfRyNkzoGHeoYKRJvEMo7AdpcF0/3aT2jyjP7Sra7OIFul8Sx5PjYuwvVxi7CC
         4Na4cP7k61pMcXwGoKNtQREygFqHbSyng/hG067s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 04/57] media: i2c: imx208: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:11 +0300
Message-ID: <20230914181704.4811-5-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx208.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index ee5a28675388..871f857cf8b6 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -714,10 +714,6 @@ static int imx208_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	mutex_lock(&imx208->imx208_mx);
-	if (imx208->streaming == enable) {
-		mutex_unlock(&imx208->imx208_mx);
-		return 0;
-	}
 
 	if (enable) {
 		ret = pm_runtime_get_sync(&client->dev);
-- 
Regards,

Laurent Pinchart

