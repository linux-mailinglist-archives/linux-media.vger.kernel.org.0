Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8E4163E7EC
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiLACdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:33:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiLACdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:33:05 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755094219A
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:33:04 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id q63-20020a632a42000000b0045724b1dfb9so527166pgq.3
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Irho+t3sB9hIi5ncYXkY5M9p18wVPjmHaKEuFApF/Ns=;
        b=o5/yv0M5SnvdDF+1rJIEGlTBgwD17k03UyxPtHrqPdzAoUbRk9RFRQBjNXk20O3K1a
         n6JnjJ+w5SgzoQulkkqlASiYf6LZJNXqvMnq2eKuaTtDMbSNRNbPQEsLPTAsTcGI2Gwg
         fxGzo1Ox4g9enWDdYmsl8btRoyw9ng+uv5PKodw/f+nc0X6742SxBzT1kZHIOP7TPVmT
         s07vgETwHMqoSjQuTP5cbrOkyBUJDekUAmHXYM6kDuIRe99AWDDenU+HjGBk+rc1uTEA
         W2o5LGusIq96r+EK+7SUH0b03pIdbJ10jhZb70WGGIK6gG4MXKT8VPZMVIsmFYZjbE0Q
         M/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Irho+t3sB9hIi5ncYXkY5M9p18wVPjmHaKEuFApF/Ns=;
        b=z4QghJc8ZrYKIKuWwa7e+9v6z8+mdauhbFkII1VmzypH6fSd/L6iO40lWb7aUiKhD8
         lVl0qqyZrI2JAted8gjLv/nNv4k82BKa/11x9af90RXktNbsDcMjZbnK+9EK772I4QAg
         jpZE6w+6p3eDdT1zoOia3lp1B2yBh04ZoQe8ZqehTAzK7nxqVCtqcfThTbAPKezlYB5k
         NlSHexcN6uEKLck9ZYIsK88rw7BCGxQ63CUJM/V3vg97S+7UwUhWgdwutMTR8JYcKdlT
         QNOOq7Su6iBZ4l+SUrMODsDf0Sjuju7+SYbMzvYEM2UVrCXZMeZGA9do23vxVD8CE3kT
         Ww7Q==
X-Gm-Message-State: ANoB5pn8KPoNMN2HwndkTwZ3IGmYC1+yORPH/nxuHBCdGhGAnERY3fCN
        OWrSo85dbgxNhzQ3ITA/XxzyD5C/ngY=
X-Google-Smtp-Source: AA0mqf4BWPUECPVN/NTsmjmAoUlwJu+VMtpWdg7K/a1IEA9wLEufzpECvKZvBHs2EfwHCtksmu/+qz4LsMQ=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a63:5a56:0:b0:46e:9bac:17f with SMTP id
 k22-20020a635a56000000b0046e9bac017fmr41402479pgm.420.1669861984156; Wed, 30
 Nov 2022 18:33:04 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:32:03 +0900
In-Reply-To: <20221201023204.2177458-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-11-yunkec@google.com>
Subject: [PATCH v10 10/11 RESEND] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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
2.38.1.584.g0f3c55d4c2-goog

