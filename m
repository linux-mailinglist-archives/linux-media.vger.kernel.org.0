Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857345F04F9
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 08:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbiI3Glh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 02:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiI3Gle (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 02:41:34 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A208814B846
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:30 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id k11-20020a5b038b000000b006bbf786c30aso3065115ybp.8
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=7V+jjJhb7QkQF5D+VD/rNIYjNOEn5jzHIYgS/0RXBrM=;
        b=HszvMz1cjyX6vCEw2S1ynsEc8kszOQXfXUsHftx0Rda2Fn5iO507012iKl7aQNZilh
         XrU8p0UcXVf49cd7RyHVny7Qq+tRcKQmkHZJXm4J0PUgH3V+x9QYEhKcHPyxJAXfA4UJ
         xIGw57KOucyZVCD8AAxf0XHFLt6/Vq5NTjKVSYsXuMx8ktZwDWwG7Gisf7f0clLzCDWK
         pmNs5fRUTTzZFVsvu7ipJhndlE3qJNGi293/Qy7+mvUc8g/X/37U6ZFOmyduj3Z7FiHg
         IAaz8jP41F7gC/YYItOxheCMZaAh7qrdbNW9o48JkEvDVuHhsouuv6sbfsqvle8n4Xko
         H+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=7V+jjJhb7QkQF5D+VD/rNIYjNOEn5jzHIYgS/0RXBrM=;
        b=RA5r3B4bJSzvCTBjN6l9i7DM/htg7KE1sxKythoFS7rGtQK6+TsJfkbExmtKpS8CIy
         YqclMNJPEwU6ZroQKEuUL1CjGbrRYo8EzrpQ0gBxTXirudG3R8RaJjDSrF2pYadkWaqS
         QbtALzFAy1lBgse156+hsir6QHAltzjEZC396WtA6g1Athp+WZjxYXraK8vNqsl3RoxM
         ZDFpZ6Htp9xtOJz0SEuNxFU9UrdDGS+bi7mIpli9Zqt8agcL+Ud1hwveIiD5MlJUz+AE
         3HCE/784rJjF9WfytqstWR8O1kfVb/e0g2PLLBhgQIoLeFutTs3loFzTgLrwa1e15q4c
         h3Ug==
X-Gm-Message-State: ACrzQf2yY/q8R1y6PWAN/PL2IqiH2UlTpFiLWB18QMlb6gqqVBtLMXGh
        DL/+7gPNdev2/MPlGqsvvjIzjKxqkGo=
X-Google-Smtp-Source: AMsMyM6mlXVKxxdxrdrQJaqtdf2jXRdKMbG6wf8hCONolExJdaw+S/NYss3bGyXEHFwjvrdYQDkEBfFE9Qc=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d86:8b01:88ae:86c1])
 (user=yunkec job=sendgmr) by 2002:a5b:94e:0:b0:6bb:ee52:1a66 with SMTP id
 x14-20020a5b094e000000b006bbee521a66mr6920904ybq.506.1664520089911; Thu, 29
 Sep 2022 23:41:29 -0700 (PDT)
Date:   Fri, 30 Sep 2022 15:40:54 +0900
In-Reply-To: <20220930064059.3633710-1-yunkec@google.com>
Mime-Version: 1.0
References: <20220930064059.3633710-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220930064059.3633710-6-yunkec@google.com>
Subject: [PATCH v8 05/10] media: uvcvideo: Add support for compound controls
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
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
index 989c0fba2a88..99249d2f4959 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -836,6 +836,28 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
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
@@ -858,7 +880,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
 
 static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
 	struct uvc_control_mapping **mapping, struct uvc_control **control,
-	int next)
+	int next, int next_compound)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *map;
@@ -873,14 +895,17 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
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
@@ -894,6 +919,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl = NULL;
 	struct uvc_entity *entity;
 	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
 
 	*mapping = NULL;
 
@@ -902,12 +928,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 
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
 
@@ -1047,10 +1074,59 @@ static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
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
@@ -1058,7 +1134,7 @@ static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
 		if (!(chain->ctrl_class_bitmap & BIT(i)))
 			continue;
-		if (!find_next) {
+		if (!find_next && !find_next_compound) {
 			if (uvc_control_classes[i] == req_id)
 				return i;
 			continue;
@@ -1150,7 +1226,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0);
+				   &master_map, &master_ctrl, 0, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
 		s32 val = 0;
 		int ret;
@@ -1166,6 +1242,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
@@ -1399,7 +1484,7 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 	s32 val = 0;
 
-	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
+	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
 	if (ctrl == NULL)
 		return;
 
@@ -1705,7 +1790,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 
 	for (i = 0; i < ctrls->count; i++) {
 		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
-				   &ctrl_found, 0);
+				   &ctrl_found, 0, 0);
 		if (uvc_control == ctrl_found)
 			return i;
 	}
@@ -1753,7 +1838,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 		return -EINVAL;
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
-		return -EINVAL;
+		return __uvc_ctrl_get_compound_cur(chain, ctrl, mapping, xctrl);
 	else
 		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
 }
@@ -1774,6 +1859,25 @@ int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
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
@@ -1791,7 +1895,8 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 	}
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
-		ret = -EINVAL;
+		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
+						       xctrl);
 	else
 		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
 
@@ -1800,6 +1905,34 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 	return ret;
 }
 
+int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
+			    struct v4l2_ext_control *xctrl,
+			    struct uvc_control *ctrl)
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
@@ -1901,12 +2034,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2306,10 +2441,23 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
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
index d87b4cad4437..55ea39219f0c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -267,8 +267,12 @@ struct uvc_control_mapping {
 
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
2.38.0.rc1.362.ged0d419d3c-goog

