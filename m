Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A0D31B495
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhBOEbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:31:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhBOEbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:31:05 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A9221904;
        Mon, 15 Feb 2021 05:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363300;
        bh=BUkY7XRcrluLVmTn1agIvtTmOdcegANhDoyToryPIlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uBam68R8KAqB9BV6mpxO54CJ5a18/llJ24J+aeieTor8ZS843XKnp6zzZfwprKjg7
         L8HO5lDAE4Z80I3CYrn6cYoJvCffoGSDJd+nNFBsXEQZZq8oUB4Trs53IRTd80OPU7
         B/ub4+d/ukMO0LEjKgM8AG/MtvhaPd7T5OywWWws=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 12/77] media: imx: capture: Remove capture_priv stop field
Date:   Mon, 15 Feb 2021 06:26:36 +0200
Message-Id: <20210215042741.28850-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The stop field in the capture_priv structure is only set, never read.
Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-capture.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 933ebc69e16d..4cee7ba55311 100644
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

