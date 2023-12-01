Return-Path: <linux-media+bounces-1454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D6800499
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF47281636
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 07:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CFB12E48;
	Fri,  1 Dec 2023 07:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gsS/H0VB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A67131
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:53 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d3aa625542so8900897b3.1
        for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701415192; x=1702019992; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6C8SekB8YyvZgxsUdlghH361DxPsL2oozd53z2vxk+4=;
        b=gsS/H0VBbwjngOj14YHGzgSNWJCjbQbIYZMeFZTwS1NHKaIGTz8DPrczLf0TZoGyto
         6+eEkqkFPyrGKg6QN57CxWb3po9/W/8bSDzsP0m5k/T70lCodp+ctz64vLpI8MvoWQYZ
         IZabzCTFZLJ3IBBt6DN/MGuHBrnCXT09WFLJHFWRXudRaRXHIYa8j46CSvToWk1QZfG3
         8IUBZgZmbDmnFjGptgM1VQ/jG1anzDqb5mWkpDchnkSsCv7VH0mGrnJx1jOylHM5Wv1N
         IdxApoeYFZRDpfuEOVR8w07huNmFQvxD6Q+4dDcwNPY1cfU6a1ka4WMUd/70/F1KlZNd
         VjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415192; x=1702019992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6C8SekB8YyvZgxsUdlghH361DxPsL2oozd53z2vxk+4=;
        b=rhpvosQrqQK1hpeYxUW1EsWSKFnwqpkZilGpEQiERF/ZCmHikPK98Jd4HAa0TIrx/j
         LnXDNJugFvOJ5IpEQrdzJXcaI7VnWiWd7CmSRaybVAXy1dfK8zpcrBZwuY/EXX7Ew8Jo
         UhhHHFAv6WJ4FSv0GllWcNmUR6HF4e6kHwGJxQx/qhkkRZt7kioFmTTqD/v6oke5rmsX
         G2Rb2HnkHflTdsLdhrLphf18TpczPfqZMA7AVPaYB3tyr7ccKGEGapxAnIUEJR5ilY8W
         T2sTh+po86JJZ91vqJamgOOgN/pvWvEK02hulns5x/fSchtSz8reJm76UqM53Xen996A
         o1Vw==
X-Gm-Message-State: AOJu0YzsVd1FtKQlbuxJa8sP1hDK375Xt9GVh8IO0vAwqduTQx8eXM1W
	C593VQitbT8zi2H9zxh+TXExcxhaUX4=
X-Google-Smtp-Source: AGHT+IGmiOOm1zwviJl1YGNmcqk2bY50idlimoXK/vsqiOJkyMtsIxdUXeQBsbqb6iBfbBhz7yDOHooPB38=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:ea68:7c7a:2356:8a4a])
 (user=yunkec job=sendgmr) by 2002:a81:fe03:0:b0:5c1:4b36:85bf with SMTP id
 j3-20020a81fe03000000b005c14b3685bfmr1062710ywn.1.1701415192576; Thu, 30 Nov
 2023 23:19:52 -0800 (PST)
Date: Fri,  1 Dec 2023 16:18:59 +0900
In-Reply-To: <20231201071907.3080126-1-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201071907.3080126-9-yunkec@google.com>
Subject: [PATCH v14 08/11] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
From: Yunke Cao <yunkec@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v11:
- No change.
Changelog since v10:
- Added Reviewed-by from Sergey.
Changelog since v9:
- Revert a change in v7 that causes v4l2-compliance failure:
- In uvc_ioctl_g_ext_ctrls(), when v4l2_which is not V4L2_CTRL_WHICH_*_VAL,
- treat it the same as cur instead of returning EINVAL. This is the existing
- behavior.
- The change in v7 of returning EINVAL fails the check in
- v4l2-compliance/v4l2-test-controls.cpp#L834.
Changelog since v8:
- No change.
Changelog since v7:
- Address some comments.

 drivers/media/usb/uvc/uvc_ctrl.c | 64 +++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c |  7 +++-
 drivers/media/usb/uvc/uvcvideo.h |  3 +-
 3 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aae2480496b7..c073c2a02102 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1247,11 +1247,18 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!ctrl)
 		return -EINVAL;
 
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
-		return -EACCES;
-
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
-		return -EACCES;
+	if (read) {
+		if (ctrls->which == V4L2_CTRL_WHICH_MIN_VAL ||
+		    ctrls->which == V4L2_CTRL_WHICH_MAX_VAL) {
+			if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) ||
+			    !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX))
+				return -EINVAL;
+		} else if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+			return -EACCES;
+	} else {
+		if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
+			return -EACCES;
+	}
 
 	if (ioctl != VIDIOC_S_EXT_CTRLS || !mapping->master_id)
 		return 0;
@@ -1332,6 +1339,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
+	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
@@ -1981,6 +1991,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 				       struct uvc_control *ctrl,
 				       struct uvc_control_mapping *mapping,
+				       u32 v4l2_which,
 				       struct v4l2_ext_control *xctrl)
 {
 	struct v4l2_queryctrl qc = { .id = xctrl->id };
@@ -1990,28 +2001,59 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return ret;
 
-	xctrl->value = qc.default_value;
+	switch (v4l2_which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		xctrl->value = qc.default_value;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		xctrl->value = qc.minimum;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		xctrl->value = qc.maximum;
+		break;
+	}
+
 	return 0;
 }
 
 static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
 					    struct uvc_control *ctrl,
 					    struct uvc_control_mapping *mapping,
+					    u32 v4l2_which,
 					    struct v4l2_ext_control *xctrl)
 {
+	u32 flag, id;
 	int ret;
 
+	switch (v4l2_which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		flag = UVC_CTRL_FLAG_GET_DEF;
+		id = UVC_CTRL_DATA_DEF;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		flag = UVC_CTRL_FLAG_GET_MIN;
+		id = UVC_CTRL_DATA_MIN;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		flag = UVC_CTRL_FLAG_GET_MAX;
+		id = UVC_CTRL_DATA_MAX;
+		break;
+	}
+
+	if (!(ctrl->info.flags & flag) && flag != UVC_CTRL_FLAG_GET_DEF)
+		return -EINVAL;
+
 	if (!ctrl->cached) {
 		ret = uvc_ctrl_populate_cache(chain, ctrl);
 		if (ret < 0)
 			return ret;
 	}
 
-	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_DEF, xctrl);
+	return __uvc_ctrl_get_compound(mapping, ctrl, id, xctrl);
 }
 
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
-			  struct v4l2_ext_control *xctrl)
+			  struct v4l2_ext_control *xctrl, u32 v4l2_which)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -2028,9 +2070,11 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
 		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
-						       xctrl);
+						       v4l2_which, xctrl);
 	else
-		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
+		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping,
+						  v4l2_which, xctrl);
+
 
 done:
 	mutex_unlock(&chain->ctrl_mutex);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index ff72caf7bc9e..352f62ef02f2 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1094,9 +1094,12 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
+	switch (ctrls->which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			ret = uvc_ctrl_get_boundary(chain, ctrl);
+			ret = uvc_ctrl_get_boundary(chain, ctrl, ctrls->which);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 11805b729c22..6fda40919e7f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -790,7 +790,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
-			  struct v4l2_ext_control *xctrl);
+			  struct v4l2_ext_control *xctrl,
+			  u32 v4l2_which);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   const struct v4l2_ext_controls *ctrls,
-- 
2.43.0.rc2.451.g8631bc7472-goog


