Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5A27A0C76
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241311AbjINSRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240632AbjINSRf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901E51FD7
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E55887E3;
        Thu, 14 Sep 2023 20:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715357;
        bh=kK+SomDiYNZE87UeT77XObwLhMFo8coI0OWiSdKjg3Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W5gDWH1KwgJTno67SlKH7Kpv3rkiuOuvWZ/ZM09t10NlmpLyZJQH6EAyoZAqbBmND
         QiNuR8NdBAcGiouUgLUB8pU4iqTV2l9SxFuEf2z+AUVn0ypTIpGdVIwq+MkFrms8B9
         d1tgt49MoAkBG4EgKS3Z4rraB6697pszMy5i6ZMU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 27/57] media: i2c: ov7740: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:34 +0300
Message-ID: <20230914181704.4811-28-laurent.pinchart@ideasonboard.com>
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

The streaming field of the driver's private structure is now unused,
drop it as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov7740.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index dffdb475e433..2f76029e9a9b 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -120,7 +120,6 @@ struct ov7740 {
 	struct v4l2_ctrl *contrast;
 
 	struct mutex mutex;	/* To serialize asynchronus callbacks */
-	bool streaming;		/* Streaming on/off */
 
 	struct gpio_desc *resetb_gpio;
 	struct gpio_desc *pwdn_gpio;
@@ -618,10 +617,6 @@ static int ov7740_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	mutex_lock(&ov7740->mutex);
-	if (ov7740->streaming == enable) {
-		mutex_unlock(&ov7740->mutex);
-		return 0;
-	}
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
@@ -635,8 +630,6 @@ static int ov7740_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov7740->streaming = enable;
-
 	mutex_unlock(&ov7740->mutex);
 	return ret;
 
-- 
Regards,

Laurent Pinchart

