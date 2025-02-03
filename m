Return-Path: <linux-media+bounces-25571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81666A258CA
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25623A853F
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FC2205E28;
	Mon,  3 Feb 2025 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SZ1rHYc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26031205ADD
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583766; cv=none; b=sZJiKaEGFS90BbhcvR89aTgIEe23LGNILflaW91YpAYDfpkDZ+Plq+DNiWVvYmI97LGwQbEJHzLL9enoB2DVMa8TVRSKntxqYSP5po23pM5EInbXydPUatjNcTEtQebNFyjI2wCoyjJ8d5vR7WzzGsdhLEG7mTyWwllAgArYCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583766; c=relaxed/simple;
	bh=l/fcdHhsZc1G8kfqRIGNDU+WYdRMCOvEOwkUO1BblOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5panWLlenggnQFxK4URo/aDl5zbKs6APcF16ho6P1DAWxZpq4wvwLZ9RhgyKkxb0Io8IkCPvsRqo8gvfnQJai9N4/NNwCFRTMhDZH5f6db2cIiGPW0cq/yIh2kyeFO4IQojD3RW0LU5AYXa0bILaJ5Y2BT4vzPRzIFY2IYnNCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SZ1rHYc6; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afde39e360so1034458137.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583763; x=1739188563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sF4HNI5vFPmPVaNfnuD6G4Y5GTStktdnYr0fU81onE=;
        b=SZ1rHYc69r4uzuFSlmQg5iJ73fhTiQh8hbal+fImnQ1u2kS/VUtjDHeQFXyifsVRZd
         01JiocyNvoAHiM98+EfOEkFpCvQRwctQt12d5YZtNWBbU1X1DMwLsSqSKdgKpCdFzkIT
         AKJZJ49P5j9vMKo6ZCRRQ4kySTgjYYGpK/dNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583763; x=1739188563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sF4HNI5vFPmPVaNfnuD6G4Y5GTStktdnYr0fU81onE=;
        b=TeKYPE515JYZ/myPUk0NXUEL9HBHm7+C4G/E/wEEQisVOKLLzSPc1o47HkU+mmpVAe
         xNqr8SsrX9lGY4ZaAD9wtc3JFX0KOuJR5dgxxxlJZvSNw8PaSePNVthXrRdKLTV6P3zm
         ylhjXMV4kGJyCyTd9R4i1oiWtJp8ENTRA5uP8La2P6ZF1xyFOfPqQDyKKWsX01AMYm7M
         UUi5Q8MPnlDNn7iTvjqPl/X84X2RMDJ/UsfPwQEJ8om+lcXfGoyCcDnTenwPKkg6POZ/
         dUkmA9LMJ+flr8N/c8YhFEhWsbJBoONS8pqQPzuf+aD4RPWpFi8vSpWwWmlApSikKFp8
         Mujw==
X-Forwarded-Encrypted: i=1; AJvYcCUOlknkXm7isaO++VY2xIqsu5pIUCpG03oYtK9OQM9RTrmtpP/MSWRrTvj2EW6yC2b3B4iDPDzTtA9+CA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0v/JLqWrpy5dgKS6oTc5ImojMejmBzL4XG+2mWyztGlNz/He+
	6OdiO+8oxVDkG4uIlXyiWCTIhGXZwEa2ZiE8mqNwY03ywy8C3NJL+la1FN91Rg==
X-Gm-Gg: ASbGncsD/GA+9bYT0/LLt78yso++P6jbk6wP7KbW49E4rsltsayNSlW3TleqIBRxQEb
	ca1sL4TXbKaWUWv12oxrdT456hw59g2UMsCtVqBuuTVUzxxYn7d4+sc48ITfrgUEB8PKUrLE5uX
	xFdu51XZd1bOZCjM+gsfcnFo2KdElxtkyuU+iN6qUssAQTnYMagxNzrKeKI99jLCiMFalxWQSmc
	7Tasq8qTkNReLSbF41Jxp4McDGjInxIBXul+MIX7DqE53vZ2+iVw8AMSIgyzIm4ybUPvf6asv5b
	VjW08nz+0pfUXh88dedvI+OsQQqdzHsdj93sbbyhHEs6sLo7QbMJw2Y1OdmlbWTGTA==
X-Google-Smtp-Source: AGHT+IH3DiLPTkUdxBLBfUiIGXa7NKTm3tt7X5VWElLM4TJp33bz1gCXlPjF+Ehy/3tK93p9qyUu1Q==
X-Received: by 2002:a05:6102:2ad3:b0:4af:bb06:62d with SMTP id ada2fe7eead31-4b9a4f499c9mr13926394137.11.1738583763057;
        Mon, 03 Feb 2025 03:56:03 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:01 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:46 +0000
Subject: [PATCH v17 10/17] media: uvcvideo: add support for compound
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-10-5900a9fed613@chromium.org>
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
index b6fd06bd1006..b8bf8ca95747 100644
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
@@ -1696,7 +1723,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 		uvc_ctrl_set_handle(handle, ctrl, NULL);
 
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
@@ -1780,6 +1812,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 
 	for (i = 0; i < xctrls_count; ++i) {
 		u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
+		s32 value;
 
 		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
 		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
@@ -1804,6 +1837,10 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 						  slave_id);
 		}
 
+		if (uvc_ctrl_mapping_is_compound(mapping))
+			value = 0;
+		else
+			value = xctrls[i].value;
 		/*
 		 * If the master is being modified in the same transaction
 		 * flags may change too.
@@ -1814,7 +1851,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 			changes |= V4L2_EVENT_CTRL_CH_FLAGS;
 
 		uvc_ctrl_send_event(handle->chain, handle, ctrl, mapping,
-				    xctrls[i].value, changes);
+				    value, changes);
 	}
 }
 
@@ -1846,7 +1883,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (uvc_ctrl_mapping_is_compound(mapping) ||
+		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1986,7 +2024,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 
 	for (i = 0; i < ctrls->count; i++) {
 		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
-				   &ctrl_found, 0);
+				   &ctrl_found, 0, 0);
 		if (uvc_control == ctrl_found)
 			return i;
 	}
@@ -2022,19 +2060,64 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
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
@@ -2053,6 +2136,33 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
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
@@ -2136,6 +2246,42 @@ static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
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
@@ -2175,8 +2321,9 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
 		       ctrl->info.size);
 	}
 
-	uvc_mapping_set_s32(mapping, xctrl->value,
-			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	ret = uvc_mapping_set_xctrl(ctrl, mapping, xctrl);
+	if (ret)
+		return ret;
 
 	ctrl->dirty = 1;
 	ctrl->modified = 1;
@@ -2551,6 +2698,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *map;
 	unsigned int size;
 	unsigned int i;
+	int ret;
 
 	/*
 	 * Most mappings come from static kernel data, and need to be duplicated.
@@ -2591,6 +2739,12 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
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
@@ -2612,11 +2766,13 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
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
index b55d5c23dfca..2f9a1bf8b48a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -116,7 +116,12 @@ struct uvc_control_mapping {
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
2.48.1.362.g079036d154-goog


