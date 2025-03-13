Return-Path: <linux-media+bounces-28143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CE8A5F3D3
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 13:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9060165847
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5D9267706;
	Thu, 13 Mar 2025 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Awowln0p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296ED2676CA
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741867595; cv=none; b=jSd14KmEbFNcKe6TyHMSLrGLXsWFMB7r7LkpK7Kz0gxrFL7rrGcFsSz8R0vXkbrmQSFOEQsPj1z6tXs/n0NH0hpvlF/FpfJ4ldll2qc0YAjRNfFyCfVuZTalL4WGberU3SnRc0d2PH9zUGbCj4DYgjCMmDysPpYd949YDnq1n0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741867595; c=relaxed/simple;
	bh=29pelfkmcmoRIGGzeUx/Al0wDWrgyoW69zhwYaoLsnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7n4HXYjpO/flDOqREW2y5IuaHImnjoakjaMprLk+T5i22qaZ42AtvUmmOgfZAhkW/IcPEcww5EMPC/P+oO0gLTvWUF7uufD94HT+mYsp4K3NNG48i8JXjiQCm9CbalWYsu8573oOuiZhbibbha4GPa6soODrP/y26zvBOIpCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Awowln0p; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c547932d2eso51012385a.0
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 05:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741867591; x=1742472391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoMekbFYiURjA/Ma1CHI/wWtmP4OuAXoPIc+PxHPaU0=;
        b=Awowln0pcLe8sqlxpsgXU0xKki8KB4hj78pNOnBk44yd/61ft4KEy/t5uSx4h29dOy
         vaBAnyLhzBjrbu3TLbNulLJgJIpkeIp1AUB5V5lj1Gb1OujcRcD9HDwj7bwzR1Ru++Db
         tGY+1h2zdxVh7XkEoCqeaXICwJP8dbuvWKdIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741867591; x=1742472391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoMekbFYiURjA/Ma1CHI/wWtmP4OuAXoPIc+PxHPaU0=;
        b=qgdugONU1WHYbpqvpMI5rbzQijM00H35Xby3Z0GhB3Cw2O4gawj9+b/CyVYpAJG8Iw
         fIn8g2mx1mfBfTp8zg11pgq+iIGi906/TCtrKlTr1y5dUbFw2w65pq4P/U5ovYT8FwXs
         xvYY5qDiTNzjXo1HOmB7ANQGCIL1Wv8CrG9F+PWIOrEfgOAXwE7MNDh5MIF9GW/O+Uz8
         1kGDngUzZWd34/X7MQ+u21axV9RSLxDAHaYeCy1uLVg1k75RFEFOFeeoCtbNDKzpjmNe
         1TRNIXIFRYRjZ0U0bAOEI40QVvWCfU9524W9ANGmQHj4upeEtSfWs62xeu9owGrcXkCt
         YfNQ==
X-Gm-Message-State: AOJu0YwumNd7EulJDOdqc0cjMQ35qFaEEWb+cb14nczAiUA+9AWUdH5B
	zIEm3D1hXQ21lpZb6cXZX4kEoLmK/G/GUcKpNLl01CHNALVQnuvJgydUDsZPuQ==
X-Gm-Gg: ASbGncuAwjLMrgRyAq5UTJTonsAfbME1apjYXcgDPDe9tMfgkeBRIChKXPGHIwQfXBk
	4kJx2yv1D+wK5+dCzoKkBTlwRMAwt/ib60g3jIFwflw/SRmD9ibx0ZKprbsoHEf0hMZiNzPRgIM
	I5JcVi75gvVTa4JJPf0IUIA7DfhohG19MCUMZ7KPv0Lar4nObu/4/zkNsmeNR8lBlkuKH/WOTrA
	vJnb4QmCwpOqvxZqbw4466w4BkEoSB36WHbNxQcoxPiiadNBfEXn0jYTzmaPuxiPG4pWf2ou/n6
	gEIauSms9mdY0I9G/6k1OqVLqmU+jZhPNWRzKVDSZ3Wa6DsX0MerQ6DBIU/65YYKgObbTKFCOvv
	HreYcjui7MYToZQUOmxrPhw==
