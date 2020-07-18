Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D262248DA
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 07:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgGRFGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 01:06:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:44046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbgGRFGB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 01:06:01 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 606FF2083B;
        Sat, 18 Jul 2020 05:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595048760;
        bh=ojj7GnqfqGS8LAnmrju8sV2OmdDNvXHUPH2FlYIO4dQ=;
        h=From:To:Cc:Subject:Date:From;
        b=VxImCxYxvE6Y5kSxGVPCpAs3DXYtIuvhVkcD5RizdYIlzBruoFMaKsLoSmYkUAKHO
         0aOKkUXcjAMTp5IMD+h+gIpmT6Ri4lQ5wE0gDGR2WTeIait8cmHUdOsAnO8hWmAwn7
         C2rMUERvbG12v7m6qQqMq95mreQSf9CUSrz+6RjA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1jwf2r-003EDt-S8; Sat, 18 Jul 2020 07:05:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 1/3] media: rkvdec: Fix H264 scaling list order
Date:   Sat, 18 Jul 2020 07:05:54 +0200
Message-Id: <2630e1bb0948c3134c6f22ad275ae27cc6023532.1595048742.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonas Karlman <jonas@kwiboo.se>

The Rockchip Video Decoder driver is expecting that the values in a
scaling list are in zig-zag order and applies the inverse scanning process
to get the values in matrix order.

Commit 0b0393d59eb4 ("media: uapi: h264: clarify expected
scaling_list_4x4/8x8 order") clarified that the values in the scaling list
should already be in matrix order.

Fix this by removing the reordering and change to use two memcpy.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
[hverkuil-cisco@xs4all.nl: rkvdec_scaling_matrix -> rkvdec_h264_scaling_list]
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 66 +++++++---------------
 1 file changed, 20 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index cd4980d06be7..7b66e2743a4f 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -18,11 +18,16 @@
 /* Size with u32 units. */
 #define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
 #define RKV_RPS_SIZE			((128 + 128) / 4)
-#define RKV_SCALING_LIST_SIZE		(6 * 16 + 6 * 64 + 128)
 #define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
 
 #define RKVDEC_NUM_REFLIST		3
 
+struct rkvdec_h264_scaling_list {
+	u8 scaling_list_4x4[6][16];
+	u8 scaling_list_8x8[6][64];
+	u8 padding[128];
+};
+
 struct rkvdec_sps_pps_packet {
 	u32 info[8];
 };
@@ -86,7 +91,7 @@ struct rkvdec_ps_field {
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_h264_priv_tbl {
 	s8 cabac_table[4][464][2];
-	u8 scaling_list[RKV_SCALING_LIST_SIZE];
+	struct rkvdec_h264_scaling_list scaling_list;
 	u32 rps[RKV_RPS_SIZE];
 	struct rkvdec_sps_pps_packet param_set[256];
 	u8 err_info[RKV_ERROR_INFO_SIZE];
@@ -785,56 +790,25 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 	}
 }
 
-/*
- * NOTE: The values in a scaling list are in zig-zag order, apply inverse
- * scanning process to get the values in matrix order.
- */
-static const u32 zig_zag_4x4[16] = {
-	0, 1, 4, 8, 5, 2, 3, 6, 9, 12, 13, 10, 7, 11, 14, 15
-};
-
-static const u32 zig_zag_8x8[64] = {
-	0,  1,  8, 16,  9,  2,  3, 10, 17, 24, 32, 25, 18, 11,  4,  5,
-	12, 19, 26, 33, 40, 48, 41, 34, 27, 20, 13,  6,  7, 14, 21, 28,
-	35, 42, 49, 56, 57, 50, 43, 36, 29, 22, 15, 23, 30, 37, 44, 51,
-	58, 59, 52, 45, 38, 31, 39, 46, 53, 60, 61, 54, 47, 55, 62, 63
-};
-
-static void reorder_scaling_list(struct rkvdec_ctx *ctx,
-				 struct rkvdec_h264_run *run)
+static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
+				     struct rkvdec_h264_run *run)
 {
 	const struct v4l2_ctrl_h264_scaling_matrix *scaling = run->scaling_matrix;
-	const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
-	const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
-	const size_t num_list_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8);
-	const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
-	u8 *dst = tbl->scaling_list;
-	const u8 *src;
-	int i, j;
 
-	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_4x4) != list_len_4x4);
-	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_8x8) != list_len_8x8);
-	BUILD_BUG_ON(ARRAY_SIZE(tbl->scaling_list) <
-		     num_list_4x4 * list_len_4x4 +
-		     num_list_8x8 * list_len_8x8);
+	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_4x4) !=
+		     sizeof(scaling->scaling_list_4x4));
+	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_8x8) !=
+		     sizeof(scaling->scaling_list_8x8));
 
-	src = &scaling->scaling_list_4x4[0][0];
-	for (i = 0; i < num_list_4x4; ++i) {
-		for (j = 0; j < list_len_4x4; ++j)
-			dst[zig_zag_4x4[j]] = src[j];
-		src += list_len_4x4;
-		dst += list_len_4x4;
-	}
+	memcpy(tbl->scaling_list.scaling_list_4x4,
+	       scaling->scaling_list_4x4,
+	       sizeof(scaling->scaling_list_4x4));
 
-	src = &scaling->scaling_list_8x8[0][0];
-	for (i = 0; i < num_list_8x8; ++i) {
-		for (j = 0; j < list_len_8x8; ++j)
-			dst[zig_zag_8x8[j]] = src[j];
-		src += list_len_8x8;
-		dst += list_len_8x8;
-	}
+	memcpy(tbl->scaling_list.scaling_list_8x8,
+	       scaling->scaling_list_8x8,
+	       sizeof(scaling->scaling_list_8x8));
 }
 
 /*
@@ -1126,7 +1100,7 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
 				    h264_ctx->reflists.b1);
 
-	reorder_scaling_list(ctx, &run);
+	assemble_hw_scaling_list(ctx, &run);
 	assemble_hw_pps(ctx, &run);
 	assemble_hw_rps(ctx, &run);
 	config_registers(ctx, &run);
-- 
2.26.2

