Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0A90294EA
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 11:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390302AbfEXJgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 05:36:55 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:47395 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389881AbfEXJgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 05:36:55 -0400
X-Originating-IP: 90.88.147.134
Received: from localhost.localdomain (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E2382FF80B;
        Fri, 24 May 2019 09:36:50 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 2/4] media: pixfmt: Add HEVC slice pixel format
Date:   Fri, 24 May 2019 11:36:33 +0200
Message-Id: <20190524093635.1832-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524093635.1832-1-paul.kocialkowski@bootlin.com>
References: <20190524093635.1832-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce the V4L2_PIX_FMT_HEVC_SLICE pixel format, which currently
describes an output buffer with enough appended slice data for
producing one decoded frame with a stateless video decoder.

This will need to be reworked (along with the controls and the core) to
allow passing slice data individually, as it is the natural decoding
unit in HEVC.

We also need to figure out the description of the possible source data:
* Compressed slice data only, with slice controls attached;
* Slice data in Annex-B format (with raw slice header), without slice
  controls attached;
* Slice data in Annex-B format (with raw slice header), with slice
  controls attached.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 include/media/hevc-ctrls.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 9ea013c88afc..2de83d9f6d47 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -11,6 +11,9 @@
 #ifndef _HEVC_CTRLS_H_
 #define _HEVC_CTRLS_H_
 
+/* The pixel format isn't stable at the moment and will likely be renamed. */
+#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
+
 #define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_MPEG_BASE + 1008)
 #define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_MPEG_BASE + 1009)
 #define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_MPEG_BASE + 1010)
-- 
2.21.0

