Return-Path: <linux-media+bounces-52494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPxNE9zqimlEOwAAu9opvQ
	(envelope-from <linux-media+bounces-52494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:22:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D23611836A
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F83F3007AEF
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 08:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D41633CEBC;
	Tue, 10 Feb 2026 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M02JaPxo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F8C2DAFD5
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711766; cv=none; b=EgU9xI0+IhviIfKU8auaGBgMPAgoO87kA6mVCycoVGzKRAmy4E2i1XGp6JtFrL3EwJeytdtU3UK5cEKHE/CXVEgVDPZCJhhHGqRC2kVesX8LmgSqPT6bfiiO69n9MMwUYGJ3lkz3+Ia1XIAtaP5stqgOt93KYlKOwCOso7Jqinc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711766; c=relaxed/simple;
	bh=spC6e00DeqGGAXkfdRmYQho9ysO900oti327ddZBI24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WEjDjTRLHu8uq5uHYTrIgieyAzgB2/ZeOmF82+E+K185gVTMoT1llkhRUE4Lj/pefhOrE4OHgVvRrLk7Yg4jU+EYVY4xEI3Daa4C4pSy5z+9VldiiMAev2OoSOaM3UjQeMu4PtFY9iHRh1HfQpCQGxpOVcrRuyNEu/DVUfdmJ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M02JaPxo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:2edd:807a:f3c0:8d1b:28a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2505E47;
	Tue, 10 Feb 2026 09:21:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770711718;
	bh=spC6e00DeqGGAXkfdRmYQho9ysO900oti327ddZBI24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M02JaPxoGSurQ1lU4EQJHAV0G1nG3aktF5BVtavrJUdeAIFYLNec3MkhLiR54ORts
	 JSauQHeHXSKa+7zV9UtZZAPuH2Qd3DIw76Ua4d+NlyHnJOsy+zdEtKN6W371JHGu4D
	 omHaSeMLGVPJP2rf6NGyrO7gehotj5lXWRhc4WsY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 10 Feb 2026 13:51:23 +0530
Subject: [PATCH v2 6/8] media: platform: broadcom: Move unicam driver to
 subdir
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-b4-vchiq-isp-v2-6-4403944152fe@ideasonboard.com>
References: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
In-Reply-To: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5508;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=spC6e00DeqGGAXkfdRmYQho9ysO900oti327ddZBI24=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpiuqrq6Ms5qdvmlOMxeSds4jO+0K/qyb045DV4
 NJAUFotZkCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaYrqqwAKCRBD3pH5JJpx
 RXirEACO1yXxoBCS71+AWm4/S07kBloTwMeNdh/kk7nxATDnEqahk71m0wBD+hFVy8mrB+AmVrR
 +gP+msNm4/s80KA+9+ETihwtMVc546wOct1Z9kW8Qw7I3g7JLIrES+iadrpi+hXwPtzmEhwKwin
 1tDway5BJd8r5HRqsFHJXpWEUnfPydcDVd2Tuf5mtFxWefGbWZrfxOuuAiNcAtjtJcB+cgh0NyQ
 K9i9CGdjL7bOqmG0cobMplSPBxXskerUFW1GdKEh0VNPkY4rMtj0yeMoZ0s7VRD/2KHG4eGIHMN
 Uih6SyU1r8cFGNoSZDt4KcDPea/5HaivoGAeCKB/kTdv3N1JiOHrro9cgj78ywe6w2NZubFf6kO
 c24fDWFtcEPlLDPuxvUqrvjSa8Bj+InnJ8EoeFpHEhTmZxCo2Vfk/JQpGWunDCHl2dS2c0LGAq3
 JfVWtzW+AqbJMSgQi23E2Mxaf+087Ry80vu5jajUgziWFKMYlfCxkkLcqY2iU1cPYnGK8FbIhIm
 BFS0JxeKBAmE4k/I85g/1VxSHQweTlj2i5QGHmbj3hV+0WqS+XHSYlljGcI7nEUcg3+gIlYL55h
 ywn9z+5Re3+phEYKJTQSr2X6Rk1vXOBqE7IqmCq0MNP+zftNJh3DI+F3J+mVn5jLLa0bIXTGd2z
 KJanJI7kFPmAhwA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52494-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,gmx.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,raspberrypi.com:email,hauke-m.de:email]
X-Rspamd-Queue-Id: 5D23611836A
X-Rspamd-Action: no action

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
index 34f779679f1d0eff4cfbdc2533db153fb5f8fe2e..e9e8e735ecb2057581345fb7faad6608849fc3bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4956,7 +4956,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
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


