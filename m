Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2C814D246
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 22:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgA2VGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 16:06:19 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34506 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbgA2VGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 16:06:19 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3265F294CF2
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: hantro: Prevent encoders from using post-processing
Date:   Wed, 29 Jan 2020 18:06:08 -0300
Message-Id: <20200129210608.6807-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The post-processing feature is meant to be used by decoding
only. Prevent encoding jobs from enabling it.

Fixes: 8c2d66b036c77 ("media: hantro: Support color conversion via post-processing")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index b0faa43b3f79..327ddef45345 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -423,7 +423,7 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 static inline bool
 hantro_needs_postproc(struct hantro_ctx *ctx, const struct hantro_fmt *fmt)
 {
-	return fmt->fourcc != V4L2_PIX_FMT_NV12;
+	return !hantro_is_encoder_ctx(ctx) && fmt->fourcc != V4L2_PIX_FMT_NV12;
 }
 
 static inline dma_addr_t
-- 
2.25.0

