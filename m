Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA68455C70F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243494AbiF1H5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 03:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343882AbiF1H5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 03:57:40 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B58E13FA7
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:39 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id g34-20020a635662000000b0040d1da6ada4so6309583pgm.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=nDIjOO1xzDSFkJrFVqULQeNIM6YoCDnuWCLYEys0a9A=;
        b=Cnj4hGwjSJCIGj0QhB/tLYOGT5tKyaCf4YfQTlE9oL7u/MTVIhdu22oa0y0/ZzXMAX
         NbqoNYTog2GmUan+NSKPHySQUMklAJbtYxR0f0uceCbJDQxDh04QTCP/5gHAZhGVAjQb
         /rXIN0sqT6JX3AjyJobB/eb/mVReAMzmyuZyV6L0QcX+UlNFwsDrkSobRRjJwfFZEM2C
         /gKblFyAS85g+pr0GHkesc9TxS71LSImYG1vNMSDdjf9C4/DAPJNqrbkPhUKhdEgBtNm
         UnVi3ShnCRhHQs7Eq+oTOnkXX9zO6DKKRzqRwRxiVMyEuI1OcUa1sNVNSDgIDunYwu3j
         2wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nDIjOO1xzDSFkJrFVqULQeNIM6YoCDnuWCLYEys0a9A=;
        b=qi7onUn6bupZODKN5zIJgSPmE4JQ8whublx4cfPBvAx94+EiO2Bi/mkKg3ZJ4qy5Sv
         pVMqdnqKknTU98l3Plw/fGU0DpDMgeFkaviFDTRJ4n0YS+Tn1vYyYUrXYOnzwE4RwNq7
         qBtnIgbz6zGrmAvteuW3qElaBZfjgvVVR5NQG1J9Lbyi8IqUkL7WdMwVL6BQ+YuqUYSR
         qNPCTfjWt5MGc2457ULccetdPz2LEMIiHwaFvCBbG4PebxvmWKaTNPhdaMPNx9ArRlw8
         xSP3ZvWBZJ6OQKKUKYyA9OWjJCXfgDdumwHe5l/KCOrXSUpt3lG/dkPaLwgrD8yW4gH+
         1MpA==
X-Gm-Message-State: AJIora8dDe6a8GioSUAwse9MLw7121frS9f4tZU4qGKDCXt6afckQx+w
        O6YOzNKhDLFQET1KIgmaatMN5ptXwSM=
X-Google-Smtp-Source: AGRyM1tkkWEAvE5UIZEyYncX4CMycuzxlZrLRdmhrajFGUb/H92RSM1aWNNA4FrM8deU8cAUqtNDSqill3U=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a17:903:32c4:b0:16a:4227:cd68 with SMTP id
 i4-20020a17090332c400b0016a4227cd68mr3649688plr.173.1656403058576; Tue, 28
 Jun 2022 00:57:38 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:57:01 +0900
In-Reply-To: <20220628075705.2278044-1-yunkec@google.com>
Message-Id: <20220628075705.2278044-4-yunkec@google.com>
Mime-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v7 3/7] media: uvcvideo: Add support for compound controls
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supports getting/setting current value.
Supports getting default value.
Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 279 ++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h |   4 +
 2 files changed, 238 insertions(+), 45 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 772d9d28a520..508ee04afbcd 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -815,6 +815,34 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	}
 }
 
+/* Extract the byte array specified by mapping->offset and mapping->size
+ * stored at 'data' to the output array 'data_out'.
+ */
+static int uvc_get_array(struct uvc_control_mapping *mapping, const u8 *data,
+			 u8 *data_out)
+{
+	// Only supports byte-aligned data.
+	if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
+		return -EINVAL;
+
+	memcpy(data_out, data + mapping->offset / 8, mapping->size / 8);
+	return 0;
+}
+
+/* Copy the byte array 'data_in' to the destination specified by mapping->offset
+ * and mapping->size stored at 'data'.
+ */
+static int uvc_set_array(struct uvc_control_mapping *mapping, const u8 *data_in,
+			 u8 *data)
+{
+	// Only supports byte-aligned data.
+	if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
+		return -EINVAL;
+
+	memcpy(data + mapping->offset / 8, data_in, mapping->size / 8);
+	return 0;
+}
+
 /* ------------------------------------------------------------------------
  * Terminal and unit management
  */
