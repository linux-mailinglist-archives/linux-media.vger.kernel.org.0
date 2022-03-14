Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFE94D8955
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243172AbiCNQgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240164AbiCNQgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:36:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD4213CC6;
        Mon, 14 Mar 2022 09:35:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 16BFFB80E86;
        Mon, 14 Mar 2022 16:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942F6C341D1;
        Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647275708;
        bh=mnzP78x62PrqI/Wgg4pPcVbC3/dSoYAuo2JnKAyheac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O5hZ6ne0FZJ3l2/75Y7bmdV4RlsTpG2qZmO3YGAgosrI2rI3iGYXN9QTzJAONJcKr
         MEqlf1VQJuvd/Yidb0S+XFai6ju94rv2XYKQA9hWbROPngJuLUvTCcNaRZ/vp5MBv1
         4wmjAGnjicXQR35IOlWapRGfBk73uP15A96Jn+APtky91VBsVeIkijTuNAsDm+IIhN
         YgUDhDPv/ahpma2xqMnGzApS8Q4eAGiGGCf78n4/FrQ0rq1GIvaF/U2//UEmf56e0+
         m+wtAyyyxpYtn5aPBd4ohyO1wd9GHwtF7LnQL6B3cAmRyogJPgT/rFKmmtJiRwujNn
         R+h51Jt+x3kXQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTnf0-001wyi-BT; Mon, 14 Mar 2022 17:35:06 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Fabio Estevam <festevam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Weber <martin.weber@br-automation.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Ming Qian <ming.qian@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 40/67] media: platform: rename coda/ to chips-media/
