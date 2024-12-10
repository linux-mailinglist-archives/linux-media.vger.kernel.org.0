Return-Path: <linux-media+bounces-23009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE39EACD0
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F19A216B530
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3695822331A;
	Tue, 10 Dec 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GQNS8Reu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3343F2153D0
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823781; cv=none; b=lD6yqBXUscEa6LpOmSM0ZpjTTeEOKVvZLRQ4fiYSLyEDRxCyZhWgtuVd4//zA+m6HL0RHAgtPDVUT3PUcikoNH6y7g/oOoXgf6qfvYHicbDNpxajpqWu3/SX+4tPGh+EkPZV5KXVlRkGQq94TlMJYig8EJMmmsKD9QrvAW99B4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823781; c=relaxed/simple;
	bh=4xbVKX6i7so/xLpTZa/XjbZr4+Bsicj6dDAFUgCiOPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWTAvDKQESgHEYSp2A48By0dn7F7h1RFhKlyR1uEcSBZSvKAAk+dUXl5zcQ3gt4l8rAt9enepAFbwWbGaIb8pkfPfQAvHH4j4+skR9e6m6zu+QlYr6e/9ZBkr2lR3ymGmvY6wBrzaOU7sU2UnVRIO9cXLq4t6WPFbANQ+BWpvVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GQNS8Reu; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d87ab49423so52345226d6.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823778; x=1734428578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFj66RyTk6sqT9V9Y9d3LeaKrBJRM9mSw2F5nWt5/Tw=;
        b=GQNS8ReuQ4z/uRrHUQbCHlnTcr1i9t3zuY5UUu6cFFBl5i1dGCWj8gt8iRim4oRu0r
         OVurlvRPnUgZ7yTfpR03E+D+cTFHyG5TNcU8uHsshoOuJXdYFeD7+t5eOd/5ZdlMV9Kd
         i++09WD2ybdh1VD9/lN6w8dQMQ4cBgXIG03tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823778; x=1734428578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFj66RyTk6sqT9V9Y9d3LeaKrBJRM9mSw2F5nWt5/Tw=;
        b=p3unoPMm8bkxGRH7Lxy1dCBgVQMNVsYMaz57i2HM7igp/pSFByjRLjXC/uv/fJjh7g
         NvCyy1r92K8+5T/UmhcZ5f2AKgVHn9YB1MQ4KIQZ6WxpPvhuZTgwnm9/if8E+26EYZ8Y
         afKpaH0uMZ15I3za23ODZKwr0m6g+btjm+TGsIDpEGI4pEBDNRJKszS8Jv+rdvMxbc3c
         l8XPkHkZ9gScPVGgwa4LfMrVbzJj4ESw9YzDYYaNZbLD5y7RQLkjF1tZvnxvoPtOAoYm
         kGptcqczYT9dGXQAObcLz+uP73zvA55oC9J1xD14hpI8yNFdc/BT0av0m8rNFbXY2nYP
         12Qg==
X-Forwarded-Encrypted: i=1; AJvYcCX2FDODkSIAocxCBCdtE3eL5yGspvGecSLbzoLKwG1xNQIimd+rLIMZI7vuYikL5tM/++CPVpLzwDf/Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1V0RW7jxuXu3VLph7h4FNNQ5cM47J51y2RgowdLMjQ1NfGVm
	tTz5Ih/v6881RhfcGkmYT82ztO43VbjAPKXlIrATQ4Mj1ykKFFiY6DMCDZ8M4w==
X-Gm-Gg: ASbGnctMWRwVJWsaOoTADHrsD5VCrhhqhw5QTNTK8R4ShxulroOtZwKdNYQDtUy/qQP
	4ndlgz9qKt0OGVNHHYXtt0S14gRTdasePMOramjORklANjovvZ9fpFnjo9WwvVgV0l8x17ddzsI
	qOjhl6YGXMJUaFbl34spscOapcjfYvsBBm8N/oEnUGGqDagSQ+CCtPwP8JcqL5SNKpbAAAqGbzC
	8MLrotWy+X8iCbziaUd+41Qsax/QFoN03YQczK6OQesNaB9hrAg/NJOWRl7zK8Cqpoef3MoFWua
	has2eBw07XOk8U9HXJzJUiSzo3yr
X-Google-Smtp-Source: AGHT+IHYM3HgfWV26yqIYegG7eG1m3LG+GjVuVqNl6AyxQo8dS/maLswppMMcvwBORh7NXSiVEHMOA==
X-Received: by 2002:a05:6214:d8d:b0:6d4:1f6d:695f with SMTP id 6a1803df08f44-6d91e2d2d35mr80814336d6.2.1733823778212;
        Tue, 10 Dec 2024 01:42:58 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:42:57 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:45 +0000
Subject: [PATCH v16 09/18] media: uvcvideo: Support any size for mapping
 get/set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-9-e8201f7e8e57@chromium.org>
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
index 12ce7e38d6f6..8fc83961c76e 100644
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
@@ -1587,7 +1658,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 	ctrl->handle = NULL;
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
-		s32 value = mapping->get(mapping, UVC_GET_CUR, data);
+		s32 value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
 
 		/*
 		 * handle may be NULL here if the device sends auto-update
@@ -1931,8 +2002,8 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 			if (ret < 0)
 				return ret;
 		}
-		xctrl->value = mapping->get(mapping, UVC_GET_DEF,
-					    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+		xctrl->value = uvc_mapping_get_s32(mapping, UVC_GET_DEF,
+						   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
 		return 0;
 	}
 
@@ -1969,12 +2040,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
 
@@ -2053,8 +2124,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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


