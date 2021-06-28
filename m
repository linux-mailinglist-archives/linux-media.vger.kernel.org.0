Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5879C3B5E75
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 14:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbhF1M5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 08:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbhF1M5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 08:57:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480C3C061574
        for <linux-media@vger.kernel.org>; Mon, 28 Jun 2021 05:54:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 293061F423D5
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 07/10] media: hantro: Enable H.264 on Rockchip VDPU2
Date:   Mon, 28 Jun 2021 09:54:07 -0300
Message-Id: <20210628125410.9228-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628125410.9228-1-ezequiel@collabora.com>
References: <20210628125410.9228-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Given H.264 support for VDPU2 was just added, let's enable it.
For now, this is only enabled on platform that don't have
an RKVDEC core, such as RK3328.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Alex Bee <knaerzche@gmail.com>
---
 .../staging/media/hantro/rockchip_vpu_hw.c    | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index 3ccc16413f42..e4e3b5e7689b 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -162,6 +162,19 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1920,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 1088,
+			.step_height = MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
 		.codec_mode = HANTRO_MODE_MPEG2_DEC,
@@ -388,6 +401,12 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
 		.init = hantro_jpeg_enc_init,
 		.exit = hantro_jpeg_enc_exit,
 	},
+	[HANTRO_MODE_H264_DEC] = {
+		.run = rockchip_vpu2_h264_dec_run,
+		.reset = rockchip_vpu2_dec_reset,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
 	[HANTRO_MODE_MPEG2_DEC] = {
 		.run = rockchip_vpu2_mpeg2_dec_run,
 		.reset = rockchip_vpu2_dec_reset,
@@ -433,6 +452,8 @@ static const char * const rockchip_vpu_clk_names[] = {
 	"aclk", "hclk"
 };
 
+/* VDPU1/VEPU1 */
+
 const struct hantro_variant rk3036_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3066_vpu_dec_fmts,
@@ -495,11 +516,14 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
 };
 
+/* VDPU2/VEPU2 */
+
 const struct hantro_variant rk3328_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
-	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER,
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
 	.irqs = rockchip_vdpu2_irqs,
 	.num_irqs = ARRAY_SIZE(rockchip_vdpu2_irqs),
-- 
2.32.0