Date:   Mon, 14 Mar 2022 17:34:35 +0100
Message-Id: <c9da33a847e99fb8278a63f238772c9c7d410516.1647274406.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
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
rename coda/ to chips-media/.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 MAINTAINERS                                                | 2 +-
 drivers/media/platform/Kconfig                             | 2 +-
 drivers/media/platform/Makefile                            | 4 ++--
 drivers/media/platform/{coda => chips-media}/Kconfig       | 0
 drivers/media/platform/{coda => chips-media}/Makefile      | 0
 drivers/media/platform/{coda => chips-media}/coda-bit.c    | 0
 drivers/media/platform/{coda => chips-media}/coda-common.c | 0
 drivers/media/platform/{coda => chips-media}/coda-gdi.c    | 0
 drivers/media/platform/{coda => chips-media}/coda-h264.c   | 0
 drivers/media/platform/{coda => chips-media}/coda-jpeg.c   | 0
 drivers/media/platform/{coda => chips-media}/coda-mpeg2.c  | 0
 drivers/media/platform/{coda => chips-media}/coda-mpeg4.c  | 0
 drivers/media/platform/{coda => chips-media}/coda.h        | 0
 drivers/media/platform/{coda => chips-media}/coda_regs.h   | 2 +-
 drivers/media/platform/{coda => chips-media}/imx-vdoa.c    | 0
 drivers/media/platform/{coda => chips-media}/imx-vdoa.h    | 0
 drivers/media/platform/{coda => chips-media}/trace.h       | 2 +-
 17 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/media/platform/{coda => chips-media}/Kconfig (100%)
 rename drivers/media/platform/{coda => chips-media}/Makefile (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-bit.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-common.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-gdi.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-h264.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-jpeg.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-mpeg2.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-mpeg4.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda.h (100%)
 rename drivers/media/platform/{coda => chips-media}/coda_regs.h (99%)
 rename drivers/media/platform/{coda => chips-media}/imx-vdoa.c (100%)
 rename drivers/media/platform/{coda => chips-media}/imx-vdoa.h (100%)
 rename drivers/media/platform/{coda => chips-media}/trace.h (98%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 848640546398..84bc106acc57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4771,7 +4771,7 @@ M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/coda.yaml
-F:	drivers/media/platform/coda/
+F:	drivers/media/platform/chips-media/
 
 CODE OF CONDUCT
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 721f27ef0130..24a43cef18de 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -71,7 +71,7 @@ source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/cadence/Kconfig"
-source "drivers/media/platform/coda/Kconfig"
+source "drivers/media/platform/chips-media/Kconfig"
 source "drivers/media/platform/davinci/Kconfig"
 source "drivers/media/platform/exynos-gsc/Kconfig"
 source "drivers/media/platform/exynos4-is/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 20b07ae3ebf1..8d6e15fad0b1 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -6,12 +6,12 @@
 # Place here, alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
-obj-y += aspeed/
 obj-y += am437x/
 obj-y += amphion/
+obj-y += aspeed/
 obj-y += atmel/
 obj-y += cadence/
-obj-y += coda/
+obj-y += chips-media/
 obj-y += davinci/
 obj-y += exynos-gsc/
 obj-y += exynos4-is/
diff --git a/drivers/media/platform/coda/Kconfig b/drivers/media/platform/chips-media/Kconfig
similarity index 100%
rename from drivers/media/platform/coda/Kconfig
rename to drivers/media/platform/chips-media/Kconfig
diff --git a/drivers/media/platform/coda/Makefile b/drivers/media/platform/chips-media/Makefile
similarity index 100%
rename from drivers/media/platform/coda/Makefile
rename to drivers/media/platform/chips-media/Makefile
diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/chips-media/coda-bit.c
similarity index 100%
rename from drivers/media/platform/coda/coda-bit.c
rename to drivers/media/platform/chips-media/coda-bit.c
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
similarity index 100%
rename from drivers/media/platform/coda/coda-common.c
rename to drivers/media/platform/chips-media/coda-common.c
diff --git a/drivers/media/platform/coda/coda-gdi.c b/drivers/media/platform/chips-media/coda-gdi.c
similarity index 100%
rename from drivers/media/platform/coda/coda-gdi.c
rename to drivers/media/platform/chips-media/coda-gdi.c
diff --git a/drivers/media/platform/coda/coda-h264.c b/drivers/media/platform/chips-media/coda-h264.c
similarity index 100%
rename from drivers/media/platform/coda/coda-h264.c
rename to drivers/media/platform/chips-media/coda-h264.c
diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/chips-media/coda-jpeg.c
similarity index 100%
rename from drivers/media/platform/coda/coda-jpeg.c
rename to drivers/media/platform/chips-media/coda-jpeg.c
diff --git a/drivers/media/platform/coda/coda-mpeg2.c b/drivers/media/platform/chips-media/coda-mpeg2.c
similarity index 100%
rename from drivers/media/platform/coda/coda-mpeg2.c
rename to drivers/media/platform/chips-media/coda-mpeg2.c
diff --git a/drivers/media/platform/coda/coda-mpeg4.c b/drivers/media/platform/chips-media/coda-mpeg4.c
similarity index 100%
rename from drivers/media/platform/coda/coda-mpeg4.c
rename to drivers/media/platform/chips-media/coda-mpeg4.c
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/chips-media/coda.h
similarity index 100%
rename from drivers/media/platform/coda/coda.h
rename to drivers/media/platform/chips-media/coda.h
diff --git a/drivers/media/platform/coda/coda_regs.h b/drivers/media/platform/chips-media/coda_regs.h
similarity index 99%
rename from drivers/media/platform/coda/coda_regs.h
rename to drivers/media/platform/chips-media/coda_regs.h
index da5bb3212528..db81a904cf3f 100644
--- a/drivers/media/platform/coda/coda_regs.h
+++ b/drivers/media/platform/chips-media/coda_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * linux/drivers/media/platform/coda/coda_regs.h
+ * linux/drivers/media/platform/chips-media/coda_regs.h
  *
  * Copyright (C) 2012 Vista Silicon SL
  *    Javier Martin <javier.martin@vista-silicon.com>
diff --git a/drivers/media/platform/coda/imx-vdoa.c b/drivers/media/platform/chips-media/imx-vdoa.c
similarity index 100%
rename from drivers/media/platform/coda/imx-vdoa.c
rename to drivers/media/platform/chips-media/imx-vdoa.c
diff --git a/drivers/media/platform/coda/imx-vdoa.h b/drivers/media/platform/chips-media/imx-vdoa.h
similarity index 100%
rename from drivers/media/platform/coda/imx-vdoa.h
rename to drivers/media/platform/chips-media/imx-vdoa.h
diff --git a/drivers/media/platform/coda/trace.h b/drivers/media/platform/chips-media/trace.h
similarity index 98%
rename from drivers/media/platform/coda/trace.h
rename to drivers/media/platform/chips-media/trace.h
index c0791c847f7c..19f98e6dafb9 100644
--- a/drivers/media/platform/coda/trace.h
+++ b/drivers/media/platform/chips-media/trace.h
@@ -167,7 +167,7 @@ DEFINE_EVENT(coda_buf_class, coda_jpeg_done,
 #endif /* __CODA_TRACE_H__ */
 
 #undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH ../../drivers/media/platform/coda
+#define TRACE_INCLUDE_PATH ../../drivers/media/platform/chips-media
 #undef TRACE_INCLUDE_FILE
 #define TRACE_INCLUDE_FILE trace
 
-- 
2.35.1

