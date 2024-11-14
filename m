Return-Path: <linux-media+bounces-21423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1110B9C9237
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5351281604
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4056A1B2193;
	Thu, 14 Nov 2024 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V+9cYduD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086A71AF0D5
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611459; cv=none; b=FebHsLnRzKJF9cF++rp5FJy/ndksKk2pp7JQORo5K1TjJz5IMdZAu9VdtMDSxF4Fpq/viTthKh68QHid55TmVdZGTYrfD+3sdf9hOTkXiiCvV+pB616TZo3M9L+f4q/VhmC1QCuCvgWpf6HGzgeNY6Dn1boRZwlvb3Sz+VLPMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611459; c=relaxed/simple;
	bh=oq440kgPkAQhG9oi3yrxId3dsdrPC0s/a6e3SBTmY9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqKHFoF5DwW5OVhuhxSZ86tWJNucL8zgbWxw6n+6/tf9acv9W5agUcpjHgdYmmHqwDgBbL7oj5iNOXIeIz/x0MjJV5wG+7iUas9TtgeVmF/jqApDbBQkBh64arAz4RW0p8O2e930HHOH6m9GoRj6KyQn/DwFFSV5ltSuM5kFKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V+9cYduD; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b15416303aso57429185a.1
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611456; x=1732216256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUNPuZP1461Q7ZURisQrbqS4YW2rP86ATE8dHXg5UnY=;
        b=V+9cYduD+mDiLI0Nwaf79aQzvIEKTxZjYvlbsJXn0KPQxwMlgtt9VZMjS1qNNoB6fe
         rF8NsUEoQeOM7u5xTHvujy42SEcMNUeim273T8x6DyyCXy4vkhepEbt998NkXK2/yl7A
         pOcIfb7VB9d+XGrmXAbqZpsgEDrRjB3jlDY1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611456; x=1732216256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUNPuZP1461Q7ZURisQrbqS4YW2rP86ATE8dHXg5UnY=;
        b=Ztk53HTc94/yODbHruQVDRNaxgJrfLt7O09VjKNjssjWKijKdaXaJat3r0Mvmq/cCO
         GdshQ1T5pL0t70ymkllv2dzhzHnLoXj58nx8dtbkRejxkoLMV+OieJVPl9qyDYwEEh67
         v7Zj8HhZWXyoJTAdPSj4gW/STdljcfcTz3cvn2LvmiBW2JmR8dpMNtpuNiSx7tOgJuiN
         k474oKz9ytuvOP/t+uGs/PdiU9SLivbvI46mx3LOvXgaW2Tv1f1ERxqNOVF8qYy30xtX
         B231IMmsf0Nz78UR9oMqitesZrkBkAjf8b2idPPUyLWr7QhHTtIIWBErla4pRDyT2vX0
         KbXA==
X-Forwarded-Encrypted: i=1; AJvYcCVXSQewQoUatNgbl1aZqxHWfgNTlDn5xsZdpuUxTKaa76k/s7FoZGfBZboHajj0QUqJR0LcZsMK8aHxrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+2uiDKCn/kxZTOtAiH0WeK/LW45biHSD+dcDMCTIxqpN+94FV
	LhcFSOYUS6CMibKj68kQgEH7t3PThNcwZFxDnYZaX9YzP6FGpqf/P3VEXIfcFw==
X-Google-Smtp-Source: AGHT+IG+L7MCCPunuQpdTHZAW3SSa7WlJBojBgUUn00gVEvYkzaXDKwAyHGPjRtQlCsfjqSPt192lw==
X-Received: by 2002:a05:6214:398e:b0:6cb:832e:9267 with SMTP id 6a1803df08f44-6d3edca403emr33642486d6.7.1731611455939;
        Thu, 14 Nov 2024 11:10:55 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:40 +0000
Subject: [PATCH v15 11/19] media: uvcvideo: add support for compound
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-11-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
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
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 224 ++++++++++++++++++++++++++++++++-------
 drivers/media/usb/uvc/uvcvideo.h |   5 +
 2 files changed, 192 insertions(+), 37 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 893d12cd3f90..e51cd0a2228a 100644
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
@@ -1048,7 +1053,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
 
 static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
 	struct uvc_control_mapping **mapping, struct uvc_control **control,
