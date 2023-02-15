Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2BEF697EB5
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 15:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjBOOs6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 09:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjBOOsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 09:48:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0932623D9C
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 06:48:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B45EBB81E9A
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCA1C433EF;
        Wed, 15 Feb 2023 14:48:18 +0000 (UTC)
Message-ID: <e9cb93fd-cdb7-7e67-ca79-1e3ffd1241e6@xs4all.nl>
Date:   Wed, 15 Feb 2023 15:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v6.3] media: v4l2-subdev.c: clear stream field
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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

Both userspace and kernelspace can pass structs with an uninitialized 'stream'
field. Since the check_state() function checks for a non-zero stream field,
suddenly these calls will fails with -EINVAL.

So check in the wrapper functions in v4l2-subdev.c (which are used by both the
kernel and userspace API) if V4L2_SUBDEV_FL_STREAMS is set, and if not, then zero
the stream field.

Currently no drivers set V4L2_SUBDEV_FL_STREAMS.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1bebcda2bd20..db22da153002 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -197,6 +198,8 @@ static inline int check_format(struct v4l2_subdev *sd,
 	if (!format)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		format->stream = 0;
 	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
 	       check_state(sd, state, format->which, format->pad, format->stream);
 }
@@ -224,6 +227,8 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 	if (!code)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		code->stream = 0;
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
 	       check_state(sd, state, code->which, code->pad, code->stream) ? :
 	       sd->ops->pad->enum_mbus_code(sd, state, code);
@@ -236,6 +241,8 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 	if (!fse)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		fse->stream = 0;
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
 	       check_state(sd, state, fse->which, fse->pad, fse->stream) ? :
 	       sd->ops->pad->enum_frame_size(sd, state, fse);
@@ -271,6 +278,8 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 	if (!fie)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		fie->stream = 0;
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
 	       check_state(sd, state, fie->which, fie->pad, fie->stream) ? :
 	       sd->ops->pad->enum_frame_interval(sd, state, fie);
@@ -283,6 +292,8 @@ static inline int check_selection(struct v4l2_subdev *sd,
 	if (!sel)
 		return -EINVAL;

+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+		sel->stream = 0;
 	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
 	       check_state(sd, state, sel->which, sel->pad, sel->stream);
 }
