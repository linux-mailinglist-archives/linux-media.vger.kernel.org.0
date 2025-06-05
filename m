Return-Path: <linux-media+bounces-34117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 991DAACEF2B
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E72861899DE1
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBCB225408;
	Thu,  5 Jun 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGqetUg+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D684617B50F;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126426; cv=none; b=KDRDtF3EFqfseiO3bf8ehrLxe1tJU3HgcJQs6qCPvyV3Gb0wHi2ngRgbSoPACrRXWf/6E4XXr9QqFDEK17hCMLydpBR8Lq7UqiVbPGaQPh5Eo8npzW9uTNtjCU2T6jbnb/W2JqvL+5PX6d0FgI/jDyQOSG1BdTl7+E5Ar+fxQbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126426; c=relaxed/simple;
	bh=0t/Pj0E1HAm09Ep6Ym+EnNXhmlhQUHqvu1SyTkbUVMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXuh1z7Xsd82vv+lMMtW2TWEVPJEayx80+nvhtkLjnzJ36jWCIvBMnCIFTCjDQgBxAcNwfRP40cft5pc5DC2sEBSL6v4I1hlIRFie+gSxEq+oNvQ8nqw8rdBLMzH2AThxqnyhMgq4w0PYGwTGcoV5Ec8hvvIe33uqkdlHQSsH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGqetUg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64F09C4CEEE;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749126426;
	bh=0t/Pj0E1HAm09Ep6Ym+EnNXhmlhQUHqvu1SyTkbUVMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tGqetUg+sPTVlOnzWKE+WZLxRH6iB4gzTig0u4pgUkm8SvUyrwzohA8VLI6pBzsyT
	 /MBEdyKs8szp7KXaChc6JuQmgq/Pj1FbmvU+Xbtxx6OgJn9YvQP62ABUXuzK8wpPfB
	 m/z89qHOhRX6o4N9dBP3B5rDRx+PI2iNhL51e9pV4MLKks5LxfXjt1turI96qfByom
	 97Tbk37+gOrBw/HxWLFhitwE08WCB3IP0S+6eMQaAfiy60UMp/+jsy7DUez2e7L12V
	 5R5EAoWqZ7A+/tVCQjpbHxuWW29xjFb5oOBTJiHXJ+Xbpfg4MaC5lRZNBBq+9zcAPB
	 wWWMNb33GJlUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F72C5B555;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Thu, 05 Jun 2025 12:26:56 +0000
Subject: [PATCH v2 1/4] media: allegro-dvt: Move the current driver to a
 subdirectory
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-allegro_dvt_al300_dec_driver-v2-1-1ef4839f5f06@allegrodvt.com>
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
In-Reply-To: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7230;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=mB2DF3b3IX9HBLQRlzY2Y3Z4XGuRJDLzgEw1Mri1Jts=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWQ49oof8PsybbassaeCZb7g0fVHd4dd8r4+rzfWa77J9
 r6zz54odZSyMIhxMciKKbJ8MFj67Atbjc+MFrb5MHNYmUCGMHBxCsBE9mQw/A8N2Sn76M7n3Pt5
 lz8Z+UapzEmMnVO6KXGGfICvF1NqqjTD/4ior/8NebqOHPZfpP31/Xprv4JtfD83l13XPe/wrkz
 8IAsA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Reply-To: yassine.ouaissa@allegrodvt.com

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

In preparation for the upcoming driver update, we need to relocate the
current driver.
This will help ensure a clean transition and avoid any potential
conflicts with the new driver.
This patch is crucial for keeping our directory organized and
facilitating a smooth integration of the new driver.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 MAINTAINERS                                             |  2 +-
 drivers/media/platform/allegro-dvt/Kconfig              | 16 +---------------
 drivers/media/platform/allegro-dvt/Makefile             |  5 +----
 drivers/media/platform/allegro-dvt/zynqmp/Kconfig       | 17 +++++++++++++++++
 drivers/media/platform/allegro-dvt/zynqmp/Makefile      |  6 ++++++
 .../platform/allegro-dvt/{ => zynqmp}/allegro-core.c    |  0
 .../platform/allegro-dvt/{ => zynqmp}/allegro-mail.c    |  0
 .../platform/allegro-dvt/{ => zynqmp}/allegro-mail.h    |  0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c  |  0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h  |  0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c  |  0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h  |  0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c  |  0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h  |  0
 14 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eecc41c39a9cb467e91023307b92a181af6ee23d..abc6ba61048771303bc219102f2db602266b7c30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -817,7 +817,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
-F:	drivers/media/platform/allegro-dvt/
+F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index 2182e1277568a407f51a23ea437811c50b1183c8..e9008614c27b9490d1cd29fab887977a1918ede4 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -2,18 +2,4 @@
 
 comment "Allegro DVT media platform drivers"
 
-config VIDEO_ALLEGRO_DVT
-	tristate "Allegro DVT Video IP Core"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV
-	depends on ARCH_ZYNQMP || COMPILE_TEST
-	select V4L2_MEM2MEM_DEV
-	select VIDEOBUF2_DMA_CONTIG
-	select REGMAP_MMIO
-	help
-	  Support for the encoder video IP core by Allegro DVT. This core is
-	  found for example on the Xilinx ZynqMP SoC in the EV family and is
-	  called VCU in the reference manual.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called allegro.
+source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index 66108a3037747020d549bc0a427881e0667a3f0a..d2aa6875edcf7760901996aac4d5ac98282cce20 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,6 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-allegro-objs := allegro-core.o allegro-mail.o
-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
-
-obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
+obj-y += zynqmp/
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Kconfig b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..0a0a697c420da47f87f05153a2dbfbe5d3ccf988
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_ALLEGRO_DVT
+	tristate "Allegro DVT Video IP Core for ZynqMP"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV
+	depends on ARCH_ZYNQMP || COMPILE_TEST
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select REGMAP_MMIO
+	help
+	  Support for the encoder video IP core by Allegro DVT. This core is
+	  found for example on the Xilinx ZynqMP SoC in the EV family and is
+	  called VCU in the reference manual.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called allegro.
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..66108a3037747020d549bc0a427881e0667a3f0a
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+allegro-objs := allegro-core.o allegro-mail.o
+allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
+
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-core.c
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.c
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.h
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h

-- 
2.30.2



