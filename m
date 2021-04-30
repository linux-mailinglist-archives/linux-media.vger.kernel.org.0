Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13FF436F93D
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 13:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbhD3L1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 07:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbhD3L1Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 07:27:16 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23AFC06138B
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:28 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id y1so20774133plg.11
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zIeGfPeG7mxLyeWqTVf7wfaZkEDi44BCzuBGF1X/M+U=;
        b=BFhXsWdbAorG6W7X28knlmwSQAvDMHREHZpapfF789zkPTpt6YHSKtcq+a57hzTDAH
         rHN57as60d478lbaWrzks+TyxoDSOjHM631QWi/qornlL6nga34sm2tlVqA+Wb5tNS3D
         iRtKFH2yEnSEVHZwQI+ZLNyN7+3ju/rEMbdd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zIeGfPeG7mxLyeWqTVf7wfaZkEDi44BCzuBGF1X/M+U=;
        b=mFYHxPwujnP4BV4D3w08wHwLL9Y7hOQxb1J6cGwQm+gBdgGCzxcd8BiTINmb+LB4Qt
         ub0vYanJfBI82M2FRM09GdVIVcwXcSDsVfI5s7gqUkczucpUKCAZpzj07OTkrZ3tG43k
         v806l2UqXKqAiIxHNmcd3x8xUsZLg9nQ289h6osllrwxq893q5SQJDjeD5A4R9oGEVXf
         1slV4mN7q/xtb71xrSDxHEkzdbia18frQMCj/ZhPG1hik3TyDDLp1Ev503qfEC3ej62Y
         NlF6Wx4p2uSkwhCArucITGINY/cErr78068TmY/3zrCI6SwMdneoKnIxCJK3+eWzcCur
         Vo0w==
X-Gm-Message-State: AOAM530iT73tnOt6f9WvHS55XHJZ4BK39EOBFgCD6dg3yTWvhjm6QWjF
        BAl7BGancD3i61ASU8ARo2qUIA==
X-Google-Smtp-Source: ABdhPJx0JvQpszhYbbOBoZIy/feVD/3KCckrdiUITnwS+Elady3xpX1f8F7JsXN7SWe3R261c3NtCA==
X-Received: by 2002:a17:90a:3e44:: with SMTP id t4mr4902617pjm.201.1619781988226;
        Fri, 30 Apr 2021 04:26:28 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:2c33:77c9:7bef:267e])
        by smtp.gmail.com with ESMTPSA id l10sm1809457pjy.42.2021.04.30.04.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 04:26:27 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 3/5] media: uvcvideo: add ROI auto controls
Date:   Fri, 30 Apr 2021 20:26:09 +0900
Message-Id: <20210430112611.475039-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430112611.475039-1-senozhatsky@chromium.org>
References: <20210430112611.475039-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for Region of Interest bmAutoControls.

ROI control is a compound data type:
  Control Selector     CT_REGION_OF_INTEREST_CONTROL
  Mandatory Requests   SET_CUR, GET_CUR, GET_MIN, GET_MAX, GET_DEF
  wLength 10
  Offset   Field            Size
  0        wROI_Top         2
  2        wROI_Left        2
  4        wROI_Bottom      2
  6        wROI_Right       2
  8        bmAutoControls   2       (Bitmap)

uvc_control_mapping, however, can handle only s32 data type at the
moment: ->get() returns s32 value, ->set() accepts s32 value; while
v4l2_ctrl maximum/minimum/default_value can hold only s64 values.

Hence ROI control handling is split into two patches:
a) bmAutoControls is handled via uvc_control_mapping as V4L2_CTRL_TYPE_BITMASK
b) ROI rectangle (SET_CUR, GET_CUR, GET_DEF, etc.) handling is implemented
   separately, by the means of selection API.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 19 +++++++++++++++++++
 include/uapi/linux/usb/video.h     |  1 +
 include/uapi/linux/v4l2-controls.h |  9 +++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b3dde98499f4..5502fe540519 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -355,6 +355,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
 		.flags		= UVC_CTRL_FLAG_GET_CUR
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.index		= 21,
+		.size		= 10,
+		.flags		= UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
+				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_DEF
+	},
 };
 
 static const struct uvc_menu_info power_line_frequency_controls[] = {
@@ -753,6 +762,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		= V4L2_CID_REGION_OF_INTEREST_AUTO,
+		.name		= "Region of Interest (auto)",
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		= 16,
+		.offset		= 64,
+		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
+		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
+	},
 };
 
 /* ------------------------------------------------------------------------
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index bfdae12cdacf..9076a444758a 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -104,6 +104,7 @@
 #define UVC_CT_ROLL_ABSOLUTE_CONTROL			0x0f
 #define UVC_CT_ROLL_RELATIVE_CONTROL			0x10
 #define UVC_CT_PRIVACY_CONTROL				0x11
+#define UVC_CT_REGION_OF_INTEREST_CONTROL		0x14
 
 /* A.9.5. Processing Unit Control Selectors */
 #define UVC_PU_CONTROL_UNDEFINED			0x00
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d43bec5f1afd..34bdaf484a8b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -985,6 +985,15 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
 #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_CLASS_BASE+34)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION	(1 << 6)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY	(1 << 7)
 
 #define V4L2_CID_CAMERA_ORIENTATION		(V4L2_CID_CAMERA_CLASS_BASE+34)
 #define V4L2_CAMERA_ORIENTATION_FRONT		0
-- 
2.31.1.527.g47e6f16901-goog

