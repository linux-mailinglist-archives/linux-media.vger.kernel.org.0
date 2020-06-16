Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33FA91FB3AF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 16:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbgFPOJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 10:09:49 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35235 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729050AbgFPOJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 10:09:47 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E453AE0006;
        Tue, 16 Jun 2020 14:09:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 05/10] media: v4l2-subdev: Remove [s|g]_mbus_config video ops
Date:   Tue, 16 Jun 2020 16:12:40 +0200
Message-Id: <20200616141244.49407-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
References: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With all sensor and platform drivers now converted to use the new
get_mbus_config and set_mbus_config pad operations, remove the
deprecated video operations g_mbus_config and s_mbus_config.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d8b9d5735307..98975248a033 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -402,12 +402,6 @@ struct v4l2_mbus_frame_desc {
  *
  * @query_dv_timings: callback for VIDIOC_QUERY_DV_TIMINGS() ioctl handler code.
  *
- * @g_mbus_config: get supported mediabus configurations
- *
- * @s_mbus_config: set a certain mediabus configuration. This operation is added
- *	for compatibility with soc-camera drivers and should not be used by new
- *	software.
- *
  * @s_rx_buffer: set a host allocated memory buffer for the subdev. The subdev
  *	can adjust @size to a lower value and must not write more data to the
  *	buffer starting at @data than the original value of @size.
@@ -435,10 +429,6 @@ struct v4l2_subdev_video_ops {
 			struct v4l2_dv_timings *timings);
 	int (*query_dv_timings)(struct v4l2_subdev *sd,
 			struct v4l2_dv_timings *timings);
-	int (*g_mbus_config)(struct v4l2_subdev *sd,
-			     struct v4l2_mbus_config *cfg);
-	int (*s_mbus_config)(struct v4l2_subdev *sd,
-			     const struct v4l2_mbus_config *cfg);
 	int (*s_rx_buffer)(struct v4l2_subdev *sd, void *buf,
 			   unsigned int *size);
 };
-- 
2.27.0

