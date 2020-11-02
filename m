Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD502A36B2
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgKBWmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:42:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42350 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgKBWmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:42:01 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE590115F;
        Mon,  2 Nov 2020 23:41:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356917;
        bh=HFx2q6hBeF47Kk62WE4DXSzU6PkMZXFaWEZ7cXYFIQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kJLf98koaNdS55UUvlCOndtyPqnMq9APTzcZUfDnib3uZ92/Hj+Tjexk2cll0PZ0w
         OXwOmlO17n49b2nsmUQzCkDsFssirgir5CWkDWFVe0lk8eu5MrrPAlvv6y+qE8y7rO
         I586u7DLWNnc8Ehy1b8U/s3XOtiCOU1RDUztMPeY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 07/19] media: doc: pixfmt-yuv: Document subsampling in more details
Date:   Tue,  3 Nov 2020 00:40:50 +0200
Message-Id: <20201102224102.30292-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document YUV subsampling, including chroma spatial siting, and replace
the siting examples in individual formats by references to the common
documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-m420.rst   |  59 +----
 .../userspace-api/media/v4l/pixfmt-nv12.rst   |  57 +---
 .../userspace-api/media/v4l/pixfmt-nv12m.rst  |  60 +----
 .../userspace-api/media/v4l/pixfmt-nv16.rst   |  73 +----
 .../userspace-api/media/v4l/pixfmt-nv16m.rst  |  73 +----
 .../userspace-api/media/v4l/pixfmt-uyvy.rst   |  44 +--
 .../userspace-api/media/v4l/pixfmt-vyuy.rst   |  42 +--
 .../userspace-api/media/v4l/pixfmt-y41p.rst   |  62 +----
 .../userspace-api/media/v4l/pixfmt-yuv410.rst |  59 +----
 .../media/v4l/pixfmt-yuv411p.rst              |  39 +--
 .../userspace-api/media/v4l/pixfmt-yuv420.rst |  66 +----
 .../media/v4l/pixfmt-yuv420m.rst              |  66 +----
 .../media/v4l/pixfmt-yuv422m.rst              |  44 +--
 .../media/v4l/pixfmt-yuv422p.rst              |  44 +--
 .../media/v4l/pixfmt-yuv444m.rst              |  33 +--
 .../userspace-api/media/v4l/pixfmt-yuyv.rst   |  49 +---
 .../userspace-api/media/v4l/pixfmt-yvyu.rst   |  42 +--
 .../userspace-api/media/v4l/yuv-formats.rst   | 250 +++++++++++++++++-
 18 files changed, 278 insertions(+), 884 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-m420.rst b/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
