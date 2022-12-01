Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE37A63E7E6
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiLACcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiLACcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:32:43 -0500
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D050AB4A0
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:39 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id pq17-20020a17090b3d9100b0020a4c65c3a9so589832pjb.0
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo278ZnD8Ru9U04sopkJReNUlCva6BHaqqdIKLMz17o=;
        b=enJobTO9L86PQFNoQUN6fVdh3PRU/4MrTlMCWNmX+6KDRT7pRvOpLFnmnxC85P4kqi
         UI0UwPFJDCz7dmF61KYJ10L3Kbz8l/+R+QW/h1iWgxFL3bUR7aoCMMITV0oy0QqUL9pE
         u/qVIxS+MBposukHg8ime5NF3WlrtqiGNyKpEjBc0qRgVF0QxWPcczx2yjuEj9EMb+GL
         qf/ZRpM4L5rwYo9RLTfAlnwlEZdZoLlq+S/hP0IUWa4VXI0wXihi7Kl2xF/LesZcldQl
         ojT4IRX/jb24FzI0ODYLgEaGuIgb3avIg48dmB6neRqpdgW701qwU0GVlykIlq02pAY1
         CDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo278ZnD8Ru9U04sopkJReNUlCva6BHaqqdIKLMz17o=;
        b=azjqx+KRKSunqESUoJf5S/3OcDUd7uL/xSNXgcn8sORPMxT+BeY5CgNKK1Uy9i15dJ
         GvUsRFedNOt/Yj3k30W0VMjEKTwE/dG+dmR8aNq/HpR6iy4200XOyrrY3ex6MsCKU+rn
         8iSbN09H+Zl78WQwxwC/RnDAdH1elQlTgU2AVmFz6Yrtt0id4bLjyGe5clTlaf7onK3D
         t8uUh7cifFRfbD0Hvp/+pHAaBbErlxHFwGk+6TJe/AOJ1PDvf0BZkzMrN8IVzpUdYvRm
         1iaMgq3kYGHAW/zf900UxK+5CvuewTSbBI9JYwZmVoWWmhH6iO28SZFOuPoOVdnnW7c6
         CxEA==
X-Gm-Message-State: ANoB5pkUp0CKpm8Lky53+lMzZ/4/7wEfmEp972ierPTdksdU5EtqY2kj
        GIYfuEQpU51h1aKcw/7Zkcisx7FHO1k=
X-Google-Smtp-Source: AA0mqf6OxvIxiaDgHVs2T5bQqaJiIBuIgh1h/95+iEfszd/OOWEmoqrXIi7DeajWzt6XvY5mrd+qWRBH0h8=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a17:90a:d086:b0:219:227d:d91f with SMTP id
 k6-20020a17090ad08600b00219227dd91fmr2439803pju.0.1669861958771; Wed, 30 Nov
 2022 18:32:38 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:31:58 +0900
In-Reply-To: <20221201023204.2177458-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-6-yunkec@google.com>
Subject: [PATCH v10 05/11 RESEND] media: uvcvideo: Add support for compound controls
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supports getting/setting current value.
Supports getting default value.
Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changelog since v9:
- Make __uvc_ctrl_set_compound() static.
Changelog since v8:
- No change.
Changelog since v7:
- Fixed comments styles, indentation and a few other style issues.
- Renamed uvc_g/set_array() to uvc_g/set_compound().
- Moved size check to __uvc_ctrl_add_mapping().
- After setting a new value, copy it back to user.
- In __uvc_ctrl_set_compound(), check size before allocating.

 drivers/media/usb/uvc/uvc_ctrl.c | 184 ++++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvcvideo.h |   4 +
 2 files changed, 170 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 5c4aa4b82218..7d86aa695b34 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -837,6 +837,28 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	}
 }
 
+/*
+ * Extract the byte array specified by mapping->offset and mapping->data_size
+ * stored at 'data' to the output array 'data_out'.
+ */
+static int uvc_get_compound(struct uvc_control_mapping *mapping, const u8 *data,
+			    u8 *data_out)
+{
+	memcpy(data_out, data + mapping->offset / 8, mapping->data_size / 8);
+	return 0;
+}
+
+/*
+ * Copy the byte array 'data_in' to the destination specified by mapping->offset
+ * and mapping->data_size stored at 'data'.
+ */
+static int uvc_set_compound(struct uvc_control_mapping *mapping,
+			    const u8 *data_in, u8 *data)
+{
+	memcpy(data + mapping->offset / 8, data_in, mapping->data_size / 8);
+	return 0;
+}
+
 static bool
 uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
 {
@@ -859,7 +881,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
 
 static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
 	struct uvc_control_mapping **mapping, struct uvc_control **control,
-	int next)
+	int next, int next_compound)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *map;
@@ -874,14 +896,17 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
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
+			    ((!uvc_ctrl_mapping_is_compound(map) && next) ||
+			     (uvc_ctrl_mapping_is_compound(map) &&
+			      next_compound))) {
 				*control = ctrl;
 				*mapping = map;
 			}
@@ -895,6 +920,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl = NULL;
 	struct uvc_entity *entity;
 	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
 
 	*mapping = NULL;
 
@@ -903,12 +929,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 
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
 
