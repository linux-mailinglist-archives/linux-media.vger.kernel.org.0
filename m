Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA3F3781FA
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 12:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhEJKb0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 06:31:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:59988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231680AbhEJK3f (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 06:29:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 854456157F;
        Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620642443;
        bh=JrLMYL4JThvq3F8iBkWp1UK3eSd5nAUFv6Kg0wHMGcE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YnWY2hZWNeHAPr7IU+RXYtk/YCOhzkDj4igjW97kvMGX+dGYkPWgEA5G4RTwDEA/M
         sB/skEROu0R62Q0g+d3FJXlrl0Ox46VyjGPv5d9SVkqdxnECOc0NMPTSjDFSndqcBy
         Nmna0XJ7NqWro49eat00KYeKPZ/ekODKeue/CQMheyP1CPEqxSWB43VA/GMN0BHPaw
         KeqFwI1xcBgbtSJm8mH0WufW8++SFBG/Izo/289+NgNzIx2eUpLsN5fy3/S4y1ZtWg
         0B6ZP39Ro+PYej0LgbGrVsKUoAISVnYMF2OdpxsJ3ToysYHkANZqhgK7sOsfxTKPXA
         hYebhXr+7EqNw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lg38D-000UPs-GF; Mon, 10 May 2021 12:27:21 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 24/53] docs: userspace-api: media: v4l: avoid using UTF-8 chars
Date:   Mon, 10 May 2021 12:26:36 +0200
Message-Id: <7bfa245cf54bfea669e2f46de4a91eeb3155c169.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While UTF-8 characters can be used at the Linux documentation,
the best is to use them only when ASCII doesn't offer a good replacement.
So, replace the occurences of the following UTF-8 characters:

	- U+00a0 (' '): NO-BREAK SPACE
	- U+00d7 ('×'): MULTIPLICATION SIGN
	- U+2014 ('—'): EM DASH
	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/biblio.rst |  8 ++++----
 Documentation/userspace-api/media/v4l/crop.rst   | 16 ++++++++--------
 .../userspace-api/media/v4l/dev-decoder.rst      |  6 +++---
 .../userspace-api/media/v4l/diff-v4l.rst         |  2 +-
 Documentation/userspace-api/media/v4l/open.rst   |  2 +-
 .../userspace-api/media/v4l/vidioc-cropcap.rst   |  4 ++--
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 64d241daf63c..6e07b78bd39d 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -51,7 +51,7 @@ ISO 13818-1
 ===========
 
 
-:title:     ITU-T Rec. H.222.0 | ISO/IEC 13818-1 "Information technology — Generic coding of moving pictures and associated audio information: Systems"
+:title:     ITU-T Rec. H.222.0 | ISO/IEC 13818-1 "Information technology - Generic coding of moving pictures and associated audio information: Systems"
 
 :author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
 
@@ -61,7 +61,7 @@ ISO 13818-2
 ===========
 
 
-:title:     ITU-T Rec. H.262 | ISO/IEC 13818-2 "Information technology — Generic coding of moving pictures and associated audio information: Video"
+:title:     ITU-T Rec. H.262 | ISO/IEC 13818-2 "Information technology - Generic coding of moving pictures and associated audio information: Video"
 
 :author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
 
@@ -150,7 +150,7 @@ ITU-T.81
 ========
 
 