index 13cf36a8cd5c..c01a949e7c11 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
@@ -67,60 +67,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 1
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-    * - 2
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 3
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
index dd2f38129fe6..692117bf83ad 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
@@ -72,58 +72,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 1
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-    * - 2
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 3
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
index 250f8b977605..002b361d5a9b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
@@ -84,61 +84,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 1
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-    * - 2
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      -
-      - C
-      -
-    * - 3
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
index 22295fc0c359..e6307843d848 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
@@ -80,74 +80,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 1
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * -
-    * - 2
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 3
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
index 812bf2ccabf0..58e97205d41f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
@@ -84,74 +84,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 1
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * -
-    * - 2
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
-    * - 3
-      - Y
-      -
-      - Y
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      - C
-      -
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst b/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
index bae975fb14f6..1abc3066b712 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
@@ -66,45 +66,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 1
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 2
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 3
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst b/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
index aff8588b67a9..4fd0630a83a4 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
@@ -66,43 +66,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      -
-      - 2
-      - 3
-    * - 0
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 1
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 2
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 3
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
index d14cedf8f317..bb83eb6db3e5 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
@@ -89,63 +89,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      - 1
-      -
-      - 2
-      - 3
-      - 4
-      - 5
-      -
-      - 6
-      - 7
-    * - 0
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-    * - 1
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-    * - 2
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-    * - 3
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
index de2e519adc60..d79cd46d5055 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
@@ -68,60 +68,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      -
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-    * - 1
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-      -
-      -
-      -
-      - C
-      -
-      -
-      -
-    * - 2
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-    * - 3
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
index 998aa9b1328f..8a70eeca8d83 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
@@ -76,40 +76,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      - 1
-      -
-      - 2
-      - 3
-    * - 0
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-    * - 1
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-    * - 2
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
-    * - 3
-      - Y
-      - Y
-      - C
-      - Y
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
index f1c7baf32685..a36ec8d6d8a4 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
@@ -77,67 +77,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      -
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      -
-      - C
-      -
-    * - 1
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-    * - 2
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      -
-      - C
-      -
-    * - 3
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
index cd20a57e0621..c2cf17b9743c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
@@ -86,67 +86,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      -
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      -
-      - C
-      -
-    * - 1
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-    * - 2
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
-    * -
-      -
-      - C
-      -
-      -
-      -
-      - C
-      -
-    * - 3
-      - Y
-      -
-      - Y
-      -
-      - Y
-      -
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
index 32bf15e1426e..f92b54853fc9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
@@ -97,45 +97,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 1
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 2
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 3
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
index b178be558361..33e6b923e325 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
@@ -85,45 +85,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 1
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 2
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 3
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
index 90bdee2e2b0d..7c03cc5b07d9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
@@ -107,35 +107,4 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      - 1
-      - 2
-      - 3
-    * - 0
-      - YC
-      - YC
-      - YC
-      - YC
-    * - 1
-      - YC
-      - YC
-      - YC
-      - YC
-    * - 2
-      - YC
-      - YC
-      - YC
-      - YC
-    * - 3
-      - YC
-      - YC
-      - YC
-      - YC
+Chroma samples are :ref:`co-sited<yuv-chroma-cosited>`.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
index ca073a5098a9..4d5773922ba1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
@@ -69,50 +69,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      -
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      - C
-      - Y
-      -
-      - Y
-      - C
-      - Y
-    * - 1
-      - Y
-      - C
-      - Y
-      -
-      - Y
-      - C
-      - Y
-    * - 2
-      - Y
-      - C
-      - Y
-      -
-      - Y
-      - C
-      - Y
-    * - 3
-      - Y
-      - C
-      - Y
-      -
-      - Y
-      - C
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst b/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
index 81ebec525ae5..14b56b611349 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
@@ -66,43 +66,5 @@ Each cell is one byte.
 
 
 **Color Sample Location:**
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * -
-      - 0
-      -
-      - 1
-      - 2
-      -
-      - 3
-    * - 0
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 1
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 2
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
-    * - 3
-      - Y
-      - C
-      - Y
-      - Y
-      - C
-      - Y
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 4a05a105a9e6..79a4fda566c6 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -14,11 +14,251 @@ reconstructed by subtracting from the brightness component. See
 :ref:`colorspaces` for conversion examples. YUV was chosen because
 early television would only transmit brightness information. To add
 color in a way compatible with existing receivers a new signal carrier
