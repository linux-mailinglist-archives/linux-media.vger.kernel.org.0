Return-Path: <linux-media+bounces-25569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B9A258C5
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76C343A185F
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3C7205AC0;
	Mon,  3 Feb 2025 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="khe9klhu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55DB205503
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583761; cv=none; b=K68tvVEIYK5Zp69cj3hSBt+k6UqjbQh+RbOTgTL63wUirub6qSo5JBDuXxSECUSLJL+rcU+Oro7TEVIz1vrgjIikWQDdOKIjBt4TF2xISmByRIWWCYrpvEaxCACmxCfUEMYwGPjfvckNoDFhgMPuduS4tG/6Ucn90Y/4V0dOkbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583761; c=relaxed/simple;
	bh=IfDfnmI9WexGaCozjlG56eHWRNpkJwSGj+oicfx0AIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krpzMOONZQ9+lfq0Bcgb7EIVUb+FZcA/CwGVs2uw1yivmMmglUCY03RnNefmldrPsXs+NIX9VNlNiAIMbu89GkrxoVImjasKLu0WO5i28ebLNW8b47puk5aPoP2Iw0Sn+dOl1A4iU07CWrGAhXFSh0FIeMcGH00l/4xTocMeJs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=khe9klhu; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afe1009960so1110976137.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583759; x=1739188559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1eOFJCjuwi+7HI+8fuv+RZbg2mJZX4fHHxSxUTTx/0=;
        b=khe9klhu53bpcCexLIKhtRQLM9HLkJLgz9R/ymeFkg1DbH6/lb0WxPrfl+Yjt4Cqf6
         G0XT+i/1U7GSr/sL2OGn0+4igQnnqJGSR4zNabwpy2ST1Fdaym0GvWICoAFaa2/Gwk/z
         oI23EV/sSmTAN3zMfzuyBtIn6k1dULiLmo+CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583759; x=1739188559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1eOFJCjuwi+7HI+8fuv+RZbg2mJZX4fHHxSxUTTx/0=;
        b=mWX0LMl8+LFew/FX786AEOvFsGKdGDsQUh3Y5RqalEMWngMeXVpT4X4sTKAqkFgTuP
         trthgSUW3Noe0P/GTapN0zXc7vuHOeIUe++crfRxnrus6o0uUseTB85loXWhbjiOMnuO
         6y6CWJcjGePfTW+iWLtcVsTu/a/CCO7uBI4IiLhYrD6CCf4f08rX8NLthYQB8VqAEPVr
         5fosAtaoTe25x86D3I5vtV8tA/h3ei6UagmhIC51P2KQYfUoeWYh0Sn0oaQlK3yW0gvd
         seQK5w5v4v8D91YS7qVph44WD6gw3NzxegQf6/A0uT2QULiGtJjAGgHb/3cY7+pTGKNy
         PpOA==
X-Forwarded-Encrypted: i=1; AJvYcCUVbxt7tBYhvzGNW3+APvzWsJp+P7jmVV3daPRsYek8TU4zLoX64BkhPRrTNv3kF8XeHx1Cw4CvjV3ZPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1Xk6OQZQzS2Z4uaTS8bvHqCNejs6oZGSOP1yOZ4Ox4yUlFCa
	BlQy6aX4tZtFwMqB0PYk+HSd1wJdh6N14yT38CxzWDdDjDrSwzc5MuqGOGiCUg==
X-Gm-Gg: ASbGncsJhhcvEuZEHCL2fbRMsH8HbdBPeI67u1sCQZH4WeMwQ9Xcj6mGGRLbd44Pty4
	NO6zRh21b3U31ScdTu1gDvehm2kCJkotUBKgif4zLgCQxxu5lPqJvbp6hEqF3utcE49CRufx4i+
	rUru7Wh3sDG93CJro2+nMByoaZbYQeRtGnpxXFFwd3/4lxSOw1+s9r4l/jny9TIMG7OAKAtwAa3
	H6uEIr+L/gLwK9yvQBh4sioeuP3UQE5rYE5JG258p+WCStA0VtjYwA6JJfftqIgRHJalMxSGnq7
	QptCEkmtN3n7f/uJYIbJJ8462QUgTO4huB24sivjOHjpixgdAew5kKEN+0H11vTIKQ==
