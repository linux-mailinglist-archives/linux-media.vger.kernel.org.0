Return-Path: <linux-media+bounces-25573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F598A258CB
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD51188266E
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E238B2063E7;
	Mon,  3 Feb 2025 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oHZHC95p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533A2063C4
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583770; cv=none; b=YbsHMFq1K5bT9uMkAOYXTzSFLzT+/rkl/yopwYmOKMvhNHsijW4ivGOi5tqPr0YUr0YDwDWnI+4uIfOPJNL9W6oZVn5y2p0n4m9mVpCFGBbojl7KbRGKqo2/OSgOM4Qyrf1eVEX26kRfZeZVY8WZMexxQ9TL9YGggdQraMq5OPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583770; c=relaxed/simple;
	bh=RffajfSqQ9GsgHbbHK+VrpyXrmjLYlz8COh1cGV6mTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKX22bnP/fnE/tcxOx0P6qvihIZvU3tI4XWQw93KBvQR0ByzdrVIMSql599sdSa4ghe3OW9/lR/Z89RFxL2p3VF7dzaMd2MArVe+Nmb476u875YIFmQHnTlpT3LuLlUDcaVxaOhmSjCAwi4gYwdJtT80wwwS1EIsDA2ElAQx10w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oHZHC95p; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c5adbca8eso940126241.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583767; x=1739188567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60gSF4q4NotUR04D9MFkGmquICtPF/Hrtt0pbfyUnfg=;
        b=oHZHC95py8QyGNYAnULjT7fh0NXsnTcMTbQYHEnwKyKwYw8EQw3Bmv49V8aJF1EFGQ
         E84wJrcwOKfd7SrsLW7xuzICM+nwkrTisEIAqEjGJ22NUmx6MHBhibM4UZRg7p+334Et
         PVq+6lSQntT+t3gDVGoayXXo3f/nRlhx8T6tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583767; x=1739188567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60gSF4q4NotUR04D9MFkGmquICtPF/Hrtt0pbfyUnfg=;
        b=W1fluW4mbgvEFtF0fnQqcLoc7vuQHw1LRpjJ/7XItW1gDR/luApiTgVHAlXkwelcrg
         aoPQHCSkdfMSAJCYTst/ynXpwPy4ileUZLYj2c9gAaRizpaMAhz589G/zjSrBD2salGE
         SJVTAbmEOQTVsNFSLPuKIl0EmND+WeL/WS4XD+VK2Fhas5SCM4ZD9Eeq0CyUjuny4JOj
         jTqzo6yc4QHIgsLYGBbvkPcV0mk2B73BUzQIjzYv6uO+suU1YVnzAIRlDYe5M2Oyn7Ns
         NZZVPQzy2n/B11byFF2fDxq1rFK4AyOVQU6/DICqvdjMvkTIjTaRcWktb15SwsRstqqB
         sSTg==
X-Forwarded-Encrypted: i=1; AJvYcCVTg7nl8fgMaRJpPz/lkhrQouh5oYU6y/W+RSYu4z5o+2ArWrkwvrQcXQEDclIzuQ6mFnukllkk5JUDUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cRp5TjqcLLrDgtWnGlQM1t46tmempsexHOpLD3bgxqf7L1mY
	IE/5smhgNa3mNgzC7Oqjo9HCDoVgMFdx6mLmf+SMXJ/mxhH0xG27ZNa33TkM2Q==
X-Gm-Gg: ASbGncvYbLq10fkjpSf4mt0IZ5+lWW5jJkjxlmjRRSGry8UnFEM0h9yw4UKLpd5+1Yo
	3Z8Dt2N68cXOe7VRZ0g/Gg3qqrhH1wQKbmXifjUfoXrw/bkF0kUGWyxvwleRlkkmhkluIC2HQrq
	Jwzzo9eWZ7uoDTCNpXDDmufJ1uah2tm28wMWi/ZCwW9WVdSpLztCuOJFO3fB5g51EPxi/rdD+q+
	3UdfIJJ0YSad2Q4mK0nVqzLEpZTq+cGT3NwCQyVBoofar3lJyDOYjRfgJ/0GYk9iusgtt5Ywfgh
	H6vIPduYim6VzYoJ5P7wATQUy7tx8crC4jTaVXvBCfo+VBrsU/L7OuJ0ICsZbnGpFw==
X-Google-Smtp-Source: AGHT+IFdc+vvtfqPGIQ0dOYET8XeiwJkNlOo0hhwFNHh1eon8q9yA3l9hR0ZGEYs7quwOZb8R4dPaQ==
X-Received: by 2002:a05:6102:3581:b0:4af:bf45:39a8 with SMTP id ada2fe7eead31-4b9a5237dbbmr13918082137.16.1738583767166;
        Mon, 03 Feb 2025 03:56:07 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:48 +0000
Subject: [PATCH v17 12/17] media: uvcvideo: support
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-12-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@google.com>

Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
It is needed for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.

