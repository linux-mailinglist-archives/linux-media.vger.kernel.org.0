Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A1D404B30
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 13:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237641AbhIILuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 07:50:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:54738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242204AbhIILsi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Sep 2021 07:48:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7334F61208;
        Thu,  9 Sep 2021 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631187804;
        bh=4YGcCdxw4MTG0LbsryXAkz2ES/z/GJ0yp39prEeTR7o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uGH9F5L/tx777rcVnLDnrkpr2MIdwVCGgYC6ugL2I9Pe1hAyAQK3qMAkHVPPXMt7O
         0JQmKhJmoajFJoTfyMzLkDSV3+6+yWC58sVNdQHPVjsurnSQdd1GR4qcLh6CahFqlP
         aLzSxcv3+0DnfqMNcraPpAxl6hJYwasatrILmgeUB6cL+D/gqTMDxCaufXg55vMLVY
         wFhC3aE7YBmc8dutG0Zz+w710OdlvGwaNb9M9a1Yl0bdk5ogj4c6jjOD4YRpQ5IgBB
         eKvhF+BkUhiYzsrUygxhtkGo0JTre4dNP+qUvV5cSliedfLfPAO4oKknhWMTCoKNJO
         wx/Qpfwe0jNfw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.14 107/252] media: imx: imx7-media-csi: Fix buffer return upon stream start failure
Date:   Thu,  9 Sep 2021 07:38:41 -0400
Message-Id: <20210909114106.141462-107-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 0ada1697ed4256b38225319c9896661142a3572d ]

When the stream fails to start, the first two buffers in the queue have
been moved to the active_vb2_buf array and are returned to vb2 by
imx7_csi_dma_unsetup_vb2_buf(). The function is called with the buffer
state set to VB2_BUF_STATE_ERROR unconditionally, which is correct when
stopping the stream, but not when the start operation fails. In that
case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 894c4de31790..2882964b8513 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -361,6 +361,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 
 			vb->timestamp = ktime_get_ns();
 			vb2_buffer_done(vb, return_status);
+			csi->active_vb2_buf[i] = NULL;
 		}
 	}
 }
@@ -386,9 +387,10 @@ static int imx7_csi_dma_setup(struct imx7_csi *csi)
 	return 0;
 }
 
-static void imx7_csi_dma_cleanup(struct imx7_csi *csi)
+static void imx7_csi_dma_cleanup(struct imx7_csi *csi,
+				 enum vb2_buffer_state return_status)
 {
-	imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
+	imx7_csi_dma_unsetup_vb2_buf(csi, return_status);
 	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
 }
 
@@ -537,9 +539,10 @@ static int imx7_csi_init(struct imx7_csi *csi)
 	return 0;
 }
 
-static void imx7_csi_deinit(struct imx7_csi *csi)
+static void imx7_csi_deinit(struct imx7_csi *csi,
+			    enum vb2_buffer_state return_status)
 {
-	imx7_csi_dma_cleanup(csi);
+	imx7_csi_dma_cleanup(csi, return_status);
 	imx7_csi_init_default(csi);
 	imx7_csi_dmareq_rff_disable(csi);
 	clk_disable_unprepare(csi->mclk);
@@ -702,7 +705,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 		ret = v4l2_subdev_call(csi->src_sd, video, s_stream, 1);
 		if (ret < 0) {
-			imx7_csi_deinit(csi);
+			imx7_csi_deinit(csi, VB2_BUF_STATE_QUEUED);
 			goto out_unlock;
 		}
 
@@ -712,7 +715,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 		v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
 
-		imx7_csi_deinit(csi);
+		imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
 	}
 
 	csi->is_streaming = !!enable;
-- 
2.30.2

