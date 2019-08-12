Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBFBC8A74D
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 21:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHLTgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 15:36:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60198 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbfHLTga (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 15:36:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8A2A12854FE
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Hertz Wong <hertz.wong@rock-chips.com>
Subject: [PATCH v5 11/11] media: hantro: Enable H264 decoding on rk3288
Date:   Mon, 12 Aug 2019 16:35:22 -0300
Message-Id: <20190812193522.10911-12-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812193522.10911-1-ezequiel@collabora.com>
References: <20190812193522.10911-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hertz Wong <hertz.wong@rock-chips.com>

Now that the generic bits have been added, we can activate H264 decoding
on rk3288.

Signed-off-by: Hertz Wong <hertz.wong@rock-chips.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v5:
* None.
Changes in v4:
* None.
---
 drivers/staging/media/hantro/rk3288_vpu_hw.c | 21 +++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index f1b573a006ae..6bfcc47d1e58 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -61,6 +61,19 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 3840,
+			.step_width = H264_MB_DIM,
+			.min_height = 48,
+			.max_height = 2160,
+			.step_height = H264_MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
 		.codec_mode = HANTRO_MODE_MPEG2_DEC,
@@ -162,6 +175,12 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
 		.init = hantro_jpeg_enc_init,
 		.exit = hantro_jpeg_enc_exit,
 	},
+	[HANTRO_MODE_H264_DEC] = {
+		.run = hantro_g1_h264_dec_run,
+		.reset = rk3288_vpu_dec_reset,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
 	[HANTRO_MODE_MPEG2_DEC] = {
 		.run = hantro_g1_mpeg2_dec_run,
 		.reset = rk3288_vpu_dec_reset,
@@ -197,7 +216,7 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.dec_fmts = rk3288_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
-		 HANTRO_VP8_DECODER,
+		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
 	.codec_ops = rk3288_vpu_codec_ops,
 	.irqs = rk3288_irqs,
 	.num_irqs = ARRAY_SIZE(rk3288_irqs),
-- 
2.22.0

