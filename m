Return-Path: <linux-media+bounces-37042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A82AFBAD8
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 20:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5D0B1BC0025
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 18:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C262797A4;
	Mon,  7 Jul 2025 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jj5yW9X2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D157271452
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 18:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913250; cv=none; b=gOF5TuMUKIF54iYecOovClRaTVeQRgmQLIBlHnTvIDr5Q4r4NHRghBy0Y3rrOHRJoSsM+7vSMrbh+fMebXjIT9x6B+uzBD+RR4sLiPkg4XrO/s83R8r4H/y6XgNWqr7Y/kvOfR3L+YUvrJWLDy5ze5tQ3hZbD1/emrT1JKTH3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913250; c=relaxed/simple;
	bh=cMCc/YVoj/o1iMMtqAwdWEEQxRV6brtdDuFTq1NJi20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2tBfSjpzeK0y/BuCqR/UYkMYFYX9nstElUXnowC5dIsSkb0G3UMvzAdzvSMUeHcTI91bBPAUFKRyurPi3vv1d4K/RGS7WsjK9dMYftbSO2FPdQROcK2yjRg+XbDUmqhnzzmzv8mng0x1aoszBgoUzqe/wonGmPBV6eQ6EJsYYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jj5yW9X2; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32f1df5b089so20195891fa.3
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751913244; x=1752518044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6hGfoFapvas+Hz1L3ZuhmMpf2VFQ5l8hbCjstkgFL4=;
        b=jj5yW9X2Xmo4AKbKKzyfApVQngaZ2Q5Ksq2EA1HeYP2pXagqk2VPu52IRuiZWkis9E
         WNf5oTuWUh7sFjgK5egtd8RaF+kcDlGOiRH0yMv8ogHsGqahZz2yOeAcWoXKCnImPsDx
         pMmupqtdmQADK+dcfSDBTrnrS9j8WPCX5mHCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751913244; x=1752518044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6hGfoFapvas+Hz1L3ZuhmMpf2VFQ5l8hbCjstkgFL4=;
        b=jeiOmY640IsevXO36vxHK4HGGR6VmSu+yEO8N8dlyP7FBpz1WI7aiF06e2qQ+6yG4A
         hr9j3PMjjc54iq11QVkrDUQtW8egxKdSQ45kzQhh0MSG7gK6uIwA19W7arSmPdxxBcPv
         ZZ0emTdqSCvwqlCsQr9Q29WEu0CghQCSLOqc7srqupa1IDVKNTuaiRhG8OudBjCxgUOz
         cX+BPnNXTwdkZyPVTgtN1iIFsHGj4+KN6ZAj6yTwl17r0qJ+9XjuqNAXs4BDjbEhgxti
         PWP5CClqgxXf1imXWn2AjB01f45gbcUUm6tt2VN0Ro7oAkhrxhEcmkgiwNtRxoP15i7B
         OGwA==
X-Gm-Message-State: AOJu0YxnTUBc57TIZzy0EUk8TmqW9wrlw5YiAjaDQbAUlZ51R8iduOCE
	QXdTKxmEMsGyjxdIlB8s5zJGYRJs2EK2G53xPGDApHfgVH2qAlXADHN7G1K3cK1zEQ==
X-Gm-Gg: ASbGnctcC8cbKO3yFs2uLSg/sch9HThaO83ZxfbhfTQbj969SuMT8WNtBCLexLBME+0
	dkYpfTO9+4etug/S3tnnwQ/hJ8vCvZTpORLDM4G6ZsEgHyvMk+wj1e3ePI4w6fdK4L3DmgMWUJa
	mepikLuDjHKpjFhO15OpWKdnGQMt/lL/3S6EYLkKMgpST2qfdXCIQGRBXUJRjmzZs8uReL/hv8X
	Ue2yE7AaD6AgkTm6EHHTpnCcmi6mhpIY2aHVetHNNf4pfy+vksS1q09h23tIXzSY3cj830LeKHi
	4pKnPpCXIk8O6Tgtp7WJ2OMPDa7RWWMf6xlWoQsXttCNmM4r75TQpcomg32taKV6MQoA4n0r1lW
	B+zkWwxOL7OTUSpc2SftPsLmQT8U4R/oZnOw8QdPLa7JKTnaSoyMc
X-Google-Smtp-Source: AGHT+IGXpDV/f3jM6ZfbvudPD8pxigPxC7oBSeMClnkzX//m6nh6RDqJosKm/5PF2RkWF3O2NZiKmw==
X-Received: by 2002:a05:6512:10cb:b0:553:35ca:592a with SMTP id 2adb3069b0e04-557e55ce64cmr2739571e87.52.1751913244440;
        Mon, 07 Jul 2025 11:34:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d31a6sm1417630e87.61.2025.07.07.11.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 11:34:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 07 Jul 2025 18:34:04 +0000
Subject: [PATCH v8 4/5] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-uvc-meta-v8-4-ed17f8b1218b@chromium.org>
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
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               |  4 ++++
 drivers/media/usb/uvc/uvcvideo.h                   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 7 files changed, 32 insertions(+)

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
index 658543062bba3b7e600699d7271ffc89250ba7e5..fdde1d37ed2ef9058e3ea3417bec25afe454dfc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25827,6 +25827,7 @@ S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
 T:	git git://linuxtv.org/media.git
 F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
 F:	drivers/media/common/uvc.c
 F:	drivers/media/usb/uvc/
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 4bcbc22f47e67c52baf6e133f240131ff3d32a03..77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -195,6 +195,10 @@ void uvc_meta_init(struct uvc_device *dev)
 	    !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC))
 		dev->meta_formats[i++] = dev->info->meta_format;
 
+	if (dev->quirks & UVC_QUIRK_MSXU_META &&
+	    !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC_MSXU_1_5))
+		dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
+
 	 /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
 	dev->meta_formats[i++] = 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b3c094c6591e7a71fc00e1096bcf493a83f330ad..616adc417c62a58686beccbc440a5dfac0a2d588 100644
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
index be94a79b976e3de4eb957f5d2584ec6d4230469e..993b36417b4655456ce545cb42a41b55b98e4d6c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1463,6 +1463,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
+	case V4L2_META_FMT_UVC_MSXU_1_5:	descr = "UVC MSXU Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 6f7bd38dd5aa4b1b2084685512512a380d76a5e4..863bc5b7dec32303e852d7e9c3891011ce5a3d71 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -867,6 +867,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
 #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
 
 /* Vendor specific - used for RK_ISP1 camera sub-system */

-- 
2.50.0.727.gbf7dc18ff4-goog


