Return-Path: <linux-media+bounces-1453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B8D800498
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48C0A1F20F77
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 07:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E02C14F69;
	Fri,  1 Dec 2023 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c51Y4BCO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31346193
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:48 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5ca2a6f07b6so31480097b3.2
        for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701415187; x=1702019987; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oQIbzkmmaojt+78vVbRQUlIDfWUbQJ7iOpxbGGh3+PQ=;
        b=c51Y4BCOf5A4mdeeJ7dOSq0tIRX/elnCuu8GUP5dWvv17DPHdya78nM1HQ9tuvrfCu
         sh9E1kWhajsoYs+HmxEJsOJWTNph7XC+C6YetL690B/cxTv2JC+d6U2/LlibYMAgSOLF
         0JNInuWXd9+kTUJiDxeEXhMl4TSHW/6QNxKEliQf5iklfrBb4ShXxY8FeFdeTSWM9MXO
         nmvbBnHsigam+DHDYiAFBJj7JC7Zosx6Rm/+tnKmFyRdkUIhfQRpwnsnGegKhJ9mBsSE
         I3nZRHaiXaxPXx3Tc/YxiptI03Sroa9n9XHIn/rPKMm72zx9ub/do5it71Q9jkJSp5dL
         2vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415187; x=1702019987;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQIbzkmmaojt+78vVbRQUlIDfWUbQJ7iOpxbGGh3+PQ=;
        b=vCQEDJLuIYryUPS730cEx1XXkxZStX/ivO03HFFCI7b4QPHj65JZdH/N0oaQWY2lYX
         ObzYiSxe8KU1rm5tFY185R4ue1/GRxEG+ErHsQ0GZMvDSIO8noQNi201xL4fN5k/syXK
         6KqYQY/vzaxcBIyQol97i5FkrEbq0+Jcxr2n6P9laLnPOrv49v6n7sWfsKcB4KUhx4xB
         SovC83cJ/D0nTEdo4FgJWdO4qoC/flL0Q4UjzBPvB4DY/WEa5mQpbkmYZe5ZwHjKqMya
         1yjkfQHOZAUryxOE7nybTYwT+rM7j+6LO5w2qBt0orv+MADwHCdgutbR1iOVxSbyT/RJ
         S9YA==
X-Gm-Message-State: AOJu0YwhtsshBwS0RlNLBSoaBgwcCWbwuag5aiJHSDjBMDxE1ftSNP6g
	rE2W5cY+pMUJ+c3pFYlJFaAXPHVZ4N4=
X-Google-Smtp-Source: AGHT+IFjp1SGqjAxddiLMIi4ScbG70IxT7brHc4ojspZ0sWJZvO2fhxhy1X3vHd/EAQaq2+BWNDgbVi1gFs=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:ea68:7c7a:2356:8a4a])
 (user=yunkec job=sendgmr) by 2002:a05:690c:844:b0:5d3:fa18:bf8c with SMTP id
 bz4-20020a05690c084400b005d3fa18bf8cmr65918ywb.0.1701415187496; Thu, 30 Nov
 2023 23:19:47 -0800 (PST)
Date: Fri,  1 Dec 2023 16:18:58 +0900
In-Reply-To: <20231201071907.3080126-1-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201071907.3080126-8-yunkec@google.com>
Subject: [PATCH v14 07/11] media: vivid: Add an rectangle control
From: Yunke Cao <yunkec@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changelog since v13:
- Added Reviewed-by from Hans

 .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f2b20e25a7a4..27a1173c7734 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -38,6 +38,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -357,6 +358,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.step = 1,
 };
 
+static const struct v4l2_rect rect_def = {
+	.top = 100,
+	.left = 200,
+	.width = 300,
+	.height = 400,
+};
+
+static const struct v4l2_rect rect_min = {
+	.top = 0,
+	.left = 0,
+	.width = 1,
+	.height = 1,
+};
+
+static const struct v4l2_rect rect_max = {
+	.top = 0,
+	.left = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Rect",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &rect_def,
+	.p_min.p_const = &rect_min,
+	.p_max.p_const = &rect_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1677,6 +1710,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.43.0.rc2.451.g8631bc7472-goog


