Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A964063E7DD
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiLACc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiLACcZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:32:25 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568B38326C
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:24 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id x6-20020aa79a46000000b0057558a60f72so601495pfj.15
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V16WYRiBZ+HCYg0BzqvOp4DrW+UCaTZFj+Wo5i60W3Q=;
        b=DrcXKBPoBhT8VsTZEZHiInQGn2d8kxlL8Ip+3CefgDj4+yHbetaodeOaLEkST4R71g
         xf9MF48NAZe7YozJg8VYSBFGGVDEIYwlcFVO77rNucNaKAHXK2Zol+STUzIurBVy72rt
         25dq2HgWtA8dDxglnU7D6HgbFK6JakgMo9ekYuMQKQUHkJOMfiGp4bjlZGwBYmc2Uwqx
         htgUyw3MYwHBJVzR98xHuEKXtvKuH5L5JOmofkAiq5GrYrq5Z8LID4XzAM1i4RiIo13a
         1LJgDRgwJKneXqHYW8WJQUMQp4wXqbz096xwmDKqfgLAnFWiyCSeAVaRqW7KxnKpFbsI
         DnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V16WYRiBZ+HCYg0BzqvOp4DrW+UCaTZFj+Wo5i60W3Q=;
        b=YtBQyHtyZyrJsl3A82N6jQOXrU3f5EzayoRXdRRSWzamnlwhHIVwjW/e1yZJ6hsiT7
         LKLhaye2sc7TPAcWvsHxD8RGdtfTzgXOngOkd46UjI2K+pJuCLed7S4xEqApQve97gPl
         IdlsxWeUNriCEncEtOfrPQHBjQq2T/yJN4J4P4E+Nx+YBTO6JZbY7rNhSYoku7eGqQ/x
         HHQJYKV6hYIblUcPx2smGANhAwfi89CtEJ0rUmKVYO45WsyhhX9LSOaUAAcDgyGp9omG
         SaiaAD2rgenqE9rYgWTdAUR9hH0d5sqRO1VvkErUtY2pGAhtirGz383BWcbWnnuUcWdv
         AhTA==
X-Gm-Message-State: ANoB5pnp0cPa5/c7Y2CzzdB5OutlXR0ONr29pjUP0JKHJ5aVaq6I6ih5
        z89+SSNm4ZlEEtCgXdABNsrUY37sDPc=
X-Google-Smtp-Source: AA0mqf6qbCjqlNUmRoo0rGhAkuRc/353vpZO4XFqWieoyya+d12BUt62xo8bDk0BiRQLp7PirFgVGbXQD/A=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a63:1e5b:0:b0:477:3c62:49ba with SMTP id
 p27-20020a631e5b000000b004773c6249bamr38664380pgm.446.1669861943877; Wed, 30
 Nov 2022 18:32:23 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:31:55 +0900
In-Reply-To: <20221201023204.2177458-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-3-yunkec@google.com>
Subject: [PATCH v10 02/11 RESEND] media: uvcvideo: add uvc_ctrl_get_boundary
 for getting default value
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

Introduce uvc_ctrl_get_boundary(), making it easier to extend to
support compound controls and V4L2_CTRL_WHICH_MIN/MAX_VAL in the
following patches.

For now, it simply returns EINVAL for compound controls and calls
__query_v4l2_ctrl() for non-compound controls.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v9:
- Make __uvc_ctrl_get_boundary_std() static.
Changelog since v8:
- No Change.
Changelog since v7:
- Rename uvc_ctrl_get_fixed() to uvc_ctrl_get_boundary().
- Move refactor (introduce  __uvc_ctrl_get_boundary_std()) in this patch
  instead of in the patch where we implement compound control.
- Fix locking. uvc_ctrl_get_boundary() now acquires ctrl_mutex.
  __uvc_ctrl_get_boundary_std() calls __uvc_query_v4l2_ctrl() while
  holding the mutex.
- Define a uvc_ctrl_mapping_is_compound() for readability.

 drivers/media/usb/uvc/uvc_ctrl.c | 49 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  6 +---
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 3 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c95a2229f4fa..dfb9d1daece6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -837,6 +837,12 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
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
@@ -1743,6 +1749,49 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
 }
 
+static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
+				       struct uvc_control *ctrl,
+				       struct uvc_control_mapping *mapping,
+				       u32 v4l2_which,
+				       struct v4l2_ext_control *xctrl)
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
index f4d4c33b6dfb..e807e348aa41 100644
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
index df93db259312..b2ee3d59a4c8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -759,6 +759,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
+			  struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
-- 
2.38.1.584.g0f3c55d4c2-goog

