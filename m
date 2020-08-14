Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE55244AA7
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgHNNg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:36:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43184 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbgHNNg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:36:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8BA8B29A807
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 02/19] media: uapi: h264: Further clarify scaling lists order
Date:   Fri, 14 Aug 2020 10:36:17 -0300
Message-Id: <20200814133634.95665-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814133634.95665-1-ezequiel@collabora.com>
References: <20200814133634.95665-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 0b0393d59eb4a ("media: uapi: h264: clarify
expected scaling_list_4x4/8x8 order") improved the
documentation on H264 scaling lists order.

This commit improves the documentation by clarifying
that the lists themselves are expected in raster scan order.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2:
* Use "raster scan order" instead of "matrix order"
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index b9b2617c3bda..694037ce888a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1725,12 +1725,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``scaling_list_4x4[6][16]``
       - Scaling matrix after applying the inverse scanning process.
         Expected list order is Intra Y, Intra Cb, Intra Cr, Inter Y,
-        Inter Cb, Inter Cr.
+        Inter Cb, Inter Cr. The values on each scaling list are
+        expected in raster scan order.
     * - __u8
       - ``scaling_list_8x8[6][64]``
       - Scaling matrix after applying the inverse scanning process.
         Expected list order is Intra Y, Inter Y, Intra Cb, Inter Cb,
-        Intra Cr, Inter Cr.
+        Intra Cr, Inter Cr. The values on each scaling list are
+        expected in raster scan order.
 
 ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS (struct)``
     Specifies the slice parameters (as extracted from the bitstream)
-- 
2.27.0

