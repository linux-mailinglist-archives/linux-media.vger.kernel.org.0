Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49382E5E4B
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 19:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfJZRr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 13:47:29 -0400
Received: from mailoutvs36.siol.net ([185.57.226.227]:35681 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726474AbfJZRr1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 13:47:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 2D7AE523991;
        Sat, 26 Oct 2019 19:47:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 78Q2iftWDMu5; Sat, 26 Oct 2019 19:47:23 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id CC977520606;
        Sat, 26 Oct 2019 19:47:23 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 76B70523991;
        Sat, 26 Oct 2019 19:47:21 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 4/4] media: cedrus: hevc: Add support for multiple slices
Date:   Sat, 26 Oct 2019 19:47:03 +0200
Message-Id: <20191026174703.1120023-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191026174703.1120023-1-jernej.skrabec@siol.net>
References: <20191026174703.1120023-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that segment address is available, support for multi-slice frames
can be easily added.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 21 +++++++++++++++----
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
index 888bfd5ca224..e909adf6f30f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -366,15 +366,28 @@ static void cedrus_h265_setup(struct cedrus_ctx *ct=
x,
 	reg =3D VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_end_addr);
 	cedrus_write(dev, VE_DEC_H265_BITS_END_ADDR, reg);
=20
-	/* Coding tree block address: start at the beginning. */
+	/* Coding tree block address */
 	reg =3D VE_DEC_H265_DEC_CTB_ADDR_X(0) | VE_DEC_H265_DEC_CTB_ADDR_Y(0);
+	if (!ctx->fh.m2m_ctx->new_frame) {
+		unsigned int log2_max_luma_coding_block_size =3D
+			sps->log2_min_luma_coding_block_size_minus3 + 3 +
+			sps->log2_diff_max_min_luma_coding_block_size;
+		unsigned int ctb_size_luma =3D
+			1UL << log2_max_luma_coding_block_size;
+		unsigned int width_in_ctb_luma =3D
+			DIV_ROUND_UP(sps->pic_width_in_luma_samples, ctb_size_luma);
+
+		reg =3D VE_DEC_H265_DEC_CTB_ADDR_X(slice_params->slice_segment_addr % =
width_in_ctb_luma);
+		reg |=3D VE_DEC_H265_DEC_CTB_ADDR_Y(slice_params->slice_segment_addr /=
 width_in_ctb_luma);
+	}
 	cedrus_write(dev, VE_DEC_H265_DEC_CTB_ADDR, reg);
=20
 	cedrus_write(dev, VE_DEC_H265_TILE_START_CTB, 0);
 	cedrus_write(dev, VE_DEC_H265_TILE_END_CTB, 0);
=20
 	/* Clear the number of correctly-decoded coding tree blocks. */
-	cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
+	if (ctx->fh.m2m_ctx->new_frame)
+		cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
=20
 	/* Initialize bitstream access. */
 	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_INIT_SWDEC);
@@ -523,8 +536,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 				V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT,
 				pps->flags);
=20
-	/* FIXME: For multi-slice support. */
-	reg |=3D VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PI=
C;
+	if (ctx->fh.m2m_ctx->new_frame)
+		reg |=3D VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_P=
IC;
=20
 	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO0, reg);
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
index 15cf1f10221b..497b1199d3fe 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -311,6 +311,7 @@ static int cedrus_s_fmt_vid_out(struct file *file, vo=
id *priv,
=20
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_H264_SLICE:
+	case V4L2_PIX_FMT_HEVC_SLICE:
 		vq->subsystem_flags |=3D
 			VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 		break;
--=20
2.23.0

