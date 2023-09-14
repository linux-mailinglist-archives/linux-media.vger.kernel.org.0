Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55687A0C69
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241088AbjINSRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241084AbjINSRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B60D1FD7
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A23E18622;
        Thu, 14 Sep 2023 20:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715338;
        bh=so2o3/JcMpjgwLRu10OkI0/TOGjok5XT8gjaux+BHDo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n1o8ltoNZ0MpajBrb0wHYdq4gKNAlCXedw7EbdUgKIZD9PLj1sXhXzuW5WAFynpyj
         U5hJmXGQCe5ezXRSGmNGMNgO5mWzTkfMZwlcCzwtUk6/AbR0DWkrU2an3sGegHbmzn
         2DO5fIvJZ96duud8cAUpzUba/dedzrlCGQFhtJOw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 14/57] media: i2c: og01a1b: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:21 +0300
Message-ID: <20230914181704.4811-15-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/og01a1b.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 365ce5684583..ab8381c52503 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -732,9 +732,6 @@ static int og01a1b_set_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (og01a1b->streaming == enable)
-		return 0;
-
 	mutex_lock(&og01a1b->mutex);
 	if (enable) {
 		ret = pm_runtime_get_sync(&client->dev);
-- 
Regards,

Laurent Pinchart

