Return-Path: <linux-media+bounces-37041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD775AFBACF
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 20:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0046016B08E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 18:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E5B2749E3;
	Mon,  7 Jul 2025 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IeB6u0k7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F4B26560A
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 18:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913248; cv=none; b=uHXUrKuiTYF/548sIiw0X9wJ6+MTJEKRvz3K/Y9CaKQ/b2y2IdCc0JML3e1l+jZSNMqkPt3t8bn2yyymzaktkKmuGaTcJ27jlphCkH3A5EQy5OBAWILjTTJvgPXIxAjPLy2qpZir5/iPar/LZH2XH3WCQODVAOgKM6tDRslkjpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913248; c=relaxed/simple;
	bh=XTTO2GlL2rwzrs5D9X0KqylT3melKL3EVpcGuIGiKrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usspkSKpXnBs8Y6rJEoKjitpfN+nTZpbjkiOvUFXwYwuJcdJGqn2L/VWTMAKthLZ8d11tJCOZpNfuvu3F6RIVaLtTtpk8fgmA0p3wTjFCJ4O1MGADJAkaetukhsV/eopo+fMzjI+sO7RnMpEQorFNwLfa5QDvKcFV5kpcuPw4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IeB6u0k7; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b3316160so4177708e87.2
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751913244; x=1752518044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yz8301aMK4jTXSvQ1f1sAIMmy3TqXQCCdC9cQDPE4Kk=;
        b=IeB6u0k75k35RiwALC9LWWkINXmi4IoU2zYGjIzljxwz2c5Nr3unq968YLkS7cRQ80
         XKJvINPXZAo+ks/DFk+rLEb/7nzuPFUP+Z5uCU5Fb6FmEIiWicNoMau4OS9sx1TENUhz
         THj21WgzYznrMH4FDjumEYlwyfNI2n1FGs8o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751913244; x=1752518044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yz8301aMK4jTXSvQ1f1sAIMmy3TqXQCCdC9cQDPE4Kk=;
        b=ExO/X/5L8rEWk7NoJjtI8ar8aoyri5aUAZ5OBdZaTVBEiRJvB1R/EkCTJ1RP4xTrqn
         Bjz/wB/9y1s440cIF/qWEkc1TpvBDfItJo49eGwJuWZVU3ccH2wNdSlasLb1iS0b7IOK
         9XLg07/FPgZ1YZ3vc4Gchj11oOhPZurdWUXCdLAl3BYSTpFTatNpxWCAf5red8Y2qXR0
         GsbVmcWtrI7rwpWyNoUT3UYSThNrMJmXkTYsiHqU4tfypSwfTLSmbdy9eZ8zQbynhsuO
         rVhsdrIo5fkiyr4TT3mlh2q0agPA+qGeviI/yk2g8DXVTTrIe7FP7gEHpN/fjz8Gx+b/
         F8DQ==
X-Gm-Message-State: AOJu0Yyc9W3LMzEvwvDoQlRyRghCgAkNXuyFxIO/CX3XrFJ98Sk0P4PS
	kbuZPbSYOPs15l2X37JTumy+zlMsBE3/icmdTqruu2lwT4+0gz1LiC4Durjc7jdaUg==
X-Gm-Gg: ASbGnct04IDM75rvmiq+SOGI3dPqRLDJj8EVo6L3PP7Dk6EXpTyg4VLndUtrEXd33Cj
	kHLeA1k7eSdXQ95aA4mxKR66ntBt4i5Eo+p8G0AJjs4F603Z6hlnub4H+ulgX8gFhXGWBi1VP9o
	V091+hgOPHwX2wm3poM0AJhuNH0jMk7UYVubB+D4OFATdRCCdIZEvDvjfOSBY3nElDgHvKeCDYQ
	1By1id++m5MepRyDovqujihYz03MASxQL4hCh8sxYDm2qnAWNjUdj1clGRth1dMYnVsT/8inNDz
	0guhgrxhR4iNkEHzp8sIiQz+qesyRIzHd8iDnAqK7Lwckt2UUleYRiVlrNJTrs3KaOfpGAzIN7D
	t0j73v2rbjnFX20u+++FKWKrv0X0pRMqtfVxbMTKEjg==
X-Google-Smtp-Source: AGHT+IGfWfOKT1mPFOAlQpBieTmRp9vWA29ON5ogRlHpx2VgDwJFdP5LHFEKMr/R8mVBYkECy0syNg==
X-Received: by 2002:a05:6512:3081:b0:556:2764:d20b with SMTP id 2adb3069b0e04-557a19df4ebmr4253285e87.19.1751913243937;
        Mon, 07 Jul 2025 11:34:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d31a6sm1417630e87.61.2025.07.07.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 11:34:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 07 Jul 2025 18:34:03 +0000