X-Google-Smtp-Source: AGHT+IGTlig8kmYrtdA9vFKMK5hVn4z1GSGbEe1Xa8zAMYN41pWD/i7Dx4awPb0ofXtkDJoOxZfLag==
X-Received: by 2002:a05:620a:6083:b0:7c5:6678:ab18 with SMTP id af79cd13be357-7c56678ae0emr1320035285a.42.1741867591068;
        Thu, 13 Mar 2025 05:06:31 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c4db57sm92117685a.8.2025.03.13.05.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:06:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 13 Mar 2025 12:06:27 +0000
Subject: [PATCH v3 3/3] media: uvcvideo: Introduce V4L2_META_FMT_UVC_CUSTOM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-uvc-metadata-v3-3-c467af869c60@chromium.org>
References: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
In-Reply-To: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
V4L2_META_FMT_D4XX. The only difference between the two of them is that
V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
V4L2_META_FMT_D4XX copies the whole metadata section.

Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
devices, but it is useful to have the whole metadata section for any
device where vendors include other metadata, such as the one described by
Microsoft:
https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata

This patch introduces a new format V4L2_META_FMT_UVC_CUSTOM, that is
identical to V4L2_META_FMT_D4XX but it is available to all the UVC
devices.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../userspace-api/media/v4l/metafmt-uvc-custom.rst | 31 +++++++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 40 ++++++++++++++++++----
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 6 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 86ffb3bc8ade2e0c563dd84441572ecea1a571a6..9fd83f4a3cc8509702a2a9f032fdc04bf6c6d1bc 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-pisp-fe
     metafmt-rkisp1
     metafmt-uvc
+    metafmt-uvc-custom
     metafmt-vivid
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
new file mode 100644
index 0000000000000000000000000000000000000000..9f150fc2b6f379cc4707ff45041dd014956ae11a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-meta-fmt-uvc-custom:
+
+*********************************
+V4L2_META_FMT_UVC_CUSTOM ('UVCC')
+*********************************
+
+UVC Custom Payload Metadata.
+
+
+Description
+===========
+
+V4L2_META_FMT_UVC_CUSTOM buffers follow the metadata buffer layout of
+V4L2_META_FMT_UVC with the only difference that it includes all the UVC
+metadata, not just the first 2-12 bytes.
+
+The most common metadata format is the one proposed by Microsoft(R)'s UVC
+extension [1_], but other vendors might have different formats.
+
+Applications might use information from the Hardware Database (hwdb)[2_] to
+process the camera's metadata accordingly.
+
+.. _1:
+
+[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
+
+.. _2:
+
+[2] https://www.freedesktop.org/software/systemd/man/latest/hwdb.html
diff --git a/MAINTAINERS b/MAINTAINERS
index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..4e8e8096951ff0e7159d7f3916cf7b014a6ef95f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24665,6 +24665,7 @@ S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
 T:	git git://linuxtv.org/media.git
 F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
 F:	drivers/media/common/uvc.c
 F:	drivers/media/usb/uvc/
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6b70c5ba16bcba9e0741231231904..b257524d279a141f650e2fbb376a35cc17252c2e 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -63,15 +63,21 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
-	u32 fmeta = fmt->dataformat;
+	u32 fmeta;
+
+	if (fmt->dataformat == dev->info->meta_format)
+		fmeta = dev->info->meta_format;
+	else if (fmt->dataformat == V4L2_META_FMT_UVC_CUSTOM)
+		fmeta = V4L2_META_FMT_UVC_CUSTOM;
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
@@ -106,6 +112,24 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
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
+		return V4L2_META_FMT_UVC_CUSTOM;
+	case 2:
+		if (dev->info->meta_format)
+			return V4L2_META_FMT_UVC_CUSTOM;
+		return 0;
+	}
+
+	return 0;
+}
+
 static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 				      struct v4l2_fmtdesc *fdesc)
 {
@@ -113,16 +137,20 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
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
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a16fb44c7246e35f3710306fde5dfc15329b4d95..1ffbf38823b226ff7044c798c4b982d52137e904 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1457,6 +1457,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
+	case V4L2_META_FMT_UVC_CUSTOM:	descr = "UVC Custom Payload Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c8cb2796130f8d1b864d669267d2b31f73b839aa..b0af18b7621296be0885d5b65494ec01bc425c9c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -851,6 +851,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_UVC_CUSTOM  v4l2_fourcc('U', 'V', 'C', 'C') /* UVC Custom Payload metadata */
 #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
 
 /* Vendor specific - used for RK_ISP1 camera sub-system */

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