@@ -831,7 +859,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
 
 static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
 	struct uvc_control_mapping **mapping, struct uvc_control **control,
-	int next)
+	int next, int next_compound)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *map;
@@ -846,14 +874,18 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
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
+			    ((map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES &&
+			      next) ||
+			     (map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES &&
+			      next_compound))) {
 				*control = ctrl;
 				*mapping = map;
 			}
@@ -867,6 +899,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl = NULL;
 	struct uvc_entity *entity;
 	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
+	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
 
 	*mapping = NULL;
 
@@ -875,12 +908,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
 
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
 
@@ -943,6 +977,39 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
+			       struct uvc_control *ctrl)
+{
+	int ret = 0;
+
+	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
+		return -EACCES;
+
+	if (ctrl->loaded)
+		return 0;
+
+	if (ctrl->entity->get_cur) {
+		ret = ctrl->entity->get_cur(chain->dev,
+			ctrl->entity,
+			ctrl->info.selector,
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+			ctrl->info.size);
+	} else {
+		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
+				     ctrl->entity->id, chain->dev->intfnum,
+				     ctrl->info.selector,
+				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+				     ctrl->info.size);
+	}
+
+	if (ret < 0)
+		return ret;
+
+	ctrl->loaded = 1;
+
+	return ret;
+}
+
 static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
 				const u8 *data)
 {
@@ -963,35 +1030,19 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
 	return value;
 }
 
-static int __uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
-	s32 *value)
+static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
+			      struct uvc_control *ctrl,
+			      struct uvc_control_mapping *mapping,
+			      s32 *value)
 {
 	int ret;
 
-	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
-		return -EACCES;
-
-	if (!ctrl->loaded) {
-		if (ctrl->entity->get_cur) {
-			ret = ctrl->entity->get_cur(chain->dev,
-				ctrl->entity,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-		} else {
-			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				ctrl->entity->id,
-				chain->dev->intfnum,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-		}
-		if (ret < 0)
-			return ret;
+	if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
+		return -EINVAL;
 
-		ctrl->loaded = 1;
-	}
+	ret = __uvc_ctrl_load_cur(chain, ctrl);
+	if (ret < 0)
+		return ret;
 
 	*value = __uvc_ctrl_get_value(mapping,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
@@ -999,6 +1050,57 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static int __uvc_ctrl_get_compound_to_user(struct uvc_control_mapping *mapping,
+					   struct uvc_control *ctrl,
+					   int id,
+					   struct v4l2_ext_control *xctrl)
+{
+	int ret, size;
+	u8 *data;
+
+	if (WARN_ON(!mapping->size % 8))
+		return -EINVAL;
+
+	size = mapping->size / 8;
+	if (xctrl->size < size) {
+		xctrl->size = size;
+		return -ENOSPC;
+	}
+
+	data = kmalloc(size, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = mapping->get_array(mapping, uvc_ctrl_data(ctrl, id), data);
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
+static int __uvc_ctrl_get_compound(struct uvc_video_chain *chain,
+				   struct uvc_control *ctrl,
+				   struct uvc_control_mapping *mapping,
+				   struct v4l2_ext_control *xctrl)
+{
+	int ret;
+
+	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
+		return -EINVAL;
+
+	ret = __uvc_ctrl_load_cur(chain, ctrl);
+	if (ret < 0)
+		return ret;
+
+	return __uvc_ctrl_get_compound_to_user(mapping, ctrl,
+					       UVC_CTRL_DATA_CURRENT,
+					       xctrl);
+}
+
 static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 				  u32 found_id)
 {
@@ -1102,10 +1204,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0);
+				   &master_map, &master_ctrl, 0, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+		int ret;
+		s32 val = 0;
+
+		if (master_map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
+			return -EINVAL;
+
+		ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
 		if (ret < 0)
 			return ret;
 
@@ -1113,6 +1220,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
@@ -1346,11 +1462,12 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 	s32 val = 0;
 
-	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
+	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
 	if (ctrl == NULL)
 		return;
 
-	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
+	if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES ||
+	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
@@ -1517,7 +1634,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES ||
+		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1647,7 +1765,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 
 	for (i = 0; i < ctrls->count; i++) {
 		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
-				   &ctrl_found, 0);
+				   &ctrl_found, 0, 0);
 		if (uvc_control == ctrl_found)
 			return i;
 	}
@@ -1694,11 +1812,14 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
+		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
+	else
+		return __uvc_ctrl_get_compound(chain, ctrl, mapping, xctrl);
 }
 
-int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
-		       struct v4l2_ext_control *xctrl)
+int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
+			     struct v4l2_ext_control *xctrl)
 {
 	struct v4l2_queryctrl qc = { .id = xctrl->id };
 	int ret = uvc_query_v4l2_ctrl(chain, &qc);
@@ -1710,6 +1831,56 @@ int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
 	return 0;
 }
 
