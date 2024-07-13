Return-Path: <linux-media+bounces-14985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B273F930560
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 13:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CD772819A8
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 11:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC328287F;
	Sat, 13 Jul 2024 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqYaSimS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B01130486;
	Sat, 13 Jul 2024 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720868951; cv=none; b=ItRlNbMWJJE+UuYdQ27in/R7LsSBz3pOlU5hlfoiJ06vwNX8OocU6wZ3qiyZ9OTwNcjshzWfZonS1bVEzQ2iF4C59Duj/+bQ5OEZeqRLhgOtb22IQITfX3BYKXci1D7GxMbvtNSULrGtlMjPnWdq/Vep6co5wlxSG5lW2GMEWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720868951; c=relaxed/simple;
	bh=JtuPboEJSp8eAlkZ3GBvTBrDrdQKWdXvJetgHpGlolU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=La7SaQsRN/S/R6u88+1Lnq6SjHbM65Uzzl4/MJsvWgzXQ5VmuUIzKBt3RV+S+d0+8hWGpLxglpHTjbj+/cpLiaEF6ZK79G88BN7X2oYzxHP6sgKRsWVPZOrFUTj06Q0cT7m9sFeoXCw8hwfETD0q+gHAILImsXs0/ibeB5C4klE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqYaSimS; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70af81e8439so2515529b3a.0;
        Sat, 13 Jul 2024 04:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720868950; x=1721473750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHpfBVGElYoS1Dl7oK+sXhQ2e4e+IynO1g7uoMNSJmM=;
        b=KqYaSimSb347kyo+1/+3R/TJpY0GWtE0TKsxD0fAl/kR/7uoR4MfqUWux3Dd2oZAtJ
         B3QJbVmMHXoj2txa98HBRkDJtTbc6f1h0TKlkuVnmomY7iVni0tavOS8/ieXKiBj8Q4i
         rZ2qdNAjfpOzb3uYXCp96ujyViTr0n/XCO/Q1RPj2+x39QxvtvPu2pmVSWqWErfDgKZv
         3xiy2dUbshQHAI8dhGwKR73RAj+ApjKr9AOFucenjV9N76J7Ckn791LYMu/gG8XdK3u1
         iyR9FmtTVGCGeYdxARhxOavAV5rwrEGgW87udRCzvkigPUc4+CZchFNuh6feYBAIsvkM
         qTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720868950; x=1721473750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHpfBVGElYoS1Dl7oK+sXhQ2e4e+IynO1g7uoMNSJmM=;
        b=xGJQVgBzRwUkYO40ty1iKsWLt8lFEbdN7jzSS+mxqPmh0n18wZEilk8B+si5sEPDuV
         BtlekOfYeWvV3N5NlzFNEL4ZUkScbbV5o35SYLXLd9y7titqaRYoPFAwHP23yZpP+5jk
         XPPA5HrKOUW5ZH0OxxJbs4e4sbLZBdNHWNq0AqCIjVg2KG3+s70SZi+MauxDps0mNfYQ
         +GxCoxl8G9xM31K94iW0Ekmzi+06knduALjAjnnWdUpZbK/H6cYbePcxL6NBiFptKNsG
         1Q2+jXrZyXun0ej4v2PPOrei9s6ge8iFhX3hJMXw6sldoZRD8cXxjbuWClJEuf4pswH7
         0zdg==
X-Forwarded-Encrypted: i=1; AJvYcCXOWTlb+DwE24ie3PwP2bxYZdmDO07lZOre/rdLIthUYssDby7+kjrxAX/Yx754n7NWPD+tujpLZFvChQdx7VtfhTSGZ1lpiPjT8ZlE
X-Gm-Message-State: AOJu0Yz/JXulpN+29lVlQE+jCK27ctggLCz6eqSBBDUzMdrxX1aUjJ6X
	GcCL+x1RkVdihnPOXfjyt+QY6nixfobiTP17BHXG8Yzlm/+C+Pm6
X-Google-Smtp-Source: AGHT+IGKMdpK3yFlSYDmN4PLipKlMZkexcmwd6X5fMk0JFXvPcE8BigIdm5nkmkymwk1znXoKWon8A==
X-Received: by 2002:a05:6a00:1955:b0:70a:f576:beeb with SMTP id d2e1a72fcca58-70b43561b8amr15828000b3a.15.1720868949661;
        Sat, 13 Jul 2024 04:09:09 -0700 (PDT)
Received: from lenovo.. ([2405:201:e000:8836:366b:5a81:7de6:ee25])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-70b7ec7d06bsm1014862b3a.114.2024.07.13.04.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 04:09:09 -0700 (PDT)
From: aditya-chari25 <adi25charis@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aditya-chari25 <adi25charis@gmail.com>
Subject: [PATCH] MEDIA: USB: UVC: Corrected Errors in Macro Definitions
Date: Sat, 13 Jul 2024 16:38:58 +0530
Message-Id: <20240713110858.307085-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

macro definitions had errors since they weren't enclosed in parenthesis
hence I rectified those errors

Signed-off-by: aditya-chari25 <adi25charis@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 8fe24c98087e..6e14b9dc3886 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2424,9 +2424,9 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
 	.quirks = UVC_QUIRK_FORCE_Y8,
 };
 
-#define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
-#define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
-	{.meta_format = m}
+#define UVC_INFO_QUIRK(q) {(kernel_ulong_t)&(struct uvc_device_info){.quirks = q}}
+#define UVC_INFO_META(m) {(kernel_ulong_t)&(struct uvc_device_info) \
+	{.meta_format = m}}
 
 /*
  * The Logitech cameras listed below have their interface class set to
-- 
2.34.1


