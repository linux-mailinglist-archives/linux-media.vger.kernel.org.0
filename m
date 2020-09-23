Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9553F274F2A
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgIWCoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53034 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgIWCoW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:22 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A8B0148B;
        Wed, 23 Sep 2020 04:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829055;
        bh=ZMZbzk2d+xdgxXjVKcsyoSKGCrklX/Vdo2lon9UkO44=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sRc76/PgVmN+KABOaXJmOQLvOsk4KcD9XmdclEE5coco0NJpWlwLjGYwqh8VdHM5S
         k55MfsjHJ16hL5OpxQHbEv3SfOXkIL8wpIik4y+fClheeZsM7+tHARaWiwyQjJp9Np
         7RfxtTQqjt/vMdhvjKX6WDTrm5ZBBz0cqHZ62sa4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 07/16] media: doc: pixfmt-yuv: Document subsampling in more details
Date:   Wed, 23 Sep 2020 05:43:24 +0300
Message-Id: <20200923024333.920-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
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
index 5180bbe16c6e..38c2bde6a87d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
@@ -74,60 +74,5 @@ Each cell is one byte.
 
 
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
index 19d47b38e02a..26d7df9e1298 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
@@ -79,58 +79,5 @@ Each cell is one byte.
 
 
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
index 115ea603c13f..752c42a0f52c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
@@ -91,61 +91,5 @@ Each cell is one byte.
 
 
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
index 977636fc98d6..82659557daae 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
@@ -87,74 +87,5 @@ Each cell is one byte.
 
 
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
index cf33942d942d..3e8ae54c846e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
@@ -91,74 +91,5 @@ Each cell is one byte.
 
 
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
index 776cb37f76f1..5571d771af89 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
@@ -73,45 +73,5 @@ Each cell is one byte.
 
 
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
index 6cd574e78e4c..3d0dce59c591 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
@@ -73,43 +73,5 @@ Each cell is one byte.
 
 
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
index 211afd7593cc..880e87490b25 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
@@ -96,63 +96,5 @@ Each cell is one byte.
 
 
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
index 1d20115f2b1d..b4b0bcd96f6e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
@@ -75,60 +75,5 @@ Each cell is one byte.
 
 
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
index 967ba7ce41a2..65d5a9b54500 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
@@ -83,40 +83,5 @@ Each cell is one byte.
 
 
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
index 7cb685cc8289..cc1a5df03248 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
@@ -84,67 +84,5 @@ Each cell is one byte.
 
 
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
index 80c14d4f5acb..d189903d8ff3 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
@@ -93,67 +93,5 @@ Each cell is one byte.
 
 
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
index 29b78480ccad..5ffea984a160 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
@@ -104,45 +104,5 @@ Each cell is one byte.
 
 
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
index 73fde222d820..ee4e7badbf4c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
@@ -92,45 +92,5 @@ Each cell is one byte.
 
 
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
index 7073ac7f842d..52ebc67d7ebe 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
@@ -114,35 +114,4 @@ Each cell is one byte.
 
 
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
index fe70e007787d..0ad1169b221f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
@@ -76,50 +76,5 @@ Each cell is one byte.
 
 
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
index 96c1b537d5a0..c9f35d7183c5 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
@@ -73,43 +73,5 @@ Each cell is one byte.
 
 
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
index 8ee92d0cd769..77ab71c7d0f5 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -21,11 +21,251 @@ reconstructed by subtracting from the brightness component. See
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

