Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27643C07A7
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfI0OeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:34:20 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:52467 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfI0OeU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:34:20 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0A24120002;
        Fri, 27 Sep 2019 14:34:17 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v8 2/3] media: pixfmt: Document the HEVC slice pixel format
Date:   Fri, 27 Sep 2019 16:34:10 +0200
Message-Id: <20190927143411.141526-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927143411.141526-1-paul.kocialkowski@bootlin.com>
References: <20190927143411.141526-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the current state of the HEVC slice pixel format.
The format will need to evolve in the future, which is why it is
not part of the public API.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../media/uapi/v4l/pixfmt-compressed.rst      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
index 292fdc116c77..7e9b2b939e59 100644
--- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
@@ -188,6 +188,29 @@ Compressed Formats
 	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
 	then the decoder has no	requirements since it can parse all the
 	information from the raw bytestream.
+    * .. _V4L2-PIX-FMT-HEVC-SLICE:
+
+      - ``V4L2_PIX_FMT_HEVC_SLICE``
+      - 'S265'
+      - HEVC parsed slice data, as extracted from the HEVC bitstream.
+	This format is adapted for stateless video decoders that implement a
+	HEVC pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
+	This pixelformat has two modifiers that must be set at least once
+	through the ``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE``
+        and ``V4L2_CID_MPEG_VIDEO_HEVC_START_CODE`` controls.
+	Metadata associated with the frame to decode is required to be passed
+	through the following controls :
+        * ``V4L2_CID_MPEG_VIDEO_HEVC_SPS``
+        * ``V4L2_CID_MPEG_VIDEO_HEVC_PPS``
+        * ``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS``
+	See the :ref:`associated Codec Control IDs <v4l2-mpeg-hevc>`.
+	Buffers associated with this pixel format must contain the appropriate
+	number of macroblocks to decode a full corresponding frame.
+
+	.. note::
+
+	   This format is not yet part of the public kernel API and it
+	   is expected to change.
     * .. _V4L2-PIX-FMT-FWHT:
 
       - ``V4L2_PIX_FMT_FWHT``
-- 
2.23.0

