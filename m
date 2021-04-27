Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4DA36C5CC
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237745AbhD0MIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237500AbhD0MIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:08:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C85C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:07:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUm-0006DG-0C; Tue, 27 Apr 2021 14:07:16 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUl-0005ul-Aj; Tue, 27 Apr 2021 14:07:15 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 1/6] media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG media bus formats
Date:   Tue, 27 Apr 2021 14:06:56 +0200
Message-Id: <20210427120701.21809-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210427120701.21809-1-m.felsch@pengutronix.de>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
with the interleaved IR pixels looks like:

        |  G |  R |  G |  B | ...
        +----+----+----+----+---
        | IR |  G | IR |  G | ...
        +----+----+----+----+---
        |  G |  B |  G |  R | ...
        +----+----+----+----+---
        | IR |  G | IR |  G | ...
        +----+----+----+----+---
        | .. | .. | .. | .. | ..

[1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../media/v4l/subdev-formats.rst              | 42 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index bd68588b2683..d774ccd57c1b 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2252,6 +2252,27 @@ organization is given as an example for the first pixel only.
       - g\ :sub:`2`
       - g\ :sub:`1`
       - g\ :sub:`0`
+    * .. _MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG8_1X8:
+
+      - MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG8_1X8
+      - 0x3021
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
     * .. _MEDIA-BUS-FMT-SRGGB8-1X8:
 
       - MEDIA_BUS_FMT_SRGGB8_1X8
@@ -2748,6 +2769,27 @@ organization is given as an example for the first pixel only.
       - g\ :sub:`2`
       - g\ :sub:`1`
       - g\ :sub:`0`
+    * .. _MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG12_1X12:
+
+      - MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG12_1X12
+      - 0x3022
+      -
+      -
+      -
+      -
+      -
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
     * .. _MEDIA-BUS-FMT-SRGGB12-1X12:
 
       - MEDIA_BUS_FMT_SRGGB12_1X12
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee243a..cdd995e44926 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -112,10 +112,11 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3021 */
+/* Bayer - next is	0x3023 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
+#define MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG8_1X8	0x3021
 #define MEDIA_BUS_FMT_SRGGB8_1X8		0x3014
 #define MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8		0x3015
 #define MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8		0x3016
@@ -136,6 +137,7 @@
 #define MEDIA_BUS_FMT_SBGGR12_1X12		0x3008
 #define MEDIA_BUS_FMT_SGBRG12_1X12		0x3010
 #define MEDIA_BUS_FMT_SGRBG12_1X12		0x3011
+#define MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG12_1X12	0x3022
 #define MEDIA_BUS_FMT_SRGGB12_1X12		0x3012
 #define MEDIA_BUS_FMT_SBGGR14_1X14		0x3019
 #define MEDIA_BUS_FMT_SGBRG14_1X14		0x301a
-- 
2.29.2

