Return-Path: <linux-media+bounces-35102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D89ADD03E
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EFA016F4C0
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388642E54C6;
	Tue, 17 Jun 2025 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMkrDL9b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1F2264BC
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171358; cv=none; b=qBmptQWAnrseuPZZvVYxyLHDY7fyzlmG7RRIjCAd/IPpm5vrANoFGqlVGcgL9BKnVMlufjQuiOsnCZBWKFALsyER3Pus/wxuoOquh6XSDz8G6iN8TLIj8XwwRvRq4a9Ia42xHahG7U4lbPDIQogAl6J8+3JWLz3SRfc2Xq3iXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171358; c=relaxed/simple;
	bh=VUOlaRTP4eV8iVL8FnrRm8GJrgvq6sOIU/fSE8Vhe4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYxqzi5U/9HH3AQg9nIktPgfXkEGQ7p5dpYK7ZGrsZdtsU3bsymmCuup1pRGIe8fkl0t3yVvHLNCD4De/dO4LQZasSCBxLGrhN9LG5jH8ohVFg5Fh758haFO11svGurxdXGHMaX504kWL1Dhuzx2eKLTipGnyy+1tjwIDUHa30k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMkrDL9b; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3322259e87.1
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171354; x=1750776154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XZ3dPW1w4QCfr6i2hU3GgbqSe/1fko3hczMWWZK2cI=;
        b=nMkrDL9b9Aj7W8cXp2+ZfjIEl5ySuRlEw4JPa/03Y/hMzsdGfFCB/w8B8LbzxOM950
         7qs9YofkJX+euJXtcvSirPTjpQMa03Qd5cXJA9zP+XvJ4htR27F7lsSHiwxcxD6JGu0Y
         MDdQYZgjeIsINT/VlnShBn/WM6YfJbzYMtiaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171354; x=1750776154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XZ3dPW1w4QCfr6i2hU3GgbqSe/1fko3hczMWWZK2cI=;
        b=n1qv1AehtaZThlZe1Ja3j6ssosH05/bv5231x/FeicVPkKnqFVNhG2ZFjYYas0e7oA
         x9whsibN7jAKVMDncWZIuNs75inhNjnpqR5LSlKDLhWKJgOwrVUjjKEmOJCG4LZonpvA
         T1Dpzp9o3YutTSefXv6P0t5kkOLMKg80Gw4oIe2lmM3o5qOZFJryHUggaiBgSbXkl8zz
         6NMbMr01W3ak4xIlImms+GH2YTdZ8/sEMoidIgFoYph+G73wPiDHr88Pvw0OlDdVQKc7
         4f/QsEWW9lkHWMDsE15m2eAGqmoIaCPD7BVjA16PZ0cBYcn4cMbExr4jRYlEwBaQjtyY
         VvHg==
X-Gm-Message-State: AOJu0YzO0rDXAxMukCbPwLdN3V0wjUZmupW0I4noCHW7oyeigkXr+WRN
	nUYewfMEBU1e55yMOI7bTogG2/8D11rpPhXSuTsreNMZ5tjIYFx5qTu7r1A9wK9OPQ==
X-Gm-Gg: ASbGncsoPs1IMdZswl3qR+1bQnDmQH0UM7G4vvBL3qoBOBSQRtfkNQaMHMw7VfQOvrU
	dCdn57IHOyfmkMJfPREDxa2wmVpz0Mcsp+S0kjC1Gj5JjZtWYpEYNuFoFqj648nL7/b57qKSMsZ
	EqjKY6ZQqEPgXrFuRntRDLn1ipAoPWKZNdz6p7rE9gyL7/007KsP0K6Fhfu+/pqXTrI65ou8r71
	xeOoJEEjYoPDECBXLdSEW38eDNNXsx9PmpiN8q3gEbFEyvfCvMhvUJ3r9iBBp5XnDhra7HpzSDK
	QcASLoovschtSRBwHJqJvHIxpCZ1zxMAE/A8num38wIxRdZUyqtHiUxA+rUGYKm/EiRrtdKnWf2
	63P1SBseLy2u+v9IDr+GU91Z7Y0gscqbwNdhbq76h+A==
X-Google-Smtp-Source: AGHT+IG1sZuE/Nfhe9B34FOf/eWJmAMXL0Jv1BzWgBFgKFKiF4bV662uimtyRZWQUXOB9gPR6hlDog==
X-Received: by 2002:a05:6512:3b9d:b0:553:37e7:867a with SMTP id 2adb3069b0e04-553b6f4d01bmr3097555e87.49.1750171354119;
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:24 +0000
Subject: [PATCH v7 3/5] media: uvcvideo: Introduce dev->meta_formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-3-9c50623e2286@chromium.org>
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
In-Reply-To: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c   |  7 ++++++
 drivers/media/usb/uvc/uvc_metadata.c | 46 ++++++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h     |  2 ++
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 62eb45435d8bec5c955720ecb46fb8936871e6cc..9de5abb43e19d9e876cddc5d7124592953db89ac 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2315,6 +2315,13 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	ret = uvc_meta_init(dev);
+	if (ret < 0) {
+		dev_err(&dev->udev->dev,
+			"Error initializing the metadata formats (%d)\n", ret);
+		goto error;
+	}
+
 	if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
 		udev->quirks &= ~USB_QUIRK_RESET_RESUME;
 
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6b70c5ba16bcba9e0741231231904..bc84e849174397f41d1e20bf890a876eeb5a9c67 100644
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
@@ -174,3 +184,25 @@ int uvc_meta_register(struct uvc_streaming *stream)
 					 V4L2_BUF_TYPE_META_CAPTURE,
 					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
 }
+
+int uvc_meta_init(struct uvc_device *dev)
+{
+	static const u32 uvch_only[] = {V4L2_META_FMT_UVC, 0};
+	static const u32 d4xx_format[] = {V4L2_META_FMT_UVC, V4L2_META_FMT_D4XX,
+					  0};
+
+	switch (dev->info->meta_format) {
+	case V4L2_META_FMT_D4XX:
+		dev->meta_formats = d4xx_format;
+		break;
+	case 0:
+		dev->meta_formats = uvch_only;
+		break;
+	default:
+		dev_err(&dev->udev->dev, "Unknown metadata format 0x%x\n",
+			dev->info->meta_format);
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6..502f1d5608637cd28ce6f01aee31c4f5df160081 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -581,6 +581,7 @@ struct uvc_device {
 	char name[32];
 
 	const struct uvc_device_info *info;
+	const u32 *meta_formats; /* Zero-ended list of meta formats */
 
 	atomic_t nmappings;
 
@@ -751,6 +752,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 void uvc_video_clock_update(struct uvc_streaming *stream,
 			    struct vb2_v4l2_buffer *vbuf,
 			    struct uvc_buffer *buf);
+int uvc_meta_init(struct uvc_device *dev);
 int uvc_meta_register(struct uvc_streaming *stream);
 
 int uvc_register_video_device(struct uvc_device *dev,

-- 
2.50.0.rc2.692.g299adb8693-goog


