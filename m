Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9B71D36C9
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgENQmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:42:52 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:52969 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgENQmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:42:52 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 500821C000C;
        Thu, 14 May 2020 16:42:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 5/8] media: v4l2-subdev: Deprecate g_mbus_config video op
Date:   Thu, 14 May 2020 18:45:37 +0200
Message-Id: <20200514164540.507233-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514164540.507233-1-jacopo+renesas@jmondi.org>
References: <20200514164540.507233-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Deprecate 'g_mbus_config' video operation in favor of the newly
introduced 'get_mbus_config' pad operation.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8d5f4a255b87..7c77092ae9b7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -402,7 +402,9 @@ struct v4l2_mbus_frame_desc {
  *
  * @query_dv_timings: callback for VIDIOC_QUERY_DV_TIMINGS() ioctl handler code.
  *
- * @g_mbus_config: get supported mediabus configurations
+ * @g_mbus_config: get supported mediabus configurations. This operation is
+ *		   deprecated in favour of the get_mbus_config() pad operation
+ *		   and should not be used by new software.
  *
  * @s_mbus_config: set a certain mediabus configuration. This operation is added
  *	for compatibility with soc-camera drivers and should not be used by new
-- 
2.26.2

