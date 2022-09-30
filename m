Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C575F04F5
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 08:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiI3GlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 02:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbiI3GlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 02:41:16 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693051A06E
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:15 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id h11-20020a170902f54b00b001780f0f7ea7so2613394plf.9
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=hsKpGR6ZAwwrbPQSkvSMIn3H2D248KIeuadqPOigFCY=;
        b=e0tGMWIEgzQJBygDwbStFuAEr6L1PVLhFLjoKnT7ZEneInY7Z8YzIan6klDoqS/DMT
         ZEXmNSPjmMR1+SYVoPjupaU8950utqIEL/e33/6BbNdM1cBj6kcp2KApfTv2hf3A+2Ed
         2GfNv5MluH4Chvcuf1vaiO0wx/CH+j1CF0csDTAnwlU2hbMdlEGGg8LbruKm9C6bXmj0
         bYBwxs95SOzfaPAO69N/x9VhiMOWAxzOmmfxVdfAtwNEYAuymtJpRsJWkdgywuFOZlX1
         E+bk2xO5sWTuwWr4By/qqQb7gdqAIWgP8rl0ErgCNHyC2DAILXGhX5UyA+vS0SxeMHjC
         zaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=hsKpGR6ZAwwrbPQSkvSMIn3H2D248KIeuadqPOigFCY=;
        b=nyuv2gVNAM1BdzAxL0wnEd+YX7MmT5vvWGW5qdESj8+Oyas6u7rD4lDcPFcLTOudX8
         F/4czmdETcY8HMEa2e7Ot2XuTLfu4VPCoGWZ7QTHffflW4n3N5d7gxjXZnIgNujIeeF8
         nSLbfiLcQJHHKfnCjVpCcFPqEpmZdokFNDIMeDpg+c1vU63ByUfoWaW3EL4JhT6Fk6RK
         WTm9ipoR55snOvQCGiMmxUkpdOcEDjIIaMBRM/lz3mYvNMRy+1PEPv/quqGMKgAidUzR
         3excmxzkMGtEgTAP3qRl2EDfb7L2qDiTA7PkT9CGZ4VU62AgGdw2Y3i2UEhZF2ngyfjI
         jQkQ==
X-Gm-Message-State: ACrzQf1HZ3JBmyNuY1IZK2TUuC7XxQdV0bQIcwr7Jg1nokN+xK4dxcne
        IUrACv1lKH0PWoIIg91iAlwaAkBu1nI=
X-Google-Smtp-Source: AMsMyM4AMQjD91gSWwMAeTyvsj9y1SNNUeUDzu2s3sswNAB3fZ9ZwWD73I6sPZsxJg2GKD0WoHcqw4OWz14=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d86:8b01:88ae:86c1])
 (user=yunkec job=sendgmr) by 2002:a17:902:b601:b0:17a:695:b5bf with SMTP id
 b1-20020a170902b60100b0017a0695b5bfmr7148166pls.35.1664520074980; Thu, 29 Sep
 2022 23:41:14 -0700 (PDT)
Date:   Fri, 30 Sep 2022 15:40:51 +0900
In-Reply-To: <20220930064059.3633710-1-yunkec@google.com>
Mime-Version: 1.0
References: <20220930064059.3633710-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220930064059.3633710-3-yunkec@google.com>
Subject: [PATCH v8 02/10] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
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

Introduce uvc_ctrl_get_boundary(), making it easier to extend to
support compound controls and V4L2_CTRL_WHICH_MIN/MAX_VAL in the
following patches.

For now, it simply returns EINVAL for compound controls and calls
__query_v4l2_ctrl() for non-compound controls.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v7:
- Rename uvc_ctrl_get_fixed() to uvc_ctrl_get_boundary().
- Move refactor (introduce  __uvc_ctrl_get_boundary_std()) in this patch
  instead of in the patch where we implement compound control.
- Fix locking. uvc_ctrl_get_boundary() now acquires ctrl_mutex.
  __uvc_ctrl_get_boundary_std() calls __uvc_query_v4l2_ctrl() while
  holding the mutex.
- Define a uvc_ctrl_mapping_is_compound() for readability.

 drivers/media/usb/uvc/uvc_ctrl.c | 48 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  6 +---
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 3 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 97f312020516..40a47e9a93a8 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -836,6 +836,12 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	}
 }
 
+static bool
+uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
+{
+	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
+}
+
 /* ------------------------------------------------------------------------
  * Terminal and unit management
  */
@@ -1742,6 +1748,48 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
 }
 
+int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
+				struct uvc_control *ctrl,
+				struct uvc_control_mapping *mapping,
+				struct v4l2_ext_control *xctrl)
+{
+	struct v4l2_queryctrl qc = { .id = xctrl->id };
+
+	int ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &qc);
+
+	if (ret < 0)
+		return ret;
+
+	xctrl->value = qc.default_value;
+	return 0;
+}
+
+int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
+			  struct v4l2_ext_control *xctrl)
+{
+	struct uvc_control *ctrl;
+	struct uvc_control_mapping *mapping;
+	int ret;
+
+	if (mutex_lock_interruptible(&chain->ctrl_mutex))
+		return -ERESTARTSYS;
+
+	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
+	if (!ctrl) {
+		ret = -EINVAL;
+		goto done;
+	}
+
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		ret = -EINVAL;
+	else
+		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
+
+done:
+	mutex_unlock(&chain->ctrl_mutex);
+	return ret;
+}
+
 int uvc_ctrl_set(struct uvc_fh *handle,
 	struct v4l2_ext_control *xctrl)
 {
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 4cc3fa6b8c98..d844da6f307c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1046,15 +1046,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 
 	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			struct v4l2_queryctrl qc = { .id = ctrl->id };
-
-			ret = uvc_query_v4l2_ctrl(chain, &qc);
+			ret = uvc_ctrl_get_boundary(chain, ctrl);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
 			}
-
-			ctrl->value = qc.default_value;
 		}
 
 		return 0;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 24c911aeebce..dce9e3ca764d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -903,6 +903,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
+			  struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
-- 
2.38.0.rc1.362.ged0d419d3c-goog

