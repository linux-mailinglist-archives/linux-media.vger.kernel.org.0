Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715EC337264
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhCKMVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhCKMUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:47 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7938FC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:47 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z1so2431837edb.8
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9SEgVG4eW/6G+FzcssVlXUnq9VbXCnxHNhzrfDeXOM=;
        b=oHho/dq2Er/TJG1cYRUOtK84ZV08O0m7lIIdCOL1I2yXh17pJGwEl7cvnU4QwwgRcv
         xUM4G0jILvbk6r3Ubw77aan4OXB+uTBERPPPLB0LEf9cVMlJ12CwYr1ByDExbFsjxgb2
         e/BhlZqNtu/41CK9Sf+rNG6ljbKCXvc7QtouM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9SEgVG4eW/6G+FzcssVlXUnq9VbXCnxHNhzrfDeXOM=;
        b=iQ7JN1N/sGeW2Sme2QMVh5x+MDRo+lQznICV6JPZl4RmUY7femMUytcgD4qEH/pDW3
         vW19tcSXaw8+i6i4XioMtx/h+HPoxGAQOBEDwNW52rTuNqUTwCrnFBihiIC0etlp1bo+
         G6oqDfR843vtH2YSqFDNCeoCIASI3mV+bdZLsCfRwvgtN5bKoQu3/y6Y04O5WuXXxoKt
         PyE5aH6nJNH5mA71+OUKH3HKWDGlp8Ajv3TmyLr3HtxOTwK5shmazjhADKLk+5VWwS56
         sVINUpwbQXWMGi7iEUY8tUyL+noYIiJCHYQ8Cu8OcbzNnNTq0Uv9VFfEEUX6fUG8SC/j
         cnBg==
X-Gm-Message-State: AOAM530iU08q2LrDF/E0IZkD6C1ieAWw85pKzk2y4ez2hmJWjYScZf9v
        dVDlRNJrHb1U9PlPQa9teh4BdQ==
X-Google-Smtp-Source: ABdhPJwoSMMiTwOlh9Fxqgpc06dFU06j7T75nybumv1yhnimMHvjmzrSOodv0w+ZUj3w9nU93NS/gQ==
X-Received: by 2002:a50:cdd1:: with SMTP id h17mr8278139edj.178.1615465246224;
        Thu, 11 Mar 2021 04:20:46 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:45 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 05/10] media: uvcvideo: Define Control and GUIDs for class ctrls
Date:   Thu, 11 Mar 2021 13:20:35 +0100
Message-Id: <20210311122040.1264410-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new bindings for class controls. This controls will be implemented
by a virtual entity.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 34 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 08877897dc5a..fd4d5ad098b9 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -355,6 +355,20 @@ static const struct uvc_control_info uvc_ctrls[] = {
 		.flags		= UVC_CTRL_FLAG_GET_CUR
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_CTRL_CLASS,
+		.selector	= UVC_CC_CAMERA_CLASS,
+		.index		= 0,
+		.size		= 1,
+		.flags		= 0,
+	},
+	{
+		.entity		= UVC_GUID_CTRL_CLASS,
+		.selector	= UVC_CC_USER_CLASS,
+		.index		= 1,
+		.size		= 1,
+		.flags		= 0,
+	},
 };
 
 static const struct uvc_menu_info power_line_frequency_controls[] = {
@@ -753,6 +767,26 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		= V4L2_CID_CAMERA_CLASS,
+		.name		= "Camera Controls",
+		.entity		= UVC_GUID_CTRL_CLASS,
+		.selector	= UVC_CC_CAMERA_CLASS,
+		.size		= 1,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_CTRL_CLASS,
+		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
+	},
+	{
+		.id		= V4L2_CID_USER_CLASS,
+		.name		= "User Controls",
+		.entity		= UVC_GUID_CTRL_CLASS,
+		.selector	= UVC_CC_USER_CLASS,
+		.size		= 1,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_CTRL_CLASS,
+		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
+	},
 };
 
 /* ------------------------------------------------------------------------
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 97df5ecd66c9..5792232ed312 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -62,6 +62,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_CTRL_CLASS \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
@@ -175,6 +178,11 @@
 	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 
+/* ------------------------------------------------------------------------
+ * Control Class Constants
+ */
+#define UVC_CC_CAMERA_CLASS	0
+#define UVC_CC_USER_CLASS	1
 
 /* ------------------------------------------------------------------------
  * Driver specific constants.
-- 
2.31.0.rc2.261.g7f71774620-goog