Signed-off-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 96 ++++++++++++++++++++++++++++++++--------
 drivers/media/usb/uvc/uvc_v4l2.c |  2 +
 2 files changed, 79 insertions(+), 19 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 6e27075939ac..4e29db334b2d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1277,6 +1277,37 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	return 0;
 }
 
+static bool uvc_ctrl_is_readable(u32 which, struct uvc_control *ctrl,
+				 struct uvc_control_mapping *mapping)
+{
+	if (which == V4L2_CTRL_WHICH_CUR_VAL)
+		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR);
+
+	if (which == V4L2_CTRL_WHICH_DEF_VAL)
+		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF);
+
+	/* Types with implicit boundaries. */
+	switch (mapping->v4l2_type) {
+	case V4L2_CTRL_TYPE_MENU:
+	case V4L2_CTRL_TYPE_BOOLEAN:
+	case V4L2_CTRL_TYPE_BUTTON:
+		return true;
+	case V4L2_CTRL_TYPE_BITMASK:
+		return (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES) ||
+			(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX);
+	default:
+		break;
+	}
+
+	if (which == V4L2_CTRL_WHICH_MIN_VAL)
+		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN);
+
+	if (which == V4L2_CTRL_WHICH_MAX_VAL)
+		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX);
+
+	return false;
+}
+
 /*
  * Check if control @v4l2_id can be accessed by the given control @ioctl
  * (VIDIOC_G_EXT_CTRLS, VIDIOC_TRY_EXT_CTRLS or VIDIOC_S_EXT_CTRLS).
@@ -1295,7 +1326,6 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	struct uvc_control *master_ctrl = NULL;
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
-	bool read = ioctl == VIDIOC_G_EXT_CTRLS;
 	s32 val;
 	int ret;
 	int i;
@@ -1307,10 +1337,10 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!ctrl)
 		return -EINVAL;
 
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
-		return -EACCES;
+	if (ioctl == VIDIOC_G_EXT_CTRLS)
+		return uvc_ctrl_is_readable(ctrls->which, ctrl, mapping);
 
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		return -EACCES;
 
 	if (ioctl != VIDIOC_S_EXT_CTRLS || !mapping->master_id)
@@ -1459,6 +1489,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
+	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
@@ -2088,16 +2121,18 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 
 	switch (which) {
 	case V4L2_CTRL_WHICH_CUR_VAL:
-		ret = __uvc_ctrl_load_cur(chain, ctrl);
-		if (ret < 0)
-			return ret;
 		id = UVC_CTRL_DATA_CURRENT;
 		query = UVC_GET_CUR;
 		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		id = UVC_CTRL_DATA_MIN;
+		query = UVC_GET_MIN;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		id = UVC_CTRL_DATA_MAX;
+		query = UVC_GET_MAX;
+		break;
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		ret = uvc_ctrl_populate_cache(chain, ctrl);
-		if (ret < 0)
-			return ret;
 		id = UVC_CTRL_DATA_DEF;
 		query = UVC_GET_DEF;
 		break;
@@ -2115,6 +2150,14 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 	if (!data)
 		return -ENOMEM;
 
+	if (which == V4L2_CTRL_WHICH_CUR_VAL)
+		ret = __uvc_ctrl_load_cur(chain, ctrl);
+	else
+		ret = uvc_ctrl_populate_cache(chain, ctrl);
+
+	if (ret < 0)
+		return ret;
+
 	ret = mapping->get(mapping, query, uvc_ctrl_data(ctrl, id), size, data);
 	if (ret < 0)
 		return ret;
@@ -2132,22 +2175,37 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
 				     struct uvc_control_mapping *mapping,
 				     u32 which, struct v4l2_ext_control *xctrl)
 {
+	struct v4l2_queryctrl qc;
+	int ret;
+
 	switch (which) {
 	case V4L2_CTRL_WHICH_CUR_VAL:
 		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		if (!ctrl->cached) {
-			int ret = uvc_ctrl_populate_cache(chain, ctrl);
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		break;
+	default:
+		return -EINVAL;
+	}
 
-			if (ret < 0)
-				return ret;
-		}
-		xctrl->value = uvc_mapping_get_s32(mapping, UVC_GET_DEF,
-						   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
-		return 0;
+	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qc);
+	if (ret < 0)
+		return ret;
+
+	switch (which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		xctrl->value = qc.default_value;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		xctrl->value = qc.minimum;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		xctrl->value = qc.maximum;
+		break;
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int uvc_mapping_get_xctrl(struct uvc_video_chain *chain,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 4025811fb9e7..ff7d0fd9e458 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1036,6 +1036,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	switch (ctrls->which) {
 	case V4L2_CTRL_WHICH_DEF_VAL:
 	case V4L2_CTRL_WHICH_CUR_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+	case V4L2_CTRL_WHICH_MIN_VAL:
 		which = ctrls->which;
 		break;
 	default:

-- 
2.48.1.362.g079036d154-goog


