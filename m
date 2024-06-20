Return-Path: <linux-media+bounces-13790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B8C910229
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 13:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9FA0282A92
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8C81AB37A;
	Thu, 20 Jun 2024 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="es5TNrgx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC50515B118;
	Thu, 20 Jun 2024 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718881689; cv=none; b=lx6ABHGrVNe8QhiT95r6tfZe/MM4KAzS1ZTYB2T9L6AH7UI54muBCyBUEH+nv5z8Po3PpP99zMbCoyQjCyd4E3zmZCmyUsWsrN/o8t+M7qznbuaz8BeT6CUekFX5i15dCO7PHfzcIHM280XrKh1nIWJ7hKxAJQD6tXHWEFmgkDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718881689; c=relaxed/simple;
	bh=dkciKZ2czVyXoXQEJLApgDJKl8vul98p+Hbzt6azbQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2wJ2Z/zYMtTpgzWR4gr2VBHD4udBIxwptuSQvLUi5hR05feY/5fS1qw+ppTN8++9kQ/39B95eJHQgQO185wj/ZWnjQHVsrf6M0GSJpDgGlpTllx9yrIvyh6C95eFCxhHlfWnK0WPdFUnxwSC51r6aFpsFNlgh81WS+DgtNHmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=es5TNrgx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 492B2BD1;
	Thu, 20 Jun 2024 13:07:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718881666;
	bh=dkciKZ2czVyXoXQEJLApgDJKl8vul98p+Hbzt6azbQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=es5TNrgx2LsUfmhfaZz42V4tMow5d8gLh3+zEC8HlfV6VkWzmuPe18LRyiZlOU6Oe
	 zblsI6ZkFhQrCC0jnyndVRry96/N3kO/q3mMP2CYUwOpixjLPVBwkt+xGS20ZIt8i6
	 NxpJnWEYTpjFcsmja2XUdQqA0y9z9ORASD9LKg7c=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Jun 2024 14:07:50 +0300
Subject: [PATCH v2 1/4] media: uapi: Add meta formats for PiSP FE config
 and stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-rp1-cfe-v2-1-b8b48fdba3b3@ideasonboard.com>
References: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
In-Reply-To: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 20240531080707.34568-1-jacopo.mondi@ideasonboard.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4361;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dkciKZ2czVyXoXQEJLApgDJKl8vul98p+Hbzt6azbQ4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmdA2RN2JyKlA4oCRJH49YI7sOZtb17AVdYbVYK
 /zA8wEzZ/SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZnQNkQAKCRD6PaqMvJYe
 9XCwD/0dM504PanpR3R4SzT0xiKp0rvstTplyAPyZM5Z890wkDTKrt9B+96oKueUq/B/TZwo9vH
 qjAZ+xvaN8yseGnOoZo4jGpTck7NtYWlMlT5slg+oWVjM9yALWiLvx00k3SyXXM0KYFerMXnAcV
 n0yTLVZ6wTjSF32VeUmBSOPIKGhdJNfncvgHtmNbeDXTyhxO38FBq4ZifZjUggMULRVY6AUFPfu
 Y0lIDDgGzscxkgKJ5gKkPga1xtbttKP1TCXCqqIN0D1GKwhJ7Uip3FZzSi1ZuX9J08cvli1eraV
 L1K2uqkz4oiHJKmNIg3SnquKO0TB+TQ7/Kr1917ldMy9jem7Sgz7+rhsPxvuMmxkL+V/nb+upap
 0AyY5HjYWsBRyeG3D9bI3MC+u9I+beg9Mkq1ng/zJA4bkYTUlQl7tMvyI6d1IiHx1sAMVWfVuAn
 55pAdxQnAI1OuPw1YeceOSwccLZNYv4QrALST6ObmT/1VRBjoNWbRNeXTmy3VtBiTltQ0L9mCVU
 A3Eu7BcMm/aSU14k7hELx2UyhPeRbiSUgx34mE1bxoxZ9Eju+KFJ6/cyscSllFkfYhtSgKEkD55
 rDfV4sPIvlfWWW7qwLPewzaZOTvp7Av7fIe8PjZU26OFt4hl6F9E5iJMKQNrIyZekkZRqCZs/MD
 MqrZh/CjH8ZukjA==
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
2.34.1


