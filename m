Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419D71A9B59
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896637AbgDOKsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:48:13 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57887 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896604AbgDOKrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:47:43 -0400
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9F29E240013;
        Wed, 15 Apr 2020 10:47:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/6] media: v4l2-subdev: Deprecate g_mbus_config video op
Date:   Wed, 15 Apr 2020 12:49:59 +0200
Message-Id: <20200415105004.2497356-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Deprecate 'g_mbus_config' video operation in favor of the newly
introduced 'get_mbus_config' pad operation.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d1a5e9d1ea63..9bf14c41626d 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -466,7 +466,9 @@ struct v4l2_mbus_pad_config {
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
2.26.0

