Return-Path: <linux-media+bounces-18389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A57FC97BFFA
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 20:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7DBC1C20C7D
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 18:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFB71C9EB4;
	Wed, 18 Sep 2024 18:05:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781D1487F1
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726682752; cv=none; b=rvA9hZL29vTp5Y7qt425coiu44WAGxkztYaix3jCsBUI2Ac8qHc3mjg7Rd22aRK7dYEuNE8eJeKa9M0oIjGSD70x4YagHgDn/PV8D0W8rV1B5zzypFQ6Y7XP6DYAe0m6+2KfrVGoASiU9ilArouKjgoS7GfufUoMRJfeHjON2VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726682752; c=relaxed/simple;
	bh=IVSVjIk+Z+47fETdHBZZfrAcd0ZneYyOjoKjseEavnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=omkiqo4+hxqO/EG27RkozSmHtpDDD2Gy2iYv5L8PHJLyDu8EShRslr97nBoOja/tr7NVPuCzddSQ0EMXU1BRRh5r58h/L6rY9Bg6MYlYGHm4d6Tl/7bkHMoWkAmFIptBwaVzDCNcdTjeCkQHkY9RKn3pU1s3s40Ot7MQrXuwkGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so77058795e9.0
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 11:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726682746; x=1727287546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/Wz3AemKVF0i1y1QM/xbZBBziggoDZyVnOGR0eUEFk=;
        b=voAxa70otTkV6VqrO9U5YwSRHOminzzZVQkjDMqQVFF8Y+ECn9zpI+oVyqQITBswPR
         Qbz+/ATEMzYQejr+KQ40dGWDvajhiGHYkGmkHVhcXWI4F+4CPVsKh071a84jd43fjdFk
         0IQ+KTThs1WEiVKdfdz+amYe6Xtx2qrsu4mPaLjZM7d/z/fJx1OUAp4Cu7jdemBycdMi
         A9WKfEPFbIMAIurC9g0aOAuM37YtT9d/SZy3IXQNGYEz67uN8jBharvHSNXajj36GTrK
         dpRY6qqeWF+YIcOtGjXPU4dY3jaNF209Ij0cHmoVxO0XVpLCn4MyKsLrWSCFZYkpPDxx
         8ztg==
X-Gm-Message-State: AOJu0Yz5+OxTzR9Sjxogwmvzapsj3pz8jO+ZNtqaVCtLVGhyTt9Vr5/W
	1FcwlK8wPycOqOV00N2yHE+a6cCBe9F4/I8ObXzQyHTj4K6jw/5eIM2/uw==
X-Google-Smtp-Source: AGHT+IGyC/XSICrhf4QWIrdb4myPuiuLEjwimVtymWxb1Fs0E62syE1am9GpJfhIVXrDRsdE9EtNJQ==
X-Received: by 2002:adf:fac9:0:b0:376:f482:8fdf with SMTP id ffacd0b85a97d-378d61d4b43mr14956870f8f.4.1726682746034;
        Wed, 18 Sep 2024 11:05:46 -0700 (PDT)
Received: from hilfy.lan ([2a02:169:1b5::22c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7804476sm13001024f8f.90.2024.09.18.11.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 11:05:45 -0700 (PDT)
From: David Given <dg@cowlark.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	David Given <dg@cowlark.com>
Subject: [PATCH v3 1/2] media: add support for the D3DFMT_R5G6B5 pixmap type
Date: Wed, 18 Sep 2024 20:05:39 +0200
Message-ID: <20240918180540.10830-1-dg@cowlark.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This media format is used by the NXP Semiconductors 1fc9:009b chipset,
used by the Kaiweets KTI-W02 infrared camera.

Signed-off-by: David Given <dg@cowlark.com>

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


