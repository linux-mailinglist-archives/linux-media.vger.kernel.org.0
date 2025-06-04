Return-Path: <linux-media+bounces-34057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2F7ACDDAE
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 14:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEA227A1586
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 12:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FF728FA82;
	Wed,  4 Jun 2025 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="msGOwrwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA0E28ECD5
	for <linux-media@vger.kernel.org>; Wed,  4 Jun 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039370; cv=none; b=RgzFkj2BvEe7wbHFaqPxVzvIqE8epmLHZseqlAfXZVgJ8x0AGdB9Sr7jZ7+X3uK5aMAuovU/SPYI3yibnS49R9fVhXAuerQg2V9MFSWDm7bhI/sUcsZ6xJeCDF21EHlzecpzBijY8yz0zi6XakZWvOZEWLHbmcNVoWBcOgRXDPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039370; c=relaxed/simple;
	bh=iQEqTG4/3UDjJ+E3KJa+z+GCpi2U4Apdf9LwAOxBmDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dcxtg1mlIwFBV8d1utyw0DFcgLTEi+QVV3rMdxxq1pAN3C5R02dx5LmG+5EAuz+oVLcXnHoLLceVRj2ibOM3EYy6+yinPuUPSxghNLcBGMc1jMcp1UowySUYubg4cjRpiPQz03N9Bqlv8uH2r/j/r31uM8Dq9AgpvmkJAwJIMjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=msGOwrwJ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5533a86a134so5994034e87.3
        for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749039366; x=1749644166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rpn5XLuZmuf4jyqtpvFJSJfn3q1HBa9vHQrTSB1V4GQ=;
        b=msGOwrwJIa2KdW9VLT26AhD8GiVYfFxY5JdW2sYHOmqJF0O/abqPhJKeaDkjpS7VD6
         8a3OIXXKe0ruSRnI25E6mi5gb2MqRofs0I7mEdOYfJctoKN9odN3YIlIzFXJLHB3qEbH
         vHaK1eefl/UfZzfObW6i1AtniQQ7lzMIII5rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039366; x=1749644166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rpn5XLuZmuf4jyqtpvFJSJfn3q1HBa9vHQrTSB1V4GQ=;
        b=BRaMoupAbmo1HLuCg/a3ScWS//+l664g1dP9O+zusgHBz/zG5xxOppU5s0OQGaovNv
         bc/4hVbf+6fyCpP5CkW42fg5erWzGyx4l8buSrVqxlBZAKytjQTEs84xCxajndG0sY/R
         VkebpiankSsqUDSyuRhYWW/fEu1unMbnwESJoL1rKLsvvke65YJ0NRDCPi/YOygpkLRj
         SWNNhsDk/RNX94am967fBje45yrPe4YMqnkR+/vf8q+yz/K2G8DCrNeFpncJkbvWdVaC
         in8LwPIRAjaK4yZlsYMD6wHwjyKZ+/yAa80+ufNuG0BzZS0XPEn+B87Hb5kqAZLqmUJ9
         K9qA==
X-Gm-Message-State: AOJu0YxQHm6tTh16zifcRR94sZ886xMFATG7hhqdaNmTjLdWk48+7wH4
	TyGESXyo9O7B7qfpJ9TvifGUonK7Q5xNsyfc0/PMZUSPgKP8061DIZAE5lR21Jn/VQ==
X-Gm-Gg: ASbGnctlnY6q44syTsArPHvvvUA2nCNcn5rqqm2W4ineAR6iJVagfBBU4gijKCKhOOv
	k5TJdiFkuc+FNkwX54996K/oEJPUzWBKaV8VIbrMYRM5XCz2tLYRTBV+lYhS1B/ITZWISPXhzjl
	t8sOSakelZvUQOKlS4Op3jRBC3y6HeSGYbaHwLxYskf6acoP9bW2lMt1n2SoAc96VIruCd1gJmD
	WV8WhPt02fEVgDA+9bfafhfsmIKBm+zemjid/qE0hTWjVe/E1zoD7y8GdxalC/eVWvUg4R9FseC
	vH34aMrO/QygqIO96TMFm7TNzVN3EXzKvOJar8qnY/Y5TctHbPQSCS0i+kL/ioEIdOq38cFOMSF
	R2wunRtvjKsWyApz1ft8pBjmUYQ==
X-Google-Smtp-Source: AGHT+IF3RtTm2BDDHqCJioBd+yKx4Lso0a0nlgtuzqJjFvwDip15oCrnHIDxvdROipxY74nFayO7tw==
X-Received: by 2002:a05:6512:2214:b0:550:d4f3:84a6 with SMTP id 2adb3069b0e04-55356c040femr799958e87.33.1749039365904;
        Wed, 04 Jun 2025 05:16:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a12ecsm2289134e87.90.2025.06.04.05.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:16:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 04 Jun 2025 12:16:04 +0000