-was added to transmit the color difference signals. Secondary in the YUV
-format the U and V components usually have lower resolution than the Y
-component. This is an analog video compression technique taking
-advantage of a property of the human visual system, being more sensitive
-to brightness information.
+was added to transmit the color difference signals.
+
+
+Subsampling
+===========
+
+YUV formats commonly encode images with a lower resolution for the chroma
+components than for the luma component. This compression technique, taking
+advantage of the human eye being more sensitive to luminance than color
+differences, is called chroma subsampling.
+
+While many combinations of subsampling factors in the horizontal and vertical
+direction are possible, common factors are 1 (no subsampling), 2 and 4, with
+horizontal subsampling always larger than or equal to vertical subsampling.
+Common combinations are named as follows.
+
+- `4:4:4`: No subsampling
+- `4:2:2`: Horizontal subsampling by 2, no vertical subsampling
+- `4:2:0`: Horizontal subsampling by 2, vertical subsampling by 2
+- `4:1:1`: Horizontal subsampling by 4, no vertical subsampling
+- `4:1:0`: Horizontal subsampling by 4, vertical subsampling by 4
+
+Subsampling the chroma component effectively creates chroma values that can be
+located in different spatial locations:
+
+- .. _yuv-chroma-centered:
+
+  The subsampled chroma value may be calculated by simply averaging the chroma
+  value of two consecutive pixels. It effectively models the chroma of a pixel
+  sited between the two original pixels. This is referred to as centered or
+  interstitially sited chroma.
+
+- .. _yuv-chroma-cosited:
+
+  The other option is to subsample chroma values in a way that place them in
+  the same spatial sites as the pixels. This may be performed by skipping every
+  other chroma sample (creating aliasing artifacts), or with filters using an
+  odd number of taps. This is referred to as co-sited chroma.
+
+The following examples show different combination of chroma siting in a 4x4
+image.
+
+.. flat-table:: 4:2:2 subsampling, interstitially sited
+    :header-rows: 1
+    :stub-columns: 1
+
+    * -
+      - 0
+      -
+      - 1
+      -
+      - 2
+      -
+      - 3
+    * - 0
+      - Y
+      - C
+      - Y
+      -
+      - Y
+      - C
+      - Y
+    * - 1
+      - Y
+      - C
+      - Y
+      -
+      - Y
+      - C
+      - Y
+    * - 2
+      - Y
+      - C
+      - Y
+      -
+      - Y
+      - C
+      - Y
+    * - 3
+      - Y
+      - C
+      - Y
+      -
+      - Y
+      - C
+      - Y
+
+.. flat-table:: 4:2:2 subsampling, co-sited
+    :header-rows: 1
+    :stub-columns: 1
+
+    * -
+      - 0
+      -
+      - 1
+      -
+      - 2
+      -
+      - 3
+    * - 0
+      - Y/C
+      -
+      - Y
+      -
+      - Y/C
+      -
+      - Y
+    * - 1
+      - Y/C
+      -
+      - Y
+      -
+      - Y/C
+      -
+      - Y
+    * - 2
+      - Y/C
+      -
+      - Y
+      -
+      - Y/C
+      -
+      - Y
+    * - 3
+      - Y/C
+      -
+      - Y
+      -
+      - Y/C
+      -
+      - Y
+
+.. flat-table:: 4:2:0 subsampling, horizontally interstitially sited, vertically co-sited
+    :header-rows: 1
+    :stub-columns: 1
+
+    * -
+      - 0
+      -
+      - 1
+      -
+      - 2
+      -
+      - 3
+    * - 0
+      - Y
+      - C
+      - Y
+      -
+      - Y
+      - C
+      - Y
+    * - 1
+      - Y
+      -
+      - Y
+      -
+      - Y
+      -
+      - Y
+    * - 2
+      - Y
+      - C
+      - Y
+      -
+      - Y
+      - C
+      - Y
+    * - 3
+      - Y
+      -
+      - Y
+      -
+      - Y
+      -
+      - Y
+
+.. flat-table:: 4:1:0 subsampling, horizontally and vertically interstitially sited
+    :header-rows: 1
+    :stub-columns: 1
+
+    * -
+      - 0
+      -
+      - 1
+      -
+      - 2
+      -
+      - 3
+    * - 0
+      - Y
+      -
+      - Y
+      -
+      - Y
+      -
+      - Y
+    * -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+    * - 1
+      - Y
+      -
+      - Y
+      -
+      - Y
+      -
+      - Y
+    * -
+      -
+      -
+      -
+      - C
+      -
+      -
+      -
+    * - 2
+      - Y
+      -
+      - Y
+      -
+      - Y
+      -
+      - Y
+    * -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+    * - 3
+      - Y
+      -
+      - Y
+      -
+      - Y
+      -
+      - Y
 
 
 .. toctree::
-- 
Regards,

Laurent Pinchart

