Return-Path: <linux-media+bounces-38246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E5B0F02D
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 396AF7B39B5
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BF6253F39;
	Wed, 23 Jul 2025 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTrE50FO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E1C2E1722;
	Wed, 23 Jul 2025 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267489; cv=none; b=PI/Z5mDDF6MdNkPXvcdAkcJlxzblkN06FEb44+Gk+G4vIi/Er13JQY3wN/AC3XTOYQIwZqNPy7c43YzlGeAi7KLL7Nu7AzKG9h1G9ZfTkiRIazf/kXsgVTB0/VIzakzHnGsHOaC/FlRZlh2HwzjWJYCrq0/MtDBHVltW6Y7YZFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267489; c=relaxed/simple;
	bh=gIBhhJv1LlK5dtyRQ/Wyt/2ZBa1gKPL/9WChQ9tr3bw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G9f/k2cPa9NfrC/3dWvZovz/7gg2r7hmBdsDe3KDp6VzYUrB7WUDvF1c5OPFUc7klm3UByFlqpK7IysJ5cYJPTXOL27cCjk+jJHBjAlVWhhOtxTyxCs74staPUIFAXNU9DoQYNmjbj3RldzLr33HtcoRxq1TFlsnWk3Ewq9sOxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTrE50FO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso67242715e9.3;
        Wed, 23 Jul 2025 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753267486; x=1753872286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LG8fPMKXO+0StW3pl1eTDwEsR+5paGvpJd/mMXE2SAU=;
        b=JTrE50FOjp7+lQvowphuYUinAKFP2uB9QL2ubsss+En79YymsaHTk2wDA5DBn1lQtJ
         3lFPWHUv518NkO3534GjVOxYX9P3KV5jKa4pF2yxgkvz8+hT3RabfLlKIlGIvrz+BUcf
         6XCR2siaNdZWSAhg9TmTWM/BS6l8GmmR+WIuhKIR3asPVqfjholgvQhisj15Xcut1Uur
         WQ/rrR0/wW3u800JJPKPCEYaorbVIvINsIodFdYOmvLOc1I6yWHqkVCD9rJaFuZO5GNL
         kz4kx9eYRmqwclPeFVqp8PgsKLAFp7FitVgQ4/j5gaUZ/ZdEENFVDXmGCC+0cwgn2orZ
         YXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267486; x=1753872286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LG8fPMKXO+0StW3pl1eTDwEsR+5paGvpJd/mMXE2SAU=;
        b=N0n2eEGu/n5leHjihqsknntbb7mQz8vHzU5kBJfTXHKnoqE7TeVY704gO4lb79rk/p
         2IJqioDSyKxfsNVDh4DC7uPh0IFcXnzp657bH2/JBKzVcRkTJ9RcFgxKuHabTcd555Qw
         ndQy4P+UjitL3skyR3UfGkDhXsofNt7rQZ4vOqtP+FJd1wusP9XDijPD2OEakX6WlMJc
         2wEWaboTt2RosDS//K4ugguk75kEY8oeXW9qsbIUt+c4554pnDg5+XWuyW5MmOkGxB/O
         FqlLPON53V2Ig35+KauLZFbL6NgTCUBCC9CqWB/E/q6FySXMrMkVSA5kqI8z0E6/yZi9
         u9rw==
X-Forwarded-Encrypted: i=1; AJvYcCWd3amUxGKhgLw84NZYHZ6H+arj9KoYnB94DuvXnjr3HIg53A31rSV8bXblt1it9tPCXBwYKsiKSg5Ompo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfJTFDfRSDgCGqA2pV3a1+B7wd5N7AwXe1P2O5fH5dpPxttT41
	eiYZfVvDnAWeAa1b9OgbQUFtY2TaH5zL4i7GOsVyuAZ21Uvl2CA1AXg2
X-Gm-Gg: ASbGncvwGtTPvDfPbwgnEnqO/KjUjSS1Hl+tvCuKD0zEKBV+SPXe1psGORS2XTK9ZBH
	fYND22V5QW1B6qUYJkll/LLQ/2a09KLqkg8Uub/6wHedC46vM2p34ylEUcU3/SuCUiSGCSWtPef
	rP4YWlx+5/H7PP/DjYYlHkZ8MNQEbJ76/ppnPwUdSmsj+zqWa1iYHVJk3dM1oJw3YSMQ21xthIq
	UopUxHnX1N5sFgqSxFqNwg8mpRI+wsRUD/750JYFYJ1hsInY61W6PLfspdzcte02CxyAa1Fo7IT
	KRvuBcBJ38Ya7KpolfRD3FVsguWm2/HTfwsE10dkJ8JJAL3iyHTzzOHxCI6bz5iUWMDC4ZYLhIp
	QAD2fVURasjdrfVlAokNI88YVu1cyVc4f58/2q/VmoO13i6nPgGy4cWRj8oFjJUENklpefQ==
X-Google-Smtp-Source: AGHT+IE9dT3EXtnqUFET6mt3+mEFc/QamplFlMRWyOfAxOmoj82F9b7K+Jatv2Q+B2FltpnCUjZAQg==
X-Received: by 2002:a05:600c:8210:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-45868d6614amr19175965e9.25.1753267485673;
        Wed, 23 Jul 2025 03:44:45 -0700 (PDT)
Received: from thinkpad-ThinkPad-E15-Gen-2.router ([154.105.198.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61d7fe48fsm14777438f8f.14.2025.07.23.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:44:45 -0700 (PDT)
From: Imene Jaziri <imenjazirii18@gmail.com>
X-Google-Original-From: Imene Jaziri <imenjaziri@outlook.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Imene Jaziri <imenjaziri@outlook.com>
Subject: [PATCH] Add changes to uvcvideo driver
Date: Wed, 23 Jul 2025 11:44:17 +0100
Message-Id: <20250723104417.22654-1-imenjaziri@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a pr_info() in the uvc_probe function to trace when the
uvcvideo driver is loaded. This is for learning purposes.

Signed-off-by: Imene Jaziri <imenjaziri@outlook.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68..4e5d1d636640 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2170,7 +2170,6 @@ static int uvc_probe(struct usb_interface *intf,
 		(const struct uvc_device_info *)id->driver_info;
 	int function;
 	int ret;
-
 	/* Allocate memory for the device and initialize it. */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
@@ -2188,7 +2187,7 @@ static int uvc_probe(struct usb_interface *intf,
 	dev->info = info ? info : &uvc_quirk_none;
 	dev->quirks = uvc_quirks_param == -1
 		    ? dev->info->quirks : uvc_quirks_param;
-
+	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
 	if (id->idVendor && id->idProduct)
 		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",
 			udev->devpath, id->idVendor, id->idProduct);
-- 
2.34.1


