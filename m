Return-Path: <linux-media+bounces-38724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14685B18442
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 16:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92CD41C82252
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 14:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE45126F467;
	Fri,  1 Aug 2025 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLN8Chdv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3C1B95B;
	Fri,  1 Aug 2025 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754060043; cv=none; b=qRdDnatk6IZCtM10bQt60fLTfxAyBOdAs0XRFMttvItaLxDYTs2gEwUYbeI/qYpkQgtydEbkaPoqkJyrXmOwUE6XQEauE7m43arAWMsPtP+rNKfudA+pSjaiF7MwoV224Bs8r/khQNkn6dScqAU0U1B0YlV6wdTfoAkIsYdIKD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754060043; c=relaxed/simple;
	bh=3pnI+XzHe5c4Mb9dzxDPhHI/pswIAnPX/+TOA5HoXyE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oIqWt2kYAmDKTWJ+2eg29LiZ60TvB1wHWYjEKRs8XMVsUQPT+oS4AGuzqlKJ75E09wQFC2AKw/bf1DAs9QlivPISeP6k5f+AU5Ah/ZiOY3k1kE5itovdwrZ5zuQa38xYoH7d8/N8KhXd1Zb8x6Dj6wwap5+4GzEovv7fcMoLM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLN8Chdv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so392797466b.3;
        Fri, 01 Aug 2025 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754060040; x=1754664840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZK6SPA99DfCc5upTotSgUW0Xq4Rl1KmxCV5h5tCSPk=;
        b=mLN8Chdvmv9hhuH5hf+pxY9E2znEWwqgGVpq40Uc7b8eCsiPDuxnvWRxdTtu9wyF50
         W+OkYmTeSWMskV+Xylmpb+zOiS1PDcKfynCCykvQIHKiTNSfgptMnWepJqGxUz+cAZnD
         gnTXn/104pxb3FAEKiSTr9dBP/JZhswY037eXLWmly5Z0P/ftRTIU0T+WidD4N6OeXSG
         fw5Bs/RLWcwzYIoTL2uaAWmayiFmedjcYvbMvDwg3qZPhjrbgcDRmaRFV74mEUvIH7ed
         5FUeRTVqL+BcDluP9nYYs6iD/Gs5tdxqZfw2iXIrCHD/3qTkN0ZqrHtnordLsYv8GV5b
         Td6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754060040; x=1754664840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZK6SPA99DfCc5upTotSgUW0Xq4Rl1KmxCV5h5tCSPk=;
        b=PVISjRrUUCpG4qntdh1+lCCF7QSFoXNJzc9sJhdPwkxSrpsF2E7iBEn8S0BJ+BkFz6
         UAHVPco0yYM1Jlosfl9VckPmPzH5yBxhtyeQbJPgKe6+q1Pm7A1KEuY3ON5h6A8E2qIQ
         EaUYVXEZUTzMG8x6zeDXyPQfiWYi6dyEXbO9U5SF4nqntRMFIqoL+9w++7AC4gNiKeNh
         +NOa/MgmYJpT8iWpbObDgRdaqoxq8Fyz7CyRnYqiUL06S1l9lZIJGtySoEkIEvlZ4z8Q
         itknDRajrofu/goKZ04r45SINPwNnf3/cGzZ6d23Yy4QsYXdh+wba4VrMH1gILru+Gnv
         1BXg==
X-Forwarded-Encrypted: i=1; AJvYcCXV1zVkvTQnzfXdYUHOudHxDDFD8V2xinmmg/mdgOJxStBF5isrrokuGwFzKISl2VozUjejxV/Vbnl8ZyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzImcRsx5stYfppBTleqJ78gmh7LwiLKCcc6rGxqY5JBDlm01+J
	fvYPn1p3MbU/VGBP84ev941eXsnz/ZCjxBu5A5pGNKcHEpoJXWvjbiT8rMHlHDwk39A=
X-Gm-Gg: ASbGncsjB8mkHtdRieOj8Kt6euOP94Yq4xitqhzW86syikUnCH+RW0LD9K3ZGXv06JH
	ZybF7iiXEyVLog0IayTM2euMO2aBHCOz0PiAYqD/5VI7TwZ6aIYHTX9gy+FmrKyJ7PtuHL3ynNo
	4GxzfrtUfBtC6gVfWHld8+v+8nNy+NsZEgRuNEsMdwGZc+YFWs71XD2/qm2PTDRKN0k2yrd5ovM
	Jm/MDR0nANwQ/y+aLphOSgYYScr0d0ZZoUfRxOXA3nEZ2CRPrYalyhcnt1XRLwz4JYohtfaglcR
	fHK3f/FNjmwOt/JWBA5l3F/4MWLI0adC9pD1vu+tmnIvZV3BYDKFfqk8sIkHOSqM4hLRVOLsSGT
	jVKpoN32p4xXhBu00Zb+yjyKlogWS10nU976kSUzUtKHticAovEU=
X-Google-Smtp-Source: AGHT+IEuHyajJxX+iWN5zmvaIA6h7SdU9rmH4OQX+GgwNeZymfvYK8ni2n631LAWkXTw6WDUoq54xQ==
X-Received: by 2002:a17:907:2d08:b0:ae3:bb0a:1cc6 with SMTP id a640c23a62f3a-af9400097b2mr11429966b.16.1754060039473;
        Fri, 01 Aug 2025 07:53:59 -0700 (PDT)
Received: from thinkpad-ThinkPad-E15-Gen-2.. ([41.225.60.207])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91b36e91dsm282659366b.69.2025.08.01.07.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 07:53:59 -0700 (PDT)
From: Imene Jaziri <imenjazirii18@gmail.com>
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	Imene Jaziri <imenjazirii18@gmail.com>
Subject: [PATCH] media: uvcvideo: Log driver load in uvc_probe function
Date: Fri,  1 Aug 2025 15:53:26 +0100
Message-Id: <20250801145326.28560-1-imenjazirii18@gmail.com>
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

Signed-off-by: Imene Jaziri <imenjazirii18@gmail.com>
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


