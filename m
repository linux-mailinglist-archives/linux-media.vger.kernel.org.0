Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2842D0854
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbgLFX5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:57:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgLFX5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:57:23 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17343185F;
        Mon,  7 Dec 2020 00:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298847;
        bh=3iPSV3Za/k7JwD3RqrCEcFWC4nSCpj3/42+90/PejTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JYV7823UK/YzJYrc6CW/bryFspHeGHDB0oQfxmtMGckFX3m4rycx49ckMg+3UJPLE
         EY2g/DGRrAw4iPqSHWWq1HjqAR7hyO9/c1FxoogADeProVHMvUvSWZlHrAhQODZEOh
         vmmqaJz6Ou3qRABOCrz2UjGZiYUo31xIfB+kRolA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 16/24] media: ti-vpe: cal: Drop V4L2_CAP_READWRITE
Date:   Mon,  7 Dec 2020 01:53:45 +0200
Message-Id: <20201206235353.26968-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 read/write API is inefficient and makes little sense for
devices that handle frame-based formats. Applications shouldn't use it,
drop its support from the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
Changes since v2:

- Drop .read handler
---
 drivers/media/platform/ti-vpe/cal-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 7eec0a57b141..32dd4d9ca212 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -393,7 +393,6 @@ static const struct v4l2_file_operations cal_fops = {
 	.owner		= THIS_MODULE,
 	.open           = v4l2_fh_open,
 	.release        = vb2_fop_release,
-	.read           = vb2_fop_read,
 	.poll		= vb2_fop_poll,
 	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
 	.mmap           = vb2_fop_mmap,
@@ -595,8 +594,7 @@ static const struct video_device cal_videodev = {
 	.ioctl_ops	= &cal_ioctl_ops,
 	.minor		= -1,
 	.release	= video_device_release_empty,
-	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-			  V4L2_CAP_READWRITE,
+	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING,
 };
 
 static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
@@ -731,7 +729,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 
 	/* Initialize the vb2 queue. */
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->drv_priv = ctx;
 	q->buf_struct_size = sizeof(struct cal_buffer);
 	q->ops = &cal_video_qops;
-- 
Regards,

Laurent Pinchart