X-Google-Smtp-Source: AGHT+IHE/glGASrHlXx81gQujZaYMBk1kjOiTOdazBG8eg6EqYAu3Io5LOiy1wwKRjVdc8juoLGChQ==
X-Received: by 2002:a05:6102:4687:b0:4b9:bd00:454b with SMTP id ada2fe7eead31-4b9bd004832mr5990018137.13.1738583758746;
        Mon, 03 Feb 2025 03:55:58 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:57 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:44 +0000
Subject: [PATCH v17 08/17] media: uvcvideo: Support any size for mapping
 get/set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-8-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

Right now, we only support mappings for v4l2 controls with a max size of
s32. This patch modifies the prototype of get/set so it can support any
size.

This is done to prepare for compound controls.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 181 +++++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h |   8 +-
 2 files changed, 130 insertions(+), 59 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 201af66a874d..a0156b79ab48 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -367,6 +367,22 @@ static const u32 uvc_control_classes[] = {
 
 static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
 
+static s32 uvc_mapping_get_s32(struct uvc_control_mapping *mapping,
+			       u8 query, const void *data_in)
+{
+	s32 data_out = 0;
+
+	mapping->get(mapping, query, data_in, sizeof(data_out), &data_out);
+
+	return data_out;
+}
+
+static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
+				s32 data_in, void *data_out)
+{
+	mapping->set(mapping, sizeof(data_in), &data_in, data_out);
+}
+
 /*
  * This function translates the V4L2 menu index @idx, as exposed to userspace as
  * the V4L2 control value, to the corresponding UVC control value used by the
@@ -405,58 +421,93 @@ uvc_mapping_get_menu_name(const struct uvc_control_mapping *mapping, u32 idx)
 	return v4l2_ctrl_get_menu(mapping->id)[idx];
 }
 
-static s32 uvc_ctrl_get_zoom(struct uvc_control_mapping *mapping,
-	u8 query, const u8 *data)
+static int uvc_ctrl_get_zoom(struct uvc_control_mapping *mapping, u8 query,
+			     const void *uvc_in, size_t v4l2_size,
+			     void *v4l2_out)
 {
-	s8 zoom = (s8)data[0];
+	u8 value = ((u8 *)uvc_in)[2];
+	s8 sign = ((s8 *)uvc_in)[0];
+	s32 *out = v4l2_out;
+
+	if (WARN_ON(v4l2_size != sizeof(s32)))
+		return -EINVAL;
 
 	switch (query) {
 	case UVC_GET_CUR:
-		return (zoom == 0) ? 0 : (zoom > 0 ? data[2] : -data[2]);
+		*out = (sign == 0) ? 0 : (sign > 0 ? value : -value);
+		return 0;
 
 	case UVC_GET_MIN:
 	case UVC_GET_MAX:
 	case UVC_GET_RES:
 	case UVC_GET_DEF:
 	default:
-		return data[2];
+		*out = value;
+		return 0;
 	}
 }
 
-static void uvc_ctrl_set_zoom(struct uvc_control_mapping *mapping,
-	s32 value, u8 *data)
+static int uvc_ctrl_set_zoom(struct uvc_control_mapping *mapping,
+			     size_t v4l2_size, const void *v4l2_in,
+			     void *uvc_out)
 {
-	data[0] = value == 0 ? 0 : (value > 0) ? 1 : 0xff;
-	data[2] = min((int)abs(value), 0xff);
+	u8 *out = uvc_out;
+	s32 value;
+
+	if (WARN_ON(v4l2_size != sizeof(s32)))
+		return -EINVAL;
+
+	value = *(u32 *)v4l2_in;
+	out[0] = value == 0 ? 0 : (value > 0) ? 1 : 0xff;
+	out[2] = min_t(int, abs(value), 0xff);
+
+	return 0;
 }
 
-static s32 uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
-	u8 query, const u8 *data)
+static int uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
+				  u8 query, const void *uvc_in,
+				  size_t v4l2_size, void *v4l2_out)
 {
 	unsigned int first = mapping->offset / 8;
-	s8 rel = (s8)data[first];
+	u8 value = ((u8 *)uvc_in)[first + 1];
+	s8 sign = ((s8 *)uvc_in)[first];
+	s32 *out = v4l2_out;
+
+	if (WARN_ON(v4l2_size != sizeof(s32)))
+		return -EINVAL;
 
 	switch (query) {
 	case UVC_GET_CUR:
-		return (rel == 0) ? 0 : (rel > 0 ? data[first+1]
-						 : -data[first+1]);
+		*out = (sign == 0) ? 0 : (sign > 0 ? value : -value);
+		return 0;
 	case UVC_GET_MIN:
-		return -data[first+1];
+		*out = -value;
+		return 0;
 	case UVC_GET_MAX:
 	case UVC_GET_RES:
 	case UVC_GET_DEF:
 	default:
-		return data[first+1];
+		*out = value;
+		return 0;
 	}
 }
 
-static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
-	s32 value, u8 *data)
+static int uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
+				  size_t v4l2_size, const void *v4l2_in,
+				  void *uvc_out)
 {
 	unsigned int first = mapping->offset / 8;
+	u8 *out = uvc_out;
+	s32 value;
+
+	if (WARN_ON(v4l2_size != sizeof(s32)))
+		return -EINVAL;
+
+	value = *(u32 *)v4l2_in;
+	out[first] = value == 0 ? 0 : (value > 0) ? 1 : 0xff;
+	out[first + 1] = min_t(int, abs(value), 0xff);
 
-	data[first] = value == 0 ? 0 : (value > 0) ? 1 : 0xff;
-	data[first+1] = min_t(int, abs(value), 0xff);
+	return 0;
 }
 
 static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
@@ -887,14 +938,20 @@ static s32 uvc_menu_to_v4l2_menu(struct uvc_control_mapping *mapping, s32 val)
  * a signed 32bit integer. Sign extension will be performed if the mapping
  * references a signed data type.
  */
