Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1293B2012
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 20:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhFWSPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 14:15:23 -0400
Received: from retiisi.eu ([95.216.213.190]:44456 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229881AbhFWSPW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 14:15:22 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D9641634C8B;
        Wed, 23 Jun 2021 21:12:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/3] v4l: subdev: Add pre_streamon and post_streamoff callbacks
Date:   Wed, 23 Jun 2021 21:13:01 +0300
Message-Id: <20210623181302.14660-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
References: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add pre_streamon and post_streamoff callbacks that can be used to set a
CSI-2 transmitter to LP-11 or LP-111 mode. This can be used by receiver
drivers to reliably initialise the receiver when its initialisation
requires software involvement.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5364e3a6ac9b..95ec18c2f49c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -354,6 +354,16 @@ struct v4l2_mbus_frame_desc {
 	unsigned short num_entries;
 };
 
+/**
+ * enum v4l2_subdev_pre_streamon_flags - Flags for pre_streamon subdev core op
+ *
+ * @V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP: Set the transmitter to either LP-11
+ *	or LP-111 mode before call to s_stream().
+ */
+enum v4l2_subdev_pre_streamon_flags {
+	V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP = BIT(0),
+};
+
 /**
  * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
  *				  in video mode.
@@ -409,6 +419,19 @@ struct v4l2_mbus_frame_desc {
  * @s_rx_buffer: set a host allocated memory buffer for the subdev. The subdev
  *	can adjust @size to a lower value and must not write more data to the
  *	buffer starting at @data than the original value of @size.
+ *
+ * @pre_streamon: May be called before streaming is actually started, to help
+ *	initialising the bus. Current usage is to set a CSI-2 transmitter to
+ *	LP-11 or LP-111 mode before streaming. See &enum
+ *	v4l2_subdev_pre_streamon_flags.
+ *
+ *	pre_streamon shall return error if it cannot perform the operation as
+ *	indicated by the flags argument. In particular, -EACCES indicates lack
+ *	of support for the operation. The caller shall call post_streamoff for
+ *	each successful call of pre_streamon.
+ *
+ * @post_streamoff: Called after streaming is stopped, but if and only if
+ *	pre_streamon was called earlier.
  */
 struct v4l2_subdev_video_ops {
 	int (*s_routing)(struct v4l2_subdev *sd, u32 input, u32 output, u32 config);
@@ -435,6 +458,8 @@ struct v4l2_subdev_video_ops {
 			struct v4l2_dv_timings *timings);
 	int (*s_rx_buffer)(struct v4l2_subdev *sd, void *buf,
 			   unsigned int *size);
+	int (*pre_streamon)(struct v4l2_subdev *sd, u32 flags);
+	int (*post_streamoff)(struct v4l2_subdev *sd);
 };
 
 /**
-- 
2.30.2

