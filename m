Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4074031B49B
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhBOEcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:32:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhBOEb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:31:59 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 034EE1911;
        Mon, 15 Feb 2021 05:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363304;
        bh=AGlOpSXee7ZzglcE1bQiatj2ipIBLf7Nk3hkD0CAD0w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OER834ydhgGEbZGYy2SwlOH6V4jGnMOgJVeLATiqgtMtxY3K7DUvfq35uzG3xLEbW
         YHc1HG4zgh4CG06FrK2kx9eJQAeosvmyTYNjsi2peSjyu5AZlv3IP3KNqVcTTNSwrh
         W/vuHt2IAMd2Ip8MplgjGejk1mxtLdyQWmbeG4Iw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 18/77] media: imx: capture: Rename querycap handler to capture_querycap
Date:   Mon, 15 Feb 2021 06:26:42 +0200
Message-Id: <20210215042741.28850-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For consistency with all the other ioctl handlers, rename
vidioc_querycap() to capture_querycap().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 4eb0f7b43f4a..ed36c28a8b52 100644
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

