Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30AB697DEA
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 14:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBONzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 08:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBONzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 08:55:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6D94C2E
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 05:55:47 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAF4810B;
        Wed, 15 Feb 2023 14:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676469346;
        bh=R73N9LrFQgS92bAa3uQ8qsw8+GoyLqJ1/WfDyiyLI4o=;
        h=From:To:Cc:Subject:Date:From;
        b=Xc9JRjSbnzEpzCpY3rfIT7keyrGSrP11LmV+HVOxYTUGN8LPGIy2WoiEu2+zRo4pn
         tRlZT5uhbW/B+97ihRi+/I00u2EkxiOwto0GsUtf8oa+yGoMUMRperD8b5fC3SRioM
         lPAtwfdlXUXz6LxZ5icsYetflfobqADSSYIwb8UM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: subdev: Fix backward compatibility with the new 'stream' field
Date:   Wed, 15 Feb 2023 15:55:23 +0200
Message-Id: <20230215135523.357332-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

The new 'stream' field in many v4l2 structs was taken from reserved
fields. The assumption was that the userspace is always required to zero
initialize the whole struct.

However, what happens in real life is that the apps only zero initialize
the reserved fields/arrays. When such an app is compiled with new
headers, the 'stream' field will be uninitialized, causing the kernel to
(most likely) return an error.

The streams API is still experimental and behind a compile-time flag,
'v4l2_subdev_enable_streams_api', and disabled by default. As a quick
fix always set the 'stream' field to zero when that flag is not set.
This keeps the backward compatibility when streams API is not enabled.

A proper fix when streams support is enabled is something else. Somehow
the userspace needs to signal the kernel that it actually intializes the
'stream' field.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1bebcda2bd20..efa0a7f770cf 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -609,6 +609,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_G_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
+		if (!v4l2_subdev_enable_streams_api)
+			format->stream = 0;
+
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
@@ -620,6 +623,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (format->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
+		if (!v4l2_subdev_enable_streams_api)
+			format->stream = 0;
+
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
@@ -629,6 +635,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_crop *crop = arg;
 		struct v4l2_subdev_selection sel;
 
+		if (!v4l2_subdev_enable_streams_api)
+			crop->stream = 0;
+
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
@@ -650,6 +659,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
+		if (!v4l2_subdev_enable_streams_api)
+			crop->stream = 0;
+
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
@@ -668,6 +680,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
 		struct v4l2_subdev_mbus_code_enum *code = arg;
 
+		if (!v4l2_subdev_enable_streams_api)
+			code->stream = 0;
+
 		memset(code->reserved, 0, sizeof(code->reserved));
 		return v4l2_subdev_call(sd, pad, enum_mbus_code, state,
 					code);
@@ -676,6 +691,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
 		struct v4l2_subdev_frame_size_enum *fse = arg;
 
+		if (!v4l2_subdev_enable_streams_api)
+			fse->stream = 0;
+
 		memset(fse->reserved, 0, sizeof(fse->reserved));
 		return v4l2_subdev_call(sd, pad, enum_frame_size, state,
 					fse);
@@ -684,6 +702,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
+		if (!v4l2_subdev_enable_streams_api)
+			fi->stream = 0;
+
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
 	}
@@ -694,6 +715,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (ro_subdev)
 			return -EPERM;
 
+		if (!v4l2_subdev_enable_streams_api)
+			fi->stream = 0;
+
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
 	}
@@ -701,6 +725,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval_enum *fie = arg;
 
+		if (!v4l2_subdev_enable_streams_api)
+			fie->stream = 0;
+
 		memset(fie->reserved, 0, sizeof(fie->reserved));
 		return v4l2_subdev_call(sd, pad, enum_frame_interval, state,
 					fie);
@@ -709,6 +736,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_G_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
+		if (!v4l2_subdev_enable_streams_api)
+			sel->stream = 0;
+
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, get_selection, state, sel);
@@ -720,6 +750,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (sel->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
+		if (!v4l2_subdev_enable_streams_api)
+			sel->stream = 0;
+
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, set_selection, state, sel);
-- 
2.34.1

