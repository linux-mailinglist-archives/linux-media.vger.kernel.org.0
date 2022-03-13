Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5F64D7478
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 11:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbiCMKxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 06:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233768AbiCMKxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 06:53:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330CF119F1C;
        Sun, 13 Mar 2022 03:52:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 43A4DB80CAD;
        Sun, 13 Mar 2022 10:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E51C340F5;
        Sun, 13 Mar 2022 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647168729;
        bh=rfDcIoqp2tGMvmOQbEgCFtaPOjgURb3ipd/yJK7UfsI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PMfG2oQ0fFiqexOiozq7XbiwPzMh4v7Es5DCBb+R7x/8CB9O7+6wH7+GNHwzZekPA
         UwUGZLB0RmXLtpXKqcBgp61vsTre7SxRCXcVg3c9tGaA0yFzwId6oufDT1rMejbIQs
         /YT2nQztF7pd9QxT4fjccJGMK8c2Xie2WOq6LTfCL834Az0ZneGWidCWC5iaqfZU34
         2thxi7j5T+U4KQeCp0S6/cSqiGW1FcduGTStqyfFIwi0h79SxGKblwkeLOBtoXTAJB
         S3ePUJunkXbjKYEemsl+IpTd9pEB0uqNLv+hf/nRe1VRUhjESlHG70AHGcR88Onfzo
         37tiFscqx0f7A==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTLpX-001I1k-2j; Sun, 13 Mar 2022 11:52:07 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Dmitry Osipenko <digetx@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Ming Qian <ming.qian@nxp.com>,
        Ondrej Jirman <megous@megous.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH 08/24] media: platform: rename sunxi/ to allwinner/
