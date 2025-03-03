Return-Path: <linux-media+bounces-27415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59216A4CB96
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 20:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EFD8189381D
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 19:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05435230BF4;
	Mon,  3 Mar 2025 19:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SW4UHc+V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA321DE2BF
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 19:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741028836; cv=none; b=AJyRKMn2kAPXCCENkc4CI3h6+RDVvCL6/W13VF101qXoamcIJUKSzuMEcYqh2TnSIjYEwX74fEn+dhfKu3pAOsDI7R6F2Wr+NxK4ciJ700QBM5QIfKIpQ0HdoaBGbMHu6FhfDDLevIomjHWfwz915BqjYSayp5rEM22RUxr0vlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741028836; c=relaxed/simple;
	bh=zwKv15o7Jo/9fgFeCeS3GYugU2qgxl7huykM3V6apSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHQYBNZonWn+w3ICs+W6VBHHonVaFrfnAu6il0vU9GTcFReNINH/BmhAaPGkzbm2jwvdQPsck3ImHUid0WwEYcGi8pCHVjFCk3P4ol86veWhKSPfWLSNQK7O4cm2coOcmAgFOfRJivUNJ3Ih/mm2AOzAqEHk/q9tvc5WPvKzrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SW4UHc+V; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-474bc1aaf5fso63870211cf.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 11:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741028833; x=1741633633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Gxk9vB5xla0tvwCl8Ds7W2l2MwxkkWMXQxVGtphCo=;
        b=SW4UHc+VNeQadA0BI0YXHxoHnIzwokI2ZDq80cev7H/Y7t6MdxTtJaXjy4m5qyiOSA
         1Sex0aJarUpORl75xVe97ao4T6T97bHrawc63MMA+2C0/TCB/0yPhheBuyCIr1pO1M+B
         +oYWFhBU6d0oITBxUUohKopCb/ZaNQTMRvHj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028833; x=1741633633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8Gxk9vB5xla0tvwCl8Ds7W2l2MwxkkWMXQxVGtphCo=;
        b=MgWKXuFV4SGw9oYFqAw+DsGoIFeYPr0lRHKxbAcTcjsCSrlg8QHCOZY/4DA4cY8Gb2
         4T5f7waW7y2SNs0K1YQZqFrmXy93XKtTbRoe5Z5XHE1gCM9Djpd3+LkT4qKVITCuDrHc
         G5E5GzK/deYjlI7T7jJ8YS7ZTVzwLYMV+FPk8wdb5xDobjDvFk3O4xNOFHuyaxb84mVI
         cqSqgZNc5Y7QHNpdeM2rHJwkoIYJbeKXihJKmlZNOdKFgD6zCGWufz2f8gzQ0xCe3uCz
         N4fce/jBByUB1VEdFvJ+zig1WlN2YjSwZXCQeGaE8ak6zCAAwuYiNUFXMAQvMYEeKbKQ
         3zdg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ499Lky9jzVNWXYyDdnMVLGj3ocpAcvsN0SffOp1df1DhhX6Nj5QIKfnpYhZmeaYcREsS2eyh/TxSug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQH8UMnjv31wgefmWkJYhRhA/PiJRZd3CPHVRLaxFbHuRepLd
	WgHNy2lSaocpqwKZWqNEjydyJryWMCT2evz8b9kWnwOD0ORInIZdeP51Yr65UA==
X-Gm-Gg: ASbGncspGPTEX9abY26rpeDLKLnM6R9v2hLFhuhDCkTwVWqQeed3Ss09pF2dW3g8vT+
	ClpMEd59HmUz5L/FlfrJS1zoh3Jcg1pD6SI99vxGlxCakxPzciFgEoVupwdSofTff2aMrSggOvF
	MpQHa6hJ+ZtjQ0cKPgu44A9sKpOIlKoH0wtTkiomgxWjOOSdkO0lRjaDmtDfSRqzpzXqVsqIRDN
	sDwgDCogoexmvpSxCFwUpg67jveN2N3juFnzDo0V484OrD20x6qFnWxjo/OFgaVlPHtZA2epk23
	MWof29kng9P+dcT5qcaErpbLCmlfrqQiuMOQH1GSrtboviiI0GtEI7Kj1mdo/gj05NUWdBbe1Ar
	bc01ZK6magPPB0YnBqFwhmQ==
X-Google-Smtp-Source: AGHT+IHNtHwExEby6G65UwGqmP6x3/NpxGPVOKVUd7HVUEskMl+/Yh0StRkgXpJdIyW8qdJRBCX/Ug==
X-Received: by 2002:a05:622a:152:b0:471:f539:481c with SMTP id d75a77b69052e-474bc0f6308mr195158551cf.39.1741028833678;
        Mon, 03 Mar 2025 11:07:13 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f1b76856sm10218651cf.16.2025.03.03.11.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:07:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Mar 2025 19:07:08 +0000
Subject: [PATCH v2 1/2] media: uvcvideo: Fix deferred probing error
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-uvc-eprobedefer-v2-1-be7c987cc3ca@chromium.org>
References: <20250303-uvc-eprobedefer-v2-0-be7c987cc3ca@chromium.org>
In-Reply-To: <20250303-uvc-eprobedefer-v2-0-be7c987cc3ca@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.1

uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
have not yet been probed. This return code should be propagated to the
caller of uvc_probe() to ensure that probing is retried when the required
GPIOs become available.

Currently, this error code is incorrectly converted to -ENODEV,
causing some internal cameras to be ignored.

This commit fixes this issue by propagating the -EPROBE_DEFER error.

Cc: stable@vger.kernel.org
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index deadbcea5e22..e966bdb9239f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
 #endif
 
 	/* Parse the Video Class control descriptor. */
-	if (uvc_parse_control(dev) < 0) {
+	ret = uvc_parse_control(dev);
+	if (ret < 0) {
+		ret = -ENODEV;
 		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
 		goto error;
 	}
 
 	/* Parse the associated GPIOs. */
-	if (uvc_gpio_parse(dev) < 0) {
+	ret = uvc_gpio_parse(dev);
+	if (ret < 0) {
 		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
 		goto error;
 	}
@@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
 	}
 
 	/* Register the V4L2 device. */
-	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
+	ret = v4l2_device_register(&intf->dev, &dev->vdev);
+	if (ret < 0)
 		goto error;
 
 	/* Scan the device for video chains. */
-	if (uvc_scan_device(dev) < 0)
+	if (uvc_scan_device(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 	/* Initialize controls. */
-	if (uvc_ctrl_init_device(dev) < 0)
+	if (uvc_ctrl_init_device(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 	/* Register video device nodes. */
-	if (uvc_register_chains(dev) < 0)
+	if (uvc_register_chains(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	/* Register the media device node */
-	if (media_device_register(&dev->mdev) < 0)
+	ret = media_device_register(&dev->mdev);
+	if (ret < 0)
 		goto error;
 #endif
 	/* Save our data pointer in the interface data. */
@@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
 error:
 	uvc_unregister_video(dev);
 	kref_put(&dev->ref, uvc_delete);
-	return -ENODEV;
+	return ret;
 }
 
 static void uvc_disconnect(struct usb_interface *intf)

-- 
2.48.1.711.g2feabab25a-goog


