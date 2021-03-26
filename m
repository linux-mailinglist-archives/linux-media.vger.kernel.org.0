Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFA334A511
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhCZJ65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhCZJ6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:49 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F83DC0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u5so7499151ejn.8
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Taa4kjTOMpLW/ZkeAqjF/jCqg+TUWX381LsGBXizrEs=;
        b=ZBlJ+2JRN/3p5bvEKSqG+fEdhMH5cWDqLs3/WLvlSk8xbuUX3mGsumV4OZH38Qw9EY
         9YkJBJFiG4aYWrGKs4YDjqVhbIGg2aM+wOfnVW9K3+BfV8DL1GMiG8L3bsBlznxeXFOm
         zhgXlkmYXvOTYJMa5U3Lge8bZGZMnPVAuO/O8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Taa4kjTOMpLW/ZkeAqjF/jCqg+TUWX381LsGBXizrEs=;
        b=br2GHH+4hycxZ9A6yYFAMF+Y/aaWvE2DVbo2R9OUMXpIs5zORmN/iranBbSnAeTlIf
         wKa8G57aW1FUIHjm0mRE0PrFlwNMM1J89WNfN5JNi/cSsfe5JzVLjXcnYxEZ00hhPga2
         +l7pO0hzKrOl6yR2reN1kY4cLkqo0683phFfO6nhz03OlFpYaGV9xWw9Wz+uHD9Jqaha
         FA+ZbLtIs5vq3aTpRn1kdFlHuKaRRRzqOmBj/VEoydWG93BSdRbJlAVTHe3gLxrDEFtv
         IQ5PJE5Lbfm4ckuezNt95rvhHX+QcfMdfRtn+7bSghar5xg2RxOn/iWl1qtI0wzS6ZAu
         QIAw==
X-Gm-Message-State: AOAM531+6M7i5+jfYqnr01y4Fh+gDpKW5/9GUPJonqdxh2+1zWLbd18q
        r9ZNt0tuDpUC1OD3SrSJKJkLYA==
X-Google-Smtp-Source: ABdhPJzXjmxn7vIeVWzcGgMBl8vzCaKq+gckf9a3EZKc1HMB3ShFF36o8c13RMnd27weOdcdDvmpeg==
X-Received: by 2002:a17:906:7c4:: with SMTP id m4mr14454353ejc.63.1616752728189;
        Fri, 26 Mar 2021 02:58:48 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:47 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 05/22] media: uvcvideo: Remove s_ctrl and g_ctrl
Date:   Fri, 26 Mar 2021 10:58:23 +0100
Message-Id: <20210326095840.364424-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we do not implement these callbacks the framework will call the
ext_ctrl callbaks instead, which are a superset of this functions.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
2.31.0.291.g576ba9dcdaf-goog

