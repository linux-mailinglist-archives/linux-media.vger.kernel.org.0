Return-Path: <linux-media+bounces-23012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDC9EACCB
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5AF428CBCE
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A593DABEB;
	Tue, 10 Dec 2024 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UsPZUy+A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06729215792
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823784; cv=none; b=FyUTYYV2MixITBQA5v/Dex5hW+5WT7A5pFyq8PASSx6dVTGPcAFnsGLK4nQOqpdax0wCJm/CkRNCwHyo3V4gFhEtLentwVVzfY4Ts0hWTxCjVABlxn7oGZOuCveNNPqXuYB3ETojzp+Hl95TQ48ZNC7X8BlLYVsDGJsmVchlu3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823784; c=relaxed/simple;
	bh=syU3SP1UFRBOFzSKFIOQYfVKkT7l3MfLBIScrqiIV0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gt+zgEAp+hn7MVHO3mOuO8tRG/ja1Q4JZRZ1/ya2uA74t+r6cn5Edn3DXr/LG8ACczH5PXkXx5CCtxTem4k/N0ZhnGcz3EsSyiVWU9E2trcVxJWBqVl7O4Un6vEL4aZs24RlxDVJxn6hKUTWSBdfLfJ02Xo7A+gK5e19WdGeAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UsPZUy+A; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46779ae3139so3659191cf.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823780; x=1734428580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bkn1FTenh9IoogHBbEytCPJjCzMA63zFkclq+5ZFIRM=;
        b=UsPZUy+A9GjVyL3fq9jfxdpCwETI14p7exqgCsThobYcx9QDEdfXE9O2kPpShQKkkI
         Z7lj1KfoiU41aYQ4hk5UhubusPVqsS8UU/emiRSQcOtelMJj7jdZGAxEENcuojQ9wu1X
         mJSSdFiSDAI9C87zglX19w0dS8zRJ0T0o5RmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823780; x=1734428580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bkn1FTenh9IoogHBbEytCPJjCzMA63zFkclq+5ZFIRM=;
        b=bUZEMjO6HYMkzYWmIZwco8eTv37kXf7AsPhP8qe/ImFuWYLzEeweFsQ/QYJw8UBt++
         EE3DBRZCxXjHxe1boMDDjGYBRP9WQ+wySFvqzfgMCrcRD2GPP8Y5oi/BmEgVjYrdfJ/P
         XkXQQjls5T3cYHFPfc+Ah0sr1U7G1A9sn3eWFoDy/OlzlABKVDeZxYkc3z92dKaTi+LP
         +/iIiCt5A7FqNUfC/8Bi/nqnsM8GcGzaGKyh3Rr9o6MQJB4DiskGXMNsEt71tEHhQsAI
         iAz3h1D0g8IVAgLwJt9uHZfsh10ZjsBiXPbGrW7SBXCU3KkmtGdxwkFGGUbymuVy5R62
         Mm7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP73e5lzK4jkFj4fC0QOqTnKNDbxY2CSaEm3zs2ZRDCOQwgkY/LslDvRD/pRYIAFD2vv3k+03ysqO0Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxajfdMIr7ILOzaSmdeU+6SUs9EIb3C+EtLw3FDEoVGh5ph2Km5
	ydIRTvVtM98ZoJftbOHpou3e++ndz24r+2yWlTHWmvJbtEg/mwdat2o81kAAtQ==
X-Gm-Gg: ASbGncttWRD1uuZiOvgYt/ZDjVyb3FBZ14K5n7/kkMiTT57aYbSgq40lo75XOHr96Fc
	ZAkxArk0D1U9DbwW9VOcuLfIZQMaCU0lVYx9WyH2ogn4Azl/tOLUHVSFrFQo0xr27emo3hwLkyu
	8QRrrGyKSZHLOUZQw7y2RYA/1FCNnCkkTw6l4lq/DIK6lLu9CKj1JNpax18esoUeut9REXo9NEA
	QPnmk5tBPbBf/Xyt9RrEr5eN65dPet3hsAVdvjkegZbGMLnRxd49YA+epo+J4teKZyGzW2/EkJs
	N6N4y3E/nA1wNvhtYXZo1ax1xjf/
