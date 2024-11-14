Return-Path: <linux-media+bounces-21421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE089C9230
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50B542813DB
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAC51B0F05;
	Thu, 14 Nov 2024 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFM9QTve"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2B1AD9F9
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611457; cv=none; b=lFtT6JIjdssyJ07C2BUApfFOYUeSHH0jF5bAqeRDGwP3PFRdr8p+S5Tn7Xh7E8cPDuXt1i7zvZtK5cdiPYaSWMAc8qFnJl4F1Ij/XFMOBjjCSGJQxQeBT3ziPH18g6kTgDOpKv/3JThwbRWwNcp/LZxnoS+raUGBopk4YN52bsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611457; c=relaxed/simple;
	bh=CcDWrBfsaMLxkzXmP4x1HP5oXQZtluzal3euucPdDoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbQ4AeAO/7yS1U6OINo7UZ0swncdRE7s7zxZGD4Pb72yrDQa3MGdz7pUwu/dCm+BHDaegiwHHz2AV3MaVeQ1l4rrFMvn+RImryxysnSMrL4xozrbUMKI4onMEE0jq53Z2iJuWpnsU+BrV+BsCLFOqdxBYbk8Mi4jFAfaZpnygNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RFM9QTve; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d18cdab29dso6402066d6.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611454; x=1732216254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5QFrzTYHuM008uMGaRoTWTjBfLTnP/MUjY+9LgVTI4=;
        b=RFM9QTvekcWD8TDCh+zuKEBNy31fMIWieLNlEMuHiDGiFYx0gNn8Un65P3B3fIMAxq
         iZnc+wsalCu8opeSSneP6Ovjoz1e6tw1BX7TyIbMS0SOcA8r2W8f5REqrOmmZEMDowVK
         tKsyDG4/L5fXdclTvWKDUDAVMPe1gjVQUith0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611454; x=1732216254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5QFrzTYHuM008uMGaRoTWTjBfLTnP/MUjY+9LgVTI4=;
        b=kYBFoxgmrXvyLz0MXA3WTxfh+suiv4ucj+rzzpwvCp6SYbq3dhYzfglUZNQ2p4F74e
         tkAlK47PSMd/JyS2wDvTUAdAiB1Y8y97ntbY1vT5pEBH52CMtpdrnF2gbIhcK0mamkYg
         zJpc+eoYmEs1BO1ti4dx3ZAT8FlpU55n+u3Iw2xu9x2NfyVC1yIaIcs7Y4g3xMKLGwf6
         wmzlBe3Pfndz4dge6tldpF+OkSrnQIx37F5+T3vXYhIs2LFk0rpdkLl6MFxaACqZH8zb
         +eXPTPOI2aMdaPqWWbEnv2dqv0fORhcZVyMUyKUnUnwNDVp2KAww6LWOma8WRLaikZN9
         Js8A==
X-Forwarded-Encrypted: i=1; AJvYcCWjPG6QkNYb1JD04+AKB7QCzXfF/3zy/gnPN4zEusWDJRDOPqTwcNbhtkyWpZN2FP9TPkmcEAg0dZC/2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8fsiJBZw7CLcIDooOdjP701xQ3iHoMmez6MWSdcduFN+oJLK7
	nB2Iwqyz55ed8qJuEEuVPyY4q/re0j0K7AVCRR/5ZF8WYrIXk/+ljuWaPIcltA==
X-Google-Smtp-Source: AGHT+IHc1mJ8L1dvVSev0Kq3FueJOT58g/fRCjBWmQ8lVDbmTXKfbuzypNjXpgw3Yse3KOc/8nvo4g==
X-Received: by 2002:a05:6214:310d:b0:6ce:26c3:c6e6 with SMTP id 6a1803df08f44-6d39e1ca982mr344624376d6.40.1731611453649;
        Thu, 14 Nov 2024 11:10:53 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:53 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:38 +0000
Subject: [PATCH v15 09/19] media: uvcvideo: Support any size for mapping
 get/set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-9-64cfeb56b6f8@chromium.org>
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

Right now, we only support mappings for v4l2 controls with a max size of
s32. This patch modifies the prototype of get/set so it can support any
size.

This is done to prepare for compound controls.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 183 +++++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h |   8 +-
 2 files changed, 130 insertions(+), 61 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d6afa131a5e1..6d5167eb368d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -367,6 +367,22 @@ static const u32 uvc_control_classes[] = {
 
 static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
 
+static s32 uvc_mapping_get_s32(struct uvc_control_mapping *mapping,
+			       u8 query, const void *data_in)
+{
+	s32 data_out;
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
 
-	data[first] = value == 0 ? 0 : (value > 0) ? 1 : 0xff;
-	data[first+1] = min_t(int, abs(value), 0xff);
+	value = *(u32 *)v4l2_in;
+	out[first] = value == 0 ? 0 : (value > 0) ? 1 : 0xff;
+	out[first + 1] = min_t(int, abs(value), 0xff);
+
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
@@ -916,29 +973,40 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
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
 	if (mapping->v4l2_type == V4L2_CTRL_TYPE_MENU)
 		value = uvc_mapping_get_menu_value(mapping, value);
 	/*
@@ -960,6 +1028,8 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 		bits -= 8 - offset;
 		offset = 0;
 	}
+
+	return 0;
 }
 
 /* ------------------------------------------------------------------------
@@ -1141,8 +1211,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return ret;
 
-	*value = mapping->get(mapping, UVC_GET_CUR,
-			      uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	*value = uvc_mapping_get_s32(mapping, UVC_GET_CUR,
+				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	return 0;
 }
@@ -1275,12 +1345,12 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
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
@@ -1324,10 +1394,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 			return ret;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
-		v4l2_ctrl->default_value = mapping->get(mapping, UVC_GET_DEF,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
-	}
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF)
+		v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
+				UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
 
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_MENU:
@@ -1359,16 +1428,16 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
@@ -1581,7 +1650,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 	ctrl->handle = NULL;
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
-		s32 value = mapping->get(mapping, UVC_GET_CUR, data);
+		s32 value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
 
 		/*
 		 * handle may be NULL here if the device sends auto-update
@@ -1925,8 +1994,8 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 			if (ret < 0)
 				return ret;
 		}
-		xctrl->value = mapping->get(mapping, UVC_GET_DEF,
-					    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+		xctrl->value = uvc_mapping_get_s32(mapping, UVC_GET_DEF,
+						   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
 		return 0;
 	}
 
@@ -1963,12 +2032,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
 
@@ -2047,8 +2116,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	mapping->set(mapping, value,
-		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	uvc_mapping_set_s32(mapping, value,
+			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6ebaabd11443..3d32a56c5ff8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -131,10 +131,10 @@ struct uvc_control_mapping {
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
2.47.0.338.g60cca15819-goog


