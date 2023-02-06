Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F54C68C9BD
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 23:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjBFWrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 17:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBFWrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 17:47:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDEA30292
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 14:47:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C773891;
        Mon,  6 Feb 2023 23:47:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675723624;
        bh=h7n9UsfXeiMdrGt0kESMnPuAX/aGYzUDgq1j50Ui4As=;
        h=From:To:Cc:Subject:Date:From;
        b=MA4Hw6imTl/vrnX7arvhqoQo24T9qPUkMxbmDkFOIeORoIbxxi9B/2sue0iQ1zqK5
         VSzyvlJKybi0XaZ0fCtfqvYWd2Z8qdf7wwJS8OWRcMFwnIWZ+84XQwJXIyfbM3Yuv9
         yW4v+aZcN9hyxIYbjSs3YFqpmfXFl/kWjpUp5pK8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH] media: i2c: imx296: Use v4l2_subdev_get_fmt()
Date:   Tue,  7 Feb 2023 00:47:02 +0200
Message-Id: <20230206224702.6412-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
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

The imx296 driver uses the subdev active state, there's no need to
implement the .get_fmt() operation manually. Use the
v4l2_subdev_get_fmt() helper instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx296.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 3c12b6edeac9..4f22c0515ef8 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -685,15 +685,6 @@ static int imx296_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int imx296_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *state,
-			     struct v4l2_subdev_format *fmt)
-{
-	fmt->format = *v4l2_subdev_get_pad_format(sd, state, fmt->pad);
-
-	return 0;
-}
-
 static int imx296_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *fmt)
@@ -845,7 +836,7 @@ static const struct v4l2_subdev_video_ops imx296_subdev_video_ops = {
 static const struct v4l2_subdev_pad_ops imx296_subdev_pad_ops = {
 	.enum_mbus_code = imx296_enum_mbus_code,
 	.enum_frame_size = imx296_enum_frame_size,
-	.get_fmt = imx296_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx296_set_format,
 	.get_selection = imx296_get_selection,
 	.set_selection = imx296_set_selection,
-- 
Regards,

Laurent Pinchart