X-Google-Smtp-Source: AGHT+IGXUszI74qq0e9uoefo1xO0lmDcF16DFHbJ0I0zOd9Bd+fviDJXHggCHAlkl2mjD7gP0nC2NA==
X-Received: by 2002:a05:6214:4009:b0:6d8:9065:2033 with SMTP id 6a1803df08f44-6d91e435246mr52366936d6.31.1733823779986;
        Tue, 10 Dec 2024 01:42:59 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:42:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:47 +0000
Subject: [PATCH v16 11/18] media: uvcvideo: add support for compound
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-11-e8201f7e8e57@chromium.org>
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

This patch adds support for compound controls. This is required to
support controls that cannot be represented with a s64 data, such as the
Region of Interest.

Signed-off-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 212 +++++++++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h |   5 +
 2 files changed, 189 insertions(+), 28 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4d0307b28fa8..794d5c365352 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -367,6 +367,11 @@ static const u32 uvc_control_classes[] = {
 
 static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
 
+static bool uvc_ctrl_mapping_is_compound(struct uvc_control_mapping *mapping)
+{
+	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
+}
+
 static s32 uvc_mapping_get_s32(struct uvc_control_mapping *mapping,
 			       u8 query, const void *data_in)
 {
@@ -1055,7 +1060,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
 
 static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
 	struct uvc_control_mapping **mapping, struct uvc_control **control,
-	int next)
+	int next, int next_compound)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *map;
@@ -1070,14 +1075,16 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
 			continue;
 
 		list_for_each_entry(map, &ctrl->info.mappings, list) {
-			if ((map->id == v4l2_id) && !next) {
+			if (map->id == v4l2_id && !next && !next_compound) {
 				*control = ctrl;
 				*mapping = map;
 				return;
 			}
 
 			if ((*mapping == NULL || (*mapping)->id > map->id) &&
-			    (map->id > v4l2_id) && next) {
+			    (map->id > v4l2_id) &&
+			    (uvc_ctrl_mapping_is_compound(map) ?
+			     next_compound : next)) {
 				*control = ctrl;
 				*mapping = map;
 			}
@@ -1091,6 +1098,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl = NULL;
 	struct uvc_entity *entity;
 	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
 
 	*mapping = NULL;
 
@@ -1099,12 +1107,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 
 	/* Find the control. */
 	list_for_each_entry(entity, &chain->entities, chain) {
-		__uvc_find_control(entity, v4l2_id, mapping, &ctrl, next);
-		if (ctrl && !next)
+		__uvc_find_control(entity, v4l2_id, mapping, &ctrl, next,
+				   next_compound);
+		if (ctrl && !next && !next_compound)
 			return ctrl;
 	}
 
-	if (ctrl == NULL && !next)
+	if (!ctrl && !next && !next_compound)
 		uvc_dbg(chain->dev, CONTROL, "Control 0x%08x not found\n",
 			v4l2_id);
 
@@ -1227,7 +1236,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 				  u32 found_id)
 {
-	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	bool find_next = req_id &
+		(V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND);
 	unsigned int i;
 
 	req_id &= V4L2_CTRL_ID_MASK;
@@ -1317,10 +1327,12 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	}
 
 	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
-			   &master_ctrl, 0);
+			   &master_ctrl, 0, 0);
 
 	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
 		return 0;
+	if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
+		return -EIO;
 
 	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
 	if (ret >= 0 && val != mapping->master_manual)
@@ -1384,10 +1396,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0);
+				   &master_map, &master_ctrl, 0, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
 		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+		int ret;
+
+		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
+			return -EIO;
+
+		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
 		if (ret < 0)
 			return ret;
 
@@ -1395,6 +1412,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 	}
 
