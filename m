Return-Path: <linux-media+bounces-25570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F90A258C7
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6BAC3A4BA4
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA36205ADF;
	Mon,  3 Feb 2025 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RkoG/Rci"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9199205AB9
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583763; cv=none; b=o4ORecu9icS/1p6NUOiuJddzJYkEL1MfTtScQ3gVO5HdfuHVvoeyOEmfQrgfZjldu3QhJoNFhzrQZxVinXio/8nedxE5QgjxWj20CYXhon7koBLqiQfYSki8MMxZt5IlcD4QbIeKXfkx4rmEdli76Rp30Y0kmyTOKx2LEcHrCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583763; c=relaxed/simple;
	bh=3aebO2Y6pQInuoUCgyshgsDh6HxXVCLmgcGLzFZAZA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhQwi5RIUPJRR1WLWKYHseNmWIPlPSxBRBP4MJCcDtf6O9Goka2loQVXZi6dh/FskCoD849eu9Veu542FTi+l1G69nPzYJESaxR5QeX90aeYu7DxqSmdLXaCrVSndJsvNykXcP2GptOoF62BSv0G/AMNskbQ5fNMlE9tK4k4ZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RkoG/Rci; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4affd0fb6adso1344472137.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583761; x=1739188561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCmmBQ4JBjHuyjlM+6/xjTKGJo8TUzW14yyn8KiIGJg=;
        b=RkoG/RcidKSF1u1wxZem9BTg0RHR5W4cLTtUqHVPU2AmraxFq8jgchOjxWXmJeOHiH
         xnMYKrWNBI8hkCIro9+/cyMewVirdaFdkN4rDg9n+Rx6Z6OWxPLq8CfC3PhGab9mjtGe
         5yTZ+aBisdN9wtDKWekDStJRpBth/9nTIxKXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583761; x=1739188561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCmmBQ4JBjHuyjlM+6/xjTKGJo8TUzW14yyn8KiIGJg=;
        b=g+9v/aivzcKsFzlanka45kdgZRw0Fv4eJTwdGlffydv0nwnONk42j8NjTrXRzi8uOY
         JbdcF+1wbJZmO/E4mgNlw03LSPHJPxupzN/Zt4h8+eXcl0LSa18dPjfqjVkuxuUpRvrr
         MOVy4d/td0P4mcfLUkcgyIn/mHZn5RRKHZtuJ0HEtwbyugLOYxGVZbI9sOuhWGAkzZ3K
         rA9BhPjLCspmcPK7OXoahj+KVjc10w2IAgcdB7VsRF8VX3h0/2TDZ3ydUkjgvGj8sntm
         lUcy7rqSL7zOxuG8P/JVRFsJqKNlIfU0JfOXzLHV3wsiJka7lEwYO2eeMYLUiWTAe2cW
         sRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9zGVpk3WlpOIlovTn3gU4rQaqq7JCtFi9koggTzA1J96Sa1QDxvYf15+6KErcTSfE0aBTKUnzI1bA4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3b2Ev5uhZSj2vwAJxI6x/5dNpxGQigcNvfg0CHpfA4RXMYFMT
	UryER4YBExUhoq72ygo3Rd1Tv9oc8Oe5gm80lCYkbv/mTnWlV4osPkjO/zrY1A==
X-Gm-Gg: ASbGncuXjF1TKY8s1VfyYVTjNmsc0SqJQ1+3wpBlhiHg1CldoGQrB1XFMChN0nssv0G
	Ck7W0zP1ALdeu/RnfMpYa7pWokfYB4qV8tJiXTJ6qwnnA1CjQWIdCNl5Axpv3iGP/18KgEgKVtE
	mEze+MSAdTNNwFaYsUVqF5jzhI8L+1HLNYVEO+v94jsO/M5EbnsHPj+lR8DCdHijembLspRz+HJ
	6hM8F4DH9cWJPInLepSN7elwumJEw+kEU48EAPQ0GYHLIc5hgzLi+uvtaCZ/GrEshjw4LFPuawh
	s705rYSjtKI/bnEMe18bdXm1FbkstA7g+PKFdUNt+TiMORiorAcn+1FvGsDwjHD/gg==
X-Google-Smtp-Source: AGHT+IFYM7tol6Vv9OAXobztpdGoP/V/bsu+SLitBGak8MLulw5+yWYEEZB5P8IiJmqPtrF+3elORw==
X-Received: by 2002:a67:e711:0:b0:4b2:5d3e:7554 with SMTP id ada2fe7eead31-4b9a526901dmr17457397137.23.1738583760862;
        Mon, 03 Feb 2025 03:56:00 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:45 +0000
Subject: [PATCH v17 09/17] media: uvcvideo: Factor out clamping from
 uvc_ctrl_set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-9-5900a9fed613@chromium.org>
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

Move the logic to a separated function. Do not expect any change.
This is a preparation for supporting compound controls.

Reviewed-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 86 +++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index a0156b79ab48..b6fd06bd1006 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2053,30 +2053,17 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
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
 
-	lockdep_assert_held(&chain->ctrl_mutex);
-
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
@@ -2094,14 +2081,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2110,21 +2096,20 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2132,8 +2117,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		 * UVC controls that support it.
 		 */
 		if (mapping->data_type == UVC_CTRL_DATA_TYPE_BITMASK) {
-			int val = uvc_mapping_get_menu_value(mapping,
-							     xctrl->value);
+			int val = uvc_mapping_get_menu_value(mapping, value);
 			if (!ctrl->cached) {
 				ret = uvc_ctrl_populate_cache(chain, ctrl);
 				if (ret < 0)
@@ -2143,14 +2127,36 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
+	lockdep_assert_held(&chain->ctrl_mutex);
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
@@ -2169,7 +2175,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	uvc_mapping_set_s32(mapping, value,
+	uvc_mapping_set_s32(mapping, xctrl->value,
 			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	ctrl->dirty = 1;

-- 
2.48.1.362.g079036d154-goog


