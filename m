Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 564087AC329
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbjIWPVg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjIWPVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1CB196
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F86AC43397;
        Sat, 23 Sep 2023 15:21:29 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 14/23] media: v4l2-device.h: drop V4L2_DEVICE_NAME_SIZE
Date:   Sat, 23 Sep 2023 17:20:58 +0200
Message-Id: <20230923152107.283289-15-hverkuil-cisco@xs4all.nl>
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

Don't use defines for the size of a name field, everyone
should just use sizeof(). In this case it was never used,
but it is bad practice, so just drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/v4l2-device.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 8a8977a33ec1..f6f111fae33c 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -13,8 +13,6 @@
 #include <media/v4l2-subdev.h>
 #include <media/v4l2-dev.h>
 
-#define V4L2_DEVICE_NAME_SIZE (20 + 16)
-
 struct v4l2_ctrl_handler;
 
 /**
@@ -49,7 +47,7 @@ struct v4l2_device {
 	struct media_device *mdev;
 	struct list_head subdevs;
 	spinlock_t lock;
-	char name[V4L2_DEVICE_NAME_SIZE];
+	char name[36];
 	void (*notify)(struct v4l2_subdev *sd,
 			unsigned int notification, void *arg);
 	struct v4l2_ctrl_handler *ctrl_handler;
-- 
2.40.1

