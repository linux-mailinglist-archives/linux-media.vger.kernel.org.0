Return-Path: <linux-media+bounces-17380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65F968B67
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 545001C2296E
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1791C62B7;
	Mon,  2 Sep 2024 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWcpg/8n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B361A3050;
	Mon,  2 Sep 2024 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292662; cv=none; b=PmzDxrYp88jIKj8q9ZB8KjqSF2tSnH2enu9EmzIJI8T7fL9EtgbRtqpzmlVyGXqTv0pY+UtdGv0HBKPIA/1RVcTfIe8FIC5ynE3+Rb8Wbwfbtzz0G2OSew0HkdkYF4TY77e/HiC9CG6k6u+lbho8lOvR1ReTH4OCnrDPEgzaLng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292662; c=relaxed/simple;
	bh=/qpG/2Z5WXZGm8WmkwLs3toa6eHEzRVbA+bjWc2mt+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNYjamUzflWTh7drak3/3kd4xYGQV8VBuHJzYeaJ45FwLrewj7OyX347q6UFo1D+2ui+NzHIGj7VR6tLvTsxRg4bnHMFhDzzgrYIxeHe1qq+KLk6U0ghYY5UHDruAGFuDjayFzK7Vil6rAfpwpVdwGXtrJ9HUbA30c4JO72WM/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWcpg/8n; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5353cd18c20so5210808e87.0;
        Mon, 02 Sep 2024 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292658; x=1725897458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gySomjgMUV/LhUrr958ADeJEzee1tSZcTuNwCSieT4k=;
        b=gWcpg/8nKNxerrb3oQsxDxAf7n0G/JTLkaENht8HtPx4WCLX3Ugb2rmvP+er/zAy30
         DyFq7FIualLqf/DtcLjICOj5xcj8RMWJ/oIW6Fi0H8s1Sly1N76JTk7udWp4+0xiP5Er
         fOSdO/TgLLvcsImDyLZI7lO59bxmFxyo9LjUc1pLqSXsFCR67ysm4eE020bf6wofWSVq
         0PDD12dr5D3HR5YeTNdK3+rWKRot35K8SmwEY1qloFEE3SSUVd65/B4YyjpST0W8mDus
         ezLJv9FYqS6gqkkAA23vxtGFmFRf93ADaHus4uOoJIUnQmW1SYzOZExLn5Lp5UD2sMPl
         HJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292658; x=1725897458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gySomjgMUV/LhUrr958ADeJEzee1tSZcTuNwCSieT4k=;
        b=LK4qpUQx7Wi3RGTzTzVgvLh2FAtVvn9VlOQSf/5ZC0kKNf3HLJOyxfjF1Vu51s2vvi
         VtdmonHn9HCrzvdBS1PXTmctSK2nk/D6xlPTHjh3tgcsLD5XKd6sCe66CodSmkwfaoO+
         mutcSWFub7Ib1+CfxJFvRwRSgW8bSa65lpUV6C8+hRkZA0WW5o7Ap7WI81D6SFlH6Yej
         l9JX3Hi6q+X2+HrBCf+S+EagywFzvsYpCr+86UgSHpILdjCYy9MzPI9Igq3jlr700sm7
         Yg5qcuDnwOrZv6+qwLkBjXykhCkcI+Cd8Sx2Rc/gRR69e3837JbeTtqnIS48P7olPaq1
         GTig==
X-Forwarded-Encrypted: i=1; AJvYcCUS7J32h4AMPvQACDbzzXKcUngvWI/G3FSeIzLDyJY/Tp5vOn/zASNIqJCDo1nTwmZo2EokZtQy4wJhU8M=@vger.kernel.org, AJvYcCUdHnRmi1kqqD19KvRCanRdfEwsHabOX4qDMXWewjQ0nlw/xCuSzdrYGNZXaq5am1raEP2fpIdIWSNB9N8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywst6ilVzyOCpuQWFQa2w+Ufn9R//keEfxoyDv80PyGF4PYLW2q
	43r0AnhVgd8emUYEGxMiSLyyCR6IxgJLUIWWmWquQKQR0x4Y5sREqQEbC7QJ
