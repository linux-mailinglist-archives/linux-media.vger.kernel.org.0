Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02D2389C54
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbfHLLGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:06:25 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:46399 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728157AbfHLLGZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:06:25 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x89ahQBOrur8Tx89ehi1BX; Mon, 12 Aug 2019 13:06:23 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 08/12] pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation
Date:   Mon, 12 Aug 2019 13:05:09 +0200
Message-Id: <20190812110513.23774-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOeSl0RRO0AQrVOaPBDR2b2vqWpUwp0wlTbamPoRr62HZ2fYJvRfwDdJID2hgdNFiJjMO5LB6FCfOxPLgCPS1s8iUMFCa3G/ElfY9/YRGA0tEz+8GY93
 7LOz3By/yFsuVYRa6RMnASZ9lCniB7yidu5qSnGnTIbzwD3KXzYmLkJpU+voNYrgByCxxADoEeuvN/6/15WYKsDkrHQTQk151bsLV0scP3U2ulCqmz0JCxil
 NQLYWBbvRBz9cZqeZXGljw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The existing documentation was incorrect and did not correspond
to how actual codec drivers implemented this.

Update the documentation to explicitly specify what is actually
expected.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/uapi/v4l/pixfmt-compressed.rst      | 36 +++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
index f52a7b67023d..9bb4a172a660 100644
--- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
@@ -41,7 +41,12 @@ Compressed Formats
 
       - ``V4L2_PIX_FMT_H264``
       - 'H264'
-      - H264 video elementary stream with start codes.
+      - H264 Access Unit.
+	The decoder expects one Access Unit per buffer.
+	The encoder generates one Access Unit per buffer.
+	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
+	then the decoder has no requirements since it can parse all the
+	information from the raw bytestream.
     * .. _V4L2-PIX-FMT-H264-NO-SC:
 
       - ``V4L2_PIX_FMT_H264_NO_SC``
@@ -86,12 +91,20 @@ Compressed Formats
 
       - ``V4L2_PIX_FMT_MPEG1``
       - 'MPG1'
-      - MPEG1 video elementary stream.
+      - MPEG1 Picture. Each buffer starts with a Picture header, followed
+	by other headers as needed and ending with the Picture data.
+	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
+	then the decoder has no requirements since it can parse all the
+	information from the raw bytestream.
     * .. _V4L2-PIX-FMT-MPEG2:
 
       - ``V4L2_PIX_FMT_MPEG2``
       - 'MPG2'
-      - MPEG2 video elementary stream.
+      - MPEG2 Picture. Each buffer starts with a Picture header, followed
+	by other headers as needed and ending with the Picture data.
+	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
+	then the decoder has no requirements since it can parse all the
+	information from the raw bytestream.
     * .. _V4L2-PIX-FMT-MPEG2-SLICE:
 
       - ``V4L2_PIX_FMT_MPEG2_SLICE``
@@ -132,7 +145,9 @@ Compressed Formats
 
       - ``V4L2_PIX_FMT_VP8``
       - 'VP80'
-      - VP8 video elementary stream.
+      - VP8 compressed video frame. The encoder generates one
+	compressed frame per buffer, and the decoder requires one
+	compressed frame per buffer.
     * .. _V4L2-PIX-FMT-VP8-FRAME:
 
       - ``V4L2_PIX_FMT_VP8_FRAME``
@@ -157,12 +172,19 @@ Compressed Formats
 
       - ``V4L2_PIX_FMT_VP9``
       - 'VP90'
-      - VP9 video elementary stream.
+      - VP9 compressed video frame. The encoder generates one
+	compressed frame per buffer, and the decoder requires one
+	compressed frame per buffer.
     * .. _V4L2-PIX-FMT-HEVC:
 
       - ``V4L2_PIX_FMT_HEVC``
       - 'HEVC'
-      - HEVC/H.265 video elementary stream.
+      - HEVC/H.265 Access Unit.
+	The decoder expects one Access Unit per buffer.
+	The encoder generates one Access Unit per buffer.
+	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
+	then the decoder has no	requirements since it can parse all the
+	information from the raw bytestream.
     * .. _V4L2-PIX-FMT-FWHT:
 
       - ``V4L2_PIX_FMT_FWHT``
@@ -170,6 +192,8 @@ Compressed Formats
       - Video elementary stream using a codec based on the Fast Walsh Hadamard
         Transform. This codec is implemented by the vicodec ('Virtual Codec')
 	driver. See the codec-fwht.h header for more details.
+	:ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
+	since the decoder can parse all the information from the raw bytestream.
     * .. _V4L2-PIX-FMT-FWHT-STATELESS:
 
       - ``V4L2_PIX_FMT_FWHT_STATELESS``
-- 
2.20.1

