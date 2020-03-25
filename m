Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8DE1932C7
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 22:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbgCYVfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 17:35:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39874 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgCYVfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 17:35:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 87055293ECE
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 3/7] hantro: Use v4l2_m2m_buf_done_and_job_finish
Date:   Wed, 25 Mar 2020 18:34:34 -0300
Message-Id: <20200325213439.16509-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325213439.16509-1-ezequiel@collabora.com>
References: <20200325213439.16509-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let the core sort out the nuances of returning buffers
to userspace, by using the v4l2_m2m_buf_done_and_job_finish
helper.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
--
 drivers/staging/media/hantro/hantro_drv.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ace13973e2d0..d0097c5fe7d9 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -101,8 +101,8 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 	pm_runtime_put_autosuspend(vpu->dev);
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 
-	src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
 	if (WARN_ON(!src))
 		return;
@@ -112,14 +112,14 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 	src->sequence = ctx->sequence_out++;
 	dst->sequence = ctx->sequence_cap++;
 
-	ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
-	if (ret)
-		result = VB2_BUF_STATE_ERROR;
-
-	v4l2_m2m_buf_done(src, result);
-	v4l2_m2m_buf_done(dst, result);
+	if (ctx->buf_finish) {
+		ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
+		if (ret)
+			result = VB2_BUF_STATE_ERROR;
+	}
 
-	v4l2_m2m_job_finish(vpu->m2m_dev, ctx->fh.m2m_ctx);
+	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
+					 result);
 }
 
 void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
-- 
2.26.0.rc2

