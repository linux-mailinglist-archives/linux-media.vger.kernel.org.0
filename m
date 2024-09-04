Return-Path: <linux-media+bounces-17570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB9D96BA5D
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE8D1F21408
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F381D173B;
	Wed,  4 Sep 2024 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n4YSZbOf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C81CCECF;
	Wed,  4 Sep 2024 11:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448781; cv=none; b=EyMTXX6BCNz4WioNL3g0A+T1ZrvWIFIMJE8vD7qVjcol3TtV1cV/I22DaQdQ+Tk/jnlfJ1vEStl1mH5Ld44i3xBZjbwy7W9n8IKpHSrr66G/cNgfiCHKHUwfsKAkYzXzeQ1F+64DlYW1E6REhHNDhsNN+VNUNjxaA+h1AFuMJAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448781; c=relaxed/simple;
	bh=bn7hb6abGotN+zJtZ8HsRWN0WBNQG9WEsGLPob3ZvdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imZ07L1gCgEi5ADfuaF0glmZRKV4WkbU6oVtHk1v/IoCbFFLzSqbcSbniNkr4Kx1C4/inEPjHJ1JZVwhcNLfyGUVRPKFs3IAHPf0ydPzr7qzplpA8ijBB6j62KLiCU0wjkanXojEftAVhP3Xj0yAtMugEOXSheDtvb2wH6ITQZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n4YSZbOf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8796C51B;
	Wed,  4 Sep 2024 13:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725448704;
	bh=bn7hb6abGotN+zJtZ8HsRWN0WBNQG9WEsGLPob3ZvdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n4YSZbOfiZ9H/SMkZPRIoNW/IxrOE3a/V/JQpU95F24Iw4QnNc0l+IvfNl0aRJW5p
	 AMyJMk114cMEKg0CjsgO08GIZrnawngYereP76C6yc3AQm/nrfXHmcQwVGUZNX/7Mm
	 ad7FEt3O7GN/JVFJDg39XaalP2b+8tbQzG5SKKuY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Sep 2024 14:19:09 +0300
Subject: [PATCH v4 1/4] media: uapi: Add meta formats for PiSP FE config
 and stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-rp1-cfe-v4-1-f1b5b3d69c81@ideasonboard.com>
References: <20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com>
In-Reply-To: <20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Naushir Patuck <naush@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4361;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bn7hb6abGotN+zJtZ8HsRWN0WBNQG9WEsGLPob3ZvdA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm2EJDOwXRX+xHwDG2BOsiTn0H6nUrloXY69KNZ
 1GYTh75s0CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZthCQwAKCRD6PaqMvJYe
 9T2WEACABRASqiUMTc7m6wO/CqZGcdqkC2nTMyMx5mgrNglC+YGB2TdwTwB8V0deuYEt0x1/SYk
 G06ckerjNYhyDiJIH5ot6kBLCQT3Dj/RX22XmPWf2dIzokGqWl+/+/3QQnUhz+i1qGfi5OpaznI
 tbdMt+79hfmkWLxjzMLpqVOg+xAZtT+M1W1e3KIn3mRaq6k92N4VNUUW/7JgfDbtFIwbwJvK1Le
 AVIXxAnEkaJM2ev+Ybp8zJcWscDHbi6ANd0dDVWKUe8Eb2/lxvDTzkGgh6sSEVYGdQdXnUK11ZO
 sfm92jBjQkCSUrz+vJSOSrP0Y3Cng2aiyyyCnRzmArUB0/jCgFEXygIwDl59KoI5hDkFVAmnbWR
 UN6+mbUbDsxUzCEyOplxfeUBeBsJGtArGF0taj4vZwOPn39cWipszBRkJfrCzQZa7hmrQMg2KHh
 qyIudykE/52welkNMuHuGmu64pDpck400SeLd3+75u7SI2QFZD0uOC1t+0HSHjPHxcvjR9uK1Fb
 H1E1nCiP//Ik9lpKw7frp85hIMggk7CrlP8yMvCbqhHLzRjPB28zn4Zmh/ir0gPv0WHJmiSFEQH
 ivtNxMmwn/Riyat1gRNrE/vstrLjlEWn0JrRey3IDJtEg2Hsvov9b23O1VHF5wzu+I7XWCpObLd
 d5A+pSCjc+7WpXg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add two meta formats for PiSP FE: V4L2_META_FMT_RPI_FE_CFG and
V4L2_META_FMT_RPI_FE_STATS. The former is used to provide configuration
for the FE and the latter is used to read the statistics from the FE.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../userspace-api/media/v4l/metafmt-pisp-fe.rst    | 39 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |  2 ++
 include/uapi/linux/videodev2.h                     |  2 ++
 4 files changed, 44 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index c6e56b5888bc..86ffb3bc8ade 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -16,6 +16,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-generic
     metafmt-intel-ipu3
     metafmt-pisp-be
+    metafmt-pisp-fe
     metafmt-rkisp1
     metafmt-uvc
     metafmt-vivid
diff --git a/Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst b/Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst
new file mode 100644
index 000000000000..fddeada83e4a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-rpi-fe-cfg:
+
+************************
+V4L2_META_FMT_RPI_FE_CFG
+************************
+
+Raspberry Pi PiSP Front End configuration format
+================================================
+
+The Raspberry Pi PiSP Front End image signal processor is configured by
+userspace by providing a buffer of configuration parameters to the
+`rp1-cfe-fe-config` output video device node using the
+:c:type:`v4l2_meta_format` interface.
+
+The `Raspberry Pi PiSP technical specification
+<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>`_
+provide detailed description of the Front End configuration and programming
+model.
+
+.. _v4l2-meta-fmt-rpi-fe-stats:
+
+**************************
+V4L2_META_FMT_RPI_FE_STATS
+**************************
+
+Raspberry Pi PiSP Front End statistics format
+=============================================
+
+The Raspberry Pi PiSP Front End image signal processor provides statistics data
+by writing to a buffer provided via the `rp1-cfe-fe-stats` capture video device
+node using the
+:c:type:`v4l2_meta_format` interface.
+
+The `Raspberry Pi PiSP technical specification
+<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>`_
+provide detailed description of the Front End configuration and programming
+model.
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5eb4d797d259..95c2c4a97966 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1466,6 +1466,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
 	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
+	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
+	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
 	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6da..9f68cd55248f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -857,6 +857,8 @@ struct v4l2_pix_format {
 
 /* Vendor specific - used for RaspberryPi PiSP */
 #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
+#define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
+#define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
 #ifdef __KERNEL__
 /*

-- 
2.43.0


