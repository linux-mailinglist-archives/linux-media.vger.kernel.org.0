Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21FE57CF9E5
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 14:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346046AbjJSMyi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 08:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346032AbjJSMx5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 08:53:57 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306D0D7B;
        Thu, 19 Oct 2023 05:52:55 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 74D306607381;
        Thu, 19 Oct 2023 13:52:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697719970;
        bh=dzwa/jYB5Q8JSc9NA/K1ZmfJPhSPTZE1y6AwFUzPpGM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iFwYFdfdorLwOroxjYpXwLTlBJe7ur0qb0NYAiZvUGLsYpQMVKvLr4IPP8jWMhnRE
         /OVaqbNLUMf6mg5Tmpy6JKI1IpZ0rRF0jhTAvRjVyfxmdm5etOUb9lorJEgOlgjAny
         /geajUH0uF34wdFYIYBS1k7oYJ+snXGEboYRheHposCwwWU6+W5CQPfS8JJxvjW4ZV
         cu59NKLfDw+KuyA75xvVMBYRMMTCxwuS/bBsuPMEe4DTiGv5JZEzOP3XQZcQAYLd1J
         t2xB1eZlI2BHFCFgwhoXD/HSa9OMSZPlYPrxp4ffdI+PNhgqDCiz/kivtPG/L1udKL
         a3gLiWXXExwqA==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH v13 38/56] media: ti: Stop direct calls to queue num_buffers field
Date:   Thu, 19 Oct 2023 14:52:04 +0200
Message-Id: <20231019125222.21370-39-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c   | 5 +++--
 drivers/media/platform/ti/cal/cal-video.c        | 5 +++--
 drivers/media/platform/ti/davinci/vpif_capture.c | 5 +++--
 drivers/media/platform/ti/davinci/vpif_display.c | 5 +++--
 drivers/media/platform/ti/omap/omap_vout.c       | 5 +++--
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 5fa2ea9025d9..f18acf9286a2 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -1771,9 +1771,10 @@ static int vpfe_queue_setup(struct vb2_queue *vq,
 {
 	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
 	unsigned size = vpfe->fmt.fmt.pix.sizeimage;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes) {
 		if (sizes[0] < size)
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index a8abcd0fee17..94e67c057a20 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -603,9 +603,10 @@ static int cal_queue_setup(struct vb2_queue *vq,
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes) {
 		if (sizes[0] < size)
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 99fae8830c41..fc42b4bc37e6 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -113,6 +113,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
 	struct channel_obj *ch = vb2_get_drv_priv(vq);
 	struct common_obj *common = &ch->common[VPIF_VIDEO_INDEX];
 	unsigned size = common->fmt.fmt.pix.sizeimage;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	vpif_dbg(2, debug, "vpif_buffer_setup\n");
 
@@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
 		size = sizes[0];
 	}
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	*nplanes = 1;
 	sizes[0] = size;
diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index f8ec2991c667..9dbab1003c1d 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -115,6 +115,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
 	struct channel_obj *ch = vb2_get_drv_priv(vq);
 	struct common_obj *common = &ch->common[VPIF_VIDEO_INDEX];
 	unsigned size = common->fmt.fmt.pix.sizeimage;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	if (*nplanes) {
 		if (sizes[0] < size)
@@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
 		size = sizes[0];
 	}
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	*nplanes = 1;
 	sizes[0] = size;
diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 4143274089c3..72ce903717d3 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -944,10 +944,11 @@ static int omap_vout_vb2_queue_setup(struct vb2_queue *vq,
 				     struct device *alloc_devs[])
 {
 	struct omap_vout_device *vout = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	int size = vout->pix.sizeimage;
 
-	if (is_rotation_enabled(vout) && vq->num_buffers + *nbufs > VRFB_NUM_BUFS) {
-		*nbufs = VRFB_NUM_BUFS - vq->num_buffers;
+	if (is_rotation_enabled(vout) && q_num_bufs + *nbufs > VRFB_NUM_BUFS) {
+		*nbufs = VRFB_NUM_BUFS - q_num_bufs;
 		if (*nbufs == 0)
 			return -EINVAL;
 	}
-- 
2.39.2

