Return-Path: <linux-media+bounces-25581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23694A25968
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7B3B3A7542
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC4C2046B8;
	Mon,  3 Feb 2025 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SjC5UTPN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8589B204598
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585651; cv=none; b=g0P2RkjndJifAbLKq+4y+VOEcWbhPfrY9552H2mu704cTbqrPr2Sy3ePIR1VAbk+vTHlJIosuSye5phkCsXz03OkBgOsrazVY1GdSKISB1Rk4j/Ogej5h254b4iiusJB2UxkCpED9deH44F2DD7PeAZaafVUlTLFpNe+3JgI6Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585651; c=relaxed/simple;
	bh=ypQ841cNTOVvJkNiivh2SjrxeSrzyKc9iA8RYDsQiLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=almyH2VvW1ZtLihCIUPQphWIN5s8yxscJv1JqOeYeryFDytsRUthdddiWokLsSm0IzBWhSjMTn7fyBEz/S8e2fWvVJRf4RoRBAIuARiSYIu8HYm0Plf6yvuu6y9VvuTwRN1E5XuLCumPlFXQ7AZW0q8Kpsw6CAnsSfu15ibf2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SjC5UTPN; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467a1d43821so49151481cf.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 04:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585648; x=1739190448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QY4+u53g0URNX41P38AQG24x1RBlbj7sJlUgGqsa0as=;
        b=SjC5UTPN8QDW8j4cyqJVdCNDbR5GZ7WB2BC0SZ7wuwKZtaOT8v33tM8Tl3GGhmZZbd
         KVFQ2B2ZYk0IU3tEdik8Dhgu3FwAB67vUaeBPgLj+mHNfPyco9u6jsMuuse/2wQs4/Ey
         bLetNiHpIm0etou/kP3i0u/Rl0QgsE9G07wOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585648; x=1739190448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QY4+u53g0URNX41P38AQG24x1RBlbj7sJlUgGqsa0as=;
        b=Sn1I+e/8OQAxh0yva9IPdszdWMEdy0WZBmkhaHC9ULMY5mrlDSfnR2LTvbk5PVlXmo
         L8Zg4h+iV8zMJu5XikjOuOcvuJKrhwdugzN0mXdcdyvnQ4V2g/221uhZeGywspf7z7Zh
         FC/QaClhIzW1lkT5Ncjel2wtEJH2iFYXsKtpZOtJyMkXOx24UZe5p5cCepE5yGhRXanr
         uviaELc+Sfj7CVU/b/8+WJQw2G8JLJMiTD6tBSQxGKfYz6C3T42o4Muo+6HtLqD++P6k
         KvTNtN7PKjQqSlmoeATtA18PPCTRNUZzar6myxboYmmHkq8w2bZfFmUyOaPZsbtAoPeG
         9yhg==
X-Gm-Message-State: AOJu0YwEVSwP6xV9GQ0DrN91MTPI51HsnX1fJYByROA9ZWm8vtO1uZ4i
	4fURDXERLEydhHWy6eVdxbsDTLvSBsgN2XLiKOnaBry1gHjZnhNDcJAq5k5+pkJGcSkd4c4qYxS
	Tng==
X-Gm-Gg: ASbGncszZxBZ/QGcvJeUCi5Ut1pBjNeB9qVS4bE+7CcJ/WOgqVrThJKsdYDl72+T+We
	J3NjM3PZeK+wiWpQvq1XlrN0hnctbGYwKLVAB8nF6fKTF0rsSMkGjd9EexgKT1AJlBRe+rBjeQm
	ZvatEu4XFW2dw7tBt0Cc9WPBtqJ+p3cnjvY7Iql0llARzWB5r4awE9lc3FyRo6bizrp+heJIXlm
	TtHba/Pg4fLrSDWgz8wGoLqKXg1cG5oQmBMHU4FXMs+th4iQRoCCKDob53w2UysoyIdDd0X5Sgh
	f6MZGidz7MnF9CvKozGhai27clWlYpfOh6MGgk7X55rclgrsWmRagfqQhsaqELSuww==
X-Google-Smtp-Source: AGHT+IGGsYptsXXuay5PF9kPj0wjLs/hfqUXeqbalcq/KJFm9kJo02Lp+ffYXVKIq92dEFobt5ZlKg==
X-Received: by 2002:a05:622a:550:b0:467:5f2f:4a9f with SMTP id d75a77b69052e-46fdd328316mr210294281cf.3.1738585648410;
        Mon, 03 Feb 2025 04:27:28 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:20 +0000
Subject: [PATCH v2 1/6] media: uvcvideo: Keep streaming state in the file
 handle
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-1-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Add a variable in the file handle state to figure out if a camera is in
the streaming state or not.
This variable will be used in the future for power management policies.

Now that we are at it, make use of guards to simplify the code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 15 +++++++++++----
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 93c6cdb23881..856eaa23e703 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -835,11 +835,17 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
+	if (handle->is_streaming)
+		return 0;
+
 	ret = uvc_queue_streamon(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	if (!ret)
+		handle->is_streaming = true;
 
 	return ret;
+
 }
 
 static int uvc_ioctl_streamoff(struct file *file, void *fh,
@@ -851,9 +857,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
 	uvc_queue_streamoff(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	handle->is_streaming = false;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..bc87e1f2c669 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -618,6 +618,7 @@ struct uvc_fh {
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
 	unsigned int pending_async_ctrls;
+	bool is_streaming;
 };
 
 struct uvc_driver {

-- 
2.48.1.362.g079036d154-goog


