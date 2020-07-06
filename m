Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248C2215ED7
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbgGFSjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730022AbgGFSjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:14 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE199214E;
        Mon,  6 Jul 2020 20:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060713;
        bh=4R71x6VehhNCk3b1Lyn+REm/HI/dSaDmDmLjHj+pLDk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GXNeVJXF425EYi/Q7O1FErp0g4tT4feO8LoHml45DzVftPsZojJGErzXxjnTBGS4Z
         q7GEYh0J9ucrmq+o8rXlcfCucf3eyUvPej8kZtRSb9oKpiSBSbWRQr22dbqKJUQ4r1
         RJZDplf+a8p8/0jjZP+tKZSPOd4s6awGgfTMQIoA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 100/108] media: ti-vpe: cal: Drop V4L2_CAP_READWRITE
Date:   Mon,  6 Jul 2020 21:37:01 +0300
Message-Id: <20200706183709.12238-101-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 read/write API is inefficient and makes little sense for
devices that handle frame-based formats. Applications shouldn't use it,
drop its support from the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 7eec0a57b141..775ed2fd9f1e 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -595,8 +595,7 @@ static const struct video_device cal_videodev = {
 	.ioctl_ops	= &cal_ioctl_ops,
 	.minor		= -1,
 	.release	= video_device_release_empty,
-	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-			  V4L2_CAP_READWRITE,
+	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING,
 };
 
 static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
@@ -731,7 +730,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 
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

