Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 002AF7AC324
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbjIWPVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbjIWPV3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A22A192
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276CCC43397;
        Sat, 23 Sep 2023 15:21:21 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCHv2 09/23] media: renesas-ceu: keep input name simple
Date:   Sat, 23 Sep 2023 17:20:53 +0200
Message-Id: <20230923152107.283289-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just show the Camera index as input name in VIDIOC_ENUM_INPUT,
no need to show the subdev name as well as that is meaningless for
users anyway.

This fixes this compiler warning:

drivers/media/platform/renesas/renesas-ceu.c: In function 'ceu_enum_input':
drivers/media/platform/renesas/renesas-ceu.c:1195:59: warning: '%s' directive output may be truncated writing up to 47 bytes into a region of size between 14 and 23 [-Wformat-truncation=]
 1195 |         snprintf(inp->name, sizeof(inp->name), "Camera%u: %s",
      |                                                           ^~
drivers/media/platform/renesas/renesas-ceu.c:1195:9: note: 'snprintf' output between 10 and 66 bytes into a destination of size 32
 1195 |         snprintf(inp->name, sizeof(inp->name), "Camera%u: %s",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1196 |                  inp->index, ceusd->v4l2_sd->name);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/renesas-ceu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index ec631c6e2a57..2562b30acfb9 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1183,17 +1183,13 @@ static int ceu_enum_input(struct file *file, void *priv,
 			  struct v4l2_input *inp)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
-	struct ceu_subdev *ceusd;
 
 	if (inp->index >= ceudev->num_sd)
 		return -EINVAL;
 
-	ceusd = ceudev->subdevs[inp->index];
-
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
 	inp->std = 0;
-	snprintf(inp->name, sizeof(inp->name), "Camera%u: %s",
-		 inp->index, ceusd->v4l2_sd->name);
+	snprintf(inp->name, sizeof(inp->name), "Camera %u", inp->index);
 
 	return 0;
 }
-- 
2.40.1

