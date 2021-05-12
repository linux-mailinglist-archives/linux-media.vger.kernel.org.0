Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E9737BD0D
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 14:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhELMxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 08:53:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231481AbhELMw7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 08:52:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C79261433;
        Wed, 12 May 2021 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620823902;
        bh=9CPQp7MPzDV6VUXKW/UwJMFGHuGr2ouXLMwFYL30Ie8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LZ/zLEsCzTMn33lLAlI+FcB1PvtFemZvcFqOe0kLj6E8X27RmgdG+FFkCid1ZcvD3
         A/WsjuQ+ZLkcI8eoLyBvnHTiws6g2SsMGo+Yw732IGQ6gWlwzHNL1EWjKgrAW5BcHj
         4f/8UEzI2mlzmfQnxESDaKAsl/Ff+bLEaqewRUvWZZFiTvvcrMwuA/ijYHEZdWpZe5
         eOCcVFdBP5Ro7c1VK1GA9dSRkoQPag0lLzfbXQCGJ3c7ivRQt7RTwESj6a549za3Gf
         ANVlN1OQfNIhwmI8eWHeHYzHYarpjc7GIbznoAMmZN4hYB1Z0lAWILJeiwu9oPBYGQ
         HDttaeqlXaGKQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lgoKy-0018hl-L6; Wed, 12 May 2021 14:51:40 +0200
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
Subject: [PATCH v2 15/40] docs: userspace-api: media: v4l: Use ASCII subset instead of UTF-8 alternate symbols
Date:   Wed, 12 May 2021 14:50:19 +0200
Message-Id: <9b48ff68615727c517df824af6a5b8f9edf55622.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620823573.git.mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
and some automatic rules which exists on certain text editors like
LibreOffice turned ASCII characters into some UTF-8 alternatives that
are better displayed on html and PDF.

While it is OK to use UTF-8 characters in Linux, it is better to
use the ASCII subset instead of using an UTF-8 equivalent character
as it makes life easier for tools like grep, and are easier to edit
with the some commonly used text/source code editors.

Also, Sphinx already do such conversion automatically outside literal blocks:
   https://docutils.sourceforge.io/docs/user/smartquotes.html

So, replace the occurences of the following UTF-8 characters:

	- U+00a0 (' '): NO-BREAK SPACE
	- U+00d7 ('×'): MULTIPLICATION SIGN
	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/crop.rst   | 16 ++++++++--------
 .../userspace-api/media/v4l/dev-decoder.rst      |  6 +++---
 .../userspace-api/media/v4l/diff-v4l.rst         |  2 +-
 Documentation/userspace-api/media/v4l/open.rst   |  2 +-
 .../userspace-api/media/v4l/vidioc-cropcap.rst   |  4 ++--
 5 files changed, 15 insertions(+), 15 deletions(-)

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

