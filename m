Return-Path: <linux-media+bounces-21422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB2C9C9236
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9E51F233A2
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910D01B140D;
	Thu, 14 Nov 2024 19:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="njsaxu8/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5D1AF0AA
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611458; cv=none; b=HXvDIqkwRS8KunrSjJPeMARsRS4bqqgA/gbdQzOgl+ShSfoFgkYrkmMfhPTgfi/2J2nPMMdy9RFi/8j92527mAyIhZFTByXLm4HCB4JOo/K9WLXn0Sqx2VwJZSXXH6WO4G3BDtoEWsMbvgAbCjWqcHD4T+UgHH/W+1Ob3SeaOMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611458; c=relaxed/simple;
	bh=eEpxjAmbwD3Lt+gRDs1Am6dF+cKdoldhzE/k4zEeBtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpZtSaCcBNiUaj6yn8QwruByZKuyKRmN8gLUfiOQemzzzSosdf6r/RmS3Bnk3LgWeJw0AR9V6lCD89EjFgANGNth0FA/U0lADXW7lrZX3u2Yvyh39SlZLXyy90Ob96vCO4aslx1H/Rnt6Pj5gLJiuGQ0xMICo4XekzBa7nCNxTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=njsaxu8/; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b150dc7bc0so56998885a.1
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611455; x=1732216255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJbE2HWSb90CvyoZHkq71MDXLaiW+wPC8fPWnyVZD4E=;
        b=njsaxu8/gMz6dHHEwUP5vhf4ogLr9un9Am0HdzZG7ldwhAcb5jLWLGLD3XyQh+RqhJ
         Ltj0oLG4rnLlhFPYZzog3me/SgItAqOpR7uFCjbev2ZYgUrafyhTsiMZgXAENFnWzegW
         upFYjZ4jrkGwIRxpPa9sKfl7iZ/40XCkXgmWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611455; x=1732216255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJbE2HWSb90CvyoZHkq71MDXLaiW+wPC8fPWnyVZD4E=;
        b=GCTjGbYP1b7TwmLifMWSG03x1gVP1e9g2ArAv6+71dWQXrCzxTUaW00z5CpnOTlOnl
         PxYMfGjCPs4NYLuvi7YlCEPYR2gaSCraHrOju656gmm93TFV80QtK/N3S+D5OL8ZkUZw
         THlV6AzbBH9v7P0/8aNg/Knp2qqV1/MTM8ms7Lj/hLnQu2a4nMTnG/PhWRDxFBfjeZ/B
         6+jtnY59KCQRAm/FgCwSmWsJaVfis6nZ7JFm0S2/Ms/I9k+4ufiN4oUHIfPPZjlaoVMi
         lWwiD/ktR0C9tsk00ze3XNA+QZ57ObHUZWzBCfdGFeV/ogjSqUF5Ck9pX/jgxN+w353v
         JE6A==
X-Forwarded-Encrypted: i=1; AJvYcCUQLG4J/sPN91+6C9XvzDbFWsiqaJZv5EM3Kb4Y5LRQUq74GDXUR3c6wk/4gY2etnESNPQ8uB4FSVEOSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA0Fsh69ww1O9VNbp0zGekjui7Ql6loMIx9FVGArq+hQlDN70P
	hf+tCKzNC7PU0hnppsMujGiVM7tDcuSauA8OiKYXXTy9RzQNnlUwQqwnP277xA==
X-Google-Smtp-Source: AGHT+IEvcPAJuJO2mAlNO/pEgGAbnA4uxX9GYiqUlzz3FMhGvdAEvXWG55u9OyHeUYdgEK9DLzdemw==
X-Received: by 2002:a0c:9e81:0:b0:6d3:fa75:e9ed with SMTP id 6a1803df08f44-6d3fa75ec86mr4480876d6.41.1731611455074;
        Thu, 14 Nov 2024 11:10:55 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:54 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:39 +0000
Subject: [PATCH v15 10/19] media: uvcvideo: Factor out clamping from
 uvc_ctrl_set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-10-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Move the logic to a separated function. Do not expect any change.
This is a preparation for supporting compound controls.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 82 +++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 6d5167eb368d..893d12cd3f90 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2002,28 +2002,17 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 	return -EINVAL;
 }
 
