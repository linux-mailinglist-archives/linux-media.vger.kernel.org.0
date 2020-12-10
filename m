Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979802D58E3
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389181AbgLJK46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:56:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:56248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389167AbgLJK4k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:56:40 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] media: docs: sliced-vbi: fix V4L2_SLICED_WSS_625 docs
Date:   Thu, 10 Dec 2020 11:55:43 +0100
Message-Id: <2cb1af25956a33cccc59d751d3c44382db87ef47.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While fixing issues with PDF generation, I noticed that
bit 8 was missing for WSS 625 format.

While here, convert the literal block into a tables,
as it becomes more visible.

I opted to move the payload into a separate table, as
Sphinx has troubles with complex nested tables.

This way, it should work fine on both html and LaTeX/PDF
formats.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l/dev-sliced-vbi.rst              | 23 ++++++++++++------
 .../media/v4l/vidioc-g-sliced-vbi-cap.rst     | 24 +++++++++++++------
 2 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index f0df144c9f63..213b736c9b67 100644
--- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -253,13 +253,7 @@ Sliced VBI services
 
 	:ref:`en300294`
       - PAL/SECAM line 23
-      -
-
-	::
-
-	    Byte         0                 1
-		  msb         lsb  msb           lsb
-	     Bit  7 6 5 4 3 2 1 0  x x 13 12 11 10 9
+      -  See :ref:`v4l2-sliced-wss-625-payload` below.
     * - ``V4L2_SLICED_VBI_525``
       - 0x1000
       - :cspan:`2` Set of services applicable to 525 line systems.
@@ -282,6 +276,21 @@ format while i/o is in progress (between a
 :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` call, and after the first
 :c:func:`read()` or :c:func:`write()` call).
 
+.. _v4l2-sliced-wss-625-payload:
+
+V4L2_SLICED_WSS_625 payload
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The payload for ``V4L2_SLICED_WSS_625`` is:
+
+           +-----+------------------+-----------------------+
+	   |Byte |        0         |           1           |
+           +-----+--------+---------+-----------+-----------+
+	   |     | msb    | lsb     | msb       | lsb       |
+           |     +-+-+-+--+--+-+-+--+--+-+--+---+---+--+-+--+
+	   | Bit |7|6|5|4 | 3|2|1|0 | x|x|13|12 | 11|10|9|8 |
+           +-----+-+-+-+--+--+-+-+--+--+-+--+---+---+--+-+--+
+
 Reading and writing sliced VBI data
 ===================================
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
index 752f7f5fae73..b3f4dc71bb5d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
@@ -162,13 +162,7 @@ the sliced VBI API is unsupported or ``type`` is invalid.
 
 	:ref:`itu1119`
       - PAL/SECAM line 23
-      -
-
-	::
-
-	    Byte        0                 1
-		 msb         lsb  msb           lsb
-	    Bit  7 6 5 4 3 2 1 0  x x 13 12 11 10 9
+      - See :ref:`v4l2-sliced-vbi-cap-wss-625-payload` below.
     * - ``V4L2_SLICED_VBI_525``
       - 0x1000
       - :cspan:`2` Set of services applicable to 525 line systems.
@@ -180,6 +174,22 @@ the sliced VBI API is unsupported or ``type`` is invalid.
 
     \normalsize
 
+.. _v4l2-sliced-vbi-cap-wss-625-payload:
+
+V4L2_SLICED_VBI_CAP WSS_625 payload
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The payload for ``V4L2_SLICED_WSS_625`` is:
+
+	    +-----+------------------+-----------------------+
+	    |Byte |        0         |           1           |
+	    +-----+--------+---------+-----------+-----------+
+	    |     | msb    | lsb     | msb       | lsb       |
+	    |     +-+-+-+--+--+-+-+--+--+-+--+---+---+--+-+--+
+	    | Bit |7|6|5|4 | 3|2|1|0 | x|x|13|12 | 11|10|9|8 |
+	    +-----+-+-+-+--+--+-+-+--+--+-+--+---+---+--+-+--+
+
+
 Return Value
 ============
 
-- 
2.29.2

