Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78E233C463
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236083AbhCORgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235612AbhCORgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:36:16 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A6AC061762
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id r17so67649438ejy.13
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IDZVfkirJB0MIvsduY3XapD058ix0zBHR7vvfdLitJQ=;
        b=XIhPZqdjCD1DSYC4oeAD8y+NLrevp6V+DsCUCSvm8e0XtQ/hp02YJ9hBAATdlnI/xw
         nb3Tfm0MiqhQ6UfZ1qqJNJGTxgILOlzUO1GdFj0p58d8w4K/NVDUTN5n4BO96tISUr+U
         7CqXeXC6UVeP967gzBHMY1U0r5qQpA67FCfJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IDZVfkirJB0MIvsduY3XapD058ix0zBHR7vvfdLitJQ=;
        b=j89hfHhr7CccPOkZPgyZizIwuX7fpQqnRoDa9186y5d0UBu4oqXPrPMoVjaq2aD1tt
         Rcq8Hf4eNWunBLSSG4c4I+qWmCSxkda/D1WVgayvJ592pX24NAQqzvRyTczOzwE9vchI
         MOrm9Ch7R/KFYukY4eTUEcHTJQpk0WfQGk6Ge1oKM7mksvFOMXK4CLeszL6vGu2N/nM6
         G4/oCYcGuqZZFUTeZXODpbarLqlWNqHRUqlHHbpdAZQHLYSG5Og/g7KWK8jwLfooJ4s+
         K54uM6LfvpFRys5zqN1y/rA3XM69Mm5Thvb74oYBBS4WkmfdC9TK/FSTanIuQDFoz5+i
         /1Aw==
X-Gm-Message-State: AOAM533GI5FwVIfABAeePvVjl74h2hk/NUOtI44GZ7jX08Bx6oSIK6Mn
        FZ5z7otox59dGUeiteMdQTS8xw==
X-Google-Smtp-Source: ABdhPJzpqYffq9W7GeBhTlvNq25fhoVJAKNqxyw0lK/gOAQ6ssjZRjfcOvsPuiG5mnHQfA7bLn/gCg==
X-Received: by 2002:a17:906:9509:: with SMTP id u9mr25099327ejx.225.1615829774998;
        Mon, 15 Mar 2021 10:36:14 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a3sm8109239ejv.40.2021.03.15.10.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:36:14 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 06/11] media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
Date:   Mon, 15 Mar 2021 18:36:04 +0100
Message-Id: <20210315173609.1547857-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315173609.1547857-1-ribalda@chromium.org>
References: <20210315173609.1547857-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create all the class controls for the device defined controls.

Fixes v4l2-compliance:
Control ioctls (Input 0):
		fail: v4l2-test-controls.cpp(216): missing control class for class 00980000
		fail: v4l2-test-controls.cpp(216): missing control tclass for class 009a0000
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 96 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h |  6 ++
 2 files changed, 102 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b75da65115ef..be0fadaf414c 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -357,6 +357,17 @@ static const struct uvc_control_info uvc_ctrls[] = {
 	},
 };
 
