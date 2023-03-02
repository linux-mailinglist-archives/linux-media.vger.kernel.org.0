Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5456A82FB
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 13:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjCBM6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 07:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjCBM6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 07:58:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E929A4FABB
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 04:57:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 997B4615CD
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 12:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A05CC433A8;
        Thu,  2 Mar 2023 12:57:42 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 8/9] v4l2-core: zero field base in struct v4l2_framebuffer
Date:   Thu,  2 Mar 2023 13:57:30 +0100
Message-Id: <20230302125731.1124945-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302125731.1124945-1-hverkuil-cisco@xs4all.nl>
References: <20230302125731.1124945-1-hverkuil-cisco@xs4all.nl>
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

Make sure this field is always 0 since destructive overlays
are no longer supported.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  7 ++-----
 drivers/media/v4l2-core/v4l2-ioctl.c          | 12 ++++++++++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index e7baa2880eeb..f3bed37859a2 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -587,14 +587,11 @@ struct v4l2_framebuffer32 {
 static int get_v4l2_framebuffer32(struct v4l2_framebuffer *p64,
 				  struct v4l2_framebuffer32 __user *p32)
 {
-	compat_caddr_t tmp;
-
-	if (get_user(tmp, &p32->base) ||
-	    get_user(p64->capability, &p32->capability) ||
+	if (get_user(p64->capability, &p32->capability) ||
 	    get_user(p64->flags, &p32->flags) ||
 	    copy_from_user(&p64->fmt, &p32->fmt, sizeof(p64->fmt)))
 		return -EFAULT;
-	p64->base = (void __force *)compat_ptr(tmp);
+	p64->base = NULL;
 
 	return 0;
 }
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index ed595c450278..683e6ad90a75 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2054,6 +2054,15 @@ static int v4l_s_hw_freq_seek(const struct v4l2_ioctl_ops *ops,
 	return ops->vidioc_s_hw_freq_seek(file, fh, p);
 }
 
+static int v4l_s_fbuf(const struct v4l2_ioctl_ops *ops,
+		      struct file *file, void *fh, void *arg)
+{
+	struct v4l2_framebuffer *p = arg;
+
+	p->base = NULL;
+	return ops->vidioc_s_fbuf(file, fh, p);
+}
+
 static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -2773,7 +2782,6 @@ struct v4l2_ioctl_info {
 	}
 
 DEFINE_V4L_STUB_FUNC(g_fbuf)
-DEFINE_V4L_STUB_FUNC(s_fbuf)
 DEFINE_V4L_STUB_FUNC(expbuf)
 DEFINE_V4L_STUB_FUNC(g_std)
 DEFINE_V4L_STUB_FUNC(g_audio)
@@ -2807,7 +2815,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
 	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
 	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
-	IOCTL_INFO(VIDIOC_S_FBUF, v4l_stub_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
+	IOCTL_INFO(VIDIOC_S_FBUF, v4l_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_OVERLAY, v4l_overlay, v4l_print_u32, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_QBUF, v4l_qbuf, v4l_print_buffer, INFO_FL_QUEUE),
 	IOCTL_INFO(VIDIOC_EXPBUF, v4l_stub_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
-- 
2.39.1

