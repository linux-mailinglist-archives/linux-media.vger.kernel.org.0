Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBFA0A726D
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 20:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729932AbfICSRf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 14:17:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38080 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfICSRf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 14:17:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B299C28A0B5
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 3/4] media: hantro: Add helper for the H264 motion vectors allocation
Date:   Tue,  3 Sep 2019 15:17:10 -0300
Message-Id: <20190903181711.7559-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190903181711.7559-1-ezequiel@collabora.com>
References: <20190903181711.7559-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce a helper to allow easier enablement of the post-processing
feature. No functional changes intended.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h      | 6 ++++++
 drivers/staging/media/hantro/hantro_v4l2.c | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index deb90ae37859..e8872f24e351 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -381,4 +381,10 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 }
 
+static inline unsigned int
+hantro_h264_buffer_extra_size(unsigned int width, unsigned int height)
+{
+	return 128 * MB_WIDTH(width) * MB_HEIGHT(height);
+}
+
 #endif /* HANTRO_H_ */
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index d48b548842cf..59adecba0e85 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -246,8 +246,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		 */
 		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
 			pix_mp->plane_fmt[0].sizeimage +=
-				128 * DIV_ROUND_UP(pix_mp->width, 16) *
-				      DIV_ROUND_UP(pix_mp->height, 16);
+				hantro_h264_buffer_extra_size(pix_mp->width,
+							      pix_mp->height);
 	} else if (!pix_mp->plane_fmt[0].sizeimage) {
 		/*
 		 * For coded formats the application can specify
-- 
2.22.0

