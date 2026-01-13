Return-Path: <linux-media+bounces-50527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A55D17891
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7166D3026972
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D323815F6;
	Tue, 13 Jan 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="adtjrQHh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072B03815E8
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295299; cv=none; b=m90akfi8A26T3Xl0l+ClVsr7hXm6r9A2MFX5a2KTVAKUPLJkbVBVDk8Lai4f0UznhovVYMWlPOtVLa25xA10sNGar9ZrKuiAIy2zPsHmsA/yLD3zJOy35B5ZrrTuA3X7jvWTjOFdZ/D0feKDz1FqtOq/epN/0WqKZaOu8GY9jmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295299; c=relaxed/simple;
	bh=0jRVD9lRqPqQavbPSY7VnC2DgLt9Tcwywl5tCeyiV1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUS3wVtF7V/dOWDQyDesR11uWr1fN6h5i0wFEHrxdBPAE2P/2D8YCVR9elqoPq9fBQ2eh509pbMcywjfz69OcOqvnS3FwQcfAF+Ngc395gKL6wzk6sgaO96ZK74vYIFVoB9FB1ZKNPh0ttrcsGqPLQ3HyYamPUG+vJug7ylFUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=adtjrQHh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 615C3316;
	Tue, 13 Jan 2026 10:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295268;
	bh=0jRVD9lRqPqQavbPSY7VnC2DgLt9Tcwywl5tCeyiV1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=adtjrQHh3OIGL95zQmfbNv2Tg0NQ8WMMlVprrfNfA2Iy6q9FaZZCQIUhffOpmqO6F
	 gAu4590gAGK8aMpYixfmXOBcymSAs/8vsjPvhRiADBtDp5zo+c5hFeAkdrXUO6Wedj
	 CpoyMZE06IjF2JXkc0gxRmMLi66AyvbtDBmzC/VE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:28 +0530
Subject: [PATCH 08/10] media: platform: broadcom: Move unicam driver to
 subdir
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-8-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5508;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=0jRVD9lRqPqQavbPSY7VnC2DgLt9Tcwywl5tCeyiV1k=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtKJS00Qrf6wZVNJUQL28FiU1tyoQiLGSrdo
 2FChaBJ4zyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLSgAKCRBD3pH5JJpx
 RZJPEACANtzSqDQnPFevKB38UZBofO9YQ55Z54+2VIIEc5qWewvDyzMs/EFg5LlCjJ1WG1CYme2
 tI/CwR8qQ877h+MddyEzwYknYArfFU6ssWvgJbRTYgEsChlS7xhVp1U802U3o7L5RT5Z9ruDcK1
 VaX2aEnPWpZJwcv58QQIaBpCTJ2BCYO2qv2YPjRwChHR0WSzr2m3bxcfacq/qGdWG+2eAiA2Jfc
 8kLsON5r2Q5etIHczx0w5ha6vah3WeAYcbJPNMn/G99Etpn8KTO+XjjIGR5lt8smQNArClWluiN
 AHMa4pX5POoQw/ze/Zt3FaoIcnZx2e/g7ansKDtEvkVH7RfS52z0iGUvAuo4LuLbcBUhErp6Zgz
 Z6ozzXB4pj1fZYSlXFWnU06zhdv342f82iv9q2D18xuhFrgSukNhsHcIxHXZmRjok1zOqmhLccN
 1VhjsRr8hwNuJ9fgv4BTGI1F4NQBU/1gaVTDJgl17bz95euxoXt+x1x+q78Eqtso3whk+eN+oii
 MNUGZvIM3x+EjFVTf3IkAPzDamaw/scr7yarEmAuY+H5EOmGcw9OSdBS+cPoLaM7v59MLYA6i6x
 FPFDYopTOmsQvHP+flJcky2IQHP8aOgsrgJSz3qjYyZiSSaJb8SJgHS+VGJe+AxMfTzPfEmpAd0
 rHTgFlSDvp3NJ0Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The BCM283x/BCM2711x SoCs capture camera frames using CSI-2, and
optionally processes the raw frames using a VC4 firmware based ISP
block.

As the driver for the ISP will be added subsequently, to ease
distinction between the two drivers' files, move the files related to
the unicam driver to a separate subdirectory.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                                        |  2 +-
 drivers/media/platform/broadcom/Kconfig            | 22 ++-------------------
 drivers/media/platform/broadcom/Makefile           |  2 +-
 .../media/platform/broadcom/bcm2835-unicam/Kconfig | 23 ++++++++++++++++++++++
 .../platform/broadcom/bcm2835-unicam/Makefile      |  3 +++
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h     |  0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c |  0
 7 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 16002c21fe06913ed57f495265b0b1ad14772c55..adf1408873f7022f3b08639129c106fb95f8d559 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4952,7 +4952,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
-F:	drivers/media/platform/broadcom/bcm2835-unicam*
+F:	drivers/media/platform/broadcom/bcm2835-unicam/*
 
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
index 32b76ebfcd9a194e285381fc4f1d0fbac7d62b4d..cab44885182ce658fa136e31485913b1f0547968 100644
--- a/drivers/media/platform/broadcom/Kconfig
+++ b/drivers/media/platform/broadcom/Kconfig
@@ -1,23 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config VIDEO_BCM2835_UNICAM
-	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
-	depends on ARCH_BCM2835 || COMPILE_TEST
-	depends on COMMON_CLK && PM
-	depends on VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_CONTIG
-	help
-	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
-	  This is a V4L2 driver that controls the CSI-2 receiver directly,
-	  independently from the VC4 firmware.
+comment "Broadcom BCM283x/BCM271x media platform drivers"
 
-	  This driver is mutually exclusive with the use of bcm2835-camera. The
-	  firmware will disable all access to the peripheral from within the
-	  firmware if it finds a DT node using it, and bcm2835-camera will
-	  therefore fail to probe.
-
-	  To compile this driver as a module, choose M here. The module will be
-	  called bcm2835-unicam.
+source "drivers/media/platform/broadcom/bcm2835-unicam/Kconfig"
diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/platform/broadcom/Makefile
index 03d2045aba2e4dd8989ca35a23e1be4ea1811787..33a89bdb0029bc67d90d16bc0910a681b7675ad7 100644
--- a/drivers/media/platform/broadcom/Makefile
+++ b/drivers/media/platform/broadcom/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
+obj-y += bcm2835-unicam/
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..32b76ebfcd9a194e285381fc4f1d0fbac7d62b4d
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_BCM2835_UNICAM
+	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
+	depends on ARCH_BCM2835 || COMPILE_TEST
+	depends on COMMON_CLK && PM
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
+	  This is a V4L2 driver that controls the CSI-2 receiver directly,
+	  independently from the VC4 firmware.
+
+	  This driver is mutually exclusive with the use of bcm2835-camera. The
+	  firmware will disable all access to the peripheral from within the
+	  firmware if it finds a DT node using it, and bcm2835-camera will
+	  therefore fail to probe.
+
+	  To compile this driver as a module, choose M here. The module will be
+	  called bcm2835-unicam.
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Makefile b/drivers/media/platform/broadcom/bcm2835-unicam/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..03d2045aba2e4dd8989ca35a23e1be4ea1811787
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam-regs.h b/drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam-regs.h
similarity index 100%
rename from drivers/media/platform/broadcom/bcm2835-unicam-regs.h
rename to drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam-regs.h
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam.c
similarity index 100%
rename from drivers/media/platform/broadcom/bcm2835-unicam.c
rename to drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam.c

-- 
2.52.0


