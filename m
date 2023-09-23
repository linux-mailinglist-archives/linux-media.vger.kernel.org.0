Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573E67AC327
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbjIWPVe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbjIWPVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF75192
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080E2C433C9;
        Sat, 23 Sep 2023 15:21:25 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 12/23] media: v4l2-subdev.h: increase struct v4l2_subdev name size
Date:   Sat, 23 Sep 2023 17:20:56 +0200
Message-Id: <20230923152107.283289-13-hverkuil-cisco@xs4all.nl>
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

This resolves a lot of the string truncate compiler warnings.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/omap4iss/iss_csi2.c | 2 +-
 include/media/v4l2-subdev.h               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
index 04ce0e7eb557..d2844414de4f 100644
--- a/drivers/staging/media/omap4iss/iss_csi2.c
+++ b/drivers/staging/media/omap4iss/iss_csi2.c
@@ -1260,7 +1260,7 @@ static int csi2_init_entities(struct iss_csi2_device *csi2, const char *subname)
 	struct media_pad *pads = csi2->pads;
 	struct media_entity *me = &sd->entity;
 	int ret;
-	char name[V4L2_SUBDEV_NAME_SIZE];
+	char name[32];
 
 	v4l2_subdev_init(sd, &csi2_ops);
 	sd->internal_ops = &csi2_internal_ops;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5f59ff0796b7..5711354056b9 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -951,7 +951,7 @@ struct v4l2_subdev_internal_ops {
 	void (*release)(struct v4l2_subdev *sd);
 };
 
-#define V4L2_SUBDEV_NAME_SIZE 32
+#define V4L2_SUBDEV_NAME_SIZE 52
 
 /* Set this flag if this subdev is a i2c device. */
 #define V4L2_SUBDEV_FL_IS_I2C			(1U << 0)
-- 
2.40.1

