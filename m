Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36A52EAE7E
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbhAEPdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:33:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbhAEPc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:32:59 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E09B8D8;
        Tue,  5 Jan 2021 16:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860588;
        bh=95V6gQR/H+TITLVIdPsuUCD7Avr/12tdY/jaqR/im2M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tEP/8sKilO8to1Zq7mwAeCoWBxUMRuqHUDxEDUhnNmoZmWKj0xE00FzXRscCAMDWf
         xTXdqU28diuVtwVo+BGZvTodf+7tPeeJvd1W3NKE8W9JTKazpS6LW7Hw8wcYcqcalT
         bnghGdzT8FfpID0gXk0ZzhQMHNnMyQShyVLWj4o0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 19/75] media: imx: capture: Rename querycap handler to capture_querycap
Date:   Tue,  5 Jan 2021 17:27:56 +0200
Message-Id: <20210105152852.5733-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For consistency with all the other ioctl handlers, rename
vidioc_querycap() to capture_querycap().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 009dd8733813..db1f551b86ea 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -56,8 +56,8 @@ struct capture_priv {
  * Video ioctls follow
  */
 
-static int vidioc_querycap(struct file *file, void *fh,
-			   struct v4l2_capability *cap)
+static int capture_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap)
 {
 	struct capture_priv *priv = video_drvdata(file);
 
@@ -414,7 +414,7 @@ static int capture_subscribe_event(struct v4l2_fh *fh,
 }
 
 static const struct v4l2_ioctl_ops capture_ioctl_ops = {
-	.vidioc_querycap	= vidioc_querycap,
+	.vidioc_querycap	= capture_querycap,
 
 	.vidioc_enum_framesizes = capture_enum_framesizes,
 	.vidioc_enum_frameintervals = capture_enum_frameintervals,
-- 
Regards,

Laurent Pinchart

