Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B07C2EAE6B
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbhAEPcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:32:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbhAEPcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:32:07 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 779588C6;
        Tue,  5 Jan 2021 16:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860585;
        bh=du/OYyun2ADhQ5sGPMZgnfL8TboSRJ6P0X7nqqeSfgM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ng9UiSfVVMJ7Q/T1wSvzbun8Jxwg3yBU3OYPRsND8LYnJbsEQomAw1DzxI3u52LG4
         Iz1fZ4YSPBVgJr0NcsNS/1rfyM01WlmaGKTrEsjgieKn3jB7Y2XKbSqW71l5PifXgC
         yERibHqBM0DzdlOs6b96e4j0hCKev6cLxJxgOguk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 13/75] media: imx: capture: Remove capture_priv stop field
Date:   Tue,  5 Jan 2021 17:27:50 +0200
Message-Id: <20210105152852.5733-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The stop field in the capture_priv structure is only set, never read.
Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index dd3861a96cb8..4f9cff62eb1f 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -45,8 +45,6 @@ struct capture_priv {
 	spinlock_t q_lock;			/* Protect ready_q */
 
 	struct v4l2_ctrl_handler ctrl_hdlr;	/* Controls inherited from subdevs */
-
-	bool stop;				/* streaming is stopping */
 };
 
 #define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
@@ -573,8 +571,6 @@ static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto return_bufs;
 	}
 
-	priv->stop = false;
-
 	return 0;
 
 return_bufs:
@@ -595,10 +591,6 @@ static void capture_stop_streaming(struct vb2_queue *vq)
 	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&priv->q_lock, flags);
-	priv->stop = true;
-	spin_unlock_irqrestore(&priv->q_lock, flags);
-
 	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
 					    false);
 	if (ret)
-- 
Regards,

Laurent Pinchart

