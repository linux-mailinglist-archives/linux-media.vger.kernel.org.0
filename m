Return-Path: <linux-media+bounces-48432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1FCADB3A
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 17:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC4823021F91
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 16:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164A02D47E8;
	Mon,  8 Dec 2025 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNWX6ZEW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6411222173A;
	Mon,  8 Dec 2025 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765208976; cv=none; b=NooPS260hhZSm7I7wgvhDkMq923wbrOjZToAuO25Jf8wpwJRKPRhFsD/p6yx0m6jg2hqEDM1XttmvLK/MYie9BCN67lcMjwajlKztoBspEwZ6Q3GLZBfl2njSr445LLSrJZdoSYxb9OggXvo0CN+G3V8s7kSP9iL6QzAHLd8jQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765208976; c=relaxed/simple;
	bh=YWAbsKFCm/k94ljlvwa1UnSGizH5yIeZ3FUV5/0lLZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gv9iQo0Sf1WIurUdWFfI67uFMYmngx99eBSmGQMh26f3HIpB7R0q0fS6NNBedy1le7CPgBiuzrvSHZNR2lZm9kSC2Uk/YHkOg0ZTFQ1bE31IvyRF0UsA0/j6HwxrYCHpkolMk/eeKOLcw1/cAUzzaR1Sa7ZnBEnaNW0BUqNCZmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNWX6ZEW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AF8BC116B1;
	Mon,  8 Dec 2025 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765208976;
	bh=YWAbsKFCm/k94ljlvwa1UnSGizH5yIeZ3FUV5/0lLZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fNWX6ZEWjj7D2R1L2IQN3AJX1SEbfzk1awHuJ6maj6uYBs59THIq3qFh6XdnKaLyU
	 c3Tjv+cGrPJ3ktD5YwNvR0fjcNZ12EXfUPkbhgRWcVteHJUPhQHoZ7YwGxkUF6ZpZo
	 0xL8R71re9SWHafrErt/sC4TtAILyXzVAB8VJ1UDJbM5S4X32F3KwKgZnPwUh8iqxO
	 weG9F3XZfNr3KCrT/MywWgDKSX40BdZzUCgi2/Sw6/sbY01IZL+1Eom0YGbeFNvfAU
	 LAosX5S6Mc1Klr8CcXXtCukayanQejjdutFfatzjftzkuX/zteM3YYqHAPXgJ582Z7
	 /KNgJwLQmxFNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CC9D3B7F3;
	Mon,  8 Dec 2025 15:49:35 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 08 Dec 2025 16:49:16 +0100
Subject: [PATCH RESEND v6 1/4] media: allegro-dvt: Move the current driver
 to a subdirectory
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-allegro_dvt_al300_dec_driver-v6-1-128956555677@allegrodvt.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-0-128956555677@allegrodvt.com>
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-0-128956555677@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7014;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=U9+FhDgZb/FiAEVct668YZQhiLAVBrhpMNqOhBE24PU=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSafe6xs797pVM9WVXr4/PTeY9+aWpHN2Qtaj/bveDvj
 JLXG7e/7ShlYRDjYpAVU2T5YLD02Re2Gp8ZLWzzYeawMoEMYeDiFICJTPjPyDDzVk6mB8fh6LYt
 X/esXZn7W+nnSr9XOquqvRQ8I6yPm/kzMnRUhwccnpDa8jqJTy132drVO3xFu79XuPU9CJQ7kPk
 4nxkA
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

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
index d701a4d5b00e..dc56841fa5e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -838,7 +838,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
-F:	drivers/media/platform/allegro-dvt/
+F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index 2182e1277568..e9008614c27b 100644
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
index 66108a303774..d2aa6875edcf 100644
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
index 000000000000..0a0a697c420d
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
index 000000000000..66108a303774
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
2.50.1



