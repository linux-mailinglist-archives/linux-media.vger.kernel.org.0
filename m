Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14325521482
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241470AbiEJMDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241469AbiEJMDs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B581052E73
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:50 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 856F5D18;
        Tue, 10 May 2022 13:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183976;
        bh=ugFiXGKljdu4sLM/6x0wIcV2N3AEtbDAbQDr0izYfQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rLIgdHwEWJz9QaXVlzD+5yQO0t4RY1aN4JI17XZf7V3zy/j6vKn/8IVJE7zkS1ks+
         ax1MkFb1siPQrcSiCZ7QT99tz1sA/JT1mbNDQivlTUBGBt+gH4EErcTgFvLGKwZboR
         Ba9LZhkGt/TXqRIxWoMCBybVaBoeRHj+ldwhjepU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 30/50] staging: media: imx: imx7-media-csi: Decouple from imx_media_dma_buf
Date:   Tue, 10 May 2022 14:58:39 +0300
Message-Id: <20220510115859.19777-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Decouple from the imx_media_dma_buf structure defined in shared helpers
by duplicating it in the imx7-media-csi driver, along with the two small
alloc and free functions. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 40 +++++++++++++++++++---
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 5a5157d8b27b..05907d6257a8 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -184,6 +184,12 @@ to_imx7_csi_vb2_buffer(struct vb2_buffer *vb)
 	return container_of(vbuf, struct imx7_csi_vb2_buffer, vbuf);
 }
 
+struct imx7_csi_dma_buf {
+	void *virt;
+	dma_addr_t phys;
+	unsigned long len;
+};
+
 struct imx7_csi {
 	struct device *dev;
 
@@ -227,7 +233,7 @@ struct imx7_csi {
 
 	/* Buffers and streaming state */
 	struct imx7_csi_vb2_buffer *active_vb2_buf[2];
-	struct imx_media_dma_buf underrun_buf;
+	struct imx7_csi_dma_buf underrun_buf;
 
 	bool is_streaming;
 	int buf_num;
@@ -415,12 +421,38 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 	}
 }
 
+static void imx7_csi_free_dma_buf(struct imx7_csi *csi,
+				  struct imx7_csi_dma_buf *buf)
+{
+	if (buf->virt)
+		dma_free_coherent(csi->dev, buf->len, buf->virt, buf->phys);
+
+	buf->virt = NULL;
+	buf->phys = 0;
+}
+
+static int imx7_csi_alloc_dma_buf(struct imx7_csi *csi,
+				  struct imx7_csi_dma_buf *buf, int size)
+{
+	imx7_csi_free_dma_buf(csi, buf);
+
+	buf->len = PAGE_ALIGN(size);
+	buf->virt = dma_alloc_coherent(csi->dev, buf->len, &buf->phys,
+				       GFP_DMA | GFP_KERNEL);
+	if (!buf->virt) {
+		dev_err(csi->dev, "%s: failed\n", __func__);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static int imx7_csi_dma_setup(struct imx7_csi *csi)
 {
 	int ret;
 
-	ret = imx_media_alloc_dma_buf(csi->dev, &csi->underrun_buf,
-				      csi->vdev_fmt.sizeimage);
+	ret = imx7_csi_alloc_dma_buf(csi, &csi->underrun_buf,
+				     csi->vdev_fmt.sizeimage);
 	if (ret < 0) {
 		v4l2_warn(&csi->sd, "consider increasing the CMA area\n");
 		return ret;
@@ -439,7 +471,7 @@ static void imx7_csi_dma_cleanup(struct imx7_csi *csi,
 				 enum vb2_buffer_state return_status)
 {
 	imx7_csi_dma_unsetup_vb2_buf(csi, return_status);
-	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
+	imx7_csi_free_dma_buf(csi, &csi->underrun_buf);
 }
 
 static void imx7_csi_dma_stop(struct imx7_csi *csi)
-- 
Regards,

Laurent Pinchart

