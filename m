Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F7065C212
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 15:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237391AbjACOhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 09:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbjACOgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 09:36:46 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950B31005B
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 06:36:45 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id m21so43993037edc.3
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4vpRNrVLZpZlxsGBTMbyBeXBdw1nBEF/02PDPHH1do=;
        b=l8jI+U5cGLKMQzvUJ7CDE/jILdc2xdTMT5aBtvmitfIQDJn4IZpTAEaBgicAJE0GAf
         dzwGH3enfaBAG0rMmtn7ncIEvIgS7XFp0iOIeucSiVLP0XnTniVHLic7gNYysZG5ubYG
         UDp4PMmjFHDxKIBk8967pAPnQC86sO2M/h3qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4vpRNrVLZpZlxsGBTMbyBeXBdw1nBEF/02PDPHH1do=;
        b=DLkk7zo7K4QWE9bdbq8Tli9sHRoYgxtLQKasvBWAJpTCYlngzxzxl9tWe9pMBh2A9Q
         k/eIok/8zv8vTAO2jMz3+ZyOSjY5uu8j2pvGCz5GlErUNxPHFN9usFcjg7lHTbsk/kQB
         UmhW+2odUOO+axSsDx8SOq1FqJ+IgILgqN3wFcdejQp8JXT6o6W1PAyg2wUjg9IcWtbQ
         jSYFGKCQQiH/YFL3/djVnvwezRe5xppJpjpA6r1qtEw3AjNs6yiUNNSK7N5Ltbh7pG0q
         NMtuUKjkJGy4MQwhWLyeurfhWnWfn5JzaOjU37rOucoujlf5bUU8pYe63Ea3mqBcT2dC
         kDNg==
X-Gm-Message-State: AFqh2kqSplervVz+sBbCHpNSZS/lrYIq6hed020gvmsIcJlDgeLQACFc
        FMdulhZsoCaAGV7WQeW8UTfQ6w==
X-Google-Smtp-Source: AMrXdXvvjCxaCSOHyRikQiiJenmQKNIAU5Ibp/kvbIlWnmtlI/gHhNhdxbOLfoyFzi8IZeFNT0zAQQ==
X-Received: by 2002:aa7:ccc2:0:b0:462:2e05:30ce with SMTP id y2-20020aa7ccc2000000b004622e0530cemr36951539edt.42.1672756604172;
        Tue, 03 Jan 2023 06:36:44 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:9789:8e2b:74ac:a9a0])
        by smtp.gmail.com with ESMTPSA id p14-20020a05640243ce00b0048ebf8a5736sm877245edc.21.2023.01.03.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:36:43 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 03 Jan 2023 15:36:19 +0100
Subject: [PATCH v3 1/8] media: uvcvideo: Check for INACTIVE in
 uvc_ctrl_is_accessible()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-Id: <20220920-resend-v4l2-compliance-v3-1-598d33a15815@chromium.org>
References: <20220920-resend-v4l2-compliance-v3-0-598d33a15815@chromium.org>
In-Reply-To: <20220920-resend-v4l2-compliance-v3-0-598d33a15815@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=5160; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=23T/fd3YJJF1E+YgFkf8Ajmygtju9PWip1iEAdc/iJ8=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjtD1rNhhtvAFQKumGKX90/lQE4tOQjtbvjf17JOJ7
 YhxxAf6JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY7Q9awAKCRDRN9E+zzrEiH5cEA
 CaIlgVgUj3T8Q8M89phJlkwOypRrMetwVm+FDAFOiRfZi6ZCvYzAsgEuBuzT5ZxDumi14MCjYl2zNY
 aJWFYSbXI+eTs+ifDsZvrO0BrTTYbG0/PHokN5wiPoRsdaYkGtvkIc6kHWwWeFCUQVS0dolcEeFmrI
 5IUK9rUTh8g/HGKqVrIZElxTlbdsZfkCEG2HCHs2c+XQagq0m40jPUMGNkWHD2g9a1Pg1YxG/kcynv
 atKV1QBiXuDrwTyez6KWH5QuDti0tVFLozaRbLHeLQDT+QyLPDtyPjKUCkPCG5fWTx2mguASoFC2i4
 hpj7qbGXt7pobUBSm7+Qwl5WGXYU/WaCliRxJFj9I6mWCSUEXblLNxJjWS2Tdoah+rr9+2oPL0VlqA
 28Zr4xUJYA603tTIyuU4H2oEXjbwfsZ65OS0MpVC8yTJ0IfWnVyPNNCOc0YNFeinPLRYruSQQaAcS4
 V/pY9PuAtNXBkzMklvVDU0inT7nc6PDOmmlzRRI9ozZRysJwMmMroSaRwDHk/P4ySpYcONNankGt3B
 O4UDa3UNdeJ2SOvkPWMckVLjtaXSr1UWnlJ/0LM7PzMbXEtIV72WxZquEEF1YOmp+iV4COhbaxpPt5
 64PEc/+nPuSi5HCGnAAA6aipoXBjgJrajsz1qOXxlZvbG9qO98hM8QpW/4OQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

