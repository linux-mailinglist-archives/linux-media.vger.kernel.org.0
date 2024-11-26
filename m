Return-Path: <linux-media+bounces-22098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA749D9BC3
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CF72B2F781
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A581DB55C;
	Tue, 26 Nov 2024 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DmSxJ0aU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C441D9A76
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638031; cv=none; b=llxrZ0B51G5T595L1u42ZhaQBmphPVlcDICtu0ljWlO8fglxcQN957QMs9gpANYAl60JQ2NWmALfcd32w3q2ZbAt+yoARFGE3BzNM8dY9jeJrqwJZpJtay/PpGPj807oFUMqu2jT1kX/AHtVNgMVYgrfYuW0PSmHkoI7Hx1xKB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638031; c=relaxed/simple;
	bh=fXeP6hP7d8DZLK/SqBOauBVNxZJD+zSrN3SPVgFuloQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AcVlpBsgBYRPLAMX9/a0UpkECIkgwUPMC8wYlnfYlqf6UBJCev9yR7e0Z1w70XYVTe0Dc+BGhHNTEwt6vdpAjnnplwJMCYvufzmILerbKYKmre4D5zm436PX0XZIgzFu5n0p2TnAOxkid3Yfc/h/mJ2ExKvUVubzky569s4rZ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DmSxJ0aU; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5f1e573f365so898721eaf.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638029; x=1733242829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oM5gW83DYtkyi5mVaIPybDtzyFce7hGSIn88DXzP1bc=;
        b=DmSxJ0aUTJE88jjHa7rYqcK3D8fHKMEgdaV3YR8oskWrS11RSeRQYWYzOZ/WBRX95N
         PyGO83C/ye+5pnCOQn3iWPqqjatS2P4XoAnwIPHjGPqp7k9LGtP68FgfxYVvYDKYxIrY
         uNFjvv4zFtOuoXbIWeoj0KkmleYzwdqatjwmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638029; x=1733242829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oM5gW83DYtkyi5mVaIPybDtzyFce7hGSIn88DXzP1bc=;
        b=haa3kNxO4Oe6YiTJNM9CzTZKOtWRU6N+u0QyClwt/Pn9X2/polM4TF1K+dBhHvcVwl
         ia7AmpySiH3kL3K7bgYOQSXt1TOcVkR3C//QtRlkWjEOt3M5UmtZ0tYCLx4dl9V0UFYY
         WINqjaFT/Ql76wvkNmeXoUHEb6Xe458Ka/GfZUCR7W4YJeAO4UCZOx2je8Bal+F+desG
         14y8+qtA/QDS/BVzmh4vZf+PW8lu0vqMaZU3hfuB+F/usH+A7nbkwQBaLbQUEPj4jrZ8
         PbC1EYGM9PRZZI6kxBJBg3DaJhK81WBtUTHSGazHFB0u4LHAxXQ+XmZAtjDecq+d9X6t
         PK5g==
X-Gm-Message-State: AOJu0Yznv7z/yg1UJaJLkhhXQ2px2BorBxrSejokpwm/RGW+Wf5Jban9
	F6unBs1IQHFaaBvvnGnmQxFhdpk9aDKH/95zBoF9o5Mx5Q7kLq4NF3XHPD6OeA==
X-Gm-Gg: ASbGnctR6TAM2kZpYE9F8yqDlOXtBoPPukeQXj3Jp70IF2ay8pE/B/IwNkARavBAx/h
	X091jI1H3i844d+rzYQb8PAoJAnCl1PaN0aE9F7xErSE9kmZ1c3Ni1NmJO2KSP1qx5jcDjnQGa/
	pQVKoqjTSQZK0k/4H2ltE/vLMciw3nR7YXVdPkLntGzucO8bx4sI4TKZvuQ2jcOs3Ac0vlZ+6ab
	CMGrrvwp1+JAQhI+4loWKg50wM53WP2t7l5jY1P6oMzqXw69uUReRnVktGnLdV+K3kzVe6y8/qg
	syGcLbqWmzoTWgxclxGcWJrP
X-Google-Smtp-Source: AGHT+IEx0/z2upzwZa1v2tR9ixIeTv9UvY1/QA26N8uIiVqTdq7qHENYY8qRduqIG+j0i0J9NC7t4A==
X-Received: by 2002:a05:6358:5699:b0:1c3:84de:4d5c with SMTP id e5c5f4694b2df-1ca797bb7d5mr904727555d.23.1732638028680;
        Tue, 26 Nov 2024 08:20:28 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8205fdsm346532241.1.2024.11.26.08.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:20:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 16:18:54 +0000
Subject: [PATCH 4/9] media: uvcvideo: Move usb_autopm_(get|put)_interface
 to status_get
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-uvc-granpower-ng-v1-4-6312bf26549c@chromium.org>
References: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
In-Reply-To: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Right now PM operations are always called at the same locations as
uvc_status_(get|put).

Combine them into uvc_status_(get|put). This simplifies the current
code and future PM changes in the driver.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 38 +++++++++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c   | 11 +----------
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 06c867510c8f..f7531ed0fa84 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -378,7 +378,7 @@ void uvc_status_suspend(struct uvc_device *dev)
 		uvc_status_stop(dev);
 }
 
-int uvc_status_get(struct uvc_device *dev)
+static int _uvc_status_get(struct uvc_device *dev)
 {
 	int ret;
 
@@ -395,13 +395,41 @@ int uvc_status_get(struct uvc_device *dev)
 	return 0;
 }
 
-void uvc_status_put(struct uvc_device *dev)
+int uvc_status_get(struct uvc_device *dev)
+{
+	int ret;
+
+	ret = usb_autopm_get_interface(dev->intf);
+	if (ret)
+		return ret;
+
+	ret = _uvc_status_get(dev);
+
+	if (ret)
+		usb_autopm_put_interface(dev->intf);
+
+	return ret;
+}
+
+static int _uvc_status_put(struct uvc_device *dev)
 {
 	guard(mutex)(&dev->status_lock);
 
 	if (dev->status_users == 1)
 		uvc_status_stop(dev);
-	WARN_ON(!dev->status_users);
-	if (dev->status_users)
-		dev->status_users--;
+
+	if (WARN_ON(!dev->status_users))
+		return -EIO;
+
+	dev->status_users--;
+	return 0;
+}
+
+void uvc_status_put(struct uvc_device *dev)
+{
+	int ret;
+
+	ret = _uvc_status_put(dev);
+	if (!ret)
+		usb_autopm_put_interface(dev->intf);
 }
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 712a531e52f9..1d4db712137e 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,20 +617,13 @@ static int uvc_v4l2_open(struct file *file)
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
 
-	ret = usb_autopm_get_interface(stream->dev->intf);
-	if (ret < 0)
-		return ret;
-
 	/* Create the device handle. */
 	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
-	if (handle == NULL) {
-		usb_autopm_put_interface(stream->dev->intf);
+	if (!handle)
 		return -ENOMEM;
-	}
 
 	ret = uvc_status_get(stream->dev);
 	if (ret) {
-		usb_autopm_put_interface(stream->dev->intf);
 		kfree(handle);
 		return ret;
 	}
@@ -666,8 +659,6 @@ static int uvc_v4l2_release(struct file *file)
 	file->private_data = NULL;
 
 	uvc_status_put(stream->dev);
-
-	usb_autopm_put_interface(stream->dev->intf);
 	return 0;
 }
 

-- 
2.47.0.338.g60cca15819-goog


