Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819B854ABF4
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 10:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355009AbiFNIg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 04:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354351AbiFNIgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 04:36:43 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC493FD98;
        Tue, 14 Jun 2022 01:36:43 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DFCA66016E5;
        Tue, 14 Jun 2022 09:36:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655195801;
        bh=foMCKM0HcDBii6A+qPIk9svG81J6/ASfNN6IIllYc2U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GR6+UiovOS0Hgra9tqGI92u3dJaaPoyxO3vZSzFZByawW3tc3NBxoWW+RUOqYGI4b
         yvuNXyJnE6JCzLit06BwOK7+xNyxMlXi9MiLi8vLVzYiTm1S5Ci38/2O2YBJrOQhiJ
         BVD+GPbDJvvGRcbk1fAGp/njHjMJi7vYoXgEeXOF1PjCX+zM+uSf+BnHr43f3z4WuQ
         tKfegppYLqkjFvFwj+vdYnIhZ0pr5XN5wY/Z9YOIB0Fv8ppUEkBXJ/3FG2If3PxMAG
         eP3X2wDjf2Ok6wGFR9SnLwVrZPztwI4YKHsTz/ZYVEyPSfCiRZJn+vAC0uclkVIuzw
         3BuRuNNGzPZ3w==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 16/17] media: uapi: Change data_bit_offset definition
Date:   Tue, 14 Jun 2022 10:36:13 +0200
Message-Id: <20220614083614.240641-17-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220614083614.240641-1-benjamin.gaignard@collabora.com>
References: <20220614083614.240641-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'F.7.3.6.1 General slice segment header syntax' section of HEVC
specification describes that a slice header always end aligned on
byte boundary, therefore we only need to provide the data offset in bytes.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 7:
- Apply Jernej patches for Cedrus

 .../media/v4l/ext-ctrls-codec.rst             |  4 ++--
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 19 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 -
 include/media/hevc-ctrls.h                    |  4 ++--
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 48a8825a001b..37079581c661 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3008,8 +3008,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - ``bit_size``
       - Size (in bits) of the current slice data.
     * - __u32
-      - ``data_bit_offset``
-      - Offset (in bits) to the video data in the current slice data.
+      - ``data_byte_offset``
+      - Offset (in bytes) to the video data in the current slice data.
     * - __u32
       - ``num_entry_point_offsets``
       - Specifies the number of entry point offset syntax elements in the slice header.
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 411601975124..7b67cb4621cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -317,6 +317,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	u32 chroma_log2_weight_denom;
 	u32 output_pic_list_index;
 	u32 pic_order_cnt[2];
+	u8 *padding;
+	int count;
 	u32 reg;
 
 	sps = run->h265.sps;
@@ -405,7 +407,22 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	/* Initialize bitstream access. */
 	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_INIT_SWDEC);
 
-	cedrus_h265_skip_bits(dev, slice_params->data_bit_offset);
+	/*
+	 * Cedrus expects that bitstream pointer is actually at the end of the slice header
+	 * instead of start of slice data. Padding is 8 bits at most (one bit set to 1 and
+	 * at most seven bits set to 0), so we have to inspect only one byte before slice data.
+	 */
+	padding = (u8 *)vb2_plane_vaddr(&run->src->vb2_buf, 0) +
+		slice_params->data_byte_offset - 1;
+
+	for (count = 0; count < 8; count++)
+		if (*padding & (1 << count))
+			break;
+
+	/* Include the one bit. */
+	count++;
+
+	cedrus_h265_skip_bits(dev, slice_params->data_byte_offset * 8 - count);
 
 	/* Bitstream parameters. */
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 33726175d980..66714609b577 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -568,7 +568,6 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
-	src_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
 	src_vq->ops = &cedrus_qops;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 9abca1a75bd4..936ff693967b 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -312,7 +312,7 @@ struct v4l2_hevc_pred_weight_table {
  * V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
  *
  * @bit_size: size (in bits) of the current slice data
- * @data_bit_offset: offset (in bits) to the video data in the current slice data
+ * @data_byte_offset: offset (in bytes) to the video data in the current slice data
  * @num_entry_point_offsets: specifies the number of entry point offset syntax
  *			     elements in the slice header.
  * @nal_unit_type: specifies the coding type of the slice (B, P or I)
@@ -356,7 +356,7 @@ struct v4l2_hevc_pred_weight_table {
  */
 struct v4l2_ctrl_hevc_slice_params {
 	__u32	bit_size;
-	__u32	data_bit_offset;
+	__u32	data_byte_offset;
 	__u32	num_entry_point_offsets;
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
 	__u8	nal_unit_type;
-- 
2.32.0

