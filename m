Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10216CA5AE
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 15:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbjC0NYl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 09:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbjC0NYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 09:24:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB68422C
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 06:23:31 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pgmop-00060J-Ql; Mon, 27 Mar 2023 15:23:27 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        mtr@pengutronix.de
Subject: [RFC PATCH] media: hantro: respect data_offset in vb2_plane
Date:   Mon, 27 Mar 2023 15:23:24 +0200
Message-Id: <20230327132324.1781416-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vb2_plane in the vb2_v4l2_buffer may have a data_offset, which is
written by user space to tell the driver that the data starts at an
offset into the buffer. Currently the hantro driver assumes that the
data starts directly at the base address of the buffer.

Add the data_offset to the plane dma_address to make sure that the
encoder actually reads the plane data if the user space put the plane
data at an offset into the buffer. Otherwise the encoded data may not be
the data that userspace expected to be encoded.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Hi,

Most other drivers also assume that the address returned by
vb2_dma_contig_plane_dma_addr() is the start of the plane data. Maybe it
would be better to change vb2_dma_contig_plane_dma_addr() to already add
the data_offset to the plane address. However, there are a few drivers
that already have a helper that respects the data_offset, but that seems
to be the exception rather than the rule.

What I am actually trying to achieve is to import a V4L2_PIX_FMT_NV12
buffer from a Rockchip RGA2 (which doesn't support the multi-planar API)
as a V4L2_PIX_FMT_NV12M buffer into the Hantro JPEG encoder (which
doesn't support V4L2_PIX_FMT_NV12). Solving this by importing the same
FD for each plane with a respective offset is how one would import such
a buffer with the DRM API. Please tell me, if my approach is wrong and,
if so, how I should solve it differently.

Michael
---
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c   | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
index 8395c4d48dd0..05df7768187d 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
@@ -32,6 +32,16 @@
 
 #define VEPU_JPEG_QUANT_TABLE_COUNT 16
 
+static dma_addr_t rockchip_vpu2_plane_dma_addr(struct vb2_buffer *vb,
+					       unsigned int plane_no)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	dma_addr_t base = vb2_dma_contig_plane_dma_addr(vb, plane_no);
+	unsigned int offset = v4l2_buf->planes[plane_no].data_offset;
+
+	return base + offset;
+}
+
 static void rockchip_vpu2_set_src_img_ctrl(struct hantro_dev *vpu,
 					   struct hantro_ctx *ctx)
 {
@@ -79,23 +89,23 @@ static void rockchip_vpu2_jpeg_enc_set_buffers(struct hantro_dev *vpu,
 
 	WARN_ON(pix_fmt->num_planes > 3);
 
-	vepu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(dst_buf, 0) +
+	vepu_write_relaxed(vpu, rockchip_vpu2_plane_dma_addr(dst_buf, 0) +
 				ctx->vpu_dst_fmt->header_size,
 			   VEPU_REG_ADDR_OUTPUT_STREAM);
 	vepu_write_relaxed(vpu, size_left, VEPU_REG_STR_BUF_LIMIT);
 
 	if (pix_fmt->num_planes == 1) {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+		src[0] = rockchip_vpu2_plane_dma_addr(src_buf, 0);
 		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
 	} else if (pix_fmt->num_planes == 2) {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
+		src[0] = rockchip_vpu2_plane_dma_addr(src_buf, 0);
+		src[1] = rockchip_vpu2_plane_dma_addr(src_buf, 1);
 		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
 		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
 	} else {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
-		src[2] = vb2_dma_contig_plane_dma_addr(src_buf, 2);
+		src[0] = rockchip_vpu2_plane_dma_addr(src_buf, 0);
+		src[1] = rockchip_vpu2_plane_dma_addr(src_buf, 1);
+		src[2] = rockchip_vpu2_plane_dma_addr(src_buf, 2);
 		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
 		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
 		vepu_write_relaxed(vpu, src[2], VEPU_REG_ADDR_IN_PLANE_2);
-- 
2.30.2