-static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
-	u8 query, const u8 *data)
+static int uvc_get_le_value(struct uvc_control_mapping *mapping,
+			    u8 query, const void *uvc_in, size_t v4l2_size,
+			    void *v4l2_out)
 {
-	int bits = mapping->size;
 	int offset = mapping->offset;
+	int bits = mapping->size;
+	const u8 *data = uvc_in;
+	s32 *out = v4l2_out;
 	s32 value = 0;
 	u8 mask;
 
+	if (WARN_ON(v4l2_size != sizeof(s32)))
+		return -EINVAL;
+
 	data += offset / 8;
 	offset &= 7;
 	mask = ((1LL << bits) - 1) << offset;
@@ -916,29 +973,41 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 		value |= -(value & (1 << (mapping->size - 1)));
 
 	/* If it is a menu, convert from uvc to v4l2. */
-	if (mapping->v4l2_type != V4L2_CTRL_TYPE_MENU)
-		return value;
+	if (mapping->v4l2_type != V4L2_CTRL_TYPE_MENU) {
+		*out = value;
+		return 0;
+	}
 
 	switch (query) {
 	case UVC_GET_CUR:
 	case UVC_GET_DEF:
-		return uvc_menu_to_v4l2_menu(mapping, value);
+		*out = uvc_menu_to_v4l2_menu(mapping, value);
+		return 0;
 	}
 
-	return value;
+	*out = value;
+	return 0;
 }
 
 /*
  * Set the bit string specified by mapping->offset and mapping->size
  * in the little-endian data stored at 'data' to the value 'value'.
  */
