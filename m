Return-Path: <linux-media+bounces-23013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376E29EACCF
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6971428450B
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A5C3DAC02;
	Tue, 10 Dec 2024 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RZwodfJl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09833238723
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823785; cv=none; b=bfds+qN3K8EBPIbVKMlHChe2kQzKiNiCtr+DezrjgKqsK/XQh+CZwEabpILIy+q3KJpxVBZO4qn+EACWH/Tlq+MMSQIxl1VLCuuRofvXUnMAQQNCwZe8pt4bk1TXvnmvf/Bpb5TXunE2eWE70vfICpWr9lrHY5X+crJNGxFAYME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823785; c=relaxed/simple;
	bh=1mIhj0L3S8RyfekH5P2w4xxehFGRoAkXfDpeUyyJAW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfVb1DN7C4/XbnOgGRWxwz0XfnmuIVXEjmuy7wiqnVmj29IofOnNEUnw3sO4pFUJG6+tDlzF6x9n1Ev8VmCm/t6UX/+MT5SAnnDWA5J9TTPqsYMJvUQQX3MwzNV+2fYueJCHQ+BTym/NWbMJxe3X6OcQsVQxiCODboaVaFwmI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RZwodfJl; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8fd060e27so24753986d6.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823782; x=1734428582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggsRkdgdY3jtYJRW9AvbLuVLQMJV/njoy22w/Cmb86g=;
        b=RZwodfJl/FxoCS42F31/3xCxxldV0O0D7atlhbxv+0nQucx5VbcRY9RXFFn0lcjAuG
         FnjOkJsXOz6AuKElciSCcRWMLZn6lSNQDHPKBOpW60aEq1U/qTOnWNoxIlCz76VO5fLC
         Dk/PpllIuwWx594pRIJHS3bq85My8Ziuu7ohc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823782; x=1734428582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggsRkdgdY3jtYJRW9AvbLuVLQMJV/njoy22w/Cmb86g=;
        b=J2Xe5BPpZE3zJAZ7WEO5uMtiDALMR4ADVNZ7cIIHvt/NcnMyBUf/Z3QFY1yrWxo+HX
         IKV7AWNZhYU1sSMo8H5mCrDnOZ9PYiZgXnWNBrkXrzAJPCRVS+OY8hfMVW/TNMpNKVEn
         KBh8w9c3WZ0ppeXpOj9arYNhOoja+QxOwe7GeWHk9iOsxg3Bm+iExCuQwEJ3VsQRVgGz
         apWBjnlEOhtGpTTj7KSXwH+dkjZwJqTlboFuM9/x5GRLJMimVV9/dSGenJHLDVU2G/gs
         vxdyUeuvxTlMR6g7d6nlkoEE7q1kRkKkWtGOJ7OxXXTdghfHUePaRuMykxA68JBsXsdH
         tjZg==
X-Forwarded-Encrypted: i=1; AJvYcCXc4ec4c5GzNxuDq1glXZuFIoeGlTvT8WK5BvCdOEgf7mTvK/rxJ7ejZMdls3d/O5wAYedPMikpu9imng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsrBjGLll2MPGwC0f58dKhmMTjQX/UiH4TJkJiWesFiFuNN2L
	XhVZ6xSBtifYOShzc+wBMK5/NG/9XybhfePn2k/M5oIQYjVWB9xpwVpZpaTgkg==
X-Gm-Gg: ASbGnct7rhrVokXdkF05spI4leKqP52hwErD725tTJO46axPuD0h8E89KdV4I6Yhj3T
	qybPSKRhQp+f+iGCpGcv5dPSd44VCoq3CHJ3C2y9B9xoB8l3ar+Y7BlLF46xsySaqysac2Jir1A
	JOQPSv7TRFfr/E7jgkuACCWP/cnj7IR28b7awAuDF9qtqZ3trCe5XdRaTPy3o+0OM42yNj/FecJ
	ydfIrbtdK1Sl2M+bF5Gf3r+jA6NNwASS+AkMUi+IeFasNetlAmCXWclYYDHonRCWIbFzfd0M3FQ
	RAVJby8XAjhFBntJaubDbR9W0qdT
X-Google-Smtp-Source: AGHT+IFWNgHEkkw0X3lGHyza0LOLXXjjNZr+apm6ApxDr5Cb85UBasRKklbmAAOPnhUreGFehC1jXg==
X-Received: by 2002:a05:6214:29e9:b0:6d8:7e03:c434 with SMTP id 6a1803df08f44-6d8e7118423mr255304156d6.20.1733823781973;
        Tue, 10 Dec 2024 01:43:01 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:43:01 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:49 +0000
Subject: [PATCH v16 13/18] media: uvcvideo: support
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-13-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
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
index 785af382103b..14aa9619fbf1 100644
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
@@ -2045,16 +2078,18 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 
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
@@ -2072,6 +2107,14 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
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
@@ -2089,22 +2132,37 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
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
index 65dbb53b1e75..7e284770149d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1087,6 +1087,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	switch (ctrls->which) {
 	case V4L2_CTRL_WHICH_DEF_VAL:
 	case V4L2_CTRL_WHICH_CUR_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+	case V4L2_CTRL_WHICH_MIN_VAL:
 		which = ctrls->which;
 		break;
 	default:

-- 
2.47.0.338.g60cca15819-goog


