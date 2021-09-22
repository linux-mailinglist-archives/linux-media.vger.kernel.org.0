Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174A94145D9
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 12:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234813AbhIVKNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 06:13:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58068 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234749AbhIVKNd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 06:13:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id E57C81F437EA
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 04/10] hantro: Add quirk for NV12/NV12_4L4 capture format
Date:   Wed, 22 Sep 2021 12:11:40 +0200
Message-Id: <20210922101146.13762-5-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922101146.13762-1-andrzej.p@collabora.com>
References: <20210922101146.13762-1-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

The G2 core decoder engine produces NV12_4L4 format,
which is a simple NV12 4x4 tiled format. The driver currently
hides this format by always enabling the post-processor engine,
and therefore offering NV12 directly.

This is done without using the logic in hantro_postproc.c
and therefore makes it difficult to add VP9 cleanly.

Since fixing this is not easy, add a small quirk to force
NV12 if HEVC was configured, but otherwise declare NV12_4L4
as the pixel format in imx8mq_vpu_g2_variant.dec_fmts.

This will be used by the VP9 decoder which will be added soon.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/hantro/hantro_v4l2.c  | 14 ++++++++++++++
 drivers/staging/media/hantro/imx8m_vpu_hw.c |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index bcb0bdff4a9a..d1f060c55fed 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -150,6 +150,20 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	unsigned int num_fmts, i, j = 0;
 	bool skip_mode_none;
 
+	/*
+	 * The HEVC decoder on the G2 core needs a little quirk to offer NV12
+	 * only on the capture side. Once the post-processor logic is used,
+	 * we will be able to expose NV12_4L4 and NV12 as the other cases,
+	 * and therefore remove this quirk.
+	 */
+	if (capture && ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE) {
+		if (f->index == 0) {
+			f->pixelformat = V4L2_PIX_FMT_NV12;
+			return 0;
+		}
+		return -EINVAL;
+	}
+
 	/*
 	 * When dealing with an encoder:
 	 *  - on the capture side we want to filter out all MODE_NONE formats.
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 02e61438220a..a40b161e5956 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -134,7 +134,7 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 
 static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	{
-		.fourcc = V4L2_PIX_FMT_NV12,
+		.fourcc = V4L2_PIX_FMT_NV12_4L4,
 		.codec_mode = HANTRO_MODE_NONE,
 	},
 	{
-- 
2.17.1

