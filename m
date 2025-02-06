Return-Path: <linux-media+bounces-25726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8216A2B292
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 20:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 587C116AB16
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 19:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBFC1B4223;
	Thu,  6 Feb 2025 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yl6iU8qZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CCB1ADFE3
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871226; cv=none; b=dmrpkIDiTmQ/Q0nK04Xyg4+sxUF6DMuB1GV8u3qXUziGO/V4ouJ0jV19VSOLd8TTWBckoki1GRXNJKJ6wakGeOAWW+3Bub3hujs2LLePjF/LbSv+LnKqXe/9tO9onIjH+kEZOumOkEcqVPUJ2N6aNrjF7HhlMyz0SN5t/jFXlUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871226; c=relaxed/simple;
	bh=mMNoow2UZDhENW+B9WaXhVHze9zEaW5TMByarH1pFXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMtzzlw1Whx+mIdkHjrj9VPkx8TZEG8E5SMNbDE/ce5MuFRSIOTBxeIePMoY+eGhM6L4Ao3xpp4wvbam7qLtjie/B9YJe1YuQTJJLTsnykZPKD4Ym0ApnzVPRjXwF4S23z1hBqJ3F8G2bK3AUe5YVjcqtl6D5uP+xAAIwr0VgSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yl6iU8qZ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dd43b08674so11656936d6.3
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871223; x=1739476023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyffxiv8kaCor5UQiEFydJ9JjxN4h7wLUxKN/7HED+8=;
        b=Yl6iU8qZjzQXRN0OaKPDn8fKTWN9nJLheQlLvQzK4uEdv/mi7W9KWCH/L/mOI6+Br7
         EiTK2t83mzyVfcbZhu8AqxHG66WnNV4desxBY1oXNx2rZ2qf+wOVKEFx5fX4yhfPrzko
         x8WpWO53+lYNhjC1aW0GI81hkBtHeuBmHxOzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871223; x=1739476023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hyffxiv8kaCor5UQiEFydJ9JjxN4h7wLUxKN/7HED+8=;
        b=OXKh7y+vp/U+MgbpfcLdyV9X5/i0swUZowVfsKMw6CWMVrA6pY/jjNZwGEq0tMcNSm
         Olh/AFUG///vjs6bGePWm0c2dsgAriRTvfgg9BT3zgucmWA+eO/OnRvYLcSzwNlKl062
         5Jo3hDsOj+ZBK/x5HKOcPEGHpvDzOMvfcu3Da6apXeJHJt5mWZwCuFhFjmfPR9XCqIDu
         XgeIXrhwJ8vFonDgLkrU5623+hCnZLLRmrIQBwRG5/9cNlpckx6UiK/jtcHsLjSouCVM
         9oGUJTHuNLL9w47Ud4ZQ+peWtc3okrWPR1cOJlR5WimGCINsFugcr7nRlGOq4ucKTeW7
         9Z5g==
X-Gm-Message-State: AOJu0Yx0sCFWcYsg+hidxQyExJ9lb9ixuXYnbKvHAf1f8HD+vzKaEZpo
	oUv1c1pqvBx95rxDdP6i21eS8qkd5+D3JUSOfpxWiuR7PKzdjPqOMHx2NErfCw==
X-Gm-Gg: ASbGncvh6cCwVLVMzifgJzKZC65m4qp9BXxVhBY/CasOPeXms1llDnMp/h79tcT5q9u
	TXL9i5+urFt5rbKv0H5DLw2Zy/K9A2ORCHSbygetLMXtCy+LG3OxVitS0SUVBLPYDpmEUlw3UzI
	HgXPfRxMK4i7lca9LFih8TTZdi+yXrKqN9+f72Jo1CARQvRBMbF3zjYpyUTidFcHCNrBbMZLY0q
	M0G2vj4rXo78pEpstG6Oxn32zoM2mZhVliyy+OQ70XilQuswxMGujwTCraFYCx6imGDXVTyHOUo
	lIhAoiWl6Bfc/r3iKGv/8CRI7dCcrVg1igt69fHvDe9A3/vXOtUZKWKF8D7/JcTYJA==
X-Google-Smtp-Source: AGHT+IEgE+n5v/MPwAYZl4Ef7ywjZ3quxd0ziOMmp4+4iq3xO+MT6vadnlGqhIKHStXrrBpnsY9zPQ==
X-Received: by 2002:ad4:5fca:0:b0:6d8:8fdd:9797 with SMTP id 6a1803df08f44-6e445720e48mr4110326d6.36.1738871223447;
        Thu, 06 Feb 2025 11:47:03 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:03 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:01 +0000
Subject: [PATCH v3 2/6] media: uvcvideo: Move
 usb_autopm_(get|put)_interface to status_get
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-2-32d0d7b0c5d8@chromium.org>
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
2.48.1.502.g6dc24dfdaf-goog


