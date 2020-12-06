Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B802D07D7
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgLFXEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgLFXEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:04:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3A3C0613D2
        for <linux-media@vger.kernel.org>; Sun,  6 Dec 2020 15:04:13 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0DB914D9;
        Mon,  7 Dec 2020 00:03:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607295811;
        bh=/VG+kFUQBmUGxOSTSOXs+EYzgEKbLb+l2JJRTd3MqrQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fHjFTY2SD/AjXmmXj8jFuqz1OEMNf98Plov3rO943VzIaxouiKNTNUkifKqHa9e8N
         EG/kobldIbNEt6kforicnWHNJPmqIP8PaYkkInGemsCWR4E+KDOKkYXER8xn9mX5CB
         kZx4doTY90gud/E/6ZKMd0ZWckGSIB1b+8J9E5kY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v4 07/16] media: doc: pixfmt-rgb: Make 8 bits per component table more compact
Date:   Mon,  7 Dec 2020 01:03:07 +0200
Message-Id: <20201206230316.1221-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
References: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All formats using 8 bits per component can be described with a byte
granularity instead of a bit granularity without loss of precision. This
makes the corresponding table more compact and easier to read.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 411 ++----------------
 1 file changed, 40 insertions(+), 371 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 36236e6ba55a..d1ddc7a251da 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -659,440 +659,109 @@ nomenclature that instead use the order of components as seen in a 24- or
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|
 
 
 .. flat-table:: RGB Formats With 8 Bits Per Component
-    :header-rows:  2
+    :header-rows:  1
     :stub-columns: 0
 
     * - Identifier
       - Code
-      - :cspan:`7` Byte 0 in memory
-      - :cspan:`7` Byte 1
-      - :cspan:`7` Byte 2
-      - :cspan:`7` Byte 3
-    * -
-      -
-      - 7
-      - 6
-      - 5
-      - 4
-      - 3
-      - 2
-      - 1
-      - 0
-
-      - 7
-      - 6
-      - 5
-      - 4
-      - 3
-      - 2
-      - 1
-      - 0
-
-      - 7
-      - 6
-      - 5
-      - 4
-      - 3
-      - 2
-      - 1
-      - 0
-
-      - 7
-      - 6
-      - 5
-      - 4
-      - 3
-      - 2
-      - 1
-      - 0
+      - Byte 0 in memory
+      - Byte 1
+      - Byte 2
+      - Byte 3
     * .. _V4L2-PIX-FMT-BGR24:
 
       - ``V4L2_PIX_FMT_BGR24``
       - 'BGR3'
 
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
+      - G\ :sub:`7-0`
+      - B\ :sub:`7-0`
+      - R\ :sub:`7-0`
       -
     * .. _V4L2-PIX-FMT-RGB24:
 
       - ``V4L2_PIX_FMT_RGB24``
       - 'RGB3'
 
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
+      - R\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - B\ :sub:`7-0`
       -
     * .. _V4L2-PIX-FMT-ABGR32:
 
       - ``V4L2_PIX_FMT_ABGR32``
       - 'AR24'
 
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
-
-      - a\ :sub:`7`
-      - a\ :sub:`6`
-      - a\ :sub:`5`
-      - a\ :sub:`4`
-      - a\ :sub:`3`
-      - a\ :sub:`2`
-      - a\ :sub:`1`
-      - a\ :sub:`0`
+      - B\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - R\ :sub:`7-0`
+      - A\ :sub:`7-0`
     * .. _V4L2-PIX-FMT-XBGR32:
 
       - ``V4L2_PIX_FMT_XBGR32``
       - 'XR24'
 
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
-
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
+      - B\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - R\ :sub:`7-0`
       - `-`
     * .. _V4L2-PIX-FMT-BGRA32:
 
       - ``V4L2_PIX_FMT_BGRA32``
       - 'RA24'
 
-      - a\ :sub:`7`
-      - a\ :sub:`6`
-      - a\ :sub:`5`
-      - a\ :sub:`4`
-      - a\ :sub:`3`
-      - a\ :sub:`2`
-      - a\ :sub:`1`
-      - a\ :sub:`0`
-
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
+      - A\ :sub:`7-0`
+      - B\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - R\ :sub:`7-0`
     * .. _V4L2-PIX-FMT-BGRX32:
 
       - ``V4L2_PIX_FMT_BGRX32``
       - 'RX24'
 
       - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
+      - B\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - R\ :sub:`7-0`
     * .. _V4L2-PIX-FMT-RGBA32:
 
       - ``V4L2_PIX_FMT_RGBA32``
       - 'AB24'
 
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
-
-      - a\ :sub:`7`
-      - a\ :sub:`6`
-      - a\ :sub:`5`
-      - a\ :sub:`4`
-      - a\ :sub:`3`
-      - a\ :sub:`2`
-      - a\ :sub:`1`
-      - a\ :sub:`0`
+      - R\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - B\ :sub:`7-0`
+      - A\ :sub:`7-0`
     * .. _V4L2-PIX-FMT-RGBX32:
 
       - ``V4L2_PIX_FMT_RGBX32``
       - 'XB24'
 
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
-
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
+      - R\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - B\ :sub:`7-0`
       - `-`
     * .. _V4L2-PIX-FMT-ARGB32:
 
       - ``V4L2_PIX_FMT_ARGB32``
       - 'BA24'
 
-      - a\ :sub:`7`
-      - a\ :sub:`6`
-      - a\ :sub:`5`
-      - a\ :sub:`4`
-      - a\ :sub:`3`
-      - a\ :sub:`2`
-      - a\ :sub:`1`
-      - a\ :sub:`0`
-
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
+      - A\ :sub:`7-0`
+      - R\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - B\ :sub:`7-0`
     * .. _V4L2-PIX-FMT-XRGB32:
 
       - ``V4L2_PIX_FMT_XRGB32``
       - 'BX24'
 
       - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-
-      - r\ :sub:`7`
-      - r\ :sub:`6`
-      - r\ :sub:`5`
-      - r\ :sub:`4`
-      - r\ :sub:`3`
-      - r\ :sub:`2`
-      - r\ :sub:`1`
-      - r\ :sub:`0`
-
-      - g\ :sub:`7`
-      - g\ :sub:`6`
-      - g\ :sub:`5`
-      - g\ :sub:`4`
-      - g\ :sub:`3`
-      - g\ :sub:`2`
-      - g\ :sub:`1`
-      - g\ :sub:`0`
-
-      - b\ :sub:`7`
-      - b\ :sub:`6`
-      - b\ :sub:`5`
-      - b\ :sub:`4`
-      - b\ :sub:`3`
-      - b\ :sub:`2`
-      - b\ :sub:`1`
-      - b\ :sub:`0`
+      - R\ :sub:`7-0`
+      - G\ :sub:`7-0`
+      - B\ :sub:`7-0`
 
 .. raw:: latex
 
-- 
Regards,

Laurent Pinchart