Subject: [PATCH v8 3/5] media: uvcvideo: Introduce dev->meta_formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-uvc-meta-v8-3-ed17f8b1218b@chromium.org>
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
In-Reply-To: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Right now, there driver supports devices with one or two metadata
formats. Prepare it to support more than two metadata formats.

This is achieved with the introduction of a new field `meta_formats`,
that contains the array of metadata formats supported by the device, in
the order expected by userspace.

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c   |  2 ++
 drivers/media/usb/uvc/uvc_metadata.c | 38 +++++++++++++++++++++++++++++-------
 drivers/media/usb/uvc/uvcvideo.h     |  6 ++++++
 3 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 62eb45435d8bec5c955720ecb46fb8936871e6cc..56ea20eeb7b9d5d92f3d837c15bdf11d536e9f2d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2315,6 +2315,8 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	uvc_meta_init(dev);
+
 	if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
 		udev->quirks &= ~USB_QUIRK_RESET_RESUME;
 
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6b70c5ba16bcba9e0741231231904..4bcbc22f47e67c52baf6e133f240131ff3d32a03 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -64,14 +64,20 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
 	u32 fmeta = fmt->dataformat;
+	u32 i;
 
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
+	for (i = 0; (fmeta != dev->meta_formats[i]) && dev->meta_formats[i];
+	     i++)
+		;
+	if (!dev->meta_formats[i])
+		fmeta = V4L2_META_FMT_UVC;
+
 	memset(fmt, 0, sizeof(*fmt));
 
-	fmt->dataformat = fmeta == dev->info->meta_format
-			? fmeta : V4L2_META_FMT_UVC;
+	fmt->dataformat = fmeta;
 	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
 	return 0;
@@ -112,17 +118,21 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 	struct v4l2_fh *vfh = file->private_data;
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
-	u32 index = fdesc->index;
+	u32 i;
+
+	if (fdesc->type != vfh->vdev->queue->type)
+		return -EINVAL;
 
-	if (fdesc->type != vfh->vdev->queue->type ||
-	    index > 1U || (index && !dev->info->meta_format))
+	for (i = 0; (i < fdesc->index) && dev->meta_formats[i]; i++)
+		;
+	if (!dev->meta_formats[i])
 		return -EINVAL;
 
 	memset(fdesc, 0, sizeof(*fdesc));
 
 	fdesc->type = vfh->vdev->queue->type;
-	fdesc->index = index;
-	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
+	fdesc->index = i;
+	fdesc->pixelformat = dev->meta_formats[i];
 
 	return 0;
 }
@@ -174,3 +184,17 @@ int uvc_meta_register(struct uvc_streaming *stream)
 					 V4L2_BUF_TYPE_META_CAPTURE,
 					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
 }
+
+void uvc_meta_init(struct uvc_device *dev)
+{
+	unsigned int i = 0;
+
+	dev->meta_formats[i++] = V4L2_META_FMT_UVC;
+
+	if (dev->info->meta_format &&
+	    !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC))
+		dev->meta_formats[i++] = dev->info->meta_format;
+
+	 /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
+	dev->meta_formats[i++] = 0;
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6..b3c094c6591e7a71fc00e1096bcf493a83f330ad 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -572,6 +572,8 @@ struct uvc_status {
 	};
 } __packed;
 
+#define UVC_MAX_META_DATA_FORMATS 3
+
 struct uvc_device {
 	struct usb_device *udev;
 	struct usb_interface *intf;
@@ -582,6 +584,9 @@ struct uvc_device {
 
 	const struct uvc_device_info *info;
 
+	/* Zero-ended list of meta formats */
+	u32 meta_formats[UVC_MAX_META_DATA_FORMATS + 1];
+
 	atomic_t nmappings;
 
 	/* Video control interface */
@@ -751,6 +756,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 void uvc_video_clock_update(struct uvc_streaming *stream,
 			    struct vb2_v4l2_buffer *vbuf,
 			    struct uvc_buffer *buf);
+void uvc_meta_init(struct uvc_device *dev);
 int uvc_meta_register(struct uvc_streaming *stream);
 
 int uvc_register_video_device(struct uvc_device *dev,

-- 
2.50.0.727.gbf7dc18ff4-goog