-int uvc_ctrl_set(struct uvc_fh *handle,
-	struct v4l2_ext_control *xctrl)
+static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
+			  struct uvc_control *ctrl,
+			  struct uvc_control_mapping *mapping,
+			  s32 *value_in_out)
 {
-	struct uvc_video_chain *chain = handle->chain;
-	struct uvc_control *ctrl;
-	struct uvc_control_mapping *mapping;
-	s32 value;
+	s32 value = *value_in_out;
 	u32 step;
 	s32 min;
 	s32 max;
 	int ret;
 
-	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
-		return -EACCES;
-
-	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
-	if (ctrl == NULL)
-		return -EINVAL;
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
-		return -EACCES;
-
-	/* Clamp out of range values. */
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_INTEGER:
 		if (!ctrl->cached) {
@@ -2041,14 +2030,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		if (step == 0)
 			step = 1;
 
-		xctrl->value = min + DIV_ROUND_CLOSEST((u32)(xctrl->value - min),
-							step) * step;
+		value = min + DIV_ROUND_CLOSEST((u32)(value - min), step) * step;
 		if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
-			xctrl->value = clamp(xctrl->value, min, max);
+			value = clamp(value, min, max);
 		else
-			xctrl->value = clamp_t(u32, xctrl->value, min, max);
-		value = xctrl->value;
-		break;
+			value = clamp_t(u32, value, min, max);
+		*value_in_out = value;
+		return 0;
 
 	case V4L2_CTRL_TYPE_BITMASK:
 		if (!ctrl->cached) {
@@ -2057,21 +2045,20 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 				return ret;
 		}
 
-		xctrl->value &= uvc_get_ctrl_bitmap(ctrl, mapping);
-		value = xctrl->value;
-		break;
+		value &= uvc_get_ctrl_bitmap(ctrl, mapping);
+		*value_in_out = value;
+		return 0;
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
-		xctrl->value = clamp(xctrl->value, 0, 1);
-		value = xctrl->value;
-		break;
+		*value_in_out = clamp(value, 0, 1);
+		return 0;
 
 	case V4L2_CTRL_TYPE_MENU:
-		if (xctrl->value < (ffs(mapping->menu_mask) - 1) ||
-		    xctrl->value > (fls(mapping->menu_mask) - 1))
+		if (value < (ffs(mapping->menu_mask) - 1) ||
+		    value > (fls(mapping->menu_mask) - 1))
 			return -ERANGE;
 
-		if (!test_bit(xctrl->value, &mapping->menu_mask))
+		if (!test_bit(value, &mapping->menu_mask))
 			return -EINVAL;
 
 		/*
@@ -2079,8 +2066,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		 * UVC controls that support it.
 		 */
 		if (mapping->data_type == UVC_CTRL_DATA_TYPE_BITMASK) {
-			int val = uvc_mapping_get_menu_value(mapping,
-							     xctrl->value);
+			int val = uvc_mapping_get_menu_value(mapping, value);
 			if (!ctrl->cached) {
 				ret = uvc_ctrl_populate_cache(chain, ctrl);
 				if (ret < 0)
@@ -2090,14 +2076,34 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 			if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & val))
 				return -EINVAL;
 		}
-		value = xctrl->value;
-		break;
+		return 0;
 
 	default:
-		value = xctrl->value;
-		break;
+		return 0;
 	}
 
+	return 0;
+}
+
+int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
+{
+	struct uvc_video_chain *chain = handle->chain;
+	struct uvc_control_mapping *mapping;
+	struct uvc_control *ctrl;
+	int ret;
+
+	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
+		return -EACCES;
+
+	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
+	if (!ctrl)
+		return -EINVAL;
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
+		return -EACCES;
+
+	ret = uvc_ctrl_clamp(chain, ctrl, mapping, &xctrl->value);
+	if (ret)
+		return ret;
 	/*
 	 * If the mapping doesn't span the whole UVC control, the current value
 	 * needs to be loaded from the device to perform the read-modify-write
@@ -2116,7 +2122,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	uvc_mapping_set_s32(mapping, value,
+	uvc_mapping_set_s32(mapping, xctrl->value,
 			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)

-- 
2.47.0.338.g60cca15819-goog


