Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4C031B4A6
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBOEeE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:34:04 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhBOEeC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:34:02 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA1491934;
        Mon, 15 Feb 2021 05:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363312;
        bh=+aHdLg8L6rJVSi90fEtONGGwDUElEHPHkSmAJIk0WlE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CCPabTJDfTqCzCbcumBerQKodtDi4N6ofybpXGN1ROWzK4ugblZH9X7wMWnJcgkXY
         Kbx6E4ND8W8td/yfgxgTkY8IxPtgAoabXTo9wxcSuhSZ/zDvuoFDiWMNthrAiNZSLS
         x/wzOA7DHnEdCWkrvLGXpxE0Aqm+mMhjtTKZmvyE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 28/77] media: imx: capture: Expose V4L2_CAP_IO_MC for the MC-centric API
Date:   Mon, 15 Feb 2021 06:26:52 +0200
Message-Id: <20210215042741.28850-29-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Report to userspace that the MC-centric API is MC-centric by exposing
the V4L2_CAP_IO_MC. This requires adding support for mbus code filtering
in format enumeration, as required by V4L2_CAP_IO_MC.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 99133b7ffa5f..c4360866f7f6 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -96,7 +96,7 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 				    struct v4l2_fmtdesc *f)
 {
 	return imx_media_enum_pixel_formats(&f->pixelformat, f->index,
-					    PIXFMT_SEL_ANY, 0);
+					    PIXFMT_SEL_ANY, f->mbus_code);
 }
 
 static int capture_enum_framesizes(struct file *file, void *fh,
@@ -986,7 +986,8 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	vfd->release = video_device_release;
 	vfd->vfl_dir = VFL_DIR_RX;
 	vfd->tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
-	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
+			 | (!legacy_api ? V4L2_CAP_IO_MC : 0);
 	vfd->lock = &priv->mutex;
 	vfd->queue = &priv->q;
 
-- 
Regards,

Laurent Pinchart

