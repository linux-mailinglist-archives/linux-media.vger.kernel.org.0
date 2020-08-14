Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8209F244A9B
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgHNNhX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgHNNhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:37:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7667AC061384;
        Fri, 14 Aug 2020 06:37:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 61B5129A825
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
Subject: [PATCH v3 08/19] media: uapi: h264: Drop SLICE_PARAMS 'size' field
Date:   Fri, 14 Aug 2020 10:36:23 -0300
Message-Id: <20200814133634.95665-9-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814133634.95665-1-ezequiel@collabora.com>
References: <20200814133634.95665-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The SLICE_PARAMS control is intended for slice-based
devices. In this mode, the OUTPUT buffer contains
a single slice, and so the buffer's plane payload size
can be used to query the slice size.

To reduce the API surface drop the size from the
SLICE_PARAMS control.

A follow-up change will remove other members in SLICE_PARAMS
so we don't need to add padding fields here.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 ---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c          | 7 +++----
 include/media/h264-ctrls.h                                | 3 ---
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c0ae7fda803e..e88c207d945b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1760,9 +1760,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - __u32
-      - ``size``
-      -
     * - __u32
       - ``start_byte_offset``
         Offset (in bytes) from the beginning of the OUTPUT buffer to the start
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index d5636dbbb622..7d9bd5860a1b 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -324,17 +324,16 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	struct vb2_buffer *src_buf = &run->src->vb2_buf;
 	struct cedrus_dev *dev = ctx->dev;
 	dma_addr_t src_buf_addr;
-	u32 len = slice->size * 8;
+	size_t slice_bytes = vb2_get_plane_payload(src_buf, 0);
 	unsigned int pic_width_in_mbs;
 	bool mbaff_pic;
 	u32 reg;
 
-	cedrus_write(dev, VE_H264_VLD_LEN, len);
+	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
 	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
 
 	src_buf_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-	cedrus_write(dev, VE_H264_VLD_END,
-		     src_buf_addr + vb2_get_plane_payload(src_buf, 0));
+	cedrus_write(dev, VE_H264_VLD_END, src_buf_addr + slice_bytes);
 	cedrus_write(dev, VE_H264_VLD_ADDR,
 		     VE_H264_VLD_ADDR_VAL(src_buf_addr) |
 		     VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID |
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index d178d7ad53b6..afcae3052085 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -165,9 +165,6 @@ struct v4l2_h264_reference {
 };
 
 struct v4l2_ctrl_h264_slice_params {
-	/* Size in bytes, including header */
-	__u32 size;
-
 	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
 	__u32 start_byte_offset;
 
-- 
2.27.0

