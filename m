Return-Path: <linux-media+bounces-23003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB939EACC5
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70CC8188A417
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1423212D88;
	Tue, 10 Dec 2024 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ODvp8bFM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302BD210F69
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823769; cv=none; b=JKlvaIlYwJGku7oS52t09ZDHmvzmCmhDH6IQ4yFzKPgeJ0gCIoqfyWIvanVlqXR6aLG0i9WFXfTFgnMnR7tneDD4g0f6yeb/AI/qnQQUuYB7PR1fJqp0TXWxBYkkjLdk17OZRDFnXKbpEoSQlP+O3NVQeahddzVIj47N6q5VOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823769; c=relaxed/simple;
	bh=K0DZI4UBFz6Q1LavHWAO5fp1PzEV7p8YAKo5Gp+ADQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRut+HVMtII+hhIe8DXdetFBWjcQ6ExlYNLSXZfTJcg35xyEG49WiL49+YS/4eLtraw0aD74xgjBcnpuw6QrcQGAmhI8p76+f8ZVt06yXLdqWImkzHk1m/fGoNw+KtzLnBoBcn/mLHmCcFmshLtJ5QYk4OW7nlyABNplPBwPzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ODvp8bFM; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d888c38841so42072676d6.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823766; x=1734428566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mf5LuVEPO74SAkZYBzrIXfOzplKA9uICYltmS7j18Lk=;
        b=ODvp8bFMPzJS7ZzEPtMgocFmFvOqb1zUnnsB2AiH7hD71egqUt7xXD/HwGUR3Fi6V2
         xFomojbgsFPEHVhB8PQnoqpNwcWZhyeNl1xxCVjZLgORVxV7PHia+dJXP1IfsJvslTgh
         f42AaaoW03IubAZKLrZMs6qHMqE4ygKvXhqZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823766; x=1734428566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf5LuVEPO74SAkZYBzrIXfOzplKA9uICYltmS7j18Lk=;
        b=ar1SuroYAVlUHCSshKMLMKSve9hdcFtw91lYXJzcqH9PH00fxdNLiJJo1e2EYr1vWM
         Y1SK3PQYbevgkW/MqnEFuffxRh0h5D4LdYQWpbNJygeALTPmCze8IdAivx0M3iQrc4bE
         mROPpZPI/szpOGJdcsRR8sjQCrzxEZr62t8HQf8A+LhEjr8TXs67P2YfXk+o8v34bfkb
         bfH05Omhgdz5VI+2kTsnlCKM5a3KuDj3iNXFb1WDoAas+ygydQBt/tekJ0pmoFiUc4Zs
         GiY0DxFr5PdKBNwj9F0DgJKIRfemi4ld64dPNrIOdCaOHCtJw0v5fOMswuKfQBWCh718
         hktQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzLcmoc/WNqZetuNk+u2HhqdrP/Bc5MU7IOneY04UnHP61L5SqHuIQN7ovtg6xINNHVMTODnmEOFn1Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG930nBoKDZhUFBmXtC9FebCc954imogdXCEl/U/M1IR3Km4b8
	vQ7eBW2rmrO4uCN+8xA3ryHI4MUkO8sXNawaOxnX8w5b79yqmpeBJJLScbhl0A==
X-Gm-Gg: ASbGncu9yH4u1+/R6VRMfCMyRkvV2UweVVjX3+5CFJpx3H1s9jnjEDBoTpglKyVsar/
	YDgrclkiOeFqiPGS00MVGYP7LBP1Hx0PNOTog6SKJfPX+AO4ZwVAu0VN1AgGrqTcxIP3FJf5Zxs
	BiIp2oqMnWZjROdeby8+kSpy3tiQ+wJeM0NdyoCFd0Ng5Xwr9h/qhRTpmk34IO5ZOt76dpkQ4po
	CJuOrZ7jKAElCssQoQgV0Tft/gfauQAHVjwQkBsmQrV1GAV4zrU9/E19YkuSJPu662b6TVMThOr
	Nx2QwCvQjtxizixXvprmg/TodCwh
X-Google-Smtp-Source: AGHT+IGT4gzfITvLDwHStH5Rg/t89JsU98DuOgF0s+ypUy2x7EUDyd1LNn2KVDFdffsHdPjaiYA0UA==
X-Received: by 2002:a05:6214:76b:b0:6d8:8165:ef21 with SMTP id 6a1803df08f44-6d8e727e5f5mr249233116d6.49.1733823766038;
        Tue, 10 Dec 2024 01:42:46 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:42:45 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:40 +0000
Subject: [PATCH v16 04/18] media: vivid: Add a rectangle control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-4-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
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
2.47.0.338.g60cca15819-goog


