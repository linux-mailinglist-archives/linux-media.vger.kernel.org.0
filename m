Return-Path: <linux-media+bounces-35103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309AEADD042
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0972216C9EC
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2D12E6D3B;
	Tue, 17 Jun 2025 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m62iDcO9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6942DE1F1
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171359; cv=none; b=MOFDGhlQcdCldFKjqCBmn9pWJ8b0JDbz9zD0qxWic82GvitkuMxBmMgo0MnhzVwlkh6y/n4Vm4uROQL8jlR/Fk5z+xbFh4XiHnfcM95bRTmuHwyy5l4BixffTZh9txagD04GkCf4w9G/xDm9ev3F0+TSjdCTukwM6Qp3fGxYuuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171359; c=relaxed/simple;
	bh=UAPmwt3iH+Cs9isdHcsBzKLNaOICZcEJlQI9RpiBp8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TR5hYgpWpg6LEVxxYM4T51IVAHUAse3ZxCbYrxfjyQuvxw+qKrbTa8cVPa3uN4R1sOL8Wt1ju4jp2kzeXD62M//pSMlRyOKDC1i9z2ERMHJEvmBxk1f85RZnSi3I5avSX7EOl9AxxrPYDTzigJzAewdAI+6zpSWKJ8+7hUBldw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m62iDcO9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b51f5218so4126163e87.0
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 07:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171355; x=1750776155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlCjqI7FmvJseGiDys0Kb0VXecdhOxVjhLPyLYz33Ng=;
        b=m62iDcO945c6qcvtEjrr3OlbcuEGOBafiUm4NZopLRsRu/LZyzNLa2U7Zn6emsI3Qf
         SU48jV/MFbeGVDqmHAqut2oCzJ1lQVIvBOmP71fEVEkpCkWTpqG5HlMx3x5RjjBrjAqu
         ie1/kp8kGDgA74qkF8cpwvN+7dL/rGBtcHmMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171355; x=1750776155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlCjqI7FmvJseGiDys0Kb0VXecdhOxVjhLPyLYz33Ng=;
        b=LqS7/EOPz2xsC8WGfNyKxD6pt8NjnnnFlqltAmxDX12ZZmQ9pbb//3GSly93LN0D5i
         z0pVArwa99yX2A+YYtoPMNnjzIymOH/m16IPUuwyQFb9wNQRrnhjr4lRoSk4m9q9Wz8e
         vQsJn6OW1FVonW2FbiXTM+2Wfu2DrfzPSDu0S256e7rZZxfo5k6W6ni2FWq5uvUY9jXp
         BFeYb8kc8QETUt+WEpQ4s9ECWOtW5Ocl+jvLhEw+DsuDy72FlVjMpkO9jeDpf0BrAfCF
         WX6dm1EXWm/mzVSUBM+W3Tuh+tk2NODqZuC8/qTYludkLb1rrwP7/GXaXqzrZYHO801n
         kvpw==
X-Gm-Message-State: AOJu0YwI+s5tSeqkasyI0Ap7DjsG0vLftrXnYjvKtiZgygJUgWkyfGPH
	/vHg+N+A8SWJpt77Wb3VEuykvaNU4Lmh/nce36vbDilpuPUm/SBis6mwtFEok4tEvw==
X-Gm-Gg: ASbGncsbicttKjufS6C0vSYJxanJFWfl5gdh5RlIcz95Aiy9slG6wy1lJ1PIqfcH+aX
	JUw05dHZIxAb+I5NiBkuN6tFfTBGb4LwBWvP8DJhezoETC38LtlMcN92ITpDUF+bwpgfTLoAfBc
	5CG2S7JDZue34tEo/TbvbuWa2iLMkfOsjkW8SgxoPZeZ3pgh6OfWJ3wyQ/2hifanXWeh/y1nBCG
	kyxLOZYtDBGPyvIL/kiVK1i6yHyr+YSSKueMlqXXQYXzvjAhc/Ms7kOPIHnbUccVSK1ZHTrODKm
	R1b6m0eLeAFFUtlpkgNUr3Hg2gaDM/vKo9wRnNBZrhE2W+GCndurAWaP7pEqtqXI/uFJXOzXnr+
	zyfuDt2k57Ks7OwdEtFAOGxPY6NXqwUTNYYHKX6xbGQ==
X-Google-Smtp-Source: AGHT+IFOa0lT9/wH7oPTGOZ5fZxCbtx/o8fZq1vWuxTWtxH1WDR/Km9QErrD0MqUbFwdVLk0JHfBOg==
X-Received: by 2002:a05:6512:3b91:b0:553:2ef3:f73f with SMTP id 2adb3069b0e04-553b6e77063mr3653743e87.3.1750171354517;
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:25 +0000
Subject: [PATCH v7 4/5] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-4-9c50623e2286@chromium.org>
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
 drivers/media/usb/uvc/uvc_metadata.c               | 20 +++++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h                   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 7 files changed, 46 insertions(+), 2 deletions(-)

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
index e8f3dc93a56921924f57e7d5a03ea2fa182a4448..87101630e528297c57b22ffc2fe553e3864d25cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25816,6 +25816,7 @@ S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
 T:	git git://linuxtv.org/media.git
 F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
 F:	drivers/media/common/uvc.c
 F:	drivers/media/usb/uvc/
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index bc84e849174397f41d1e20bf890a876eeb5a9c67..b09f81d907d64f7d7a3b0dc52de319879b7e68be 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -190,13 +190,29 @@ int uvc_meta_init(struct uvc_device *dev)
 	static const u32 uvch_only[] = {V4L2_META_FMT_UVC, 0};
 	static const u32 d4xx_format[] = {V4L2_META_FMT_UVC, V4L2_META_FMT_D4XX,
 					  0};
+	static const u32 all_formats[] = {V4L2_META_FMT_UVC, V4L2_META_FMT_D4XX,
+					  V4L2_META_FMT_UVC_MSXU_1_5, 0};
+	static const u32 ms_format[] = {V4L2_META_FMT_UVC,
+					V4L2_META_FMT_UVC_MSXU_1_5, 0};
+	bool support_msxu;
+
+	support_msxu = dev->quirks & UVC_QUIRK_MSXU_META;
 
 	switch (dev->info->meta_format) {
+	case V4L2_META_FMT_UVC_MSXU_1_5:
+		dev->meta_formats = ms_format;
+		break;
 	case V4L2_META_FMT_D4XX:
-		dev->meta_formats = d4xx_format;
+		if (support_msxu)
+			dev->meta_formats = all_formats;
+		else
+			dev->meta_formats = d4xx_format;
 		break;
 	case 0:
-		dev->meta_formats = uvch_only;
+		if (support_msxu)
+			dev->meta_formats = ms_format;
+		else
+			dev->meta_formats = uvch_only;
 		break;
 	default:
 		dev_err(&dev->udev->dev, "Unknown metadata format 0x%x\n",
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 502f1d5608637cd28ce6f01aee31c4f5df160081..3578ce72fb6a1153ae79c244ec10093e8efdd739 100644
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
2.50.0.rc2.692.g299adb8693-goog


