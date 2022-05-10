Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14B1D5214BB
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241518AbiEJMES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240882AbiEJMEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03E046673
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:16 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 705FF19AD;
        Tue, 10 May 2022 13:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183992;
        bh=7TZAvmLE3VyU/IP2y4JQZc51w8dX52N/5RgRLrzd8oU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CN5hc/77MmGC2QXy+NbdjEZSJjMcJxAFZwQWpo7cPdKR9MCrvXYpa0cbfqiYgHa5j
         s1LOm2+jE4UQL8WsAeQr2wldiH+gODXTlF3afDlFweQe1aq4h7x1CP8gXTjMkjhdI4
         bwazDQTqh5RYJAD7KEsUltIpivJXeqEy+j+T9GOI=
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
Subject: [PATCH 49/50] staging: media: imx: imx7-media-csi: Drop V4L2 events support
Date:   Tue, 10 May 2022 14:58:58 +0300
Message-Id: <20220510115859.19777-50-laurent.pinchart@ideasonboard.com>
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

The only event that the driver allows subscribing to,
V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR, is never generated. Drop events
support.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 0bf69933f1bd..ae74256755f4 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -22,14 +22,12 @@
 #include <linux/types.h>
 
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include <media/imx.h>
 #include "imx-media.h"
 
 #define IMX7_CSI_PAD_SINK		0
@@ -1212,17 +1210,6 @@ static int imx7_csi_video_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int imx7_csi_video_subscribe_event(struct v4l2_fh *fh,
-					  const struct v4l2_event_subscription *sub)
-{
-	switch (sub->type) {
-	case V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR:
-		return v4l2_event_subscribe(fh, sub, 0, NULL);
-	default:
-		return -EINVAL;
-	}
-}
-
 static const struct v4l2_ioctl_ops imx7_csi_video_ioctl_ops = {
 	.vidioc_querycap		= imx7_csi_video_querycap,
 
@@ -1244,9 +1231,6 @@ static const struct v4l2_ioctl_ops imx7_csi_video_ioctl_ops = {
 	.vidioc_expbuf			= vb2_ioctl_expbuf,
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
-
-	.vidioc_subscribe_event		= imx7_csi_video_subscribe_event,
-	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
 
 /* -----------------------------------------------------------------------------
-- 
Regards,

Laurent Pinchart

