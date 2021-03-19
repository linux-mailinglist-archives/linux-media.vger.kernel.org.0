Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87783422E3
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbhCSRJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhCSRJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:09:14 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF0CC06174A
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:13 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id bf3so11649316edb.6
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pNpKPYKhqYWQcwk8nAlLqOQJ2RG6X0m+XUJIPj/sXUs=;
        b=KtBwtIbzTIJyT6+OdVb/AyxBOly4BERSPTivBZeBVlApp4CddeihRdsgSGhu2xCLPP
         VQn+770AnwzSJf8JKVd0yCizoCo8kyATeW2R8c+fJmKyDsQzxzj4SsL5QkxY8PuNjVt6
         eNj2qtlGcCDGK4lOFaU1UKoFjUwludjdLsVFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pNpKPYKhqYWQcwk8nAlLqOQJ2RG6X0m+XUJIPj/sXUs=;
        b=MoqJ6vHuTKG3ZiNFX607a8kZqnZqfqDadIKfOF0+JZ0qI8kkv6Sipw0XKbq0PmlOdk
         iOMnIqiokYRkOQF+CKAZrQT5o4cveTenObnfX94HELdAy1E7aBXk8P4uwt8p5nAgWCeJ
         t38/1HdcJPN/US8XGODVLFSLzHPo4BqGDFvsh1FpHCXEAHsjYQIxNANhwNoMd/G8Hd9y
         6+hD13W/cA6Yy31C/MgluYVsBorw8UUmH+AmDxHxX7hO+r12Re4gYG1BeT8VQ7km+2Em
         GlcQg8exIdjkCRDY+LrFNKXOAneNL/w3wR54Y2VJwT6R/Nd6WKognwUqiV0xLgAakKRi
         cGxA==
X-Gm-Message-State: AOAM5338QhdNpahtVwDbglKEz+25j9CNF7aXf/27aCllc5X+RAaRS1iq
        lFPAlPfVPZ9rgCcQwRZzHZaC1w==
X-Google-Smtp-Source: ABdhPJyul9mTyS/jxpBE/5JWSkO6J5YDRb1DIi0nB6xIYpnzyudLtPCyCgb44xzXzL/oQ/4/Vsc2sA==
X-Received: by 2002:aa7:c815:: with SMTP id a21mr10847723edt.38.1616173752727;
        Fri, 19 Mar 2021 10:09:12 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id be27sm4506050edb.47.2021.03.19.10.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:09:12 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v8 05/19] media: uvcvideo: Remove s_ctrl and g_ctrl
Date:   Fri, 19 Mar 2021 18:08:52 +0100
Message-Id: <20210319170906.278238-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319170906.278238-1-ribalda@chromium.org>
References: <20210319170906.278238-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we do not implement these callback the framework will call the ext_ctrl
callbaks instead, which are a superset of this functions.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 56 --------------------------------
 1 file changed, 56 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 47b0e3224205..ac98869d5a05 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -983,60 +983,6 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_g_ctrl(struct file *file, void *fh,
-			    struct v4l2_control *ctrl)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_video_chain *chain = handle->chain;
-	struct v4l2_ext_control xctrl;
-	int ret;
-
-	memset(&xctrl, 0, sizeof(xctrl));
-	xctrl.id = ctrl->id;
-
-	ret = uvc_ctrl_begin(chain);
-	if (ret < 0)
-		return ret;
-
-	ret = uvc_ctrl_get(chain, &xctrl);
-	uvc_ctrl_rollback(handle);
-	if (ret < 0)
-		return ret;
-
-	ctrl->value = xctrl.value;
-	return 0;
-}
-
-static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
-			    struct v4l2_control *ctrl)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_video_chain *chain = handle->chain;
-	struct v4l2_ext_control xctrl;
-	int ret;
-
-	memset(&xctrl, 0, sizeof(xctrl));
-	xctrl.id = ctrl->id;
-	xctrl.value = ctrl->value;
-
-	ret = uvc_ctrl_begin(chain);
-	if (ret < 0)
-		return ret;
-
-	ret = uvc_ctrl_set(handle, &xctrl);
-	if (ret < 0) {
-		uvc_ctrl_rollback(handle);
-		return ret;
-	}
-
-	ret = uvc_ctrl_commit(handle, &xctrl, 1);
-	if (ret < 0)
-		return ret;
-
-	ctrl->value = xctrl.value;
-	return 0;
-}
-
 static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 				 struct v4l2_ext_controls *ctrls)
 {
@@ -1522,8 +1468,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_s_input = uvc_ioctl_s_input,
 	.vidioc_queryctrl = uvc_ioctl_queryctrl,
 	.vidioc_query_ext_ctrl = uvc_ioctl_query_ext_ctrl,
-	.vidioc_g_ctrl = uvc_ioctl_g_ctrl,
-	.vidioc_s_ctrl = uvc_ioctl_s_ctrl,
 	.vidioc_g_ext_ctrls = uvc_ioctl_g_ext_ctrls,
 	.vidioc_s_ext_ctrls = uvc_ioctl_s_ext_ctrls,
 	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
-- 
2.31.0.rc2.261.g7f71774620-goog

