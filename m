Return-Path: <linux-media+bounces-12898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E2902C40
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43B6928534E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C51515278E;
	Mon, 10 Jun 2024 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mc7Npuc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09154152176
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060998; cv=none; b=H0bXcZLP/B+9nRSNfQH5b4iYtAaP7E0iRs4SHgWoAdmVHFZit9X5Ydgq+GRyhBvPdyka0iA4ZM8UEZmXZpHOxcdOjjCdqtp4g8cN/x1z+2e07gC9peYEbPD7D3TOddHeynbFfrL0UpdXPD7sG5lW0O2iAMgtMiY+R90Ol6Kf61Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060998; c=relaxed/simple;
	bh=5KtcvntcMUZkACMFk5rU2ybB+ZMYW6Y9YCbSQeSS2kI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFX12nXgugvAPqMw3OZztAb1ii1KUjTWaRNtWU35ebtxrL78Cub7QbMJQcibBR6USA9lgn7wo8mHSCYF/bHekq/SATCBFFVkNq5bbvqZACYo0f37dFxVPMTKAznh3SntiMQzjAXM/bVPgUqe1l7SB4Abl0QjCLrCNNrKiK6hHtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mc7Npuc6; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-795dc9e0d15so78243885a.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718060996; x=1718665796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbM4kNTJNPzmGxmhqRn7T4MAUpw44gO0YyJKcWOn6hw=;
        b=Mc7Npuc6hM3Sm4YInJw6f/eWbK+ZllD/PKntLxkuLKT2k307yJQTF5fqSOLSVWr8hR
         BdiCpk5OevTGPDiXrKZfjPOytON3ZrCbC/J6xvBd58HbZhT3Cr0gbYJkvrzuy1ZIBhqZ
         tttuvZiuDttG2r8Sn8/SwPRPUXxarZ2V1u5y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060996; x=1718665796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbM4kNTJNPzmGxmhqRn7T4MAUpw44gO0YyJKcWOn6hw=;
        b=dHuJAe/qAXTW87cbN0LnHaMCf+CYzpjzrddiqJSRDqUj6baq7OnngcEIs+vXdpuKsl
         BjeQrmpww6N1Pd6VI9GieHZp7eR1U/xhi0gaxjIp4mQBev0ictQYgt+NBOPmD5ZdOdSY
         NYbekPxEJ/E3tM9rkqK9AjwssByQDWMQpDprpMmUUuIYzJ/uT1By6YICd4WWxy0oNLLN
         W4NVzuwiJTrWdQRJw5/1cGvbOeoRCtGZ64oXl8Tw5bxAHULQme2lBC3sIvzIFudi/gb7
         TypwMdlzvkTiHNUnN+rUwzxTSwRo34Q9WWQPkkpX/jN0mqiWM8jMVqeg5QEa8Jiwe65w
         Y7nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrPkEDx4ismiEvleuVDZbkGX6G4eG4ZsMZy6Hq4HbLLlQ9IWQJIJP5aZRnlEBbwzMEPXFtQolOeKvtHFT/AyuOASKMKO5ZSlVxTIg=
X-Gm-Message-State: AOJu0YyOQhHT5VmBwv3qseY4wOUezw121yWNAkVMN3gXoZyLC6MPEp8s
	2EPoCtmSGaszZYTaxouf9chlhw/KVdvc4Tg5tDysORTsb1Gdj+aYYZ82/gYa7Q==
X-Google-Smtp-Source: AGHT+IH2h0TqAZAmA0RqqwWg+HjA1/ZYxta7QDd7AU9qer6HLjPF9Oj/kvRaWHlK8xVe5Q9cgLSkww==
X-Received: by 2002:a05:6214:524a:b0:6b0:6b57:4c57 with SMTP id 6a1803df08f44-6b06b574fbbmr88218606d6.1.1718060995938;
        Mon, 10 Jun 2024 16:09:55 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b06519d521sm35256946d6.65.2024.06.10.16.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:09:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Jun 2024 23:09:53 +0000
Subject: [PATCH v2 2/7] media: uvcvideo: Refactor Power Line Frequency
 limit selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-billion-v2-2-38e861475f85@chromium.org>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
In-Reply-To: <20240610-billion-v2-0-38e861475f85@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Move the PLF mapping logic to its own function. This patch does not
introduce any new functionality to the logic, it is just a preparation
patch.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 93 ++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 38 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44ec185a8c8b..d82cfc56dfd5 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -459,6 +459,56 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
 	data[first+1] = min_t(int, abs(value), 0xff);
 }
 
+const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
+	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+	.entity		= UVC_GUID_UVC_PROCESSING,
+	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+	.size		= 2,
+	.offset		= 0,
+	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
+				  V4L2_CID_POWER_LINE_FREQUENCY_50HZ),
+};
+
+const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
+	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+	.entity		= UVC_GUID_UVC_PROCESSING,
+	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+	.size		= 2,
+	.offset		= 0,
+	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
+				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
+};
+
+static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
+	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+	.entity		= UVC_GUID_UVC_PROCESSING,
+	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+	.size		= 2,
+	.offset		= 0,
+	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_AUTO,
+				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
+};
+
+static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
+	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping);
+
+static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
+	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
+{
+	if (chain->dev->uvc_version < 0x150)
+		return __uvc_ctrl_add_mapping(chain, ctrl,
+					      &uvc_ctrl_power_line_mapping_uvc11);
+
+	return __uvc_ctrl_add_mapping(chain, ctrl,
+				      &uvc_ctrl_power_line_mapping_uvc15);
+}
+
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	{
 		.id		= V4L2_CID_BRIGHTNESS,
@@ -748,51 +798,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
-};
-
-const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
-	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-	.entity		= UVC_GUID_UVC_PROCESSING,
-	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
-	.offset		= 0,
-	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
-	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
-	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
-				  V4L2_CID_POWER_LINE_FREQUENCY_50HZ),
-};
-
-const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
-	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-	.entity		= UVC_GUID_UVC_PROCESSING,
-	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
-	.offset		= 0,
-	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
-	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
-	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
-				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
+	{
+		.entity		= UVC_GUID_UVC_PROCESSING,
+		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+		.add_mapping	= uvc_ctrl_add_plf_mapping,
+	},
 };
 
 static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc11[] = {
-	&uvc_ctrl_power_line_mapping_uvc11,
 	NULL, /* Sentinel */
 };
 
-static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
-	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-	.entity		= UVC_GUID_UVC_PROCESSING,
-	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
-	.offset		= 0,
-	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
-	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
-	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_AUTO,
-				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
-};
-
 static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc15[] = {
-	&uvc_ctrl_power_line_mapping_uvc15,
 	NULL, /* Sentinel */
 };
 

-- 
2.45.2.505.gda0bf45e8d-goog


