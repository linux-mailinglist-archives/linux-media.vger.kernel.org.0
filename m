Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3367AB276
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 14:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbjIVM6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 08:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjIVM6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 08:58:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC24CE
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 05:58:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B3FC433CB;
        Fri, 22 Sep 2023 12:58:41 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 2/6] media: renesas-ceu: keep input name simple
Date:   Fri, 22 Sep 2023 14:58:33 +0200
Message-Id: <20230922125837.3290073-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230922125837.3290073-1-hverkuil-cisco@xs4all.nl>
References: <20230922125837.3290073-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Cc: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/pci/zoran/zoran.h              | 2 +-
 drivers/media/platform/renesas/renesas-ceu.c | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
index 56340553b282..efbb1466595f 100644
--- a/drivers/media/pci/zoran/zoran.h
+++ b/drivers/media/pci/zoran/zoran.h
@@ -173,7 +173,7 @@ struct card_info {
 	int inputs;		/* number of video inputs */
 	struct input {
 		int muxsel;
-		char name[32];
+		char name[42];
 	} input[BUZ_MAX_INPUT];
 
 	v4l2_std_id norms;
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

