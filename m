Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D542EAE68
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbhAEPcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:32:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbhAEPcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:32:01 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB1788C4;
        Tue,  5 Jan 2021 16:29:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860584;
        bh=/Oz8r6URKuk54C258N2G3zeSYb2ejV+y1KiaXMgvgtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cx+Xg+MTT/FEKfEu51nsTIsUnVrlhye0Kjbsn3MeykS2k3dS5yo6OTlLUF09PGTGe
         krev+zlLZmbxDqZ2g8TjuFwE+kDqB6KRJqUAdtl4XhTNrFhhv4m1ihRnP4xO6/RRpT
         blKqR9y+EpDsiFkIl+ez0773vrz79YNm1pBcjWis=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 12/75] media: imx: capture: Clean up capture_priv structure
Date:   Tue,  5 Jan 2021 17:27:49 +0200
Message-Id: <20210105152852.5733-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document all the fields of the capture_priv structure and group them by
purpose.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 30 ++++++++-----------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index b599e30df338..dd3861a96cb8 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -29,30 +29,24 @@
 #define IMX_CAPTURE_NAME "imx-capture"
 
 struct capture_priv {
-	struct imx_media_video_dev vdev;
+	struct imx_media_dev *md;		/* Media device */
+	struct device *dev;			/* Physical device */
 
-	struct v4l2_subdev    *src_sd;
-	int                   src_sd_pad;
-	struct device         *dev;
+	struct imx_media_video_dev vdev;	/* Video device */
+	struct media_pad vdev_pad;		/* Video device pad */
 
-	struct imx_media_dev  *md;
+	struct v4l2_subdev *src_sd;		/* Source subdev */
+	int src_sd_pad;				/* Source subdev pad */
 
-	struct media_pad      vdev_pad;
+	struct mutex mutex;			/* Protect vdev operations */
 
-	struct mutex          mutex;       /* capture device mutex */
+	struct vb2_queue q;			/* The videobuf2 queue */
+	struct list_head ready_q;		/* List of queued buffers */
+	spinlock_t q_lock;			/* Protect ready_q */
 
-	/* the videobuf2 queue */
-	struct vb2_queue       q;
-	/* list of ready imx_media_buffer's from q */
-	struct list_head       ready_q;
-	/* protect ready_q */
-	spinlock_t             q_lock;
+	struct v4l2_ctrl_handler ctrl_hdlr;	/* Controls inherited from subdevs */
 
-	/* controls inherited from subdevs */
-	struct v4l2_ctrl_handler ctrl_hdlr;
-
-	/* misc status */
-	bool                  stop;          /* streaming is stopping */
+	bool stop;				/* streaming is stopping */
 };
 
 #define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
-- 
Regards,

Laurent Pinchart

