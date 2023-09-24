Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0C97ACA8D
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjIXPd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjIXPd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987A4115
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DAB91AB9;
        Sun, 24 Sep 2023 17:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569498;
        bh=5hLYqndXx/WZTC3MTVZgNK2v2GwRSsslg4Eq7MmohRY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UPOws0VKS/stbd/CmyhcwWcJf/HOU0kF8Z3cqvrCvf9AbyiQCjayJScrTMrGYkz7v
         DisDtIERdc4F5qwxst7oshBbYWs/4+gjc4EZ/N3doBl8TUs/mxm9HwI9GIQvgACLWw
         NDrfxGd84swAjcNrr1GqLT1v7sNd+WylwjpEojeI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 15/20] media: i2c: imx219: Remove unneeded goto
Date:   Sun, 24 Sep 2023 18:33:04 +0300
Message-ID: <20230924153309.12423-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the imx219_set_stream() by removing an unneeded goto statement,
and its corresponding error label. The natural flow of the function is
correct.

While at it, drop a useless comment.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index dfc5ce574227..a12ebf288dd2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -760,19 +760,11 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	if (enable) {
-		/*
-		 * Apply default & customized values
-		 * and then start streaming.
-		 */
+	if (enable)
 		ret = imx219_start_streaming(imx219, state);
-		if (ret)
-			goto unlock;
-	} else {
+	else
 		imx219_stop_streaming(imx219);
-	}
 
-unlock:
 	v4l2_subdev_unlock_state(state);
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

