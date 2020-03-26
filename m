Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9301942EA
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 16:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgCZPVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 11:21:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:40532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727717AbgCZPVg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 11:21:36 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 883B92078B;
        Thu, 26 Mar 2020 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585236095;
        bh=1TfvecVNsnrRPGYjwIJib8LOYw3hNDQWOsABSBfYq1k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c+j0D6dfQY7bS74yuW2Bw7xfSzXqji7LPRfi3QcqZiUT8c8Lsgw2f+XGKodXRyJiM
         JMyl5Ly4vLDhnHvnx6HXK+bGgzkZKxV6iId1TViWPTbioCLGlYChWy695zigrPGynQ
         wAV2/4JkCsO1tCBXXzb65Qc6MELEKQUFm5Ic9mlk=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jHUK5-003dj8-Rf; Thu, 26 Mar 2020 16:21:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org
Subject: [PATCH 7/7] media: add SPDX headers on Kconfig and Makefile files
Date:   Thu, 26 Mar 2020 16:21:32 +0100
Message-Id: <3016f7ee1b738f7a61705816963ca315a1c9bc63.1585235736.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585235736.git.mchehab+huawei@kernel.org>
References: <cover.1585235736.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most of media Kconfig/Makefile files already has SPDX,
but there are a few ones still missing. Add it to them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/Kconfig             | 2 ++
 drivers/media/mc/Kconfig                        | 2 ++
 drivers/media/platform/sunxi/Kconfig            | 2 ++
 drivers/media/platform/sunxi/Makefile           | 2 ++
 drivers/media/platform/sunxi/sun4i-csi/Kconfig  | 2 ++
 drivers/media/platform/sunxi/sun4i-csi/Makefile | 2 ++
 drivers/staging/media/hantro/Makefile           | 2 ++
 drivers/staging/media/rkisp1/Makefile           | 2 ++
 8 files changed, 16 insertions(+)

diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index 1f45808d94da..aa24506257b3 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 if MEDIA_DIGITAL_TV_SUPPORT
 
 comment "DVB Frontend drivers hidden by 'Autoselect ancillary drivers'"
diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index b3579d6c9e32..002a918c4c75 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 #
 # Media controller
 #	Selectable only for webcam/grabbers, as other drivers don't use it
diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
index 71808e93ac2e..7151cc249afa 100644
--- a/drivers/media/platform/sunxi/Kconfig
+++ b/drivers/media/platform/sunxi/Kconfig
@@ -1,2 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
 source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
 source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platform/sunxi/Makefile
index ff0993f70dc3..fc537c9f5ca9 100644
--- a/drivers/media/platform/sunxi/Makefile
+++ b/drivers/media/platform/sunxi/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 obj-y		+= sun4i-csi/
 obj-y		+= sun6i-csi/
 obj-y		+= sun8i-di/
diff --git a/drivers/media/platform/sunxi/sun4i-csi/Kconfig b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
index 5054e7b0d1ac..903c6152f6e8 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 config VIDEO_SUN4I_CSI
 	tristate "Allwinner A10 CMOS Sensor Interface Support"
 	depends on VIDEO_V4L2 && COMMON_CLK  && HAS_DMA
diff --git a/drivers/media/platform/sunxi/sun4i-csi/Makefile b/drivers/media/platform/sunxi/sun4i-csi/Makefile
index 7c790a57f5ee..5062b006d63e 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/Makefile
+++ b/drivers/media/platform/sunxi/sun4i-csi/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 sun4i-csi-y += sun4i_csi.o
 sun4i-csi-y += sun4i_dma.o
 sun4i-csi-y += sun4i_v4l2.o
diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 496b30c3c396..a558cb0623dc 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 obj-$(CONFIG_VIDEO_HANTRO) += hantro-vpu.o
 
 hantro-vpu-y += \
diff --git a/drivers/staging/media/rkisp1/Makefile b/drivers/staging/media/rkisp1/Makefile
index 69ca59c7ef34..ab32a77db8f7 100644
--- a/drivers/staging/media/rkisp1/Makefile
+++ b/drivers/staging/media/rkisp1/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
 rockchip-isp1-objs += 	rkisp1-capture.o \
 			rkisp1-common.o \
-- 
2.25.1