-:title:     ITU-T Recommendation T.81 "Information Technology — Digital Compression and Coding of Continous-Tone Still Images — Requirements and Guidelines"
+:title:     ITU-T Recommendation T.81 "Information Technology - Digital Compression and Coding of Continous-Tone Still Images - Requirements and Guidelines"
 
 :author:    International Telecommunication Union (http://www.itu.int)
 
@@ -310,7 +310,7 @@ ISO 12232:2006
 ==============
 
 
-:title:     Photography — Digital still cameras — Determination of exposure index, ISO speed ratings, standard output sensitivity, and recommended exposure index
+:title:     Photography - Digital still cameras - Determination of exposure index, ISO speed ratings, standard output sensitivity, and recommended exposure index
 
 :author:    International Organization for Standardization (http://www.iso.org)
 
diff --git a/Documentation/userspace-api/media/v4l/crop.rst b/Documentation/userspace-api/media/v4l/crop.rst
index 3fe185e25ccf..23c2b71f449e 100644
--- a/Documentation/userspace-api/media/v4l/crop.rst
+++ b/Documentation/userspace-api/media/v4l/crop.rst
@@ -130,22 +130,22 @@ the driver state and therefore only adjust the requested rectangle.
 
 Suppose scaling on a video capture device is restricted to a factor 1:1
 or 2:1 in either direction and the target image size must be a multiple
-of 16 × 16 pixels. The source cropping rectangle is set to defaults,
-which are also the upper limit in this example, of 640 × 400 pixels at
-offset 0, 0. An application requests an image size of 300 × 225 pixels,
+of 16 x 16 pixels. The source cropping rectangle is set to defaults,
+which are also the upper limit in this example, of 640 x 400 pixels at
+offset 0, 0. An application requests an image size of 300 x 225 pixels,
 assuming video will be scaled down from the "full picture" accordingly.
-The driver sets the image size to the closest possible values 304 × 224,
+The driver sets the image size to the closest possible values 304 x 224,
 then chooses the cropping rectangle closest to the requested size, that
-is 608 × 224 (224 × 2:1 would exceed the limit 400). The offset 0, 0 is
+is 608 x 224 (224 x 2:1 would exceed the limit 400). The offset 0, 0 is
 still valid, thus unmodified. Given the default cropping rectangle
 reported by :ref:`VIDIOC_CROPCAP <VIDIOC_CROPCAP>` the application can
 easily propose another offset to center the cropping rectangle.
 
 Now the application may insist on covering an area using a picture
 aspect ratio closer to the original request, so it asks for a cropping
-rectangle of 608 × 456 pixels. The present scaling factors limit
-cropping to 640 × 384, so the driver returns the cropping size 608 × 384
-and adjusts the image size to closest possible 304 × 192.
+rectangle of 608 x 456 pixels. The present scaling factors limit
+cropping to 640 x 384, so the driver returns the cropping size 608 x 384
+and adjusts the image size to closest possible 304 x 192.
 
 
 Examples
diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index 3d4138a4ba69..5b9b83feeceb 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -38,7 +38,7 @@ Conventions and Notations Used in This Document
 6. i = [a..b]: sequence of integers from a to b, inclusive, i.e. i =
    [0..2]: i = 0, 1, 2.
 
-7. Given an ``OUTPUT`` buffer A, then A’ represents a buffer on the ``CAPTURE``
+7. Given an ``OUTPUT`` buffer A, then A' represents a buffer on the ``CAPTURE``
    queue containing data that resulted from processing buffer A.
 
 .. _decoder-glossary:
@@ -288,7 +288,7 @@ Initialization
 
       Changing the ``OUTPUT`` format may change the currently set ``CAPTURE``
       format. How the new ``CAPTURE`` format is determined is up to the decoder
-      and the client must ensure it matches its needs afterwards.
+      and the client must ensure it matches its needs afterwards.
 
 2.  Allocate source (bytestream) buffers via :c:func:`VIDIOC_REQBUFS` on
     ``OUTPUT``.
@@ -874,7 +874,7 @@ it may be affected as per normal decoder operation.
 
    any of the following results on the ``CAPTURE`` queue is allowed:
 
-     {A’, B’, G’, H’}, {A’, G’, H’}, {G’, H’}.
+     {A', B', G', H'}, {A', G', H'}, {G', H'}.
 
    To determine the CAPTURE buffer containing the first decoded frame after the
    seek, the client may observe the timestamps to match the CAPTURE and OUTPUT
diff --git a/Documentation/userspace-api/media/v4l/diff-v4l.rst b/Documentation/userspace-api/media/v4l/diff-v4l.rst
index 33243ecb5033..9ce60e625974 100644
--- a/Documentation/userspace-api/media/v4l/diff-v4l.rst
+++ b/Documentation/userspace-api/media/v4l/diff-v4l.rst
@@ -447,7 +447,7 @@ name ``V4L2_FBUF_FLAG_CHROMAKEY``.
 
 In V4L, storing a bitmap pointer in ``clips`` and setting ``clipcount``
 to ``VIDEO_CLIP_BITMAP`` (-1) requests bitmap clipping, using a fixed
-size bitmap of 1024 × 625 bits. Struct :c:type:`v4l2_window`
+size bitmap of 1024 x 625 bits. Struct :c:type:`v4l2_window`
 has a separate ``bitmap`` pointer field for this purpose and the bitmap
 size is determined by ``w.width`` and ``w.height``.
 
diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
index 18bfb9b8137d..b015bbbdf8b5 100644
--- a/Documentation/userspace-api/media/v4l/open.rst
+++ b/Documentation/userspace-api/media/v4l/open.rst
@@ -100,7 +100,7 @@ Where ``X`` is a non-negative integer.
 	$ tree /dev/v4l
 	/dev/v4l
 	├── by-id
-	│   └── usb-OmniVision._USB_Camera-B4.04.27.1-video-index0 -> ../../video0
+	│   └── usb-OmniVision._USB_Camera-B4.04.27.1-video-index0 -> ../../video0
 	└── by-path
 	    └── pci-0000:00:14.0-usb-0:2:1.0-video-index0 -> ../../video0
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst b/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
index 551ac9d3c6ef..4ea652e66401 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
@@ -69,8 +69,8 @@ overlay devices.
     * - struct :ref:`v4l2_rect <v4l2-rect-crop>`
       - ``defrect``
       - Default cropping rectangle, it shall cover the "whole picture".
-	Assuming pixel aspect 1/1 this could be for example a 640 × 480
-	rectangle for NTSC, a 768 × 576 rectangle for PAL and SECAM
+	Assuming pixel aspect 1/1 this could be for example a 640 x 480
+	rectangle for NTSC, a 768 x 576 rectangle for PAL and SECAM
 	centered over the active picture area. The same co-ordinate system
 	as for ``bounds`` is used.
     * - struct :c:type:`v4l2_fract`
-- 
2.30.2

