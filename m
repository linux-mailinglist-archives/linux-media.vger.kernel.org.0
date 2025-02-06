Return-Path: <linux-media+bounces-25732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B1A2B29F
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 20:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA463188AF74
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 19:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7811DAC97;
	Thu,  6 Feb 2025 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VhZv9bUN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7961CF5E2
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871231; cv=none; b=kxX1YoaiOI379oUkh5lPAcJCL0MDT2pYtG9nUSsSlziAjcqq4OYupFKWm2HyryM9EKjRJ5i3ILRM63SXVY6iHBZtSNWc6MAKUlEDtpXTZfhOzdJ/SKb5l2oklLBDucUEDe5lrSkIhEnsWwo60vnDg9OnUJfDAowJST0+EDvO7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871231; c=relaxed/simple;
	bh=iF5q/M5JUZkyZmzqjR47MB5aqmBHiwCKShDjJbC8DL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ox7lYD50yIuX9zwNLRoubqtgei1calaifGtVcjjQUkbxsCGfvKOwYchohjTr7sP+026inn5HdFPmy+D9pkgDg/jIjS2gYmMz+i2Xx79PeaVc/NzJV7f9q3G354jGOwt9AZ32ClGPYHZcWKA27SRkKVn1NNtw0WTFvAMutTDE2Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VhZv9bUN; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd1962a75bso10035526d6.3
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 11:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871227; x=1739476027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yu46zuMM625k6HW9HpCZiLKg/8n7v8FUFBtCTL5Qq8w=;
        b=VhZv9bUNa/uQokOXosfn4S3LgqQHNPJZQlF1us8UxmKplCTWhtwFb2snkSD9wq62vK
         Ch1UewSrKcBOgd2FTpYou7UTMbSilyo8VsVeMuZb0TMLwZg4Gwo0ko2Mfx7g7V+vTZYx
         l3gLZQvkQZUklJin3Zjkqs7j2wOUswGjVn2S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871227; x=1739476027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu46zuMM625k6HW9HpCZiLKg/8n7v8FUFBtCTL5Qq8w=;
        b=ZisiIBzMu1wkEBzTnU1yB6g9Xy2EZ2mMPau87isZlUbQGfBeXIFUAMbHxFAjrMS+I5
         JAxGj09NXGGdwu4zcd6vYUHN6gCNOeYp7uk919oPzNPPGrsHkPSY4TvNAbYIMyrfXJY+
         RkD1x1e9VhkoS/J67/Kl6M2m0/zvzcnG/hjHd95N/iW9l8fAJ2rExdbs2GH76NbpnGIi
         A57lekQRNlBLJqfhWpphZFogSRfW5JKMZqvO97uOcNxfDw4wxfzbAYjd6KogFREoRG3R
         UZ+EB5xKT9vgEOdK/AnJ7/68Bf3oDNivE2ZvMA57lmhL7DEM1YnXGyPmhB8t4zSdWVcj
         TpTA==
X-Gm-Message-State: AOJu0Ywv5tat9Mp/lCX4Pndd5VJn86PfcpJ01cPHD2CeszLZ0dndCEWA
	jiBUJRgy7Kbv30QvSgIGfNZUJmg9YOsH6BiSnbLoYOVLHoO7n+c7lkLUBddEC74Kn1rGSz2Tsas
	=
X-Gm-Gg: ASbGncsEHnWfdr83q3i2NMa5oztnY5tcKhnyHXb8p5s3Wft0I9QUHKZgUfBJc4IB052
	6t3eRrw1xSQR9yXd63B+Ld+CKGz5Vgr1n1RzxYaXIG/ouBlK/ly7fHiaKviGIq7Egv2Y+SdljSb
	EsH8Mjezod03A7dAdjiMH3BolJAERqWl6yedg94jv5YRKSi+MfaFQOvoLJcDjE1DPHnGXllTakF
	DPtP5sGmlWogxOjmg3vNDyh5holBaspjj0RvuUfw/x8jdQY4ASqSecwdMiDs8ZNCikgK5RoCJAE
	ePO0KvXYcEsfbIEEjrba+UuTd/A2ll2e9G2uVCi1UiDrDlyuNIZ3c8g9BuKHE0vlAg==
X-Google-Smtp-Source: AGHT+IGvm2bH+u7v39h8LKqAEVBrazNHy8zb1bEygHBPKRdizqbmdeVljeK2PG8o11QOevB7emfwlQ==
X-Received: by 2002:a05:6214:230c:b0:6e4:2b7e:3992 with SMTP id 6a1803df08f44-6e44561daeemr4277856d6.16.1738871227268;
        Thu, 06 Feb 2025 11:47:07 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:05 +0000
Subject: [PATCH v3 6/6] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-6-32d0d7b0c5d8@chromium.org>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
In-Reply-To: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

There are some ioctls that do not need to turn on the camera. Do not
call uvc_status_get in those cases.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7fddea100ace..0f022174285f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1429,6 +1429,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
 {
 	struct uvc_fh *handle = file->private_data;
 
+	/* The following IOCTLs do not need to turn on the camera. */
+	switch (cmd) {
+	case VIDIOC_CREATE_BUFS:
+	case VIDIOC_DQBUF:
+	case VIDIOC_ENUM_FMT:
+	case VIDIOC_ENUM_FRAMEINTERVALS:
+	case VIDIOC_ENUM_FRAMESIZES:
+	case VIDIOC_ENUMINPUT:
+	case VIDIOC_EXPBUF:
+	case VIDIOC_G_FMT:
+	case VIDIOC_G_PARM:
+	case VIDIOC_G_SELECTION:
+	case VIDIOC_QBUF:
+	case VIDIOC_QUERYCAP:
+	case VIDIOC_REQBUFS:
+	case VIDIOC_SUBSCRIBE_EVENT:
+	case VIDIOC_UNSUBSCRIBE_EVENT:
+		return video_ioctl2(file, cmd, arg);
+	}
+
 	guard(uvc_status)(handle->stream->dev);
 
 	return video_ioctl2(file, cmd, arg);

-- 
2.48.1.502.g6dc24dfdaf-goog


