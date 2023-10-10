Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382DF7BF0CB
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 04:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441867AbjJJCWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 22:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441858AbjJJCWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 22:22:12 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6E293
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 19:22:09 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d86dac81f8fso7221791276.1
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 19:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696904528; x=1697509328; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZCydqZRsosFofjHKVRHHb4gDgTLmwFEZUuzdOn38mE=;
        b=2ccgMqGt9Z285IdISivHTFETizIMl/o/Y7lm2aMAiQq+XSxY78GygRHPn0RJwnuhSq
         IkWXFS/ff3BHlwuuoKImNNc9jsnXgLDAk+UZaeHCmplXt8ce43QeHskcxqeBYI+Avh61
         r/TCQlhOhpC/bCD82knoJeEBEsC4yr3JMC/XC+uP1EVtdYeSR/9q3rVolVwox3UiX/IV
         cvKDWAVCgZhCAJnZzj26vtW2n6EF8UQUY3ImLm1crG7FVIIy2CwIADFpWxf4T9othDCu
         oqVF0/jy4f+5pYGB4vr2x4Mo4sdPe4BC9zGUBtJsHoWE/TpQaCnVDByv+Ey3K4jmapZh
         H5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696904528; x=1697509328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZCydqZRsosFofjHKVRHHb4gDgTLmwFEZUuzdOn38mE=;
        b=TdFvDnBj4bSorpacB2GxWMnuV0M4y+qGTJnAL4/ARMuhQp8LMV5JPTiF/piumD9sfC
         nLpw+5zLj8bD94KxVNaV6Bo0Tpvr5pfagYaj/n3MV+Uj51i7ZOJcbkxVn3bBR2LWZDky
         Dw3NUiOXdrm/mYTVn56yOvKWzbE4k5B7TgEpBKh5tkkjyMcKmrCVpdiE9qKYpOd/5HJr
         rou6z0965KgEzQk/M6Cu45XPkQiihXneWqrRrb0DlElPi4yJM7VAG4Fd928bNPZ+q74z
         CD6MKvo1i0C88n+tld7oSNeoERXhOCGczC6IBpm+ghDLdaNzX5UxZzrRscdOYq6stIQ0
         9S5A==
X-Gm-Message-State: AOJu0YwjgYckuN+F6+e6hsmpcwgnEKcCKHb1zqjVQ2vUlXHJt+Eio2k+
        MAj+kr5FiJd7UkaJMOKHFgntkHU+J+c=
X-Google-Smtp-Source: AGHT+IHHe/u32lmywrc68MYztHzRD3TK/a64enWZTH8dpjnBRmDx8pnmg8z90+XwrwYdqNcO1523wvoMHdM=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7303:2d54:5b83:e60b])
 (user=yunkec job=sendgmr) by 2002:a25:d42:0:b0:d7f:8e0a:4b3f with SMTP id
 63-20020a250d42000000b00d7f8e0a4b3fmr268105ybn.3.1696904528570; Mon, 09 Oct
 2023 19:22:08 -0700 (PDT)
Date:   Tue, 10 Oct 2023 11:21:28 +0900
In-Reply-To: <20231010022136.1504015-1-yunkec@google.com>
Mime-Version: 1.0
References: <20231010022136.1504015-1-yunkec@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231010022136.1504015-6-yunkec@google.com>
Subject: [PATCH v13 05/11] media: uvcvideo: Add support for compound controls
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supports getting/setting current value.
Supports getting default value.
Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v11:
- No change.
Changelog since v10:
- Rewrite some logic in __uvc_find_control().
- Remove a duplicate check in __uvc_ctrl_get_compound_cur().
- Thanks, Daniel!
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

 drivers/media/usb/uvc/uvc_ctrl.c | 179 +++++++++++++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h |   4 +
 2 files changed, 164 insertions(+), 19 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 98254b93eb46..aae2480496b7 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -884,6 +884,28 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
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
@@ -906,7 +928,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
 
 static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
 	struct uvc_control_mapping **mapping, struct uvc_control **control,
-	int next)
+	int next, int next_compound)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *map;
@@ -921,14 +943,16 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
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
@@ -942,6 +966,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl = NULL;
 	struct uvc_entity *entity;
 	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
 
 	*mapping = NULL;
 
@@ -950,12 +975,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 
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
 
@@ -1101,12 +1127,59 @@ static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
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
-	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
 	unsigned int i;
 
+	bool find_next = req_id &
+		(V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND);
+
 	req_id &= V4L2_CTRL_ID_MASK;
 
 	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
@@ -1194,7 +1267,7 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	}
 
 	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
-			   &master_ctrl, 0);
+			   &master_ctrl, 0, 0);
 
 	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
 		return 0;
@@ -1262,7 +1335,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0);
+				   &master_map, &master_ctrl, 0, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
 		s32 val = 0;
 		int ret;
@@ -1278,6 +1351,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
@@ -1533,7 +1615,7 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 	s32 val = 0;
 
-	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
+	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
 	if (ctrl == NULL)
 		return;
 
@@ -1843,7 +1925,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 
 	for (i = 0; i < ctrls->count; i++) {
 		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
-				   &ctrl_found, 0);
+				   &ctrl_found, 0, 0);
 		if (uvc_control == ctrl_found)
 			return i;
 	}
@@ -1891,7 +1973,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 		return -EINVAL;
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
-		return -EINVAL;
+		return __uvc_ctrl_get_compound_cur(chain, ctrl, mapping, xctrl);
 	else
 		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
 }
@@ -1912,6 +1994,22 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
+					    struct uvc_control *ctrl,
+					    struct uvc_control_mapping *mapping,
+					    struct v4l2_ext_control *xctrl)
+{
+	int ret;
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
@@ -1929,7 +2027,8 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 	}
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
-		ret = -EINVAL;
+		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
+						       xctrl);
 	else
 		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
 
@@ -1938,6 +2037,34 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
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
@@ -2052,13 +2179,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	if (uvc_ctrl_mapping_is_compound(mapping))
-		return -EINVAL;
-	else
+	if (uvc_ctrl_mapping_is_compound(mapping)) {
+		ret = __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
+		if (ret < 0)
+			return ret;
+	} else
 		mapping->set(mapping, value,
 			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
-
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
 
@@ -2468,10 +2596,23 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 			goto err_nomem;
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
index 7bc41270ed94..11805b729c22 100644
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
2.42.0.609.gbb76f46606-goog

