Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBCB16AE0E
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 18:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgBXRwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 12:52:41 -0500
Received: from mx1.emlix.com ([188.40.240.192]:50074 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgBXRwl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 12:52:41 -0500
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 9802B5F9D4;
        Mon, 24 Feb 2020 18:52:39 +0100 (CET)
From:   =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
Subject: [PATCH 3/3] media: v4l: Add 1X14 14-bit greyscale media bus code definition
Date:   Mon, 24 Feb 2020 18:52:22 +0100
Message-Id: <20200224175222.1875-3-dg@emlix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code is called MEDIA_BUS_FMT_Y14_1X14 and behaves just like
MEDIA_BUS_FMT_Y12_1X12 with two more bits.

Signed-off-by: Daniel Glöckner <dg@emlix.com>
---
 .../media/uapi/v4l/subdev-formats.rst         | 37 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/subdev-formats.rst b/Documentation/media/uapi/v4l/subdev-formats.rst
index 15e11f27b4c8..17bfb2beaa6a 100644
--- a/Documentation/media/uapi/v4l/subdev-formats.rst
+++ b/Documentation/media/uapi/v4l/subdev-formats.rst
@@ -5792,6 +5792,43 @@ the following codes.
       - u\ :sub:`2`
       - u\ :sub:`1`
       - u\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-Y14-1X14:
+
+      - MEDIA_BUS_FMT_Y14_1X14
+      - 0x202d
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
+      - y\ :sub:`13`
+      - y\ :sub:`12`
+      - y\ :sub:`11`
+      - y\ :sub:`10`
+      - y\ :sub:`9`
+      - y\ :sub:`8`
+      - y\ :sub:`7`
+      - y\ :sub:`6`
+      - y\ :sub:`5`
+      - y\ :sub:`4`
+      - y\ :sub:`3`
+      - y\ :sub:`2`
+      - y\ :sub:`1`
+      - y\ :sub:`0`
     * .. _MEDIA-BUS-FMT-UYVY8-1X16:
 
       - MEDIA_BUS_FMT_UYVY8_1X16
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 16c1fa2d89a4..84fa53ffb13f 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -64,7 +64,7 @@
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
 
-/* YUV (including grey) - next is	0x202d */
+/* YUV (including grey) - next is	0x202e */
 #define MEDIA_BUS_FMT_Y8_1X8			0x2001
 #define MEDIA_BUS_FMT_UV8_1X8			0x2015
 #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
@@ -86,6 +86,7 @@
 #define MEDIA_BUS_FMT_VYUY12_2X12		0x201d
 #define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
 #define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
+#define MEDIA_BUS_FMT_Y14_1X14			0x202d
 #define MEDIA_BUS_FMT_UYVY8_1X16		0x200f
 #define MEDIA_BUS_FMT_VYUY8_1X16		0x2010
 #define MEDIA_BUS_FMT_YUYV8_1X16		0x2011
-- 
2.17.1

