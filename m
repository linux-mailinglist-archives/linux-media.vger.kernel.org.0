Return-Path: <linux-media+bounces-40191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EFDB2B236
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 22:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 170355677DB
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 20:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E96276054;
	Mon, 18 Aug 2025 20:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XlJhJ9a8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0543245020
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755548145; cv=none; b=jk8KdfjEUDI33VibxEiCYYfRunvq7xL0BhE/Hph3tUau3TNOdA7usT2zgXONQYBUc/yRO2zZuT5pLaLJbiPhy+pUnBhWWi2FzSlZ02eIHxvVSBxScGdeTvglFqz9G/s0ks5q8UzkLtSSS3bzIiqvWqD+S7TmyJyj58Go9OHZiWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755548145; c=relaxed/simple;
	bh=tFoInIAvGowRuxA5IgYJwn3ZqXOXAj0ZwAR5l80sflk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f9jS+P6x/kB2DDgFUgf4xp70hPP52ozPwDnC5gzf3+Sr9qrLKfEAznePlW7TYi7TrHtmMhW1FJfy8OwZLhSajylxOS482+e/AdEsuPGRDgKd5/k0tSJVWdvgfqSVuxGdacWIzfBxBwg6lM66Gu/7eUnxorqVI3vPA02M1Fyp9c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XlJhJ9a8; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce527ffbfso4053013e87.3
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 13:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755548142; x=1756152942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEpJBKB+qWy+9B0fWWzvqhUsl5wcxZoDtzLEu16z0Dw=;
        b=XlJhJ9a8kaQ/JBClQW53Y8r7tWR3vj7pYmb7BvZXSxo3nXqd7YEM2I2/Fx931xpuj0
         L8lDzMvHjyzKAkrGJW1xLrtcEO5Va1kQ0oe30ZXoCnUknlVepwnABww+nao+Y06/J7/O
         w349MXU9ofixjUHFjbH6l9kJ1G6/lJuvpcMVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548142; x=1756152942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEpJBKB+qWy+9B0fWWzvqhUsl5wcxZoDtzLEu16z0Dw=;
        b=QPFIyqCiDS6ZbwilkiPBl/BUtLwYsHFcXPZjt3NaDpb3gofB5eN0//IxPlJkk9NU/h
         Xvpf9GjqkqMxjt77cNHZhTY7uXYAROPe9tO/XtIgWOS5ztCGOv67ZuJcfGwU9P03F0Fw
         1jZhRY3/YXV544iVNL6Oawd5tWdD3Pj0KEh50uVMmFyHjJsHyzzfDkSVEugQF5sfIymz
         bar9tDHcn1kAvpZyCBWhwGrk78c73Zo7fPJrsOf8nep3tkic6MaUmfTIA1eSwelBgqnK
         j7IX0qBwD6jobhqBCw/GwcLfcPmKwgDNecrtLylsVbpvd+bLJq96abk1iLoNIB/ucoHe
         yh/w==
X-Gm-Message-State: AOJu0YyHsmSU+UFcRJ9CPKCQjOED61aEA/tsCRSNpW1FzzR1OHX44Ap1
	3PZTxuX01UHbllp/er92T0YROJWpPsHw9k5R0RmXHTqp3ezXBnzqV3F85eu1uUKglQ==
X-Gm-Gg: ASbGncvhiwGGj4PnmWfY20RSnW+vSdJoOpEtrrF4jmD92RBAWZCYFTLP0Oy9fvC5iWf
	hV82ns00q+GqPzgwSohx4uH4/QuBvV1i3Cgfrhs9+LeIgNi87H3DzEeWTbUx9ijR0t/pFljuvxi
	Rm1YIYhbBdpgt+iusI95lJbMc+n86VFUNii1Bn69vXEi/9smEpqGPSQUX8CBY0rJBKsSWqar8g5
	t5lyaP2EbcfoyigqCzhReHXlKfTjW/5cRHgqMNflfzswavYZ+4VRfEt5ifNygAUlUKN6SRtj6Fb
	KnBvCnd9qR9aB9fE6gzCilde7yf9W56o+T4jcQYgv3rSzD49PK6BnhkFdDqVRsH68FTLFXfeXsJ
	Huxlo1wWui4rwIo/4mn8Cu0Mbu+CnnB0cy9mshQT8yWuAmFHNWehm+S4e8gD6ap/4OS5t9Arl7h
	g=
