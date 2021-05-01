Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9806C37065F
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 10:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhEAIVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 May 2021 04:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhEAIVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 May 2021 04:21:09 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AE4C06174A
        for <linux-media@vger.kernel.org>; Sat,  1 May 2021 01:20:17 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id k3-20020a17090ad083b0290155b934a295so2964817pju.2
        for <linux-media@vger.kernel.org>; Sat, 01 May 2021 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e+UREwMvCU0p3OyZGXcUE16i/Oh63EmiI8PH18y1vb4=;
        b=ZK8+D/as8DjRIpotVFjLYMEBQQUy+dGI7Hy0EQJY7ZqBoeb+TK3Mdp5t8sQs+CvsrO
         YkrOcf5HswROCirjmDM8PMIRRVVJfLM2NuCpJ2ZZ7YpJbLm/PyqnU0fjar0Wro8jN9Rb
         Gb+P5SBAXCCvRjMpsXb1CkdPEHi6TYHeoApNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e+UREwMvCU0p3OyZGXcUE16i/Oh63EmiI8PH18y1vb4=;
        b=bherDDb2vr9dOXR5JocuALnYpGHBEq8MQgiOZNiMXjoi9awgzg+XitfRUY5oLWAbik
         oTFZ/VfI5slt63ngFM3BR1/RxpGv9qTIpQ4X3A0BH0LJZ/cgfVNWUKV5c2F+j5fhrOQ4
         ZkWQhtzniJIJXKd+lEOINnhWoY785u6Onn31FR13jg6AgqmnHaurQPd6uPbcp09p5bfb
         NxYCywI0vbdWtuaeIIo/j+Z8FljuGGYWKS1Hsxv8cu7aRJ8gMDv7REEzj/aJ4CnZdJyV
         E1kDhGTWYjJLQyBt6elH8muOWm+S78pDON9Q7BPEW+kGJEhyZ4SFg/koTRUvRGoBr3Jz
         QuEw==
X-Gm-Message-State: AOAM530sNgeebWNGR1DfhYSClCrLROqG4uqDsIsviQlHuI/DD9Vj3pa5
        ru+9DIX7U2TAOSjIFvsY7PC/sg==
X-Google-Smtp-Source: ABdhPJyy4DBtvRhqdgmbFu2rM+S4smwJszQFFUF0M0OjAAThphehEU+5PDPSPQSC8/9oVO/C2f4eIg==
X-Received: by 2002:a17:90a:1657:: with SMTP id x23mr341811pje.120.1619857217306;
        Sat, 01 May 2021 01:20:17 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8be7:e987:d00a:1442])
        by smtp.gmail.com with ESMTPSA id b7sm3763003pjq.36.2021.05.01.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 01:20:16 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 3/5] media: uvcvideo: add ROI auto controls
Date:   Sat,  1 May 2021 17:19:59 +0900
Message-Id: <20210501082001.100533-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210501082001.100533-1-senozhatsky@chromium.org>
References: <20210501082001.100533-1-senozhatsky@chromium.org>
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
 drivers/media/usb/uvc/uvc_ctrl.c     | 19 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c |  1 +
 include/uapi/linux/usb/video.h       |  1 +
 include/uapi/linux/v4l2-controls.h   | 10 ++++++++++
 4 files changed, 31 insertions(+)

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
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 0d7fe1bd975a..8c5816f3f7d4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -832,6 +832,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
 	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
 	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
+	case V4L2_CID_REGION_OF_INTEREST_AUTO:	return "Region Of Interest Auto Controls";
 
 	/* Codec controls */
 	/* The MPEG controls are applicable to all codec controls
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
index d43bec5f1afd..97f11b7a3a7c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -993,6 +993,16 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
+#define V4L2_CID_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_CLASS_BASE+36)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY	(1 << 7)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
2.31.1.527.g47e6f16901-goog