+int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
+		       struct v4l2_ext_control *xctrl)
+{
+	struct uvc_control *ctrl;
+	struct uvc_control_mapping *mapping;
+	int ret;
+
+	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
+		return -EACCES;
+
+	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
+	if (!ctrl)
+		return -EINVAL;
+
+	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
+		return __uvc_ctrl_get_fixed_std(chain, xctrl);
+
+	if (!ctrl->cached) {
+		ret = uvc_ctrl_populate_cache(chain, ctrl);
+		if (ret < 0)
+			return ret;
+	}
+
+	return __uvc_ctrl_get_compound_to_user(mapping, ctrl, UVC_CTRL_DATA_DEF,
+					       xctrl);
+}
+
+int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
+			    struct v4l2_ext_control *xctrl,
+			    struct uvc_control *ctrl)
+{
+	int ret;
+	u8 *data;
+
+	data = kmalloc(xctrl->size, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = copy_from_user(data, xctrl->ptr, xctrl->size);
+	if (ret < 0)
+		goto out;
+
+	ret = mapping->set_array(mapping, data,
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+
+out:
+	kfree(data);
+	return ret;
+}
+
 int uvc_ctrl_set(struct uvc_fh *handle,
 	struct v4l2_ext_control *xctrl)
 {
@@ -1820,8 +1991,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	mapping->set(mapping, value,
-		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES) {
+		mapping->set(mapping, value,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	} else {
+		ret = __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
@@ -2220,10 +2397,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		return -ENOMEM;
 	}
 
-	if (map->get == NULL)
+	if (!map->get && map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
 		map->get = uvc_get_le_value;
-	if (map->set == NULL)
+	if (!map->set && map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
 		map->set = uvc_set_le_value;
+	if (!map->get_array && map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
+		map->get_array = uvc_get_array;
+	if (!map->set_array && map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
+		map->set_array = uvc_set_array;
 
 	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
 		if (V4L2_CTRL_ID2WHICH(uvc_control_classes[i]) ==
@@ -2233,6 +2414,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		}
 	}
 
+	if (map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES &&
+	    WARN_ON(!map->get || !map->set))
+		return -EINVAL;
+
+	if (map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES &&
+	    WARN_ON(!map->get_array || !map->set_array))
+		return -EINVAL;
+
 	list_add_tail(&map->list, &ctrl->info.mappings);
 	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
 		uvc_map_get_name(map), ctrl->info.entity,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ba028ba7c34e..2f9b75faae83 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -262,8 +262,12 @@ struct uvc_control_mapping {
 
 	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
 		   const u8 *data);
+	int (*get_array)(struct uvc_control_mapping *mapping, const u8 *data,
+			 u8 *data_out);
 	void (*set)(struct uvc_control_mapping *mapping, s32 value,
 		    u8 *data);
+	int (*set_array)(struct uvc_control_mapping *mapping, const u8 *data_in,
+			 u8 *data);
 };
 
 struct uvc_control {
-- 
2.37.0.rc0.161.g10f37bed90-goog