Date:   Sun, 13 Mar 2022 11:51:49 +0100
Message-Id: <b9943cdcddf7f2251c582be318da76bc0974ee34.1647167750.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647167750.git.mchehab@kernel.org>
References: <cover.1647167750.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the end goal is to have platform drivers split by vendor,
rename sunxi/ to allwinner/.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/24] at: https://lore.kernel.org/all/cover.1647167750.git.mchehab@kernel.org/

 MAINTAINERS                                               | 8 ++++----
 drivers/media/platform/Kconfig                            | 2 +-
 drivers/media/platform/Makefile                           | 2 +-
 drivers/media/platform/allwinner/Kconfig                  | 6 ++++++
 drivers/media/platform/{sunxi => allwinner}/Makefile      | 0
 .../media/platform/{sunxi => allwinner}/sun4i-csi/Kconfig | 0
 .../platform/{sunxi => allwinner}/sun4i-csi/Makefile      | 0
 .../platform/{sunxi => allwinner}/sun4i-csi/sun4i_csi.c   | 0
 .../platform/{sunxi => allwinner}/sun4i-csi/sun4i_csi.h   | 0
 .../platform/{sunxi => allwinner}/sun4i-csi/sun4i_dma.c   | 0
 .../platform/{sunxi => allwinner}/sun4i-csi/sun4i_v4l2.c  | 0
 .../media/platform/{sunxi => allwinner}/sun6i-csi/Kconfig | 0
 .../platform/{sunxi => allwinner}/sun6i-csi/Makefile      | 0
 .../platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi.c   | 0
 .../platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi.h   | 0
 .../{sunxi => allwinner}/sun6i-csi/sun6i_csi_reg.h        | 0
 .../platform/{sunxi => allwinner}/sun6i-csi/sun6i_video.c | 0
 .../platform/{sunxi => allwinner}/sun6i-csi/sun6i_video.h | 0
 .../media/platform/{sunxi => allwinner}/sun8i-di/Kconfig  | 0
 .../media/platform/{sunxi => allwinner}/sun8i-di/Makefile | 0
 .../platform/{sunxi => allwinner}/sun8i-di/sun8i-di.c     | 0
 .../platform/{sunxi => allwinner}/sun8i-di/sun8i-di.h     | 0
 .../platform/{sunxi => allwinner}/sun8i-rotate/Kconfig    | 0
 .../platform/{sunxi => allwinner}/sun8i-rotate/Makefile   | 0
 .../{sunxi => allwinner}/sun8i-rotate/sun8i-formats.h     | 0
 .../{sunxi => allwinner}/sun8i-rotate/sun8i-rotate.h      | 0
 .../{sunxi => allwinner}/sun8i-rotate/sun8i_formats.c     | 0
 .../{sunxi => allwinner}/sun8i-rotate/sun8i_rotate.c      | 0
 drivers/media/platform/sunxi/Kconfig                      | 6 ------
 29 files changed, 12 insertions(+), 12 deletions(-)
 create mode 100644 drivers/media/platform/allwinner/Kconfig
 rename drivers/media/platform/{sunxi => allwinner}/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/Kconfig (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_csi.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_csi.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_dma.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_v4l2.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/Kconfig (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi_reg.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_video.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_video.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/Kconfig (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/sun8i-di.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/sun8i-di.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/Kconfig (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i-formats.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i-rotate.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i_formats.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i_rotate.c (100%)
 delete mode 100644 drivers/media/platform/sunxi/Kconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index 58e0d42b1278..f29195850c16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -750,7 +750,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
-F:	drivers/media/platform/sunxi/sun4i-csi/
+F:	drivers/media/platform/allwinner/sun4i-csi/
 
 ALLWINNER CPUFREQ DRIVER
 M:	Yangtao Li <tiny.windzz@gmail.com>
@@ -5114,7 +5114,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
-F:	drivers/media/platform/sunxi/sun6i-csi/
+F:	drivers/media/platform/allwinner/sun6i-csi/
 
 CW1200 WLAN driver
 M:	Solomon Peachy <pizza@shaftnet.org>
@@ -5391,7 +5391,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
-F:	drivers/media/platform/sunxi/sun8i-di/
+F:	drivers/media/platform/allwinner/sun8i-di/
 
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
@@ -16746,7 +16746,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yaml
-F:	drivers/media/platform/sunxi/sun8i-rotate/
+F:	drivers/media/platform/allwinner/sun8i-rotate/
 
 RPMSG TTY DRIVER
 M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 33f8f41b2771..5ffbbd6c6f91 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -66,6 +66,7 @@ config VIDEO_MUX
 # TODO: create per-manufacturer directories
 
 source "drivers/media/platform/allegro-dvt/Kconfig"
+source "drivers/media/platform/allwinner/Kconfig"
 source "drivers/media/platform/am437x/Kconfig"
 source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
@@ -94,7 +95,6 @@ source "drivers/media/platform/s5p-jpeg/Kconfig"
 source "drivers/media/platform/s5p-mfc/Kconfig"
 source "drivers/media/platform/sti/Kconfig"
 source "drivers/media/platform/stm32/Kconfig"
-source "drivers/media/platform/sunxi/Kconfig"
 source "drivers/media/platform/tegra/vde/Kconfig"
 source "drivers/media/platform/ti-vpe/Kconfig"
 source "drivers/media/platform/via/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 954ad8f2cde1..88519e902919 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -6,6 +6,7 @@
 # Place here, alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
+obj-y += allwinner/
 obj-y += am437x/
 obj-y += amlogic/meson-ge2d/
 obj-y += amphion/
@@ -39,7 +40,6 @@ obj-y += sti/c8sectpfe/
 obj-y += sti/delta/
 obj-y += sti/hva/
 obj-y += stm32/
-obj-y += sunxi/
 obj-y += tegra/vde/
 obj-y += ti-vpe/
 obj-y += via/
diff --git a/drivers/media/platform/allwinner/Kconfig b/drivers/media/platform/allwinner/Kconfig
new file mode 100644
index 000000000000..88bffb055528
--- /dev/null
+++ b/drivers/media/platform/allwinner/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+source "drivers/media/platform/allwinner/sun4i-csi/Kconfig"
+source "drivers/media/platform/allwinner/sun6i-csi/Kconfig"
+source "drivers/media/platform/allwinner/sun8i-di/Kconfig"
+source "drivers/media/platform/allwinner/sun8i-rotate/Kconfig"
diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platform/allwinner/Makefile
similarity index 100%
rename from drivers/media/platform/sunxi/Makefile
rename to drivers/media/platform/allwinner/Makefile
diff --git a/drivers/media/platform/sunxi/sun4i-csi/Kconfig b/drivers/media/platform/allwinner/sun4i-csi/Kconfig
similarity index 100%
rename from drivers/media/platform/sunxi/sun4i-csi/Kconfig
rename to drivers/media/platform/allwinner/sun4i-csi/Kconfig
diff --git a/drivers/media/platform/sunxi/sun4i-csi/Makefile b/drivers/media/platform/allwinner/sun4i-csi/Makefile
similarity index 100%
rename from drivers/media/platform/sunxi/sun4i-csi/Makefile
rename to drivers/media/platform/allwinner/sun4i-csi/Makefile
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.c
similarity index 100%
rename from drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
rename to drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.c
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.h
similarity index 100%
rename from drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
rename to drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.h
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/allwinner/sun4i-csi/sun4i_dma.c
similarity index 100%
rename from drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
rename to drivers/media/platform/allwinner/sun4i-csi/sun4i_dma.c
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/allwinner/sun4i-csi/sun4i_v4l2.c
similarity index 100%
rename from drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
rename to drivers/media/platform/allwinner/sun4i-csi/sun4i_v4l2.c
diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/allwinner/sun6i-csi/Kconfig
similarity index 100%
rename from drivers/media/platform/sunxi/sun6i-csi/Kconfig
rename to drivers/media/platform/allwinner/sun6i-csi/Kconfig
diff --git a/drivers/media/platform/sunxi/sun6i-csi/Makefile b/drivers/media/platform/allwinner/sun6i-csi/Makefile
similarity index 100%
rename from drivers/media/platform/sunxi/sun6i-csi/Makefile
rename to drivers/media/platform/allwinner/sun6i-csi/Makefile
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.c
similarity index 100%
rename from drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
rename to drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.c
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.h
similarity index 100%
rename from drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
rename to drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.h
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h b/drivers/media/platform/allwinner/sun6i-csi/sun6i_csi_reg.h
similarity index 100%
rename from drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h
rename to drivers/media/platform/allwinner/sun6i-csi/sun6i_csi_reg.h
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/allwinner/sun6i-csi/sun6i_video.c
similarity index 100%
rename from drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
rename to drivers/media/platform/allwinner/sun6i-csi/sun6i_video.c
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h b/drivers/media/platform/allwinner/sun6i-csi/sun6i_video.h
similarity index 100%
rename from drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
rename to drivers/media/platform/allwinner/sun6i-csi/sun6i_video.h
diff --git a/drivers/media/platform/sunxi/sun8i-di/Kconfig b/drivers/media/platform/allwinner/sun8i-di/Kconfig
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-di/Kconfig
rename to drivers/media/platform/allwinner/sun8i-di/Kconfig
diff --git a/drivers/media/platform/sunxi/sun8i-di/Makefile b/drivers/media/platform/allwinner/sun8i-di/Makefile
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-di/Makefile
rename to drivers/media/platform/allwinner/sun8i-di/Makefile
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/allwinner/sun8i-di/sun8i-di.c
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
rename to drivers/media/platform/allwinner/sun8i-di/sun8i-di.c
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.h b/drivers/media/platform/allwinner/sun8i-di/sun8i-di.h
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
rename to drivers/media/platform/allwinner/sun8i-di/sun8i-di.h
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/Kconfig b/drivers/media/platform/allwinner/sun8i-rotate/Kconfig
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-rotate/Kconfig
rename to drivers/media/platform/allwinner/sun8i-rotate/Kconfig
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/Makefile b/drivers/media/platform/allwinner/sun8i-rotate/Makefile
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-rotate/Makefile
rename to drivers/media/platform/allwinner/sun8i-rotate/Makefile
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h b/drivers/media/platform/allwinner/sun8i-rotate/sun8i-formats.h
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h
rename to drivers/media/platform/allwinner/sun8i-rotate/sun8i-formats.h
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h b/drivers/media/platform/allwinner/sun8i-rotate/sun8i-rotate.h
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h
rename to drivers/media/platform/allwinner/sun8i-rotate/sun8i-rotate.h
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats.c b/drivers/media/platform/allwinner/sun8i-rotate/sun8i_formats.c
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats.c
rename to drivers/media/platform/allwinner/sun8i-rotate/sun8i_formats.c
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/allwinner/sun8i-rotate/sun8i_rotate.c
similarity index 100%
rename from drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
rename to drivers/media/platform/allwinner/sun8i-rotate/sun8i_rotate.c
diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
deleted file mode 100644
index a10032215b08..000000000000
--- a/drivers/media/platform/sunxi/Kconfig
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
-source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
-source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
-source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
-- 
2.35.1

