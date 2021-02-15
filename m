Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFEE531B4B2
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBOEfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:35:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhBOEfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:35:53 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8551B1AB7;
        Mon, 15 Feb 2021 05:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363322;
        bh=QLNc/IOpWis40rwz3Of9G0ZJOzANEUxYyf5nvZJ5xLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RIqeE7520AxKYPILJjk20qGbYH+kRRJtcc+CJ+BZXlzcK0XA4KjEgihgqV/pVZwr3
         qxMM2zzkjrU3OVERqHZTq8EYWtmGfZDwfenOmfbGvNerHNbxmIJMy2OX5g1yfvWaGm
         BnobAqd7T353exVskbY6DMDidoSdjtvZ3TGOkXeQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 41/77] media: imx: imx7-media-csi: Split imx7_csi_dma_stop()
Date:   Mon, 15 Feb 2021 06:27:05 +0200
Message-Id: <20210215042741.28850-42-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7_csi_dma_stop() function performs two operations, it waits for
DMA to be complete, and then cleans up and frees buffers. Split the
second part out to a new imx7_csi_dma_cleanup() function to match
imx7_csi_dma_setup(), in preparation for a stream start refactoring.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index af4119dc8fd6..9cb04fa31b5a 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -462,6 +462,12 @@ static int imx7_csi_dma_setup(struct imx7_csi *csi)
 	return 0;
 }
 
+static void imx7_csi_dma_cleanup(struct imx7_csi *csi)
+{
+	imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
+	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
+}
+
 static void imx7_csi_dma_stop(struct imx7_csi *csi)
 {
 	unsigned long timeout_jiffies;
@@ -483,10 +489,6 @@ static void imx7_csi_dma_stop(struct imx7_csi *csi)
 		v4l2_warn(&csi->sd, "wait last EOF timeout\n");
 
 	imx7_csi_hw_disable_irq(csi);
-
-	imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
-
-	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
 }
 
 static void imx7_csi_configure(struct imx7_csi *csi)
@@ -627,6 +629,7 @@ static int imx7_csi_streaming_start(struct imx7_csi *csi)
 static int imx7_csi_streaming_stop(struct imx7_csi *csi)
 {
 	imx7_csi_dma_stop(csi);
+	imx7_csi_dma_cleanup(csi);
 
 	imx7_csi_disable(csi);
 
-- 
Regards,

Laurent Pinchart