+static const struct uvc_control_class uvc_control_class[] = {
+	{
+		.id		= V4L2_CID_CAMERA_CLASS,
+		.name		= "Camera Controls",
+	},
+	{
+		.id		= V4L2_CID_USER_CLASS,
+		.name		= "User Controls",
+	},
+};
+
 static const struct uvc_menu_info power_line_frequency_controls[] = {
 	{ 0, "Disabled" },
 	{ 1, "50 Hz" },
@@ -1024,6 +1035,49 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
+				  u32 found_id)
+{
+	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	unsigned int i;
+
+	req_id &= V4L2_CTRL_ID_MASK;
+
+	for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
+		if (!(chain->ctrl_class_bitmap & BIT(i)))
+			continue;
+		if (!find_next) {
+			if (uvc_control_class[i].id == req_id)
+				return i;
+			continue;
+		}
+		if (uvc_control_class[i].id > req_id &&
+		    uvc_control_class[i].id < found_id)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
+				u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
+{
+	int idx;
+
+	idx = __uvc_query_v4l2_class(chain, req_id, found_id);
+	if (idx < 0)
+		return -ENODEV;
+
+	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
+	v4l2_ctrl->id = uvc_control_class[idx].id;
+	strscpy(v4l2_ctrl->name, uvc_control_class[idx].name,
+		sizeof(v4l2_ctrl->name));
+	v4l2_ctrl->type = V4L2_CTRL_TYPE_CTRL_CLASS;
+	v4l2_ctrl->flags = V4L2_CTRL_FLAG_WRITE_ONLY
+			   | V4L2_CTRL_FLAG_READ_ONLY;
+	return 0;
+}
+
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl,
 	struct uvc_control_mapping *mapping,
@@ -1127,12 +1181,31 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return -ERESTARTSYS;
 
+	/* Check if the ctrl is a know class */
+	if (!(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL)) {
+		ret = uvc_query_v4l2_class(chain, v4l2_ctrl->id, 0, v4l2_ctrl);
+		if (!ret)
+			goto done;
+	}
+
 	ctrl = uvc_find_control(chain, v4l2_ctrl->id, &mapping);
 	if (ctrl == NULL) {
 		ret = -EINVAL;
 		goto done;
 	}
 
+	/*
+	 * If we're enumerating control with V4L2_CTRL_FLAG_NEXT_CTRL, check if
+	 * a class should be inserted between the previous control and the one
+	 * we have just found.
+	 */
+	if (v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL) {
+		ret = uvc_query_v4l2_class(chain, v4l2_ctrl->id, mapping->id,
+					   v4l2_ctrl);
+		if (!ret)
+			goto done;
+	}
+
 	ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
 done:
 	mutex_unlock(&chain->ctrl_mutex);
@@ -1426,6 +1499,11 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 	if (ret < 0)
 		return -ERESTARTSYS;
 
+	if (__uvc_query_v4l2_class(handle->chain, sev->id, 0) >= 0) {
+		ret = 0;
+		goto done;
+	}
+
 	ctrl = uvc_find_control(handle->chain, sev->id, &mapping);
 	if (ctrl == NULL) {
 		ret = -EINVAL;
@@ -1459,7 +1537,10 @@ static void uvc_ctrl_del_event(struct v4l2_subscribed_event *sev)
 	struct uvc_fh *handle = container_of(sev->fh, struct uvc_fh, vfh);
 
 	mutex_lock(&handle->chain->ctrl_mutex);
+	if (__uvc_query_v4l2_class(handle->chain, sev->id, 0) >= 0)
+		goto done;
 	list_del(&sev->node);
+done:
 	mutex_unlock(&handle->chain->ctrl_mutex);
 }
 
@@ -1577,6 +1658,9 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
 
+	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
+		return -EACCES;
+
 	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
 	if (ctrl == NULL)
 		return -EINVAL;
@@ -1596,6 +1680,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	s32 max;
 	int ret;
 
+	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
+		return -EACCES;
+
 	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
 	if (ctrl == NULL)
 		return -EINVAL;
@@ -2062,6 +2149,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 {
 	struct uvc_control_mapping *map;
 	unsigned int size;
+	unsigned int i;
 
 	/* Most mappings come from static kernel data and need to be duplicated.
 	 * Mappings that come from userspace will be unnecessarily duplicated,
@@ -2085,6 +2173,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	if (map->set == NULL)
 		map->set = uvc_set_le_value;
 
+	for (i = 0; i < ARRAY_SIZE(uvc_control_class); i++) {
+		if (V4L2_CTRL_ID2WHICH(uvc_control_class[i].id) ==
+						V4L2_CTRL_ID2WHICH(map->id)) {
+			chain->ctrl_class_bitmap |= BIT(i);
+			break;
+		}
+	}
+
 	list_add_tail(&map->list, &ctrl->info.mappings);
 	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
 		map->name, ctrl->info.entity, ctrl->info.selector);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 97df5ecd66c9..1f17e4253673 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -262,6 +262,11 @@ struct uvc_control_mapping {
 		    u8 *data);
 };
 
+struct uvc_control_class {
+	u32 id;
+	char name[32];
+};
+
 struct uvc_control {
 	struct uvc_entity *entity;
 	struct uvc_control_info info;
@@ -475,6 +480,7 @@ struct uvc_video_chain {
 
 	struct v4l2_prio_state prio;		/* V4L2 priority state */
 	u32 caps;				/* V4L2 chain-wide caps */
+	u8 ctrl_class_bitmap;			/* Bitmap of valid classes */
 };
 
 struct uvc_stats_frame {
-- 
2.31.0.rc2.261.g7f71774620-goog