X-Google-Smtp-Source: AGHT+IE0mjNwJY/EwDnV+q6jH14CZm8UZca+WUBq2p3wQXYyERXzxqjD4/n+WbcQCdVvPQYFzgQcjA==
X-Received: by 2002:a05:6512:10ca:b0:55b:886e:d50a with SMTP id 2adb3069b0e04-55e007a774emr46019e87.13.1755548141670;
        Mon, 18 Aug 2025 13:15:41 -0700 (PDT)
Received: from ribalda.c.googlers.com (237.65.88.34.bc.googleusercontent.com. [34.88.65.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3476sm1789268e87.107.2025.08.18.13.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:15:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Aug 2025 20:15:39 +0000
Subject: [PATCH 4/4] media: uvcvideo: Support UVC_CROSXU_CONTROL_IQ_PROFILE
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-uvc-iq-switch-v1-4-f7ea5e740ddd@chromium.org>
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
In-Reply-To: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The ChromeOS XU provides a control to change the IQ profile for a camera.
It can be switched from VIVID (a.k.a. standard) to NONE (a.k.a. natural).

Wire it up to the standard v4l2 control.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h          |  5 +++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index ff975f96e1325532e2299047c07de5d1b9cf09db..8766a441ad1d8554c0daaed3f87758321684246b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -376,6 +376,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_GET_DEF
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_CHROMEOS_XU,
+		.selector	= UVC_CROSXU_CONTROL_IQ_PROFILE,
+		.index		= 3,
+		.size		= 1,
+		.flags		= UVC_CTRL_FLAG_SET_CUR
+				| UVC_CTRL_FLAG_GET_RANGE
+				| UVC_CTRL_FLAG_RESTORE,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -384,6 +393,17 @@ static const u32 uvc_control_classes[] = {
 };
 
 static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
+static const int cros_colorfx_mapping[] = { 1, // V4L2_COLORFX_NONE
+					    -1, // V4L2_COLORFX_BW
+					    -1, // V4L2_COLORFX_SEPIA
+					    -1, // V4L2_COLORFX_NEGATIVE
+					    -1, // V4L2_COLORFX_EMBOSS
+					    -1, // V4L2_COLORFX_SKETCH
+					    -1, // V4L2_COLORFX_SKY_BLUE
+					    -1, // V4L2_COLORFX_GRASS_GREEN
+					    -1, // V4L2_COLORFX_SKIN_WHITEN
+					    0}; // V4L2_COLORFX_VIVID};
+
 
 static bool uvc_ctrl_mapping_is_compound(struct uvc_control_mapping *mapping)
 {
@@ -975,6 +995,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
 		.name		= "Region of Interest Auto Ctrls",
 	},
+	{
+		.id		= V4L2_CID_COLORFX,
+		.entity		= UVC_GUID_CHROMEOS_XU,
+		.selector	= UVC_CROSXU_CONTROL_IQ_PROFILE,
+		.size		= 8,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+		.menu_mapping	= cros_colorfx_mapping,
+		.menu_mask	= BIT(V4L2_COLORFX_VIVID) |
+				  BIT(V4L2_COLORFX_NONE),
+	},
 };
 
 /* ------------------------------------------------------------------------
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 12a57e1d34674a3a264ed7f88bed43926661fcd4..22e0dab0809e296e089940620ae0e8838e109701 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -29,6 +29,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_CHROMEOS_XU \
+	{0x24, 0xe9, 0xd7, 0x74, 0xc9, 0x49, 0x45, 0x4a, \
+	 0x98, 0xa3, 0xc8, 0x07, 0x7e, 0x05, 0x1c, 0xa3}
 #define UVC_GUID_MSXU_1_5 \
 	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
 	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
@@ -50,6 +53,8 @@
 #define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG	0x0f
 #define UVC_MSXU_CONTROL_FIELDOFVIEW2		0x10
 
+#define UVC_CROSXU_CONTROL_IQ_PROFILE		0x04
+
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

-- 
2.51.0.rc1.167.g924127e9c0-goog


