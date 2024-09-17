Return-Path: <linux-media+bounces-18352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DE097B56B
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 23:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35201F21B0B
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 21:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F9C1922CC;
	Tue, 17 Sep 2024 21:57:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18572186E51
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726610260; cv=none; b=pebM+BAlEKBBDYU8h4JFM6LfmPPd5Hb92Mlg8WDI/R5TciS4McwOTPifGA8619xHrj8B7jpEiPJN24EBDCK+0zEOTjrpJYZ7obP1duD5x2/8f9dPKQsOPR8FahZAeH13jPXrMYkUEL1X47TitPVVFbzGHfw04a3qKYpUjkcQYio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726610260; c=relaxed/simple;
	bh=uAGMMKvnD/u2ET/5hRcLY90UL9v27LgQGKXSRmzmugk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkd875IcM678ewEzoPAgvudsXfDRUEmwHYEee2WAuYv9R7+bY4WZAUY7RnNk59eKc68Y49c0jGyP7AzRePcwA6CfPWfiGgDovDf0KQS8PzN+0r1t7j1MDiWP8k6c1pwNW+JnuWbpVxWScmqMpi8D88KKurchG6/S4u9H16GqvgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so67004501fa.3
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 14:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726610256; x=1727215056;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swSntFnySqm2bESqQpVWbl+fcKBAxVc4S+mTfKeJoP0=;
        b=QEqb6JKs5KkwGmqSjFkbIsNT010svmAwcSFW8/+j/cVLr8j1unLbw9HSqjx28Odj32
         /CggYqP5J1EC34PS3d3KhKziLih3wYCIAUt5r+8rMdsJw1KaNIS+b44e/Jrn3mwBQKYI
         GzQ0C5bbFnftKwm8f0Yb6D0WVj3Dqji4U9t1Se+8RVSUqqh02HLCIjsnds2PfRAc1/gy
         XRJPoMeaxHI0awHL+0I1ce13IxLJQbTdztBe4YSTuXKBYAE7I5Cjmf3e4pV3wkFd8KKV
         doat4G4aNN+sy7k6/WBVYbz/nmPGzy9gbObI4rSKKf9RMa4dq/gwRZNWPbrEVSMYM7mz
         rcmQ==
X-Gm-Message-State: AOJu0Yy0OS5qEjK8h6WgdX1ZvdKcEgRSyxiRKSfl/M/Yf3T6Dwcr7XWW
	wM2WCjTfTYw3piAF3LDeLLcMVuhyUvguy/vy+LgAShSLazyJm0y0UKfqzA==
X-Google-Smtp-Source: AGHT+IFVE1d+7v4DRgt/BuiTIPmdg3EoK3xaIWHqjLqse6yqgjDpxta41sxibyYc7l/ssD6cHBFRgw==
X-Received: by 2002:a2e:611:0:b0:2f7:8b28:dcd5 with SMTP id 38308e7fff4ca-2f78b28dd66mr77772351fa.36.1726610255229;
        Tue, 17 Sep 2024 14:57:35 -0700 (PDT)
Received: from hilfy.lan ([2a02:169:1b5::22c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800308sm10612074f8f.87.2024.09.17.14.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 14:57:34 -0700 (PDT)
From: David Given <dg@cowlark.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	David Given <dg@cowlark.com>
Subject: [PATCH v2 1/2] media: add support for the D3DFMT_R5G6B5 pixmap type
Date: Tue, 17 Sep 2024 23:57:27 +0200
Message-ID: <20240917215728.50342-1-dg@cowlark.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Signed-off-by: David Given <dg@cowlark.com>
Content-Transfer-Encoding: 8bit

This media format is used by the NXP Semiconductors 1fc9:009b chipset,
used by the Kaiweets KTI-W02 infrared camera.

---
 drivers/media/common/uvc.c | 4 ++++
 include/linux/usb/uvc.h    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index c54c2268f..c12d58932 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_RGBP,
 		.fcc		= V4L2_PIX_FMT_RGB565,
 	},
+	{
+		.guid		= UVC_GUID_FORMAT_D3DFMT_R5G6B5,
+		.fcc		= V4L2_PIX_FMT_RGB565,
+	},
 	{
 		.guid		= UVC_GUID_FORMAT_BGR3,
 		.fcc		= V4L2_PIX_FMT_BGR24,
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 88d96095b..01c3b2f45 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -140,6 +140,9 @@
 #define UVC_GUID_FORMAT_D3DFMT_L8 \
 	{0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
+	{0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
+	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
 #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
 	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-- 
2.45.2