Subject: [PATCH v6 3/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-uvc-meta-v6-3-7141d48c322c@chromium.org>
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
In-Reply-To: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
V4L2_META_FMT_D4XX. The only difference between the two of them is that
V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
V4L2_META_FMT_D4XX copies the whole metadata section.

Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
devices, but it is useful to have the whole metadata payload for any
device where vendors include other metadata, such as the one described by
Microsoft:
https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata

This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
identical to V4L2_META_FMT_D4XX.

Let the user enable this format with a quirk for now. This way they can
test if their devices provide useful metadata without rebuilding the
kernel. They can later contribute patches to auto-quirk their devices.
We will also work in methods to auto-detect devices compatible with this
new metadata format.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 +++++++++++
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 44 +++++++++++++++++++---
 drivers/media/usb/uvc/uvcvideo.h                   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 7 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..0de80328c36bf148051a19abe9e5241234ddfe5c 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-pisp-fe
     metafmt-rkisp1
     metafmt-uvc
+    metafmt-uvc-msxu-1-5
     metafmt-vivid
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
new file mode 100644
index 0000000000000000000000000000000000000000..dd1c3076df243d770a13e7f6d07c3296a269e16a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-meta-fmt-uvc-msxu-1-5:
+
+***********************************
+V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
+***********************************
+
+Microsoft(R)'s UVC Payload Metadata.
+
+
+Description
+===========
+
+V4L2_META_FMT_UVC_MSXU_1_5 buffers follow the metadata buffer layout of
+V4L2_META_FMT_UVC with the only difference that it includes all the UVC
+metadata in the `buffer[]` field, not just the first 2-12 bytes.
+
+The metadata format follows the specification from Microsoft(R) [1].
+
+.. _1:
+
+[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
diff --git a/MAINTAINERS b/MAINTAINERS
index 137122d3dc4e46194eba1c4e035e24b203ed46c5..939def0992c259655c3ae1cc8a757ce53e9c650e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25215,6 +25215,7 @@ S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
 T:	git git://linuxtv.org/media.git
 F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
 F:	drivers/media/common/uvc.c
 F:	drivers/media/usb/uvc/
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6b70c5ba16bcba9e0741231231904..df3f259271c675feb590c4534dad95b3b786f082 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -63,15 +63,22 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
-	u32 fmeta = fmt->dataformat;
+	u32 fmeta;
+
+	if (fmt->dataformat == dev->info->meta_format)
+		fmeta = dev->info->meta_format;
+	else if (fmt->dataformat == V4L2_META_FMT_UVC_MSXU_1_5 &&
+		 dev->quirks & UVC_QUIRK_MSXU_META)
+		fmeta = V4L2_META_FMT_UVC_MSXU_1_5;
+	else
+		fmeta = V4L2_META_FMT_UVC;
 
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
 	memset(fmt, 0, sizeof(*fmt));
 
-	fmt->dataformat = fmeta == dev->info->meta_format
-			? fmeta : V4L2_META_FMT_UVC;
+	fmt->dataformat = fmeta;
 	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
 	return 0;
@@ -106,6 +113,27 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 	return ret;
 }
 
+static u32 uvc_meta_idx_to_fmeta(struct uvc_device *dev, u32 index)
+{
+	switch (index) {
+	case 0:
+		return V4L2_META_FMT_UVC;
+	case 1:
+		if (dev->info->meta_format)
+			return dev->info->meta_format;
+		if (dev->quirks & UVC_QUIRK_MSXU_META)
+			return V4L2_META_FMT_UVC_MSXU_1_5;
+		return 0;
+	case 2:
+		if (dev->info->meta_format &&
+		    dev->quirks & UVC_QUIRK_MSXU_META)
+			return V4L2_META_FMT_UVC_MSXU_1_5;
+		return 0;
+	}
+
+	return 0;
+}
+
 static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 				      struct v4l2_fmtdesc *fdesc)
 {
@@ -113,16 +141,20 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
 	u32 index = fdesc->index;
+	u32 fmeta;
+
+	if (fdesc->type != vfh->vdev->queue->type)
+		return -EINVAL;
 
-	if (fdesc->type != vfh->vdev->queue->type ||
-	    index > 1U || (index && !dev->info->meta_format))
+	fmeta = uvc_meta_idx_to_fmeta(dev, fdesc->index);
+	if (!fmeta)
 		return -EINVAL;
 
 	memset(fdesc, 0, sizeof(*fdesc));
 
 	fdesc->type = vfh->vdev->queue->type;
 	fdesc->index = index;
-	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
+	fdesc->pixelformat = fmeta;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e..2b6d9ddc18e751bef4d295439c460b741d1a1a2f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -77,6 +77,7 @@
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
+#define UVC_QUIRK_MSXU_META		0x00040000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 650dc1956f73d2f1943b56c42140c7b8d757259f..ba508f7fb577021497009ab23a7be5add23fd08c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1459,6 +1459,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
+	case V4L2_META_FMT_UVC_MSXU_1_5:	descr = "UVC MSXU Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9e3b366d5fc79d8a04c6f0752858fc23363db65c..75f2096b2d4fed5e0235ea4732d35044ff77a98b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -861,6 +861,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
 #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
 
 /* Vendor specific - used for RK_ISP1 camera sub-system */

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


