Return-Path: <linux-media+bounces-25582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECACA25969
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC3453A7C42
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FE7204C1B;
	Mon,  3 Feb 2025 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QfGp2Vxa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF5204689
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585652; cv=none; b=Nhs0z4AYhq0BwdKMMLx9Y0yhlnqK5ssQGYHG4uqGjpvdsp6cAUmxNzX+q6JtFgL7UxsDasE0xJq60/BWXYcm6UVxpD4ja5YO79YluPh9ZM38sU2BM6i9XzwnlOPeu+3FxPhJcdIYrM2k/E1eifd02k05ZTNMJHFZzXYFy4Zbgqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585652; c=relaxed/simple;
	bh=D3PDTa5bBZ189h6S7+Avdx11GulyjmVpJFiCtm2ywk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9/9LQqKcSqzT21pwBdsZN8uBE7761wfdEt3Sb9MkitD1jh9ywowdfoq7qzTAMokR/4rfQJwSUCEOWWp5AaFWWqW/eQQddRQmG5A7VIGMUwzyoWD1O5QnF+3hSsucjUFWab7+PBOWPExn7NGkfy9C1VyA9E2je8JWrHidNVuvNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QfGp2Vxa; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46fd4bf03cbso55733931cf.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 04:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585649; x=1739190449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJfWVER0A/MWtXZIU7OrSpWdFioEJlVatupUrNIrYbg=;
        b=QfGp2VxauptWGNvUpPrB9rrQ7Q5UfaVrF9zXK+KsGm6hUeHbxglZ77W1CGUy+YC6G2
         2HMytE0rAhUOMzJ5/B054IDE8NCCoQmOZXGTCE60GFSNvIqT9wn6GKqadhsURAEknLQH
         4UXy8U68ZZx5ln2Ggq3svr6hN6c01GOqpaJr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585649; x=1739190449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJfWVER0A/MWtXZIU7OrSpWdFioEJlVatupUrNIrYbg=;
        b=bX3WJMZAvc+uMBnPlOBzbaMyP5yhGtVc7J1EPN2ZRoc+9qhLm7/gVmgEBGpEJWuNUz
         ZPKFpJUGVFwEThCVARKE/yfDWwFz/YB8y/SOwHqtsd4IfLkwC89xCu6xwM/0suH2J3mB
         l275cxTWmkiAev+YRD2INBFFbQoLJ5MfzK4wuyCXmnHEuiWRdkraFWid8aTbWRNzvgWD
         b+YvhniY/A+lblLAcHHLaR52Oe+u9igkLx7hlL3zV7mXNEWsYHMCKrALKzte3WHGVW9x
         lu3H/xB9uHVT05quAR2As7I3qd9578EdzKtMfz0DeVTSdJ3UlYYeIswpDKEjXfMjbvzi
         ROuA==
X-Gm-Message-State: AOJu0Yz14e5KHmlU5NE7c12y3kMmnbGAwWJaBg4IA/nKorvfrbXPsAU7
	TgSvOi1kZ5IX556LOas0P1T4ELU2r43YplPHF97K/+kiIbaxAZ18Rwo6KMiDzA==
X-Gm-Gg: ASbGncsnk4KYm2b9Sl4xkmZHtwkdkRWcGX77Nx+YsuMsWqN1/XvPKjmnnmsUcyA0wKc
	SPCifvwipsx7DRFR5+q0Q+xsmKNRT26g8QeMW7Dvrl+5bGUmFTlR3Gt/1IT4Yy5Mj3DhzyA7N5u
	GWjsoGv2ckHSnySEbwnhEffMgwGQ3uOtW8MBLkQfZd8Kq2T77Y5wz3QQLUyJlGQa4j2bsb3opLU
	EZMGFsYkpOR4mjCQDJBDoq+lYuKbdEbBhLA32XYYs2m/txcfO+2J0+5Se/ZTk881UGW3gdkYzGn
	o876LWPOwDeGy1dICROgO6Q1qVptFO2962tr/LAI6XCqxkuDQhSbB5WOKGtQxYuROA==
X-Google-Smtp-Source: AGHT+IHM6vEIGrDaO5hgfLv3qjHe2qX5n9BWjAr3CI6mqTozb4ZJwT7hQqwUFOPt2P2TyvnmMxBXdA==
X-Received: by 2002:ac8:6f17:0:b0:467:6c5f:95c0 with SMTP id d75a77b69052e-46fd0a1d1fdmr263931451cf.7.1738585649574;
        Mon, 03 Feb 2025 04:27:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:21 +0000
Subject: [PATCH v2 2/6] media: uvcvideo: Move
 usb_autopm_(get|put)_interface to status_get
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-2-bef4b55e7b67@chromium.org>
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
index ee01dce4b783..caa673b0279d 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -382,7 +382,7 @@ void uvc_status_suspend(struct uvc_device *dev)
 		uvc_status_stop(dev);
 }
 
-int uvc_status_get(struct uvc_device *dev)
+static int _uvc_status_get(struct uvc_device *dev)
 {
 	int ret;
 
@@ -399,13 +399,41 @@ int uvc_status_get(struct uvc_device *dev)
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
index 856eaa23e703..5d4e967938af 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -636,20 +636,13 @@ static int uvc_v4l2_open(struct file *file)
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
@@ -685,8 +678,6 @@ static int uvc_v4l2_release(struct file *file)
 	file->private_data = NULL;
 
 	uvc_status_put(stream->dev);
-
-	usb_autopm_put_interface(stream->dev->intf);
 	return 0;
 }
 

-- 
2.48.1.362.g079036d154-goog


