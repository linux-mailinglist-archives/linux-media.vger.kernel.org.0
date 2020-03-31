Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACFF11994F8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730648AbgCaLMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730442AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B5C6216FD;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=+1dDLRCkbCi1rrPTCvD92hA0GGwV5hsi0Qr3RfQW8Jw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jiS9/dEKEwWS6GYHRtQ/n7ORJ7C1z/dxPFsnpvaoE3Osb9rsyrU7CWW0EXqVE34kc
         qZz03g21spzQyymYXhNIxLur8uAUJ4omp0ETFE3QZ0Irbp4OKv8/YZbbp9M70FqGeC
         yRAOX5UqFcwDvbqqC9rdG9oXWmPhhRh0l7kUOBfw=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002brA-Ib; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org
Subject: [PATCH v4 17/33] media: add SPDX headers on Kconfig and Makefile files
Date:   Tue, 31 Mar 2020 13:11:53 +0200
Message-Id: <981eea64742859c63d8ab88c24b1b3380ee32dd2.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
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
index 3b9795cfcb36..0c5c52f14c64 100644
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
index e86e29b6a603..93b4e82a2655 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 config VIDEO_SUN4I_CSI
 	tristate "Allwinner A10 CMOS Sensor Interface Support"
 	depends on VIDEO_V4L2 && COMMON_CLK && VIDEO_V4L2_SUBDEV_API && HAS_DMA
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
index 68c29a9c4946..743ce08eb184 100644
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

