Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB162D07D8
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgLFXEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:04:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59894 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgLFXEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:04:55 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 832C08D;
        Mon,  7 Dec 2020 00:03:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607295811;
        bh=gTOziQ2M9rEs43K0oYZhBdw44d6U/8hh/JSotfwtLNc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iNpGFuQ+7qpa/Og2CghCXIgwSlYHUWSoOPiVoKaSjr5YuOTGehxm3FXv3vCRCSBKp
         PMVfkqjZ1rB8fG+kMMOasz1J9w13PYf7Bf5NHQ6aIWZk0VBh0NMoJViQjvttZJ0/9U
         9RD2qMWO7z6GbznIpRCZnMIbL27z4bvnQhsyi0F0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v4 08/16] media: doc: pixfmt-rgb: Replace '-' with 'X' to denote padding
Date:   Mon,  7 Dec 2020 01:03:08 +0200
Message-Id: <20201206230316.1221-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
References: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using '-' to represent padding bits and bytes make text and tables more
difficult to read. Use 'x' and 'X' instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 80 +++++++++----------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index d1ddc7a251da..897676ee2c9d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -44,7 +44,7 @@ devices and drivers, for both :ref:`capture` and :ref:`output` devices.
    - In all the tables that follow, bit 7 is the most significant bit in a byte.
    - 'r', 'g' and 'b' denote bits of the red, green and blue components
      respectively. 'a' denotes bits of the alpha component (if supported by the
-     format), and '-' denotes padding bits.
+     format), and 'x' denotes padding bits.
 
 
 Less Than 8 Bits Per Component
@@ -170,10 +170,10 @@ B\ :sub:`0`].
       - b\ :sub:`1`
       - b\ :sub:`0`
 
-      - `-`
-      - `-`
-      - `-`
-      - `-`
+      - x
+      - x
+      - x
+      - x
       - r\ :sub:`3`
       - r\ :sub:`2`
       - r\ :sub:`1`
@@ -211,10 +211,10 @@ B\ :sub:`0`].
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
+      - x
+      - x
+      - x
+      - x
 
       - r\ :sub:`3`
       - r\ :sub:`2`
@@ -262,10 +262,10 @@ B\ :sub:`0`].
       - r\ :sub:`1`
       - r\ :sub:`0`
 
-      - `-`
-      - `-`
-      - `-`
-      - `-`
+      - x
+      - x
+      - x
+      - x
       - b\ :sub:`3`
       - b\ :sub:`2`
       - b\ :sub:`1`
@@ -303,10 +303,10 @@ B\ :sub:`0`].
       - r\ :sub:`2`
       - r\ :sub:`1`
       - r\ :sub:`0`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
+      - x
+      - x
+      - x
+      - x
 
       - b\ :sub:`3`
       - b\ :sub:`2`
@@ -354,7 +354,7 @@ B\ :sub:`0`].
       - b\ :sub:`1`
       - b\ :sub:`0`
 
-      - `-`
+      - x
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
@@ -398,7 +398,7 @@ B\ :sub:`0`].
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
-      - `-`
+      - x
 
       - r\ :sub:`4`
       - r\ :sub:`3`
@@ -446,7 +446,7 @@ B\ :sub:`0`].
       - r\ :sub:`1`
       - r\ :sub:`0`
 
-      - `-`
+      - x
       - b\ :sub:`4`
       - b\ :sub:`3`
       - b\ :sub:`2`
@@ -490,7 +490,7 @@ B\ :sub:`0`].
       - r\ :sub:`2`
       - r\ :sub:`1`
       - r\ :sub:`0`
-      - `-`
+      - x
 
       - b\ :sub:`4`
       - b\ :sub:`3`
@@ -552,7 +552,7 @@ B\ :sub:`0`].
       - ``V4L2_PIX_FMT_XRGB555X``
       - 'XR15' | (1 << 31)
 
-      - `-`
+      - x
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
@@ -618,21 +618,21 @@ B\ :sub:`0`].
 
       - r\ :sub:`1`
       - r\ :sub:`0`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
 
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
 
 .. raw:: latex
 
@@ -707,7 +707,7 @@ nomenclature that instead use the order of components as seen in a 24- or
       - B\ :sub:`7-0`
       - G\ :sub:`7-0`
       - R\ :sub:`7-0`
-      - `-`
+      - X\ :sub:`7-0`
     * .. _V4L2-PIX-FMT-BGRA32:
 
       - ``V4L2_PIX_FMT_BGRA32``
@@ -722,7 +722,7 @@ nomenclature that instead use the order of components as seen in a 24- or
       - ``V4L2_PIX_FMT_BGRX32``
       - 'RX24'
 
-      - `-`
+      - X\ :sub:`7-0`
       - B\ :sub:`7-0`
       - G\ :sub:`7-0`
       - R\ :sub:`7-0`
@@ -743,7 +743,7 @@ nomenclature that instead use the order of components as seen in a 24- or
       - R\ :sub:`7-0`
       - G\ :sub:`7-0`
       - B\ :sub:`7-0`
-      - `-`
+      - X\ :sub:`7-0`
     * .. _V4L2-PIX-FMT-ARGB32:
 
       - ``V4L2_PIX_FMT_ARGB32``
@@ -758,7 +758,7 @@ nomenclature that instead use the order of components as seen in a 24- or
       - ``V4L2_PIX_FMT_XRGB32``
       - 'BX24'
 
-      - `-`
+      - X\ :sub:`7-0`
       - R\ :sub:`7-0`
       - G\ :sub:`7-0`
       - B\ :sub:`7-0`
-- 
Regards,

Laurent Pinchart