X-Google-Smtp-Source: AGHT+IECCIS7n0qtjSCOMA/WBAr1wEWl2cuJHHAZgShmBdFOgCsT+SftyNWty8H8C5g81ZcvfXGGVw==
X-Received: by 2002:a05:6512:124b:b0:530:ba92:f9a5 with SMTP id 2adb3069b0e04-53546b905d6mr7540905e87.45.1725292657808;
        Mon, 02 Sep 2024 08:57:37 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f87sm570951366b.158.2024.09.02.08.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:57:37 -0700 (PDT)
From: bbara93@gmail.com
Date: Mon, 02 Sep 2024 17:57:29 +0200
Subject: [PATCH v3 4/7] media: i2c: imx290: Introduce initial "off" mode &
 link freq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-imx290-avail-v3-4-b32a12799fed@skidata.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
In-Reply-To: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

From: Benjamin Bara <benjamin.bara@skidata.com>

To be compliant to the V4L2 API, the driver currently "randomly" decides
on one of the two supported modes which also implies a link frequency.

Add a new mode and frequency which symbolize that the sensor is not in
use. This can be used as a default value during probe() and enables us
to avoid communication with the sensor.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v2:
- new
---
 drivers/media/i2c/imx290.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6812e7cb9e23..ece4d66001f5 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -425,14 +425,17 @@ static const struct imx290_csi_cfg imx290_csi_297mhz = {
 /* supported link frequencies */
 #define FREQ_INDEX_1080P	0
 #define FREQ_INDEX_720P		1
+#define FREQ_INDEX_OFF		2
 static const s64 imx290_link_freq_2lanes[] = {
 	[FREQ_INDEX_1080P] = 445500000,
 	[FREQ_INDEX_720P] = 297000000,
+	[FREQ_INDEX_OFF] = 0,
 };
 
 static const s64 imx290_link_freq_4lanes[] = {
 	[FREQ_INDEX_1080P] = 222750000,
 	[FREQ_INDEX_720P] = 148500000,
+	[FREQ_INDEX_OFF] = 0,
 };
 
 /*
@@ -552,6 +555,10 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	},
 };
 
+static const struct imx290_mode imx290_mode_off = {
+	.link_freq_index = FREQ_INDEX_OFF,
+};
+
 static inline const struct imx290_mode *imx290_modes_ptr(const struct imx290 *imx290)
 {
 	if (imx290->nlanes == 2)
@@ -876,10 +883,19 @@ static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
 static void imx290_ctrl_update(struct imx290 *imx290,
 			       const struct imx290_mode *mode)
 {
-	unsigned int hblank_min = mode->hmax_min - mode->width;
-	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
-	unsigned int vblank_min = mode->vmax_min - mode->height;
-	unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
+	unsigned int hblank_min, hblank_max, vblank_min, vblank_max;
+
+	if (mode == &imx290_mode_off) {
+		hblank_min = imx290_get_blank_min(imx290, false);
+		hblank_max = HBLANK_MAX;
+		vblank_min = imx290_get_blank_min(imx290, true);
+		vblank_max = VBLANK_MAX;
+	} else {
+		hblank_min = mode->hmax_min - mode->width;
+		hblank_max = IMX290_HMAX_MAX - mode->width;
+		vblank_min = mode->vmax_min - mode->height;
+		vblank_max = IMX290_VMAX_MAX - mode->height;
+	}
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 
@@ -932,7 +948,8 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	imx290->link_freq =
 		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
 				       V4L2_CID_LINK_FREQ,
-				       imx290_link_freqs_num(imx290) - 1, 0,
+				       imx290_link_freqs_num(imx290) - 1,
+				       FREQ_INDEX_OFF,
 				       imx290_link_freqs_ptr(imx290));
 	if (imx290->link_freq)
 		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -1278,7 +1295,7 @@ static int imx290_subdev_init(struct imx290 *imx290)
 	struct v4l2_subdev_state *state;
 	int ret;
 
-	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
+	imx290->current_mode = &imx290_mode_off;
 
 	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
 	imx290->sd.internal_ops = &imx290_internal_ops;

-- 
2.46.0


