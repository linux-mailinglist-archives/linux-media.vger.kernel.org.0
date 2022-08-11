Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2B958F9EC
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbiHKJSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234891AbiHKJR6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:17:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352539353C
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:17:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD7A9B81F8B
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E77C433D6;
        Thu, 11 Aug 2022 09:17:51 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/9] staging/media: add a STAGING_MEDIA_DEPRECATED option
Date:   Thu, 11 Aug 2022 11:17:41 +0200
Message-Id: <20220811091749.3956641-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
References: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a kernel config option to build deprecated media drivers
that are scheduled for removal. Move stkwebcam to the deprecated
directory to make it clear that this driver is deprecated.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/Kconfig                  | 18 ++++++++++++++++--
 drivers/staging/media/Makefile                 |  2 +-
 .../media/{ => deprecated}/stkwebcam/Kconfig   |  0
 .../media/{ => deprecated}/stkwebcam/Makefile  |  0
 .../media/{ => deprecated}/stkwebcam/TODO      |  0
 .../{ => deprecated}/stkwebcam/stk-sensor.c    |  0
 .../{ => deprecated}/stkwebcam/stk-webcam.c    |  0
 .../{ => deprecated}/stkwebcam/stk-webcam.h    |  0
 8 files changed, 17 insertions(+), 3 deletions(-)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/Kconfig (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/Makefile (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/TODO (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/stk-sensor.c (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/stk-webcam.c (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/stk-webcam.h (100%)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 421ce9dbf44c..3545ba722037 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -38,12 +38,26 @@ source "drivers/staging/media/omap4iss/Kconfig"
 
 source "drivers/staging/media/rkvdec/Kconfig"
 
-source "drivers/staging/media/stkwebcam/Kconfig"
-
 source "drivers/staging/media/sunxi/Kconfig"
 
 source "drivers/staging/media/tegra-video/Kconfig"
 
 source "drivers/staging/media/zoran/Kconfig"
 
+menuconfig STAGING_MEDIA_DEPRECATED
+	bool "Media staging drivers (DEPRECATED)"
+	default n
+	help
+	  This option enables deprecated media drivers that are
+	  scheduled for future removal from the kernel.
+
+	  If you wish to work on these drivers to prevent their removal,
+	  then contact the linux-media@vger.kernel.org mailing list.
+
+	  If in doubt, say N here.
+
+if STAGING_MEDIA_DEPRECATED
+source "drivers/staging/media/deprecated/stkwebcam/Kconfig"
+endif
+
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 950e96f10aad..c516764b5393 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
-obj-$(CONFIG_VIDEO_STKWEBCAM)	+= stkwebcam/
+obj-$(CONFIG_VIDEO_STKWEBCAM)	+= deprecated/stkwebcam/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
diff --git a/drivers/staging/media/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
similarity index 100%
rename from drivers/staging/media/stkwebcam/Kconfig
rename to drivers/staging/media/deprecated/stkwebcam/Kconfig
diff --git a/drivers/staging/media/stkwebcam/Makefile b/drivers/staging/media/deprecated/stkwebcam/Makefile
similarity index 100%
rename from drivers/staging/media/stkwebcam/Makefile
rename to drivers/staging/media/deprecated/stkwebcam/Makefile
diff --git a/drivers/staging/media/stkwebcam/TODO b/drivers/staging/media/deprecated/stkwebcam/TODO
similarity index 100%
rename from drivers/staging/media/stkwebcam/TODO
rename to drivers/staging/media/deprecated/stkwebcam/TODO
diff --git a/drivers/staging/media/stkwebcam/stk-sensor.c b/drivers/staging/media/deprecated/stkwebcam/stk-sensor.c
similarity index 100%
rename from drivers/staging/media/stkwebcam/stk-sensor.c
rename to drivers/staging/media/deprecated/stkwebcam/stk-sensor.c
diff --git a/drivers/staging/media/stkwebcam/stk-webcam.c b/drivers/staging/media/deprecated/stkwebcam/stk-webcam.c
similarity index 100%
rename from drivers/staging/media/stkwebcam/stk-webcam.c
rename to drivers/staging/media/deprecated/stkwebcam/stk-webcam.c
diff --git a/drivers/staging/media/stkwebcam/stk-webcam.h b/drivers/staging/media/deprecated/stkwebcam/stk-webcam.h
similarity index 100%
rename from drivers/staging/media/stkwebcam/stk-webcam.h
rename to drivers/staging/media/deprecated/stkwebcam/stk-webcam.h
-- 
2.35.1

