Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC9314A61B
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 15:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgA0OaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 09:30:19 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0OaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 09:30:18 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 93186293985
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     devel@driverdev.osuosl.org
Cc:     linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 4/4] media: hantro: Write quantization table registers in increasing addresses order
Date:   Mon, 27 Jan 2020 15:30:09 +0100
Message-Id: <20200127143009.15677-5-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127143009.15677-1-andrzej.p@collabora.com>
References: <20200127143009.15677-1-andrzej.p@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Luma and chroma qtables need to be written into two 16-register blocks,
each table consisting of 64 bytes total. The blocks are contiguous and
start at offset 0 for luma and at offset 0x40 for chroma.

The seemingly innocent optimization of writing the two blocks using one
loop causes side effects which result in improper values of quantization
tables being used by the hardware during encoding. Visually this results
in macroblocking artifacts around contrasting edges in encoded images. The
artifacts look like horizontally flipped shadows of the said edges.
Changing the write operations to non-relaxed variant doesn't help.

This patch removes this premature optimization and after this change the
macroblocking artifacts around contrasting edges are gone.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c     | 6 ++++++
 drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index bd05aea1bd71..fb43ec770e9e 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -73,10 +73,16 @@ hantro_h1_jpeg_enc_set_qtable(struct hantro_dev *vpu,
 	luma_qtable_p = (__be32 *)luma_qtable;
 	chroma_qtable_p = (__be32 *)chroma_qtable;
 
+	/*
+	 * Quantization table registers must be written in contiguous blocks.
+	 * DO NOT collapse the below two "for" loops into one.
+	 */
 	for (i = 0; i < H1_JPEG_QUANT_TABLE_COUNT; i++) {
 		reg = get_unaligned_be32(&luma_qtable_p[i]);
 		vepu_write_relaxed(vpu, reg, H1_REG_JPEG_LUMA_QUAT(i));
+	}
 
+	for (i = 0; i < H1_JPEG_QUANT_TABLE_COUNT; i++) {
 		reg = get_unaligned_be32(&chroma_qtable_p[i]);
 		vepu_write_relaxed(vpu, reg, H1_REG_JPEG_CHROMA_QUAT(i));
 	}
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
index a0cf34073235..f4dbffda0be7 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
@@ -103,10 +103,16 @@ rk3399_vpu_jpeg_enc_set_qtable(struct hantro_dev *vpu,
 	luma_qtable_p = (__be32 *)luma_qtable;
 	chroma_qtable_p = (__be32 *)chroma_qtable;
 
+	/*
+	 * Quantization table registers must be written in contiguous blocks.
+	 * DO NOT collapse the below two "for" loops into one.
+	 */
 	for (i = 0; i < VEPU_JPEG_QUANT_TABLE_COUNT; i++) {
 		reg = get_unaligned_be32(&luma_qtable_p[i]);
 		vepu_write_relaxed(vpu, reg, VEPU_REG_JPEG_LUMA_QUAT(i));
+	}
 
+	for (i = 0; i < VEPU_JPEG_QUANT_TABLE_COUNT; i++) {
 		reg = get_unaligned_be32(&chroma_qtable_p[i]);
 		vepu_write_relaxed(vpu, reg, VEPU_REG_JPEG_CHROMA_QUAT(i));
 	}
-- 
2.17.1