+	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
+		v4l2_ctrl->default_value = 0;
+		v4l2_ctrl->minimum = 0;
+		v4l2_ctrl->maximum = 0;
+		v4l2_ctrl->step = 0;
+		return 0;
+	}
+
 	if (!ctrl->cached) {
 		int ret = uvc_ctrl_populate_cache(chain, ctrl);
 		if (ret < 0)
@@ -1635,11 +1661,12 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 	s32 val = 0;
 
-	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
+	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
 	if (ctrl == NULL)
 		return;
 
-	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
+	if (uvc_ctrl_mapping_is_compound(mapping) ||
+	    __uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
@@ -1658,7 +1685,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 	ctrl->handle = NULL;
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
-		s32 value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
+		s32 value;
+
+		if (uvc_ctrl_mapping_is_compound(mapping))
+			value = 0;
+		else
+			value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
 
 		/*
 		 * handle may be NULL here if the device sends auto-update
@@ -1744,6 +1776,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 
 	for (i = 0; i < xctrls_count; ++i) {
 		u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
+		s32 value;
 
 		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
 		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
@@ -1768,6 +1801,10 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 						  slave_id);
 		}
 
+		if (uvc_ctrl_mapping_is_compound(mapping))
+			value = 0;
+		else
+			value = xctrls[i].value;
 		/*
 		 * If the master is being modified in the same transaction
 		 * flags may change too.
@@ -1778,7 +1815,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 			changes |= V4L2_EVENT_CTRL_CH_FLAGS;
 
 		uvc_ctrl_send_event(handle->chain, handle, ctrl, mapping,
-				    xctrls[i].value, changes);
+				    value, changes);
 	}
 }
 
@@ -1810,7 +1847,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (uvc_ctrl_mapping_is_compound(mapping) ||
+		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1943,7 +1981,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 
 	for (i = 0; i < ctrls->count; i++) {
 		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
-				   &ctrl_found, 0);
+				   &ctrl_found, 0, 0);
 		if (uvc_control == ctrl_found)
 			return i;
 	}
@@ -1979,19 +2017,64 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	return ret;
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
-		 struct v4l2_ext_control *xctrl)
+static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
+					  struct uvc_control *ctrl,
+					  struct uvc_control_mapping *mapping,
+					  u32 which,
+					  struct v4l2_ext_control *xctrl)
 {
-	struct uvc_control *ctrl;
-	struct uvc_control_mapping *mapping;
-
-	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
-		return -EACCES;
+	u8 *data __free(kfree) = NULL;
+	size_t size;
+	u8 query;
+	int ret;
+	int id;
 
-	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
-	if (ctrl == NULL)
+	switch (which) {
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		ret = __uvc_ctrl_load_cur(chain, ctrl);
+		if (ret < 0)
+			return ret;
+		id = UVC_CTRL_DATA_CURRENT;
+		query = UVC_GET_CUR;
+		break;
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		ret = uvc_ctrl_populate_cache(chain, ctrl);
+		if (ret < 0)
+			return ret;
+		id = UVC_CTRL_DATA_DEF;
+		query = UVC_GET_DEF;
+		break;
+	default:
 		return -EINVAL;
+	}
+
+	size = DIV_ROUND_UP(mapping->size, 8);
+	if (xctrl->size < size) {
+		xctrl->size = size;
+		return -ENOSPC;
+	}
+
+	data = kmalloc(size, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = mapping->get(mapping, query, uvc_ctrl_data(ctrl, id), size, data);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * v4l2_ext_control does not have enough room to fit a compound control.
+	 * Instead, the value is in the user memory at xctrl->ptr. The v4l2
+	 * ioctl helper does not copy it for us.
+	 */
+	return copy_to_user(xctrl->ptr, data, size) ? -EFAULT : 0;
+}
 
+static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
+				     struct uvc_control *ctrl,
+				     struct uvc_control_mapping *mapping,
+				     u32 which, struct v4l2_ext_control *xctrl)
+{
 	switch (which) {
 	case V4L2_CTRL_WHICH_CUR_VAL:
 		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
@@ -2010,6 +2093,33 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 	return -EINVAL;
 }
 
+static int uvc_mapping_get_xctrl(struct uvc_video_chain *chain,
+				 struct uvc_control *ctrl,
+				 struct uvc_control_mapping *mapping,
+				 u32 which, struct v4l2_ext_control *xctrl)
+{
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return uvc_mapping_get_xctrl_compound(chain, ctrl, mapping,
+						      which, xctrl);
+	return uvc_mapping_get_xctrl_std(chain, ctrl, mapping, which, xctrl);
+}
+
+int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
+		 struct v4l2_ext_control *xctrl)
+{
+	struct uvc_control *ctrl;
+	struct uvc_control_mapping *mapping;
+
+	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
+		return -EACCES;
+
+	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
+	if (!ctrl)
+		return -EINVAL;
+
+	return uvc_mapping_get_xctrl(chain, ctrl, mapping, which, xctrl);
+}
+
 static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
 			  struct uvc_control *ctrl,
 			  struct uvc_control_mapping *mapping,