-static void uvc_set_le_value(struct uvc_control_mapping *mapping,
-	s32 value, u8 *data)
+static int uvc_set_le_value(struct uvc_control_mapping *mapping,
+			    size_t v4l2_size, const void *v4l2_in,
+			    void *uvc_out)
 {
-	int bits = mapping->size;
 	int offset = mapping->offset;
+	int bits = mapping->size;
+	u8 *data = uvc_out;
+	s32 value;
 	u8 mask;
 
+	if (WARN_ON(v4l2_size != sizeof(s32)))
+		return -EINVAL;
+
+	value = *(s32 *)v4l2_in;
+
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_MENU:
 		value = uvc_mapping_get_menu_value(mapping, value);
@@ -966,6 +1035,8 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 		bits -= 8 - offset;
 		offset = 0;
 	}
+
+	return 0;
 }
 
 /* ------------------------------------------------------------------------
@@ -1147,8 +1218,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return ret;
 
-	*value = mapping->get(mapping, UVC_GET_CUR,
-			      uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	*value = uvc_mapping_get_s32(mapping, UVC_GET_CUR,
+				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	return 0;
 }
@@ -1281,12 +1352,12 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 	 * as supported.
 	 */
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
-		return mapping->get(mapping, UVC_GET_RES,
-				    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
+		return uvc_mapping_get_s32(mapping, UVC_GET_RES,
+					   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
-		return mapping->get(mapping, UVC_GET_MAX,
-				    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+		return uvc_mapping_get_s32(mapping, UVC_GET_MAX,
+					   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
 
 	return ~0;
 }
@@ -1331,8 +1402,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
-		v4l2_ctrl->default_value = mapping->get(mapping, UVC_GET_DEF,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+		v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
+				UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
 	}
 
 	switch (mapping->v4l2_type) {
@@ -1365,16 +1436,16 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
-		v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+		v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
+				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
-		v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+		v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
+				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
-		v4l2_ctrl->step = mapping->get(mapping, UVC_GET_RES,
-				  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
+		v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
+				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 
 	return 0;
 }
@@ -1625,7 +1696,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 		uvc_ctrl_set_handle(handle, ctrl, NULL);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
-		s32 value = mapping->get(mapping, UVC_GET_CUR, data);
+		s32 value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
 
 		/*
 		 * handle may be NULL here if the device sends auto-update
@@ -1974,8 +2045,8 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 			if (ret < 0)
 				return ret;
 		}
-		xctrl->value = mapping->get(mapping, UVC_GET_DEF,
-					    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+		xctrl->value = uvc_mapping_get_s32(mapping, UVC_GET_DEF,
+						   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
 		return 0;
 	}
 
@@ -2014,12 +2085,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 				return ret;
 		}
 
-		min = mapping->get(mapping, UVC_GET_MIN,
-				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
-		max = mapping->get(mapping, UVC_GET_MAX,
-				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
-		step = mapping->get(mapping, UVC_GET_RES,
-				    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
+		min = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
+					  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+		max = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
+					  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+		step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
+					   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 		if (step == 0)
 			step = 1;
 
@@ -2098,8 +2169,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	mapping->set(mapping, value,
-		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	uvc_mapping_set_s32(mapping, value,
+			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	ctrl->dirty = 1;
 	ctrl->modified = 1;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 018613f98f48..b55d5c23dfca 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -132,10 +132,10 @@ struct uvc_control_mapping {
 	const struct uvc_control_mapping *(*filter_mapping)
 				(struct uvc_video_chain *chain,
 				struct uvc_control *ctrl);
-	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
-		   const u8 *data);
-	void (*set)(struct uvc_control_mapping *mapping, s32 value,
-		    u8 *data);
+	int (*get)(struct uvc_control_mapping *mapping, u8 query,
+		   const void *uvc_in, size_t v4l2_size, void *v4l2_out);
+	int (*set)(struct uvc_control_mapping *mapping, size_t v4l2_size,
+		   const void *v4l2_in, void *uvc_out);
 };
 
 struct uvc_control {

-- 
2.48.1.362.g079036d154-goog


