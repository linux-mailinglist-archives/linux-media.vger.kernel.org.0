Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B013C210BF5
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730954AbgGANQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:16:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45836 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730942AbgGANQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 09:16:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 634CB2A56CF
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 6/6] hantro: Make sure we don't use post-processor on an encoder
Date:   Wed,  1 Jul 2020 10:16:07 -0300
Message-Id: <20200701131607.121988-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200701131607.121988-1-ezequiel@collabora.com>
References: <20200701131607.121988-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 986eee3a5234f fixed hantro_needs_postproc condition,
but missed one case. Encoders don't have any post-processor
hardware block, so also can't be disabled.

Fix it.

Fixes: 986eee3a5234f ("media: hantro: Prevent encoders from using post-processing")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 34367b169011..d32b6b1ab70b 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -122,10 +122,12 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
 
-	if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
-		hantro_postproc_enable(ctx);
-	else
-		hantro_postproc_disable(ctx);
+	if (!ctx->is_encoder) {
+		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
+			hantro_postproc_enable(ctx);
+		else
+			hantro_postproc_disable(ctx);
+	}
 }
 
 void hantro_end_prepare_run(struct hantro_ctx *ctx)
-- 
2.26.0.rc2

