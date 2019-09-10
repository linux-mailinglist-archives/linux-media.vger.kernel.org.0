Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 993EAAE7DF
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 12:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbfIJKUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 06:20:36 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47531 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbfIJKUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 06:20:36 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i7dGE-0002HE-Vw; Tue, 10 Sep 2019 12:20:34 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: [PATCH] media: uapi: h264: clarify V4L2_PIX_FMT_H264_SLICE format
Date:   Tue, 10 Sep 2019 12:20:30 +0200
Message-Id: <20190910102030.2236-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that the slice headers must be included for the benefit of
decoders that parse them (partially) in hardware, and that the start
code is optional. Add a link to the ITU-T Rec. H.264 specification
section that describes the slice format.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/media/uapi/v4l/pixfmt-compressed.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
index 292fdc116c77..55d8d690f22f 100644
--- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
@@ -61,10 +61,10 @@ Compressed Formats
 
       - ``V4L2_PIX_FMT_H264_SLICE``
       - 'S264'
-      - H264 parsed slice data, without the start code and as
-	extracted from the H264 bitstream.  This format is adapted for
-	stateless video decoders that implement an H264 pipeline
-	(using the :ref:`mem2mem` and :ref:`media-request-api`).
+      - H264 parsed slice data, including slice headers, either with or
+	without the start code, as extracted from the H264 bitstream.
+	This format is adapted for stateless video decoders that implement an
+	H264 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
 	This pixelformat has two modifiers that must be set at least once
 	through the ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE``
         and ``V4L2_CID_MPEG_VIDEO_H264_START_CODE`` controls.
@@ -80,6 +80,10 @@ Compressed Formats
 	appropriate number of macroblocks to decode a full
 	corresponding frame to the matching capture buffer.
 
+	The syntax for this format is documented in :ref:`h264`, section
+	7.3.2.8 "Slice layer without partitioning RBSP syntax" and the following
+	sections.
+
 	.. note::
 
 	   This format is not yet part of the public kernel API and it
-- 
2.20.1