-	int next)
+	int next, int next_compound)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *map;
@@ -1063,14 +1068,16 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
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
@@ -1084,6 +1091,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl = NULL;
 	struct uvc_entity *entity;
 	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
 
 	*mapping = NULL;
 
@@ -1092,12 +1100,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 
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
 
@@ -1220,7 +1229,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 				  u32 found_id)
 {
-	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	bool find_next = req_id &
+		(V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND);
 	unsigned int i;
 
 	req_id &= V4L2_CTRL_ID_MASK;
@@ -1310,10 +1320,12 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
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
@@ -1377,10 +1389,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
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
 
@@ -1388,6 +1405,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
@@ -1627,11 +1653,12 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
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
@@ -1650,7 +1677,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
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
@@ -1736,6 +1768,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 
 	for (i = 0; i < xctrls_count; ++i) {
 		u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
+		s32 value;
 
 		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
 		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
@@ -1760,6 +1793,10 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 						  slave_id);
 		}
 
+		if (uvc_ctrl_mapping_is_compound(mapping))
+			value = 0;
+		else
+			value = xctrls[i].value;
 		/*
 		 * If the master is being modified in the same transaction
 		 * flags may change too.
@@ -1770,7 +1807,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 			changes |= V4L2_EVENT_CTRL_CH_FLAGS;
 
 		uvc_ctrl_send_event(handle->chain, handle, ctrl, mapping,
-				    xctrls[i].value, changes);
+				    value, changes);
 	}
 }
 
@@ -1802,7 +1839,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (uvc_ctrl_mapping_is_compound(mapping) ||
+		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1935,7 +1973,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 
 	for (i = 0; i < ctrls->count; i++) {
 		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
-				   &ctrl_found, 0);
+				   &ctrl_found, 0, 0);
 		if (uvc_control == ctrl_found)
 			return i;
 	}
@@ -1971,19 +2009,59 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
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
@@ -2002,6 +2080,33 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
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
@@ -2085,6 +2190,37 @@ static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
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
@@ -2122,8 +2258,9 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
 		       ctrl->info.size);
 	}
 
-	uvc_mapping_set_s32(mapping, xctrl->value,
-			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	ret = uvc_mapping_set_xctrl(ctrl, mapping, xctrl);
+	if (ret)
+		return ret;
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
@@ -2501,6 +2638,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *map;
 	unsigned int size;
 	unsigned int i;
+	int ret;
 
 	/*
 	 * Most mappings come from static kernel data, and need to be duplicated.
@@ -2518,8 +2656,10 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	/* For UVCIOC_CTRL_MAP custom control */
 	if (mapping->name) {
 		map->name = kstrdup(mapping->name, GFP_KERNEL);
-		if (!map->name)
-			goto err_nomem;
+		if (!map->name) {
+			ret = -ENOMEM;
+			goto free_mem;
+		}
 	}
 
 	INIT_LIST_HEAD(&map->ev_subs);
@@ -2529,21 +2669,31 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		       * fls(mapping->menu_mask);
 		map->menu_mapping = kmemdup(mapping->menu_mapping, size,
 					    GFP_KERNEL);
-		if (!map->menu_mapping)
-			goto err_nomem;
+		if (!map->menu_mapping) {
+			ret = -ENOMEM;
+			goto free_mem;
+		}
 	}
 	if (mapping->menu_names && mapping->menu_mask) {
 		size = sizeof(mapping->menu_names[0])
 		       * fls(mapping->menu_mask);
 		map->menu_names = kmemdup(mapping->menu_names, size,
 					  GFP_KERNEL);
-		if (!map->menu_names)
-			goto err_nomem;
+		if (!map->menu_names) {
+			ret = -ENOMEM;
+			goto free_mem;
+		}
 	}
 
-	if (map->get == NULL)
+	if (uvc_ctrl_mapping_is_compound(map))
+		if (WARN_ON(!map->set || !map->get)) {
+			ret = -EIO;
+			goto free_mem;
+		}
+
+	if (!map->get)
 		map->get = uvc_get_le_value;
-	if (map->set == NULL)
+	if (!map->set)
 		map->set = uvc_set_le_value;
 
 	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
@@ -2561,12 +2711,12 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 
 	return 0;
 
-err_nomem:
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


