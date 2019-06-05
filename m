Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCA3436763
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 00:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfFEWXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 18:23:01 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:37864 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFEWXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 18:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559773378; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3WxFP40bw78aYfQlFi9aqJM4QOfTgmxIEVw1QoXWaIE=;
        b=AhcWMciVKZi4U8iodEa/HzGRlM5c7h0NQqAwXaRcS/HI15oRKzrHTz4bgfsM/ozaFmnb11
        iLPE3fwJ/YN6jtX7LHwEzI7qwutJg79SxwXSXUOwVu0c1B7xqWYix2Off/td1ABnvQlyfb
        undBlRzjABSLiqHBsGpiaDF9kGCnYdY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 2/3] media: uapi: Add MEDIA_BUS_FMT_RGB888_3X8 media bus format
Date:   Thu,  6 Jun 2019 00:22:46 +0200
Message-Id: <20190605222247.25657-2-paul@crapouillou.net>
In-Reply-To: <20190605222247.25657-1-paul@crapouillou.net>
References: <20190605222247.25657-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds MEDIA_BUS_FMT_RGB888_3X8, used for the GiantPlus
GPM940B0 24-bit TFT panel, where the RGB components are transferred
sequentially on a 8-bit bus.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch
    
    v3: No change
    
    v4: Add only MEDIA_BUS_FMT_RGB888_3X8, as we don't have to care about
        endianness
    
    v5: Also update Documentation/media/uapi/v4l/subdev-formats.rst

 .../media/uapi/v4l/subdev-formats.rst         | 107 ++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |   3 +-
 2 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/subdev-formats.rst b/Documentation/media/uapi/v4l/subdev-formats.rst
index ab1a48a5ae80..f4f8de31ac63 100644
--- a/Documentation/media/uapi/v4l/subdev-formats.rst
+++ b/Documentation/media/uapi/v4l/subdev-formats.rst
@@ -1305,6 +1305,113 @@ The following tables list existing packed RGB formats.
       - g\ :sub:`6`
       - g\ :sub:`5`
       - g\ :sub:`4`
+    * .. _MEDIA-BUS-FMT-RGB888-3X8:
+
+      - MEDIA_BUS_FMT_RGB888_3X8
+      - 0x101c
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+    * -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
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
+    * -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
     * .. _MEDIA-BUS-FMT-ARGB888-1X32:
 
       - MEDIA_BUS_FMT_ARGB888_1X32
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 2a6b253cfb05..16c1fa2d89a4 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101c */
+/* RGB - next is	0x101d */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -55,6 +55,7 @@
 #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
 #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
 #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
+#define MEDIA_BUS_FMT_RGB888_3X8		0x101c
 #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
-- 
2.21.0.593.g511ec345e18

