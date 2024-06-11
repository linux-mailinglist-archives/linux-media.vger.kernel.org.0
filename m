Return-Path: <linux-media+bounces-12927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C2903505
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 10:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E4391C2348A
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 08:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9C3175570;
	Tue, 11 Jun 2024 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uc5Zv05L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3C174EEB
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718093535; cv=none; b=QJdC2YkSx/2tzFrqA26iipZQpzIXRUkkuvfP/KJuG4FJZAhgm5sB4uJsjo4c2LdYFh3glKT/pM5CwrJWU7DaQkOcWbuAnTaKpDKAVwmnOVofCQekW28lg06gD4EDGW89jkVYnyf/7Gph7JZSUBICbwCXtQTVlKzQKqvACiepLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718093535; c=relaxed/simple;
	bh=hVLGmVR1HMkUx7+t5Nvw+6vPF4SbFF3ImKNPy0MAlEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpI/cggzCgM6Jas2D6xvr/9MJxxtghH5LVqiG7XUdSJSHQU3a+kvPBRtm3uX2jtTBpiWAtUrKdYMIU+yiEVfsli4i4n8KpRCDCgXbgK9bLO3fXfrebkY5U8gt3cnVek6rCNuw++d6EYLve7t2g4Qb4PMOuBN9miX1BSw48EK+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uc5Zv05L; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6b05e504bceso30191096d6.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718093533; x=1718698333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qcNpYr9SkPtRLJMkT2pD1WoLD/0+PdytNXdst5BZm8=;
        b=Uc5Zv05L3zx0B+t6IHfmS25NKwjWRsoWfUBKmZgHSW0INbbFCiQLjODl8S/s7aAhAo
         FWN5QbQzDDAZd3eut+Ei3LP47sQwcdMLIuhkK5BvAdSf+n5mjYzQ5XHdrqMvpnYRTWKr
         twlnQ9LiWmKCBx3g4589rrXy4rL/OxM+87O8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718093533; x=1718698333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qcNpYr9SkPtRLJMkT2pD1WoLD/0+PdytNXdst5BZm8=;
        b=XSFXay2mpmyHPxlfg3/9BezXMuZU6y+4AXualMHNY+es3fUJ2mUIAQ1bFAmHsNvbO7
         O3lFl3GkT3A5hjA9O9y1Wy/P24v2x6KLVYt9m+B9iHPr9DGYlYPIaxSxSrDLAIs7sEZ4
         6hYkS8HBPU+LFm4UBsJ5o1YhY8Bg0wkXWVSQx2EEScapg2gqVMdeSvR2KhIDkcRZtjRz
         VMWrgug8URPeei3UKagzzGcN6F3eIXJxrr6RqawwtCv74M5iF+0ee/JRczcTi2eeYJpi
         Yg12LSHV2XJzFbWNx8JGA2bz6DB6HBw5mYgcbJqPprisUxLc6rmMkVbVIv7Kz7W0IVe6
         oiEg==
X-Forwarded-Encrypted: i=1; AJvYcCXt7Ca2uKZuLEXH0l1uUjggmILH4rYFFB2xVbFYnuCPXLYNAd8TsKmSyDkpGa3DM67eBkfObmtJEF826gHsZtZl0IUFwpFE2Y6jzWw=
X-Gm-Message-State: AOJu0YxhBWPPeSmwFYAnfl+GyvtV6VWe04lJzsqYbafFiLK/HjEoodV1
	f100UM5Ly2XuhK3f9IwO0+PMmR0bMoZOUH7ORjkQ6yry5JqJZ68wSWztNn0EDTKJ2gwRFg20y2d
	YPrXN
X-Google-Smtp-Source: AGHT+IH48KT7q9z49yEVjuF/xwKgCzBz70RWMzOb4ndYUOF7z0Kudt/BHMFgmwtck1NHVeX9Opq37Q==
X-Received: by 2002:a05:6214:3912:b0:6b0:7ba0:ef67 with SMTP id 6a1803df08f44-6b07ba0f05cmr47438746d6.31.1718093533266;
        Tue, 11 Jun 2024 01:12:13 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b09039c2b9sm1548886d6.28.2024.06.11.01.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:12:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Jun 2024 08:12:08 +0000
Subject: [PATCH v5 3/4] media: uvcvideo: Avoid race condition during
 unregister
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-guenter-mini-v5-3-047b6fe5d08b@chromium.org>
References: <20240611-guenter-mini-v5-0-047b6fe5d08b@chromium.org>
In-Reply-To: <20240611-guenter-mini-v5-0-047b6fe5d08b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0

The control events are handled asynchronously by the driver. Once the
control event are handled, the urb is re-submitted.

If we simply kill the urb, there is a chance that a control event is
waiting to be processed, which will re-submit the urb after the device is
disconnected.

uvc_status_suspend() flushes the async controls and stops the urb in a
correct manner.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 375a95dd3011..8fd8250110e2 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -294,7 +294,7 @@ int uvc_status_init(struct uvc_device *dev)
 
 void uvc_status_unregister(struct uvc_device *dev)
 {
-	usb_kill_urb(dev->int_urb);
+	uvc_status_suspend(dev);
 	uvc_input_unregister(dev);
 }
 

-- 
2.45.2.505.gda0bf45e8d-goog


