Return-Path: <linux-media+bounces-27416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5B1A4CB9A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 20:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E734016A812
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 19:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DCA22D7AF;
	Mon,  3 Mar 2025 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IgLiRlUq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E429231CB1
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741028838; cv=none; b=uDISwgQ+bsz/2huwafgixRrGEdvI76wjAaUjvEdO+N4QeClROVIQGkpQR1Sd7B8896EESenxcwYUpipYMLIYsqQ8BW+bC1O01TmHeG/fXogHzOPXvjVMTzMDSu2qxMCc6qpxCj2fNxSIQ612UESh/hnTBtPbX6ZQoJ5CQNz1uRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741028838; c=relaxed/simple;
	bh=727RL/vy1smD0AJDbCjmRvd1a1o2D/6943w37oDoA8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHS7Lmi/HYMl7Vts/nLEpqVS15JQzSHfZ/1sKqH+0/rh5vJD5ZugI/PgMAYl50Bu59yG8TzFeLefjLJcET64esZsasxWmItQw+t6iTevvpLmoVNIpdzKO4ZE99c/ADMHORlpOCWiCKSoi02/Nyo90OS35arEMDKxP3kcq7ZyJMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IgLiRlUq; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-474bc1aaf5fso63870591cf.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741028835; x=1741633635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZwQUn/XlYg8B1gU2t/0mo4nCO2lMeP4D6FyqvnakfU=;
        b=IgLiRlUqFdj+Xe6BrIOuDEPp1ifXdeLCIO4SE7jmB+5CB6c4XjtiNYG/B5XkDzlfIz
         tt37qcdaMEqPh6s4XyfYkLthB20ATIKzRVy2UOI0gpPRUpNY6PlvJRSMOQf+YqS3zAeo
         g6ZFmom0+dyhSFphyROYz5ieiUzOjK+7QwGcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028835; x=1741633635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZwQUn/XlYg8B1gU2t/0mo4nCO2lMeP4D6FyqvnakfU=;
        b=JHU39mG2jplZsrcF0svWVX5ntLFEQ2pLeu5D6oxIq5vDlSzEt2DKuAcjp5wghieEnw
         pHw2sYamgC2Dh3tc5FUpqCAwXh2R7jWT8nQRT9Yf5bad1HVMHq9vjp8YhYF/ONWI4sCm
         oKjD/iY7Qf+DG5Q/VYCzEBnnaT7gTsf7pw0Evlt0JspnhUDNKYpQbCn4byZda5dzdfGr
         OudNmgR5reWMav/RPpQfevynxjKtWz1lUCY1dLarNtgAI+G+PqYX7V28DVNc1yQzFnFf
         VgfhGagNcUwn7d8AMxmtaN04nUTAvHDutuYGQGBGz9YonYIRN6/Xpi1pYV1VgPi/kqoO
         kJAA==
X-Forwarded-Encrypted: i=1; AJvYcCXhswSv5i7fUAT4Gc+mNcYcQBmwpQ3z/ecImnEin/uRrOa9U9tJEv7PIKsERmzw6bZgS81J7rA2vEjMVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAMA8pVS/wZJbR07lPnWIm37tquBKqj4UuNHY2dPQA1G5hAUH
	+6TvksyUWqCQCdrZzUY4tc+9TFC9HfuiSDZKWH/NfUAvDMTNGnjY/kIGEdrwVg==
X-Gm-Gg: ASbGncud2Tt1sYJ8gIP0orqM/1xkzVCN7j7N++t64ZJxFxR456gQBWk/oE5x6XoH1iI
	laWkw61T7lyLw7E2uZyzC3pxEsh4be8Es04FNyTrEiusTdGrdFdcPpKa89wnY1SHmyKU9/lJGUA
	8jFB0mZuFGixQjWi8PYaM3d5urHBhPz9k1fLzo8g7nz6uUNn/7Pn5YpMrI+Uk1JCbCBSfD8Amn4
	ZEOY362epik9qGABDxTbqkXATJqPon8MsByXZAoOmVO3bgf0d04biFbr5q8KlcP8Jc5S+gsU8Ys
	8K7AXy9zl+HlJxQsm1x2k2J+yx4Nvg/EwWe7vrG8Dc06KqptmAxqxDXu+Kh+eud1M7m9UIq68uS
	E8AoMUBL5E9hXeMry/FXGCQ==
X-Google-Smtp-Source: AGHT+IHbB2ULThZDwvr8LwWiOxMeoRP6M+8CIeBuTRWBxSc7Hsd2Skry93C67PBKQasajm2/AaIqQw==
X-Received: by 2002:a05:622a:610c:b0:474:bca3:85c1 with SMTP id d75a77b69052e-474bca38813mr202403531cf.8.1741028835091;
        Mon, 03 Mar 2025 11:07:15 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f1b76856sm10218651cf.16.2025.03.03.11.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:07:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Mar 2025 19:07:09 +0000
Subject: [PATCH v2 2/2] media: uvcvideo: Use dev_err_probe for
 devm_gpiod_get_optional
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-uvc-eprobedefer-v2-2-be7c987cc3ca@chromium.org>
References: <20250303-uvc-eprobedefer-v2-0-be7c987cc3ca@chromium.org>
In-Reply-To: <20250303-uvc-eprobedefer-v2-0-be7c987cc3ca@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Doug Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.1

Use the dev_err_probe() helper for devm_gpiod_get_optional(), like we do
with gpiod_to_irq()

That eventually calls device_set_deferred_probe_reason() which can be
helpful for tracking down problems.

Suggested-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e966bdb9239f..0094cfc092d6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1297,8 +1297,13 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 
 	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
 					       GPIOD_IN);
-	if (IS_ERR_OR_NULL(gpio_privacy))
-		return PTR_ERR_OR_ZERO(gpio_privacy);
+	if (!gpio_privacy)
+		return 0;
+
+	if (IS_ERR(gpio_privacy))
+		return dev_err_probe(&dev->intf->dev,
+				     PTR_ERR(gpio_privacy),
+				     "Can't get privacy GPIO\n");
 
 	irq = gpiod_to_irq(gpio_privacy);
 	if (irq < 0)

-- 
2.48.1.711.g2feabab25a-goog


