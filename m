Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85AB5F04F7
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 08:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbiI3Gl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 02:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbiI3GlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 02:41:24 -0400
Received: from mail-oo1-xc4a.google.com (mail-oo1-xc4a.google.com [IPv6:2607:f8b0:4864:20::c4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB32D13EAF6
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:20 -0700 (PDT)
Received: by mail-oo1-xc4a.google.com with SMTP id n5-20020a4a3445000000b004728fe7a331so1569405oof.23
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=PqX4QEY0qfmyJLMC5gw1oQg9eFk8uUBvS22hlN2DeC4=;
        b=TZJANjvFRHEFPYPEdV3ki/y2Zd1d/i+wVv+c1K989ZdLJi0jFTG3l/4yZJCkQqMTo3
         YH8TAF+mcrk9ecBD0mJRJ8N6juS5+pzlrsXwA/3TQT955mkvY7grWiy658DENVaxPWKy
         3CxkLRuYT294Gzu6O8Klwvi3uHrHQebIMXmXfTaROCKIYnbQFq9Mu/5ONoRHEOqDlsSn
         qZKtF+eOdQ/ICHFNchF1sK4xzUZDplDkbNYVJEdmicrWkGAxT7zMXMKgE88jtG2oBK9C
         0vF3a7CKMcizYf7S0RW1HXrXL/zAcyZcn4cRmXSgEEDf5Kt05mDiNECKXxe760yaqyu1
         9FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=PqX4QEY0qfmyJLMC5gw1oQg9eFk8uUBvS22hlN2DeC4=;
        b=KOSj2ZkeT99CBs7jrnEHWdGxD5OZkTjobXyi6dRzhYmLxw6YSXd3UWWj4f0rKOD8F/
         tuXOyzOsfTzok5VvOL+0opqvARWd2rmP/FZe60LiuYjamLjt8iOxdTObJ5QrdNykiHxK
         cl6g8hQtaIBxqFz9BMOyJWMh5jN68HGBbEHNkksR2Q8kc00MoxRRNj/MH6uE1N5gawW4
         VZ8dz/4w73UL/IE+5h7hMWeg+QJXix4gS0UFVOIiztshjKkly+ITy+Try1dIPtlu5oyh
         gFFxAJxDuJH869MpAn/0YZ1qpVW4Guw5SQrGQ0cBVvB1fs4CM9ZoppkSEKRNGyeeJCWR
         +aPQ==
X-Gm-Message-State: ACrzQf3KvfwPxgZZ8bVM6EedrLPu3dblHUZxCapT6QOVdhGAos8jwcNQ
        Fz8fJSGhnzbG+acVmjrCbffEQLTs/xM=
X-Google-Smtp-Source: AMsMyM6LGBuKpAKqDk8M8IvQrAL4GQbSeNx2i/TZ1yvYfhtwGRTqqJfwoWMDbXVo6ys1bjjgozVw73YXyXI=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d86:8b01:88ae:86c1])
 (user=yunkec job=sendgmr) by 2002:a05:6808:246:b0:34f:e4d6:330c with SMTP id
 m6-20020a056808024600b0034fe4d6330cmr8179519oie.142.1664520080048; Thu, 29
 Sep 2022 23:41:20 -0700 (PDT)
Date:   Fri, 30 Sep 2022 15:40:52 +0900
In-Reply-To: <20220930064059.3633710-1-yunkec@google.com>
Mime-Version: 1.0
References: <20220930064059.3633710-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220930064059.3633710-4-yunkec@google.com>
Subject: [PATCH v8 03/10] media: uvcvideo: introduce __uvc_ctrl_get_std()
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

Refactor uvc_ctrl to make adding compound control easier.

Currently uvc_ctrl_get() only work for non-compound controls.
Move the logic into uvc_ctrl_std(), return error for compound
controls.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v7:
- Newly added patch. Split the refactoring of uvc_ctrl_get from v7 3/7.

 drivers/media/usb/uvc/uvc_ctrl.c | 40 +++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 40a47e9a93a8..9e28203d6cff 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1027,15 +1027,15 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
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
@@ -1152,8 +1152,13 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
 
@@ -1398,7 +1403,8 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return;
 
-	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
+	if (uvc_ctrl_mapping_is_compound(mapping) ||
+	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
@@ -1565,7 +1571,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (uvc_ctrl_mapping_is_compound(mapping) ||
+		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1745,7 +1752,10 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+	else
+		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
 }
 
 int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
@@ -1891,8 +1901,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	mapping->set(mapping, value,
-		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	if (!uvc_ctrl_mapping_is_compound(mapping))
+		mapping->set(mapping, value,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	else
+		return -EINVAL;
+
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
-- 
2.38.0.rc1.362.ged0d419d3c-goog

