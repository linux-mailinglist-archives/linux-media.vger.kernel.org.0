Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93798698F38
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 10:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjBPJCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 04:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjBPJCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 04:02:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562D64C17
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 01:02:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEF0061E5A
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 09:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A13C433D2;
        Thu, 16 Feb 2023 09:01:59 +0000 (UTC)
Message-ID: <ba940dce-39fd-fa3d-15b6-3f06afc57098@xs4all.nl>
Date:   Thu, 16 Feb 2023 10:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 for v6.3] media: v4l2-subdev.c: clear stream field
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From 91d988c89ae7a8c26d6d7ad58b07efcf41d875da Mon Sep 17 00:00:00 2001
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Wed, 15 Feb 2023 15:48:17 +0100
Subject: [PATCH] media: v4l2-subdev.c: clear stream field

Both userspace and kernelspace can pass structs with an uninitialized 'stream'
field. Since the check_state() function checks for a non-zero stream field,
suddenly these calls will fails with -EINVAL.

So check in the wrapper functions in v4l2-subdev.c (which are used by both the
kernel and userspace API) if V4L2_SUBDEV_FL_STREAMS is set, and if not, then zero
the stream field.

Currently no drivers set V4L2_SUBDEV_FL_STREAMS, so the stream field will always
be set to 0.

This patch might well be reverted in the future when streams support is fully
enabled and we finalized the userspace API support for this feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:
- added newline after zeroing the stream field
- mention that this patch might be reverted in the future
---
 drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1bebcda2bd20..dff1d9be7841 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -197,6 +197,9 @@ static inline int check_format(struct v4l2_subdev *sd,
 	if (!format)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		format->stream = 0;
+
 	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
 	       check_state(sd, state, format->which, format->pad, format->stream);
 }
@@ -224,6 +227,9 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 	if (!code)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		code->stream = 0;
+
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
 	       check_state(sd, state, code->which, code->pad, code->stream) ? :
 	       sd->ops->pad->enum_mbus_code(sd, state, code);
@@ -236,6 +242,9 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 	if (!fse)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		fse->stream = 0;
+
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
 	       check_state(sd, state, fse->which, fse->pad, fse->stream) ? :
 	       sd->ops->pad->enum_frame_size(sd, state, fse);
@@ -271,6 +280,9 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 	if (!fie)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		fie->stream = 0;
+
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
 	       check_state(sd, state, fie->which, fie->pad, fie->stream) ? :
 	       sd->ops->pad->enum_frame_interval(sd, state, fie);
@@ -283,6 +295,9 @@ static inline int check_selection(struct v4l2_subdev *sd,
 	if (!sel)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		sel->stream = 0;
+
 	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
 	       check_state(sd, state, sel->which, sel->pad, sel->stream);
 }
-- 
2.39.1

