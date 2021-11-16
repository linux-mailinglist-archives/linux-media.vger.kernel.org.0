Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B19945345F
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 15:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237510AbhKPOlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 09:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237445AbhKPOlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 09:41:50 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2623EC061764;
        Tue, 16 Nov 2021 06:38:53 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 425B51F457E9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637073532; bh=H+KE3atvsQ+YM12laeiLLHwYWc3LA8hneUNZcnzzMNE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kN1HS9ZfQ86KcBs9I6sK1GgPipjjzMVRz0ckigSjigfGyNJ1hLoTXF8m8yHwXNX3y
         p5XseG5fcwiAtXtS3LncpL0DdYdEqJ02R3Wr8my3SkeAyY4kOL6R56r7JLTFtvsTDH
         cpF08M+sRioTTr6yV/uy5uiCWkMltDlt95mIG/wnCROTgL3uJlUoPIIQGBGi2UWaUk
         aHyRUcVoEsoUpRBFoE0VLQAwJyUWFYNzpuz4tX6n2jmh4wR6J4wik1BKSFwCJzR8nT
         tbHgai/t7pcCZjKc0QDmUFF/q9GKWzlkMXRtTIp+sRHc2Gi1FTGBe9s3fH4Ie0v35G
         BVsWBMnd8qSuQ==
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
Subject: [PATCH v8 04/12] hantro: Add quirk for NV12/NV12_4L4 capture format
Date:   Tue, 16 Nov 2021 15:38:34 +0100
Message-Id: <20211116143842.75896-5-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116143842.75896-1-andrzej.p@collabora.com>
References: <20211116143842.75896-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.25.1

