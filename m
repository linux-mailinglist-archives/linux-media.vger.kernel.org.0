Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000C93ACAD0
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbhFRMbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbhFRMbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:38 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A32C061760
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:28 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ho18so15633985ejc.8
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=chveVvqRyDjx/NebSnv0sb7ZMgkccsQXLdhoqCZBIE4=;
        b=dVV5K3NncP9uBSJZEV6oQU8CwVvaxlhliXHoJzBTBvhUNCV0v2KYxb/TbUTvPuwKY4
         HbE5umlMIpg5q4gjaUeMpho1kMg6XocVN3iGFP5B6bayUYM8s01BN4QIT4KeFRzNsSYJ
         FQTXo9tuz7wgXCtrVWd/Yi5w+1YKhhEs4cZUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=chveVvqRyDjx/NebSnv0sb7ZMgkccsQXLdhoqCZBIE4=;
        b=X2OpmV8533VJfB9F3JVYjXSeFOytQEMg0FbkIDSDZcfiWNi/7XBAI4Wet1zmC//RP7
         VKqTlFw0JAhHUadKhH193VUU3OgYlW6PBtyyaTpjm5/f9knwwdgMO9l1K9Sf5zU/Ig+0
         kOqiq23ca1S4BsQVyS8Q1kJbkwmFYZL+ty7M4w9SSpYivpghSEDyThL0YQaVOjjL47Pc
         wu6AJeFj4wdd4GfS8UdOYB9vy7ThNW7xMPbRgN/jsYF3bZcRamzlUXL1R63ZdPyvmggO
         QoY5qXubnsYjFSbUqpbfvMowJ5B372OyiOnJr5LUU6YdtBgvb87GY/3z6chtvXaAY98w
         CMkQ==
X-Gm-Message-State: AOAM5338tNjrDd9l4rtnaJ6MYZlOWL90bfKgy7d5VQucvCjjBU5gnhbE
        wCgJI82Pqaod7Fxmp1ko0RFqUw==
X-Google-Smtp-Source: ABdhPJw1fD/77qQ4ZofO8v+fz1Gr3C+9JJLJMqqg2JCHHXjeTACzCiSd+9tWT2WSfgcJbzrRVpb85Q==
X-Received: by 2002:a17:907:7b9e:: with SMTP id ne30mr10841453ejc.389.1624019366966;
        Fri, 18 Jun 2021 05:29:26 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:26 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: [PATCH v10 01/21] media: v4l2-ioctl: Fix check_ext_ctrls
Date:   Fri, 18 Jun 2021 14:29:03 +0200
Message-Id: <20210618122923.385938-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers that do not use the ctrl-framework use this function instead.

Fix the following issues:

- Do not check for multiple classes when getting the DEF_VAL.
- Return -EINVAL for request_api calls
- Default value cannot be changed, return EINVAL as soon as possible.
- Return the right error_idx
[If an error is found when validating the list of controls passed with
VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
indicate to userspace that no actual hardware was touched.
It would have been much nicer of course if error_idx could point to the
control index that failed the validation, but sadly that's not how the
API was designed.]

Fixes v4l2-compliance:
Control ioctls (Input 0):
        warn: v4l2-test-controls.cpp(834): error_idx should be equal to count
        warn: v4l2-test-controls.cpp(855): error_idx should be equal to count
		fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
Buffer ioctls (Input 0):
		fail: v4l2-test-buffers.cpp(1994): ret != EINVAL && ret != EBADR && ret != ENOTTY
	test Requests: FAIL

Cc: stable@vger.kernel.org
Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 60 ++++++++++++++++++----------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2673f51aafa4..8b3977a85b23 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -869,7 +869,7 @@ static void v4l_print_default(const void *arg, bool write_only)
 	pr_cont("driver-specific ioctl\n");
 }
 
