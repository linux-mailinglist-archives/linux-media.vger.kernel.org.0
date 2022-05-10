Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D25521487
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241414AbiEJMDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241388AbiEJMD2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224E65418B
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:31 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B44512B9;
        Tue, 10 May 2022 13:59:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183962;
        bh=VV3eplvYk/sJft+X1ditSjuXp/Rm1i02+4x1EUzfKII=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VVTXMerwkML7H8HdCA6i5vO3bmCFuoS+iY0orWnFGvrfmaKiSGj7bCEQ4nz4LnyJG
         0YpIsaRD/apHsFcpWChS/kkTxDeBtViSwYUWkTSSdKgeKThZnn/55YglwGhgsIEFsD
         4o2KoVeSCX0Ce5dGYG3dNpLVz6HIGELbX8PaCwVA=
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
Subject: [PATCH 14/50] staging: media: imx: imx7-media-csi: Reorganize imx7_csi structure
Date:   Tue, 10 May 2022 14:58:23 +0300
Message-Id: <20220510115859.19777-15-laurent.pinchart@ideasonboard.com>
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

The struct imx7_csi fields are in a random order, reorganize them
logically to prepare for adding new fields.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 36 ++++++++++++----------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 499bb74ad6f3..ad69c2e8dbc2 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -169,37 +169,41 @@ enum imx_csi_model {
 
 struct imx7_csi {
 	struct device *dev;
-	struct v4l2_subdev sd;
+
+	/* Resources and locks */
+	void __iomem *regbase;
+	int irq;
+	struct clk *mclk;
+
+	struct mutex lock; /* Protects is_streaming, format_mbus, cc */
+	spinlock_t irqlock; /* Protects last_eof */
+
+	/* Media and V4L2 device */
+	struct imx_media_dev *imxmd;
 	struct v4l2_async_notifier notifier;
-	struct imx_media_video_dev *vdev;
-	struct imx_media_dev *imxmd;
-	struct media_pad pad[IMX7_CSI_PADS_NUM];
-
-	/* lock to protect members below */
-	struct mutex lock;
-	/* lock to protect irq handler when stop streaming */
-	spinlock_t irqlock;
 
 	struct v4l2_subdev *src_sd;
+	bool is_csi2;
+
+	/* V4L2 subdev */
+	struct v4l2_subdev sd;
+	struct media_pad pad[IMX7_CSI_PADS_NUM];
 
 	struct v4l2_mbus_framefmt format_mbus[IMX7_CSI_PADS_NUM];
 	const struct imx_media_pixfmt *cc[IMX7_CSI_PADS_NUM];
 
-	void __iomem *regbase;
-	int irq;
-	struct clk *mclk;
+	/* Video device */
+	struct imx_media_video_dev *vdev;
 
-	/* active vb2 buffers to send to video dev sink */
+	/* Buffers and streaming state */
 	struct imx_media_buffer *active_vb2_buf[2];
 	struct imx_media_dma_buf underrun_buf;
 
+	bool is_streaming;
 	int buf_num;
 	u32 frame_sequence;
 
 	bool last_eof;
-	bool is_streaming;
-	bool is_csi2;
-
 	struct completion last_eof_completion;
 
 	enum imx_csi_model model;
-- 
Regards,

Laurent Pinchart

