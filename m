Return-Path: <linux-media+bounces-25563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C1A258AD
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E3F11668DA
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C3820468B;
	Mon,  3 Feb 2025 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JNNtWTMq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F0220459B
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583750; cv=none; b=pjDcetCnE7KlI54ew7wxVTkJH/dlyDK7UiUvHIu0B/D1/f9cE4wUKhPqTl6MhmGjMpB6fDXAdIe3a4mutF/EIsBFF09DwaTVzBQsaDTvW7xZzUK3aEGMN1KbH2qqc266WrSfzZE6bvdSfOc7RWQRa8y/NtKVx02QgG31KZ6BCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583750; c=relaxed/simple;
	bh=52pAZ6jK2x7Q0D1wUZ//wBDW0oHRaJoKihhdh/P6naY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gc03yOUAQrH2Ang9h7b2SmuziJ44xMVTuwnkgPu1cAz8udUweu9wefiNxjX8vpWoDHEJ2R2pEl1n9fmU/6eAfQ458slU+em2dL83YjrHI1pQgWV5qVW0Xb0l3XS4/I2JRZYqHrp/BHjLtgndHdAttt0GIAnMEbJhu/vpVDyEMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JNNtWTMq; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afeccfeda2so2460735137.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583748; x=1739188548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGF1p9h/lUEbgH8GNkApjRtx1wLKFzqXbBITVRxG3W4=;
        b=JNNtWTMqDPKN4ayKfM/UqUEXFZJ0JcI7lkX+zkPwob9MD/CJ5vIgoqSuLXHfBlA2FH
         hQW/FuoL8M2quHpdAeUNk33Y37oJZhvD01V4Hl5elV2pVlQPn/sRr36a+IiEkFretCvY
         EnAqkeD+tyTsaPYcv5IaDOKMMu9dYYbzFnTtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583748; x=1739188548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGF1p9h/lUEbgH8GNkApjRtx1wLKFzqXbBITVRxG3W4=;
        b=MdR7sVdHOQ6jhTmhGOHFlYNPnM15fLyeIZqJzfgJ5ck9kfcZSReC+Y9kWIwDsMRSrk
         UN3f9zTl9as4UES6bugIF/OM5a9lMXE2dwJu/MpzFuxp+IIteqV5n1/GzK9JdYLQZYBF
         ngGm59pDOS97wEzDbVQl7+RJwxydKxLUJB7LnamyfWHODaPOnA93TnJpZrjsrR16ZB4m
         Jd6h6dYK9vDJK6fEhvzKVeNHPaCcbsz+lrvbyIC7HI1yFyvRmOr5w0qUul9yUiAVu44K
         TkvYz/yE/tg7QeNiCoXhfDhFRKTV6hI59s1aT4Shx09j6CVj8pC9QAZ50HHWAh2eXEVT
         buGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE9PnIScJpcjBV1Ak/K9KqKMejxtfZLH2GvoGclsp/XljumOca5Mq0/2+VXLFaa/DntUcBzW+14tlsbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzufNv6iYdHfgtmsFabB1CuxZXD8bm98HjPo9i3XI/yHC0ENbwa
	YpMFhFsATpcuNdX/18iBjTjScTKnEcfHDtNFFs9E+eT+VKMMLQgqUJm0dywpC7pjZQHc6QButKA
	h5A==
X-Gm-Gg: ASbGncsNUkb6dytKpC2AwgFywZ9DBdY9r8RHJYV0GFTAm3E+ODp0sWK3o+9g4OHVfYA
	ovFfhgdTWlwAfrMa41nd4MgX73i3SiDCKj6YXmdBb8lt8QSpcZgTaz7d0je53OijCvZrrEkYtpr
	oQNpm9cNetu00WrHGiUl6HbBwpDW3mKSp7h9XAWVoE5ydaR0lG0tIyXDr7R8g/4mpUIWC2NrEhX
	/FtVGYDJosMGyr3RWY8QofI25Bs0LOM7Be2xCiCYqaDKJviV9ahxXHjixv92lkWXnBxgrUeX8gF
	TeB6lSji67ZZbmpN/mVx7Vu0t64Vrm70FcQB7935JttiuSwU9ZmdQZ2mH/t859oV+Q==
X-Google-Smtp-Source: AGHT+IGnHlpYhWPf2xuJvuKNgHsRB2A6Y8fI7OQq+908vpzT+JKkZbPfDi7QBsgqZbmFX9K/QZT/6w==
X-Received: by 2002:a05:6102:5045:b0:4b2:5ca3:f82a with SMTP id ada2fe7eead31-4b9a4f5dc62mr14553199137.7.1738583748017;
        Mon, 03 Feb 2025 03:55:48 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:46 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:39 +0000
Subject: [PATCH v17 03/17] media: vivid: Add a rectangle control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-3-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@google.com>

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 2b5c8fbcd0a2..57346b714534 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -37,6 +37,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
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
@@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);

-- 
2.48.1.362.g079036d154-goog


