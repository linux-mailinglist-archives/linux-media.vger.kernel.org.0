Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A750D6223B7
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 07:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiKIGHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 01:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiKIGHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 01:07:21 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50991F611
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 22:07:20 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id n12-20020a170902e54c00b00188515e81a6so12892275plf.23
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 22:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mi4l24lJfLDD9V/+lKUVEe1U8N/qXPDU0Q2hl6vlRXs=;
        b=m7csTZorgASyqZySAS6uE9II4b6X5/NbO7LVaz5A3/fC7PvqiVxVC+ToNa6dgB2Ymp
         lcwpLRokxFMj6dNZSpj61etuI5Dakmeia6Q+yvg5XuZYSxqhdesf7uqW6C1bxCYbzPzg
         WwMSUdVBz4G6OU8pEy8zoeqTmcK3gABltvLxozeRdaAIJyFLArck7TZkB/dJ8yNGKw5j
         eva3QeEHzsdpndp9fy72COYWOeCerihZ1hiXpCnUTlHQWpkt3qSrJhkx9KknTVqUMAII
         9i+ZkOs7zAioGjP3OPSBNneAWhcl7BvFOhZyodlpFYQaHBW8Fwjv9pRJgLOt4Jb8dPm4
         DJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mi4l24lJfLDD9V/+lKUVEe1U8N/qXPDU0Q2hl6vlRXs=;
        b=CF/k5dkUWQcddkGJK5Bb3bDScuQriF3SEG9I9yteBwyQHHV35ePPWYG0Igf5rncENb
         qDMRlxsNoaOqgKy5LiUvbuCCRiaCh37KHwEzwIDdVJFW6S/k6VH6zL3JuYfbPT5Jlk+r
         r2Csk4b65Nz+DQ/VXqAeNShHgthDEWwxW1cjAbn0EtoG2o4I/moL9Pg4+bTddP60Yupw
         +/QIuN5qLbIJ0wHgvQ4pQdmP1tfJOeEQPJxyf1rD+V2TSV3QiEQuz/wodE4MfqhQYQ8D
         DJw734+KJj+/qogCxGk8+CdO0/3tKGY+gEhR4Eg9orIdr3bPmqrZosS+E3r6LlrYynVZ
         UuhQ==
X-Gm-Message-State: ACrzQf2d8E7at1HyDpqlROzJp1SWMuOOHzqBuS361SLkFIQh+rE9pXi4
        DdMIPHuX7j2+MdGY9Jn/ACRC6obFO/g=
X-Google-Smtp-Source: AMsMyM6jsyrwv5RvYeFqJD5vz65Hms2wxufu6CwlwfMIx3MtWeHV4YF269fF3NWaNzN849STmbHxRVln4Sc=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:124f:15d3:a305:3dbf])
 (user=yunkec job=sendgmr) by 2002:a62:79d4:0:b0:561:f3bb:878 with SMTP id
 u203-20020a6279d4000000b00561f3bb0878mr1145200pfc.83.1667974040221; Tue, 08
 Nov 2022 22:07:20 -0800 (PST)
Date:   Wed,  9 Nov 2022 15:06:20 +0900
In-Reply-To: <20221109060621.704531-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221109060621.704531-11-yunkec@google.com>
Subject: [PATCH v10 10/11] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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

Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changelog since v9:
- Revert a change in v7 that causes v4l2-compliance failure:
- In uvc_ioctl_g_ext_ctrls(), when v4l2_which is not V4L2_CTRL_WHICH_*_VAL,
- treat it the same as cur instead of returning EINVAL. This is the existing
- behavior.
- The change in v7 of returning EINVAL fails the check in
- v4l2-compliance/v4l2-test-controls.cpp#L834.
Changelog since v8:
- No change.
Changelog since v7:
- Address some comments.

 drivers/media/usb/uvc/uvc_ctrl.c | 44 +++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c |  7 +++--
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index cba31ee36fed..0cb74a1e80f7 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1985,19 +1985,47 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return ret;
 
-	xctrl->value = qc.default_value;
+	switch (v4l2_which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		xctrl->value = qc.default_value;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		xctrl->value = qc.minimum;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		xctrl->value = qc.maximum;
+		break;
+	}
+
 	return 0;
 }
 
 static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
 					    struct uvc_control *ctrl,
 					    struct uvc_control_mapping *mapping,
+					    u32 v4l2_which,
 					    struct v4l2_ext_control *xctrl)
 {
+	u32 flag, id;
 	int ret;
 
-	if (!uvc_ctrl_mapping_is_compound(mapping))
-		return -EINVAL;
+	switch (v4l2_which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		flag = UVC_CTRL_FLAG_GET_DEF;
+		id = UVC_CTRL_DATA_DEF;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		flag = UVC_CTRL_FLAG_GET_MIN;
+		id = UVC_CTRL_DATA_MIN;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		flag = UVC_CTRL_FLAG_GET_MAX;
+		id = UVC_CTRL_DATA_MAX;
+		break;
+	}
+
+	if (!(ctrl->info.flags & flag) && flag != UVC_CTRL_FLAG_GET_DEF)
+		return -EACCES;
 
 	if (!ctrl->cached) {
 		ret = uvc_ctrl_populate_cache(chain, ctrl);
@@ -2005,11 +2033,11 @@ static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
 			return ret;
 	}
 
-	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_DEF, xctrl);
+	return __uvc_ctrl_get_compound(mapping, ctrl, id, xctrl);
 }
 
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
-			  struct v4l2_ext_control *xctrl)
+			  struct v4l2_ext_control *xctrl, u32 v4l2_which)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -2026,9 +2054,11 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
 		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
-						       xctrl);
+						       v4l2_which, xctrl);
 	else
-		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
+		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping,
+						  v4l2_which, xctrl);
+
 
 done:
 	mutex_unlock(&chain->ctrl_mutex);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 52a7dc9ad4b9..494ce646eb4b 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1047,9 +1047,12 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
+	switch (ctrls->which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			ret = uvc_ctrl_get_boundary(chain, ctrl);
+			ret = uvc_ctrl_get_boundary(chain, ctrl, ctrls->which);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c7d20333ca8a..5c3b4ce85615 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -778,7 +778,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
-			  struct v4l2_ext_control *xctrl);
+			  struct v4l2_ext_control *xctrl,
+			  u32 v4l2_which);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
-- 
2.38.1.431.g37b22c650d-goog

