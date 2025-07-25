Return-Path: <linux-media+bounces-38456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03919B11D09
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B6251751AA
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786EC2E7161;
	Fri, 25 Jul 2025 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W9WvHmSg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06B2E5B2F
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441299; cv=none; b=JpvhwRINzn1xiVRgyQcFJewrjW3BCYRc6jdMDSBK9/qNFW9RhJ/uo2dpMmSsByaxLpUh4sdk4o6ts50HIA1OhX1Sr0GpEX9+XlIt4M+uSIz6rfXAWW+rIy3tajXGH/cnspkLkIHcSBd5y1eVrghSCG5z02rnNAcGI748XCYM+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441299; c=relaxed/simple;
	bh=91c+c3XacArZYhJktraFog1DitCooWolYjBkQgEPN+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P191B1KtbXRR54PlQcXU1u3J5SDevaM5nUl2+hb0ax3IxED3E+ME7bHYix4FuUpF12eOlLBNVR8EKL9clm/RM6ZU1aWcpyFHKcxAVHIzJKeYZXoTSLi+Tv/pgi5HG3fSMjXpTsxp+sz1S4mfYm6UWPkS3uDi5j+EkjvM5j6MvSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W9WvHmSg; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b3b250621so18930831fa.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753441294; x=1754046094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1Nxza4r7OAZ4l5YzoQCQzc/vgKwVrRaLTJPvigr7KM=;
        b=W9WvHmSgXIVRK4haB4MedJYb/vdEhrgli7DabpIHFVLnQmq0tRau9E3tCbP07fPVRN
         9eQE8NPRaPzyHa8NbED+OVExSaD9/krjEPWEsq/qVs15i2Ju1BFbZbU9IgF/HHQFozni
         HWgN7PAd0FidpL6PYPcimWUZRQ3hZvZHsJjaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753441294; x=1754046094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1Nxza4r7OAZ4l5YzoQCQzc/vgKwVrRaLTJPvigr7KM=;
        b=r69FZmHn/NDpWPUgX4evI1650UbFRW0qjVKZAKxFpwuC02cVyu9xNyrpm5mJE1Ozp7
         aBv7C1yKN0juZ4LOkIjrbWP73/wmu87zjh4Kbb+kM69SIFKnWcQ3XgxkDyviawFtM4Y1
         /EQs5LSkLQbITnZzA2QdGUVxOB7HAXegGBFWLi3jUbzi2jzWXXiRJsO7Kvk7ojS0zKUK
         USnKm8pwlVOnyGI4RH2q1f0JmYRHQrNMOBmGqrsh3m6t6KAF4bviWBKSqhwXYAlSgn4/
         w+QrtpJhau0OeM8og6Akbirk8Nb7HeVVtvJ9jQRrw2diMVKCwjacEmjRsce6bAgV+Uew
         AFfA==
X-Gm-Message-State: AOJu0Yx5P7I+3eCQ3kX1NxUlJAzJ8Y9Je9VGdjuP5vu6LtGdbzeP8f8k
	K2Aav8uZtiA0fVlf9q29wTSM5Ui577m2qfhddQ6BljBJUG5XJreZF1RDUV7/B5h2tg==
X-Gm-Gg: ASbGncvAL6zHZsYj4gbt1WjptVHQ3Eae7BPZY8vev84qs1nzIW6FU3ZtAH99KVAV9A0
	X7X2yBN8wzuRhauFnQqhoqjnHOakZPl8CqJ2+SNVq2WXFh/1D17EavNo8ManMHfsaEHaB1hXDbM
	mFIPIxa9q/R7UUFzF8RjVxL6uOgSQnauo9SBcbr+riazuTUaN6T9dlPLYJAl8jE2BVZfo61TPlE
	vi1y+tRc8dg3etbT1bcv7C7lp2XiwEkTX+umOXV+i6peFVx7YMjGPDPDekt1YFrq/VEubZuuBO2
	6MAD0qXYdqodcIx6pXg/Qz4ed/6pa1np2duLo3ab7SPzOyEGxbQZle5LxURGaGPjgK//T8yPk+4
	DNbFPiFt7n/FdmkkFa1+7xZcZHbf3UGQyX+BQ4CdBEVwOdyZZiXzcMzgGG1KGjXomae5ex73vvb
	oZQA==
X-Google-Smtp-Source: AGHT+IGCop+bbnI2GJGX4G+Ze/OhblUQtpcNFHyqhlJ15tmeQfxDEPv5skwMMRx0MrNl/cPvjV1utg==
X-Received: by 2002:a2e:8e63:0:b0:32b:719f:1260 with SMTP id 38308e7fff4ca-331ee6ee566mr3407751fa.9.1753441294210;
        Fri, 25 Jul 2025 04:01:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e8940156sm4187141fa.97.2025.07.25.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 04:01:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Jul 2025 11:01:30 +0000
Subject: [PATCH 2/2] media: uvcvideo: Do not re-reference dev->udev
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-uvc-nousbdev-v1-2-28f5a1fdf544@chromium.org>
References: <20250725-uvc-nousbdev-v1-0-28f5a1fdf544@chromium.org>
In-Reply-To: <20250725-uvc-nousbdev-v1-0-28f5a1fdf544@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

dev->udev is already referenced by the variable udev. Let's use it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index d09d1286da0f61d5953125df23ed92555585e8f2..209cedeff59e8be2e96ce79c3d395a5a85a336c6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -882,7 +882,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
 	unsigned int n, p;
 	int handled = 0;
 
-	switch (le16_to_cpu(dev->udev->descriptor.idVendor)) {
+	switch (le16_to_cpu(udev->descriptor.idVendor)) {
 	case 0x046d:		/* Logitech */
 		if (buffer[1] != 0x41 || buffer[2] != 0x01)
 			break;

-- 
2.50.1.470.g6ba607880d-goog