Check for inactive controls in uvc_ctrl_is_accessible().

Use the new value for the master_id controls if present, otherwise
use the existing value to determine if it is OK to set the control.
Doing this here avoids attempting to set an inactive control, which
will return an error from the USB device, which returns an invalid
errorcode.

This fixes:
  warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
  warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
test VIDIOC_G/S_CTRL: OK
  warn: v4l2-test-controls.cpp(739): s_ext_ctrls returned EIO
  warn: v4l2-test-controls.cpp(739): s_ext_ctrls returned EIO
  warn: v4l2-test-controls.cpp(816): s_ext_ctrls returned EIO
test VIDIOC_G/S/TRY_EXT_CTRLS: OK

Tested with:
v4l2-ctl -c auto_exposure=1
OK
v4l2-ctl -c exposure_time_absolute=251
OK
v4l2-ctl -c auto_exposure=3
OK
v4l2-ctl -c exposure_time_absolute=251
VIDIOC_S_EXT_CTRLS: failed: Input/output error
exposure_time_absolute: Input/output error
ERROR
v4l2-ctl -c auto_exposure=3,exposure_time_absolute=251,auto_exposure=1
v4l2-ctl -C auto_exposure,exposure_time_absolute  
auto_exposure: 1
exposure_time_absolute: 251

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 42 +++++++++++++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c |  3 +--
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c95a2229f4fa..6165d6b8e855 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1085,11 +1085,28 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	return 0;
 }
 
+/*
+ * Check if control @v4l2_id can be accessed by the given control @ioctl
+ * (VIDIOC_G_EXT_CTRLS, VIDIOC_TRY_EXT_CTRLS or VIDIOC_S_EXT_CTRLS).
+ *
+ * For set operations on slave controls, check if the master's value is set to
+ * manual, either in the others controls set in the same ioctl call, or from
+ * the master's current value. This catches VIDIOC_S_EXT_CTRLS calls that
+ * set both the master and slave control, such as for instance setting
+ * auto_exposure=1, exposure_time_absolute=251.
+ */
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read)
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl)
 {
+	struct uvc_control_mapping *master_map = NULL;
+	struct uvc_control *master_ctrl = NULL;
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
+	bool read = ioctl == VIDIOC_G_EXT_CTRLS;
+	s32 val;
+	int ret;
+	int i;
 
 	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
 		return -EACCES;
@@ -1104,6 +1121,29 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
 		return -EACCES;
 
+	if (ioctl != VIDIOC_S_EXT_CTRLS || !mapping->master_id)
+		return 0;
+
+	/*
+	 * Iterate backwards in cases where the master control is accessed
+	 * multiple times in the same ioctl. We want the last value.
+	 */
+	for (i = ctrls->count - 1; i >= 0; i--) {
+		if (ctrls->controls[i].id == mapping->master_id)
+			return ctrls->controls[i].value ==
+					mapping->master_manual ? 0 : -EACCES;
+	}
+
+	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
+			   &master_ctrl, 0);
+
+	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+		return 0;
+
+	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+	if (ret >= 0 && val != mapping->master_manual)
+		return -EACCES;
+
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4d4c33b6dfb..3edb54c086b2 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1020,8 +1020,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 	int ret = 0;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
-					    ioctl == VIDIOC_G_EXT_CTRLS);
+		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, ioctl);
 		if (ret)
 			break;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index df93db259312..a151f583cd15 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -761,7 +761,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read);
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl);
 
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);

-- 
2.39.0.314.g84b9a713c41-goog-b4-0.11.0-dev-696ae
