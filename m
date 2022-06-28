Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8728655D96A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243310AbiF1H6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 03:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243514AbiF1H6V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 03:58:21 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AAE022B3F
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:54 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id li4-20020a17090b48c400b001eeec855ae1so1879048pjb.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=BVnCtq4DRmPQW5iFurXbHjb7kWgxbL0xarKsJFp9Ck4=;
        b=TS+p2JsiWhwAX2uA9migG+CHniNgSrHwwCQlyxfVdeJ59DiYoRpF8XqKj8d3mgssCG
         eWGb/VCsW4AS2af9wSNocj/PthX6495Ku/1j2jaexJ6VELKY2kPqcuitLNwk/864DEaq
         WfuPKSyZpnh5EePAwW9MRiBo2V67SpAmLs58DcfUwPXmj6wvUCrOJC0jgg/jAjolNA2K
         fFM+GUwElrurc6T7brts50eG5GJtAAapJ+t8+NL9HCAPusdTq7yG+Z/MRbaNhhFw2Lrv
         hBh9x6L1R5sFOqoTWkYigixwyu4wjbptdrACjuMLv8faUXvTxgVhLWRap/4F65Lke+Ma
         vpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=BVnCtq4DRmPQW5iFurXbHjb7kWgxbL0xarKsJFp9Ck4=;
        b=EDvhrgfDNuGqVE54KbhzwokP3pCRqpWx0UJk5uNmBegaFjCUGNSmxieRzhTxtUEddb
         nGUCjG5TEazdSop7yp0ACQKqo1nygJJcu/4UBVGKCI6fkSLMeHjFPcEEcf2FjVt9Mmvz
         eWcxAIUf+lW1Oj1R4hJw9VYBB0qnd+LNjvPfnyOawvCgS3fWGQmtZDpuCi/cqRRIat3n
         29Fm59WGMSQo6N5vHsmJgZ9ndYKiVvNwZN/VuRkNqvOgYy5nX+RAjr31lv0RvamQOagj
         mYvk/ZUGoxyOz2XVJaGkScxSSMtT0UXfUyTWkujT1UfsxKzdFE8fVUYLFyWEK0Y1m64t
         svdg==
X-Gm-Message-State: AJIora+P2yp0zusa23GRSrID7ut22L6TOeZosfVDZI0g8oEg+I5TF64M
        k+JP5btyottoNKv5JwGcxfcTNDX2Shs=
X-Google-Smtp-Source: AGRyM1v2n//BOzFWYUoP9dCqHyfTQakFN+97p2nIduvFwMUfVNKjEaGtygMXMm3GJh+Tf39cEzwBAOCpQLI=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a17:902:7105:b0:168:dfe3:66e0 with SMTP id
 a5-20020a170902710500b00168dfe366e0mr3715978pll.88.1656403073833; Tue, 28 Jun
 2022 00:57:53 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:57:04 +0900
In-Reply-To: <20220628075705.2278044-1-yunkec@google.com>
Message-Id: <20220628075705.2278044-7-yunkec@google.com>
Mime-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v7 6/7] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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

Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 73 ++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvc_v4l2.c | 11 +++--
 drivers/media/usb/uvc/uvcvideo.h |  3 +-
 3 files changed, 70 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 00482269233a..b569d6824ac1 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1923,7 +1923,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 }
 
 int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
-			     struct v4l2_ext_control *xctrl)
+			     struct v4l2_ext_control *xctrl, u32 v4l2_which)
 {
 	struct v4l2_queryctrl qc = { .id = xctrl->id };
 	int ret = uvc_query_v4l2_ctrl(chain, &qc);
@@ -1931,16 +1931,69 @@ int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
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
+	default:
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
+static int __uvc_ctrl_get_fixed_compound(struct uvc_video_chain *chain,
+					 struct uvc_control_mapping *mapping,
+					 struct uvc_control *ctrl,
+					 u32 v4l2_which,
+					 struct v4l2_ext_control *xctrl)
+{
+	int ret;
+	u32 flag, id;
+
+	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
+		return -EINVAL;
+
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
+	default:
+		return -EINVAL;
+	}
+
+	if (!(ctrl->info.flags & flag) && flag != UVC_CTRL_FLAG_GET_DEF)
+		return -EACCES;
+
+	if (!ctrl->cached) {
+		ret = uvc_ctrl_populate_cache(chain, ctrl);
+		if (ret < 0)
+			return ret;
+	}
+
+	return __uvc_ctrl_get_compound_to_user(mapping, ctrl, id, xctrl);
+}
+
 int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
-		       struct v4l2_ext_control *xctrl)
+		       struct v4l2_ext_control *xctrl, u32 v4l2_which)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
-	int ret;
 
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
@@ -1950,16 +2003,10 @@ int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
 		return -EINVAL;
 
 	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
-		return __uvc_ctrl_get_fixed_std(chain, xctrl);
+		return __uvc_ctrl_get_fixed_std(chain, xctrl, v4l2_which);
 
-	if (!ctrl->cached) {
-		ret = uvc_ctrl_populate_cache(chain, ctrl);
-		if (ret < 0)
-			return ret;
-	}
-
-	return __uvc_ctrl_get_compound_to_user(mapping, ctrl, UVC_CTRL_DATA_DEF,
-					       xctrl);
+	return __uvc_ctrl_get_fixed_compound(chain, mapping, ctrl, v4l2_which,
+					     xctrl);
 }
 
 int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index aad61af36271..004e3b764737 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1043,16 +1043,21 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
+	switch (ctrls->which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			ret = uvc_ctrl_get_fixed(chain, ctrl);
+			ret = uvc_ctrl_get_fixed(chain, ctrl, ctrls->which);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
 			}
 		}
-
 		return 0;
+
+	default:
+		break;
 	}
 
 	ret = uvc_ctrl_begin(chain);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9ff95bbad251..54cc47bc2d33 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -913,7 +913,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
-		       struct v4l2_ext_control *xctrl);
+		       struct v4l2_ext_control *xctrl,
+		       u32 v4l2_which);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
-- 
2.37.0.rc0.161.g10f37bed90-goog