@@ -2093,6 +2203,42 @@ static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static int uvc_mapping_set_xctrl_compound(struct uvc_control *ctrl,
+					  struct uvc_control_mapping *mapping,
+					  struct v4l2_ext_control *xctrl)
+{
+	u8 *data __free(kfree) = NULL;
+	size_t size;
+
+	size = DIV_ROUND_UP(mapping->size, 8);
+	if (xctrl->size != size)
+		return -EINVAL;
+
+	/*
+	 * v4l2_ext_control does not have enough room to fit a compound control.
+	 * Instead, the value is in the user memory at xctrl->ptr. The v4l2
+	 * ioctl helper does not copy it for us.
+	 */
+	data = memdup_user(xctrl->ptr, size);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return mapping->set(mapping, size, data,
+			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+}
+
+static int uvc_mapping_set_xctrl(struct uvc_control *ctrl,
+				 struct uvc_control_mapping *mapping,
+				 struct v4l2_ext_control *xctrl)
+{
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return uvc_mapping_set_xctrl_compound(ctrl, mapping, xctrl);
+
+	uvc_mapping_set_s32(mapping, xctrl->value,
+			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	return 0;
+}
+
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
 {
 	struct uvc_video_chain *chain = handle->chain;
@@ -2130,8 +2276,9 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
 		       ctrl->info.size);
 	}
 
-	uvc_mapping_set_s32(mapping, xctrl->value,
-			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	ret = uvc_mapping_set_xctrl(ctrl, mapping, xctrl);
+	if (ret)
+		return ret;
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
@@ -2509,6 +2656,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *map;
 	unsigned int size;
 	unsigned int i;
+	int ret;
 
 	/*
 	 * Most mappings come from static kernel data, and need to be duplicated.
@@ -2549,6 +2697,12 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 			goto err_nomem;
 	}
 
+	if (uvc_ctrl_mapping_is_compound(map))
+		if (WARN_ON(!map->set || !map->get)) {
+			ret = -EIO;
+			goto free_mem;
+		}
+
 	if (map->get == NULL)
 		map->get = uvc_get_le_value;
 	if (map->set == NULL)
@@ -2570,11 +2724,13 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	return 0;
 
 err_nomem:
+	ret = -ENOMEM;
+free_mem:
 	kfree(map->menu_names);
 	kfree(map->menu_mapping);
 	kfree(map->name);
 	kfree(map);
-	return -ENOMEM;
+	return ret;
 }
 
 int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3d32a56c5ff8..f429f325433b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -115,7 +115,12 @@ struct uvc_control_mapping {
 	u8 entity[16];
 	u8 selector;
 
+	/*
+	 * Size of the control data in the payload of the UVC control GET and
+	 * SET requests, expressed in bits.
+	 */
 	u8 size;
+
 	u8 offset;
 	enum v4l2_ctrl_type v4l2_type;
 	u32 data_type;

-- 
2.47.0.338.g60cca15819-goog


