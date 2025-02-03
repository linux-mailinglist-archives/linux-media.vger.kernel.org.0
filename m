Return-Path: <linux-media+bounces-25566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C11A258B3
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3284318882F5
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A831204C28;
	Mon,  3 Feb 2025 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FZfYmpHz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F1B2046B8
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583755; cv=none; b=iOyDZsP+Eb4W8vZMhXmD4CIb5PriOTJlRvaXhmVgH2SeuOlIc87ECi9aycob07GuqMnnAGfZHhrSYhUADF4x6bVb4oDevuYecp44RdT0Dh/9SbpA7DeaXvbLOfL1QQn5JM9jQ1GNyMiIlQ6LnMf7ikOj7TyngQF8uwlNaYtJJtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583755; c=relaxed/simple;
	bh=3T3cQOz17m5Ds9rW6s0LrBZRHiluSRGdx/Rbl2rtwCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bsRn9cPQxjxlfUH+ykc28NZJ8laVmGL6n62msU8fiJpLlRXAskWFVWoMk5avSYa3mYXx+NUd+WRtgxFAj9P4UNqPqggP3BCmqg+qCuI+BBfsK5nBGtqisYAoxL/MnXRDV8R4tYtsBycfE2Fh2PjpNrYDWjuiY2Yt5ddQMUC3QzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FZfYmpHz; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85c5eb83a7fso2187085241.2
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583752; x=1739188552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4T/jeZDyuPmkQiIqMcypfqD3cEs/NVatrloEFxJn+oE=;
        b=FZfYmpHz606/DFx24V3jShiJH3OIOppIeD6HaoBJQrY7qBTIdRTsp5tYvgpXBEOh2w
         fZ7uvZ2vNMqnhTNn1Bc8e+o3jFT/HEcY4KehurB6v6wEbrXZk+Osg5wuYHCckdgwtNNB
         3+eE+EOV+wVYnvgyKbjzjms+/ux12PsyMZqgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583752; x=1739188552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T/jeZDyuPmkQiIqMcypfqD3cEs/NVatrloEFxJn+oE=;
        b=VA72PfbsbHdhE91Ls95mfIY5GvIIwT7nmCLhK9KTIbSU+UxuseUr2aTce6hCroaSfm
         ojl8nP6Wb6urf3Pz4bmsvGtVflK7+rj4efcpRcP+6c3UOAwGdTQLLfZRJwYYU1HhZQe0
         opR12A3hw0R15cmjeWwzjJOSYovolO1lT7sw1vgo8RAb85pS6SACCEyMCI5O2MClyyBN
         mz7OnVEcUSmWtXdaI/Jdx9JZabNYM5A6Xo1/c/mXo0unT911Ji5zTQlwNIF9DgoWVp4S
         1JCZVnTSdUgV/7kq4hxeQ5qJBh9Dm7K4szpIUbB/OTushx7xBROfLabavgRopsvWDl1I
         lB/A==
X-Forwarded-Encrypted: i=1; AJvYcCUBsRXItX0yGbLZobVYcUHWmrYLmeR9xkGWOa+BZDyk+8ds9J0LEpt6gOHL2R5hKdMWkpslgfu4PLlTQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxWN3UOTebOFcJy+zXi4CvZnI4c0O7N0jKXjyIjyGow8BNRA9y
	eKQ9FEdrA0f68NHran5pGYWxL4PaJXnSOVx9dhRdWiSqQr09sBFrUBXUfSjqxOGH8o4FgxwsCBC
	P7w==
X-Gm-Gg: ASbGncvWB9K5fQuw9r+zV4j+TggqQxczg7xqY1wnn6ZJMqXUu5/ph1MPEyQGTYMYcUT
	jCB1lEMrrXtY8e/KzTLxNYkNRPLU+IZNz/MHXYPs17oxb/SbkkyoLehOMKYf11Aj8DDtjkaUm2K
	z2YOzAR+3p+lPG60+Nt8vdkUe8dDW4puA+wtjzMR8TQwV5c2UKqJd6QSavmFnbfiUgFyiistmY3
	OOTF7BiJ27UuLMcFOhCg1XQsu8v/mpZeI1SCVEtzgVltuUrWX9cdxJIQp+JfhoJSYceCG5NxjpC
	BifT2p/WZ3ZMUTlOjSAOmwRKJI51RNjKZghQ2RmvIuiweKeqNLZ1WCe3RohZrESm9w==
X-Google-Smtp-Source: AGHT+IHg7iII8wVGrHg4rxybjTvs73uue2/7WP9h+5WXhBhYPZ4vx0SJVudZFvGpnVRiTDgaJp6Png==
X-Received: by 2002:a05:6102:508a:b0:4b6:d833:63b2 with SMTP id ada2fe7eead31-4b9a4f9acabmr14188569137.10.1738583752239;
        Mon, 03 Feb 2025 03:55:52 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:51 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:41 +0000
Subject: [PATCH v17 05/17] media: uvcvideo: Handle uvc menu translation
 inside uvc_set_le_value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-5-5900a9fed613@chromium.org>
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

Be consistent with uvc_get_le_value() and do the menu translation there.

Note that in this case, the refactor does not provide much... but
consistency is a nice feature.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4a55cf78ec52..3108d2fa1ff9 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -939,14 +939,22 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	int offset = mapping->offset;
 	u8 mask;
 
-	/*
-	 * According to the v4l2 spec, writing any value to a button control
-	 * should result in the action belonging to the button control being
-	 * triggered. UVC devices however want to see a 1 written -> override
-	 * value.
-	 */
-	if (mapping->v4l2_type == V4L2_CTRL_TYPE_BUTTON)
+	switch (mapping->v4l2_type) {
+	case V4L2_CTRL_TYPE_MENU:
+		value = uvc_mapping_get_menu_value(mapping, value);
+		break;
+	case V4L2_CTRL_TYPE_BUTTON:
+		/*
+		 * According to the v4l2 spec, writing any value to a button
+		 * control should result in the action belonging to the button
+		 * control being triggered. UVC devices however want to see a 1
+		 * written -> override value.
+		 */
 		value = -1;
+		break;
+	default:
+		break;
+	}
 
 	data += offset / 8;
 	offset &= 7;
@@ -2033,23 +2041,23 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		if (!test_bit(xctrl->value, &mapping->menu_mask))
 			return -EINVAL;
 
-		value = uvc_mapping_get_menu_value(mapping, xctrl->value);
-
 		/*
 		 * Valid menu indices are reported by the GET_RES request for
 		 * UVC controls that support it.
 		 */
 		if (mapping->data_type == UVC_CTRL_DATA_TYPE_BITMASK) {
+			int val = uvc_mapping_get_menu_value(mapping,
+							     xctrl->value);
 			if (!ctrl->cached) {
 				ret = uvc_ctrl_populate_cache(chain, ctrl);
 				if (ret < 0)
 					return ret;
 			}
 
-			if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & value))
+			if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & val))
 				return -EINVAL;
 		}
-
+		value = xctrl->value;
 		break;
 
 	default:

-- 
2.48.1.362.g079036d154-goog


