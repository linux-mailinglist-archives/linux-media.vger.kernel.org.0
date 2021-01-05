Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714A22EAEB0
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbhAEPgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:36:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbhAEPgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:36:15 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCD3D1AFC;
        Tue,  5 Jan 2021 16:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860601;
        bh=IGHk6heKBskiySdFPG0ZP9hXwbsxuNiUiq2+QptZSlQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tNfJdGEY8KdeS3U7hMakmcaTNOZxkyERYAxRnn3jZAYt++w+kZiemReSjq8ui1mi9
         +f1/lD5FlNCjBPiyqCa9FBRT8gj14ZZ1vDJIRw0fBzkoE5VBKjO2NN98T42yVvL8Nr
         AyWJH1WzehXUzBPxgHBelOuX/KQs6dHKlPlsRqeg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 40/75] media: imx: imx7-media-csi: Split imx7_csi_dma_stop()
Date:   Tue,  5 Jan 2021 17:28:17 +0200
Message-Id: <20210105152852.5733-41-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/staging/media/imx/imx7-media-csi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index eb13dfd82def..b7e4d83bbbfc 100644
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

