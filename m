Return-Path: <linux-media+bounces-1449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396C800494
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC512817A5
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 07:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F0112B96;
	Fri,  1 Dec 2023 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nKfE8lHn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFC9131
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:28 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-db402e6f61dso381041276.3
        for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701415168; x=1702019968; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsjqXMsPVPqJed6Pc7qZS41a7yp/U2hsgVgzXjczfug=;
        b=nKfE8lHnKO9VHU1o2uqrE6YQxOtNEmWDnNUfUSlyKPyim4gA51XTNDbC10JbU08/f8
         Qrm3NBjHqn7yQbUCw96/gyYV7ZMwo1kmbW+v8DGIsCsnt5GSksqQ3iaN6eCfsd2iiNhW
         nodVi6MLUcIRtR7wkSdVbFzMWJLlva36itLvc7XqzmDRPLKUSP6RVwssONDk9K5Jdnru
         WqMgNY/P139g1v3KgxiPh6Tup/iUSTLLFrtu/sNFzu1wEM0lAt7hex1B2UT9xvxJ2rnA
         Ztk8aRvoIHnjpAKVDo8Ey4VRqXAV4TX0SJUnUrnmurT5w+qQIlZkUkdk8VgNm8B9KmmR
         y3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415168; x=1702019968;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsjqXMsPVPqJed6Pc7qZS41a7yp/U2hsgVgzXjczfug=;
        b=Ka3a777FuGTzDneZEvAjYbE8XMyK0lTwGLE52ZxdVn1H0aQWgkUqIWv5zx1PKq0Yov
         wSN8YIC0IdDuXY2q3ArAeh72nmKK3q0zIedBnK/TrUZhLyJJsi1/txNlX5zviE8/2dja
         OJop4pomaGoB9l+z9r5MuOFWX6lDQsaMLjBQDB97enp+1WDtousCdVXt+QD1d1en8dn+
         M4Yak8eeyVgz4qATPXY9x9FzdygjnPAF57+QjWV4E+Ep+5JbstppT2TdS6AN6lniN9Uo
         nrrqeaK7U/yr9TRYqjpyxz9hnwSBpYL4TLre+LojbRKl/vcDmVhs2cnaCwNYLLmXPFT/
         JkKw==
X-Gm-Message-State: AOJu0Ywi/kEnIYKW8IjQqbmtTm48lNGGQbCBJxnbn3eoNx8J6uVeZn/+
	xDoD3+9M67BCu2XFi4RkTxQcHcJqUnk=
X-Google-Smtp-Source: AGHT+IH1BP5H2OaY1ZJY8VpH5U/A09u79pAzPE0CYb/LYOzme2JEFay7mipSPmUROjtsMZ8ruTMcxVl9FSI=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:ea68:7c7a:2356:8a4a])
 (user=yunkec job=sendgmr) by 2002:a25:d151:0:b0:db5:48ed:9288 with SMTP id
 i78-20020a25d151000000b00db548ed9288mr80104ybg.12.1701415167910; Thu, 30 Nov
 2023 23:19:27 -0800 (PST)
Date: Fri,  1 Dec 2023 16:18:54 +0900
In-Reply-To: <20231201071907.3080126-1-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201071907.3080126-4-yunkec@google.com>
Subject: [PATCH v14 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
From: Yunke Cao <yunkec@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

Refactor uvc_ctrl to make adding compound control easier.

Currently __uvc_ctrl_get() only work for non-compound controls.
Move the logic into __uvc_ctrl_std(), return error for compound
controls.

Make __uvc_ctrl_get() call __uvc_ctrl_std() inside. Also modify some of the
callers of __uvc_ctrl_get() to call __uvc_ctrl_get_std() instead.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v12:
- No change.
Changelog since v11:
- Minor change to avoid negative if statement.
Changelog since v10:
- Better commit message.
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Newly added patch. Split the refactoring of uvc_ctrl_get from v7 3/7.

 drivers/media/usb/uvc/uvc_ctrl.c | 42 +++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 8d8333786333..4a685532f7eb 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1081,15 +1081,15 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 	return ret;
 }
 
-static int __uvc_ctrl_get(struct uvc_video_chain *chain,
-			  struct uvc_control *ctrl,
-			  struct uvc_control_mapping *mapping,
-			  s32 *value)
+static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
+			      struct uvc_control *ctrl,
+			      struct uvc_control_mapping *mapping,
+			      s32 *value)
 {
 	int ret;
 
-	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
-		return -EACCES;
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
 
 	ret = __uvc_ctrl_load_cur(chain, ctrl);
 	if (ret < 0)
@@ -1199,7 +1199,7 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
 		return 0;
 
-	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+	ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
 	if (ret >= 0 && val != mapping->master_manual)
 		return -EACCES;
 
@@ -1264,8 +1264,13 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+		s32 val = 0;
+		int ret;
+
+		if (uvc_ctrl_mapping_is_compound(master_map))
+			return -EINVAL;
+
+		ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
 		if (ret < 0)
 			return ret;
 
@@ -1532,7 +1537,8 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return;
 
-	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
+	if (uvc_ctrl_mapping_is_compound(mapping) ||
+	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
@@ -1703,7 +1709,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (uvc_ctrl_mapping_is_compound(mapping) ||
+		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1883,7 +1890,10 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+	else
+		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
 }
 
 static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
@@ -2042,8 +2052,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	mapping->set(mapping, value,
-		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+	else
+		mapping->set(mapping, value,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
-- 
2.43.0.rc2.451.g8631bc7472-goog


