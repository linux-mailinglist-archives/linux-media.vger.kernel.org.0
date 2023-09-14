Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DED37A0C60
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240948AbjINSRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240866AbjINSRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF881FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:16:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4374E8622;
        Thu, 14 Sep 2023 20:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715325;
        bh=ilcnb6W+71vjxE6vZY6TN1eg7mYuAo+frvOXuhxOkB8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZX56JbWW1aPVRh3qt118/tg4MhT9Hsw5WZ2n+MoN8NzjjyWuUoyYD+qw3ApLpuTo1
         Au4rp0WqIaK5+I49hSaV9LfP6HapfwfZtO4MKmoaP2Kjdtrn/0eGn/Sy3BJfjPYZ46
         tWIBwaO48Yt31/+2hEPxMoQzmizUmC1x2mPrJgyk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH 05/57] media: i2c: imx214: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:12 +0300
Message-ID: <20230914181704.4811-6-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx214.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 2f9c8582f940..e2805173f4b1 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -775,9 +775,6 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 	struct imx214 *imx214 = to_imx214(subdev);
 	int ret;
 
-	if (imx214->streaming == enable)
-		return 0;
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx214->dev);
 		if (ret < 0)
-- 
Regards,

Laurent Pinchart

