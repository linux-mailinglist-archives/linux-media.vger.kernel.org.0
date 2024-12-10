Return-Path: <linux-media+bounces-23010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7339EACC7
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DF4E28C940
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08852153D0;
	Tue, 10 Dec 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hi3wrvQd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A48215768
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823781; cv=none; b=bpvMX/E5MVwlA4MSymB581w4WFm7yRjx8TzZvIPNeisI92Dt/iMiQOqyTSlIV6/2B960VRJhtn2HqcA5mVIAY4zPwM2B9Tiy1V1DcSjoZn7kNv072A86lzLfHDlCV1xKg+XLNFXz6iHzM90XZsKT0eAcwfKgQkjmFHWqyk6l7vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823781; c=relaxed/simple;
	bh=Vz8bAvwdEEadzQqCLWQ4ZMfQ2c7Ovu4YJ7E9TC+hlEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N831yCCjMqtM5veecJdgDTpeEa0jBrkjKIdYuNq+CkWBgT1yAF3p7Q1RNEJ557yvcP/WafWyCAF2SzMHh0bjM6YORMZUyJoVht4iB9rJmLtW9ar4dzQHuguLyMiODLjUjVwBQzWqDbm6a7BtNHhdai2jyOHMTAemjjmok5tpdGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hi3wrvQd; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6d63ab374so104646885a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823779; x=1734428579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZ3g5bZEuxcEXI8DiQzHarhSV0V4/CTEhxMXIFDKmOg=;
        b=Hi3wrvQd/xabDE9mn/qqoC5AginiI1GwZC1B+5dQL6IFuUelPjhfuQcRKMEuOjit36
         Ai6qtTiDHcJLENTCxh9Mc5PFq3nIT4esI8pgG9OtJZemwtHUogW/1X4AhhHvjXwZGt3Z
         b5gnpkvCbD0Ze9VKCIhN49OYxuVvlONSDIGdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823779; x=1734428579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ3g5bZEuxcEXI8DiQzHarhSV0V4/CTEhxMXIFDKmOg=;
        b=M8vjUuKQqi9C+omt5pYAMG5HqPEIp+euPTiVgX1lOsG4fC97Ik8DZGBc/ey54q+YtP
         dxBJW1rsAayvnUA5Pg4qDDC3xagA8I50JvbhM26y+Q8nNP8x37asXd+ApO3dljqFqWfq
         3JROZlOIFO9VUDn+NdNN3BKCZ4KkVcVElRcldWgAu51NglvBJLXunbB4iffHE0mSPSF0
         dwlMPrR1GWx7BL0eszIGickWnNC8/XSSm/C6yhG8/zb54lsrq2VcZkGWTo9fKK1/EVei
         9boDd7PoW0zgaaWjFKsVqSvaQVsFEacN2Fkm496tJGIJdyy6HeuIAOweVUsm+gyHZLSe
         cylw==
X-Forwarded-Encrypted: i=1; AJvYcCUVbIH82X18lNIsMNjeInFtQ+0oq/7lTErv6A5ipFolT3SBBIxM98I4Gd0tRMIRFq3nKqjCyP8povVu9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SYv2aDBqM4imFti3zpusxAhgsvDCPoX/H6MBh8HR16JOBgsh
	RMq3ZnSn9hBLH1F6Zr8DvaIGwRVJCjvT2J2ZnM/Ja4e0R4t3umg0MCSmmVoWNw==
X-Gm-Gg: ASbGncvMdl8gbY1b3V8oHJPx3U7ZHthv5oWT2/vaiOrkxYLwTs4RJoKt1Nfm2kvJPiA
	WorLfrdAeQZn1bm8Jv5nqS1CW8+i8CUUPNmMbDr6KEg/4xLmoqaJfeagJ8YTkjDAOZKevTAR8t4
	5K9xknddyUjtyXel5PhGrq465wjgHxKzXNslq9nXbkCc2IeBc+Ijbtjv+3eAp0DbvMFKL1nrsaE
	qc3DylH1zVfIO8VUiI7nMyBaFKlF2/y8OhgZBl2L3qc+zqIRpChOCn4LR6HrWDwslG6EDNa5n0A
	TigStowwC13jX+C0d5gyY0oL5aza
X-Google-Smtp-Source: AGHT+IF8U35izwV/nHX+p4seSA3KTbcuZ18YbCP8LguOy+GNHTGswMHJMWEvV2Qr2+rCQLe2Ra6Apw==
X-Received: by 2002:a05:6214:490:b0:6d4:22fc:ce3e with SMTP id 6a1803df08f44-6d8e71dad68mr241873486d6.44.1733823779121;
        Tue, 10 Dec 2024 01:42:59 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:42:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:46 +0000
Subject: [PATCH v16 10/18] media: uvcvideo: Factor out clamping from
 uvc_ctrl_set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-10-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

Move the logic to a separated function. Do not expect any change.
This is a preparation for supporting compound controls.

Reviewed-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 82 +++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 8fc83961c76e..4d0307b28fa8 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2010,28 +2010,17 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
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
@@ -2049,14 +2038,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2065,21 +2053,20 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2087,8 +2074,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		 * UVC controls that support it.
 		 */
 		if (mapping->data_type == UVC_CTRL_DATA_TYPE_BITMASK) {
-			int val = uvc_mapping_get_menu_value(mapping,
-							     xctrl->value);
+			int val = uvc_mapping_get_menu_value(mapping, value);
 			if (!ctrl->cached) {
 				ret = uvc_ctrl_populate_cache(chain, ctrl);
 				if (ret < 0)
@@ -2098,14 +2084,34 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2124,7 +2130,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	uvc_mapping_set_s32(mapping, value,
+	uvc_mapping_set_s32(mapping, xctrl->value,
 			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)

-- 
2.47.0.338.g60cca15819-goog