-static int check_ext_ctrls(struct v4l2_ext_controls *c, int allow_priv)
+static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
 {
 	__u32 i;
 
@@ -878,23 +878,41 @@ static int check_ext_ctrls(struct v4l2_ext_controls *c, int allow_priv)
 	for (i = 0; i < c->count; i++)
 		c->controls[i].reserved2[0] = 0;
 
-	/* V4L2_CID_PRIVATE_BASE cannot be used as control class
-	   when using extended controls.
-	   Only when passed in through VIDIOC_G_CTRL and VIDIOC_S_CTRL
-	   is it allowed for backwards compatibility.
-	 */
-	if (!allow_priv && c->which == V4L2_CID_PRIVATE_BASE)
-		return 0;
-	if (!c->which)
-		return 1;
+	switch (c->which) {
+	case V4L2_CID_PRIVATE_BASE:
+		/*
+		 * V4L2_CID_PRIVATE_BASE cannot be used as control class
+		 * when using extended controls.
+		 * Only when passed in through VIDIOC_G_CTRL and VIDIOC_S_CTRL
+		 * is it allowed for backwards compatibility.
+		 */
+		if (ioctl == VIDIOC_G_CTRL || ioctl == VIDIOC_S_CTRL)
+			return false;
+		break;
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		/* Default value cannot be changed */
+		if (ioctl == VIDIOC_S_EXT_CTRLS ||
+		    ioctl == VIDIOC_TRY_EXT_CTRLS) {
+			c->error_idx = c->count;
+			return false;
+		}
+		return true;
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		return true;
+	case V4L2_CTRL_WHICH_REQUEST_VAL:
+		c->error_idx = c->count;
+		return false;
+	}
+
 	/* Check that all controls are from the same control class. */
 	for (i = 0; i < c->count; i++) {
 		if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
-			c->error_idx = i;
-			return 0;
+			c->error_idx = ioctl == VIDIOC_TRY_EXT_CTRLS ? i :
+								      c->count;
+			return false;
 		}
 	}
-	return 1;
+	return true;
 }
 
 static int check_fmt(struct file *file, enum v4l2_buf_type type)
@@ -2187,7 +2205,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
 	ctrls.controls = &ctrl;
 	ctrl.id = p->id;
 	ctrl.value = p->value;
-	if (check_ext_ctrls(&ctrls, 1)) {
+	if (check_ext_ctrls(&ctrls, VIDIOC_G_CTRL)) {
 		int ret = ops->vidioc_g_ext_ctrls(file, fh, &ctrls);
 
 		if (ret == 0)
@@ -2221,7 +2239,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 	ctrls.controls = &ctrl;
 	ctrl.id = p->id;
 	ctrl.value = p->value;
-	if (check_ext_ctrls(&ctrls, 1))
+	if (check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
 		return ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
 	return -EINVAL;
 }
@@ -2243,8 +2261,8 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 					vfd, vfd->v4l2_dev->mdev, p);
 	if (ops->vidioc_g_ext_ctrls == NULL)
 		return -ENOTTY;
-	return check_ext_ctrls(p, 0) ? ops->vidioc_g_ext_ctrls(file, fh, p) :
-					-EINVAL;
+	return check_ext_ctrls(p, VIDIOC_G_EXT_CTRLS) ?
+				ops->vidioc_g_ext_ctrls(file, fh, p) : -EINVAL;
 }
 
 static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
@@ -2264,8 +2282,8 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 					vfd, vfd->v4l2_dev->mdev, p);
 	if (ops->vidioc_s_ext_ctrls == NULL)
 		return -ENOTTY;
-	return check_ext_ctrls(p, 0) ? ops->vidioc_s_ext_ctrls(file, fh, p) :
-					-EINVAL;
+	return check_ext_ctrls(p, VIDIOC_S_EXT_CTRLS) ?
+				ops->vidioc_s_ext_ctrls(file, fh, p) : -EINVAL;
 }
 
 static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
@@ -2285,8 +2303,8 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 					  vfd, vfd->v4l2_dev->mdev, p);
 	if (ops->vidioc_try_ext_ctrls == NULL)
 		return -ENOTTY;
-	return check_ext_ctrls(p, 0) ? ops->vidioc_try_ext_ctrls(file, fh, p) :
-					-EINVAL;
+	return check_ext_ctrls(p, VIDIOC_TRY_EXT_CTRLS) ?
+			ops->vidioc_try_ext_ctrls(file, fh, p) : -EINVAL;
 }
 
 /*
-- 
2.32.0.288.g62a8d224e6-goog