@@ -1048,10 +1075,59 @@ static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static int __uvc_ctrl_get_compound(struct uvc_control_mapping *mapping,
+				   struct uvc_control *ctrl,
+				   int id,
+				   struct v4l2_ext_control *xctrl)
+{
+	u8 size;
+	u8 *data;
+	int ret;
+
+	size = mapping->v4l2_size / 8;
+	if (xctrl->size < size) {
+		xctrl->size = size;
+		return -ENOSPC;
+	}
+
+	data = kmalloc(size, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = mapping->get_compound(mapping, uvc_ctrl_data(ctrl, id), data);
+	if (ret < 0)
+		goto out;
+
+	ret = copy_to_user(xctrl->ptr, data, size) ? -EFAULT : 0;
+
+out:
+	kfree(data);
+	return ret;
+}
+
+static int __uvc_ctrl_get_compound_cur(struct uvc_video_chain *chain,
+				       struct uvc_control *ctrl,
+				       struct uvc_control_mapping *mapping,
+				       struct v4l2_ext_control *xctrl)
+{
+	int ret;
+
+	if (!uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+
+	ret = __uvc_ctrl_load_cur(chain, ctrl);
+	if (ret < 0)
+		return ret;
+
+	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT,
+				       xctrl);
+}
+
 static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 				  u32 found_id)
 {
 	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	bool find_next_compound = req_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
 	unsigned int i;
 
 	req_id &= V4L2_CTRL_ID_MASK;
@@ -1059,7 +1135,7 @@ static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
 		if (!(chain->ctrl_class_bitmap & BIT(i)))
 			continue;
-		if (!find_next) {
+		if (!find_next && !find_next_compound) {
 			if (uvc_control_classes[i] == req_id)
 				return i;
 			continue;
@@ -1151,7 +1227,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0);
+				   &master_map, &master_ctrl, 0, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
 		s32 val = 0;
 		int ret;
@@ -1167,6 +1243,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
@@ -1400,7 +1485,7 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 	s32 val = 0;
 
-	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
+	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
 	if (ctrl == NULL)
 		return;
 
@@ -1706,7 +1791,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 
 	for (i = 0; i < ctrls->count; i++) {
 		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
-				   &ctrl_found, 0);
+				   &ctrl_found, 0, 0);
 		if (uvc_control == ctrl_found)
 			return i;
 	}
@@ -1754,7 +1839,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 		return -EINVAL;
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
-		return -EINVAL;
+		return __uvc_ctrl_get_compound_cur(chain, ctrl, mapping, xctrl);
 	else
 		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
 }
@@ -1776,6 +1861,25 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
+					    struct uvc_control *ctrl,
+					    struct uvc_control_mapping *mapping,
+					    struct v4l2_ext_control *xctrl)
+{
+	int ret;
+
+	if (!uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+
+	if (!ctrl->cached) {
+		ret = uvc_ctrl_populate_cache(chain, ctrl);
+		if (ret < 0)
+			return ret;
+	}
+
+	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_DEF, xctrl);
+}
+
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 			  struct v4l2_ext_control *xctrl)
 {
@@ -1793,7 +1897,8 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 	}
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
-		ret = -EINVAL;
+		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
+						       xctrl);
 	else
 		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
 
@@ -1802,6 +1907,34 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 	return ret;
 }
 
+static int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
+				   struct v4l2_ext_control *xctrl,
+				   struct uvc_control *ctrl)
+{
+	u8 *data;
+	int ret;
+
+	if (xctrl->size != mapping->v4l2_size / 8)
+		return -EINVAL;
+
+	data = kmalloc(xctrl->size, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = copy_from_user(data, xctrl->ptr, xctrl->size);
+	if (ret < 0)
+		goto out;
+
+	ret = mapping->set_compound(mapping, data,
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+
+	__uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT, xctrl);
+
+out:
+	kfree(data);
+	return ret;
+}
+
 int uvc_ctrl_set(struct uvc_fh *handle,
 	struct v4l2_ext_control *xctrl)
 {
@@ -1903,12 +2036,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	if (!uvc_ctrl_mapping_is_compound(mapping))
+	if (!uvc_ctrl_mapping_is_compound(mapping)) {
 		mapping->set(mapping, value,
 			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
-	else
-		return -EINVAL;
-
+	} else {
+		ret = __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
@@ -2308,10 +2443,23 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		return -ENOMEM;
 	}
 
-	if (map->get == NULL)
+	if (uvc_ctrl_mapping_is_compound(map)) {
+		if (map->data_size != map->v4l2_size)
+			return -EINVAL;
+
+		/* Only supports byte-aligned data. */
+		if (WARN_ON(map->offset % 8 || map->data_size % 8))
+			return -EINVAL;
+	}
+
+	if (!map->get && !uvc_ctrl_mapping_is_compound(map))
 		map->get = uvc_get_le_value;
-	if (map->set == NULL)
+	if (!map->set && !uvc_ctrl_mapping_is_compound(map))
 		map->set = uvc_set_le_value;
+	if (!map->get_compound && uvc_ctrl_mapping_is_compound(map))
+		map->get_compound = uvc_get_compound;
+	if (!map->set_compound && uvc_ctrl_mapping_is_compound(map))
+		map->set_compound = uvc_set_compound;
 
 	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
 		if (V4L2_CTRL_ID2WHICH(uvc_control_classes[i]) ==
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8f7938205a63..1e1bccd3b2e5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -129,8 +129,12 @@ struct uvc_control_mapping {
 
 	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
 		   const u8 *data);
+	int (*get_compound)(struct uvc_control_mapping *mapping, const u8 *data,
+			    u8 *data_out);
 	void (*set)(struct uvc_control_mapping *mapping, s32 value,
 		    u8 *data);
+	int (*set_compound)(struct uvc_control_mapping *mapping, const u8 *data_in,
+			    u8 *data);
 };
 
 struct uvc_control {
-- 
2.38.1.584.g0f3c55d4c2-goog

