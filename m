Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73ACB5263A0
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348935AbiEMOQ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbiEMOQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:09 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499A9A309F
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451368; x=1683987368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q3n8K/hx0XDgB3DIGJPVTbO9XMHQEc9teptegvUD6mA=;
  b=O0BDzloLJ8pQc4R3Po2GWnwyYHRnaMZH3qPu5WsAV7F/vijsYNp4223G
   +HY6/vQ+rU9eHQ6X5/5Y13prIvUPpZ5Lvzqrb0MCdItEpPzINkvyJcLRq
   nhwfTkvlN8/a4LgoN9mgOb8n7LQwzG9uH9IbyXRXBh8HBOvdYq/fPcF+o
   1NhrMcVFbuyJrWuisPKNaC/88kgCU9d7xRIzkHPvC7SYUquHKIWrlbgNf
   GS5QgaZ7LbYX65TFC+PSEpEXqCDxE9+TS1OfBYn2eJiUEuzGF+ZiSHFAQ
   Hb+0+XgwcGDm6kj9RTtRex6y/nxzLjcQ0QGPBv9kxkeSA+PIqM//Rtag5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="356740963"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="356740963"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="624879383"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:03 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1C86021707;
        Fri, 13 May 2022 17:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW58-0001gd-Dv; Fri, 13 May 2022 17:15:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 18/28] media: ov5640: Remove frame rate check from find_mode()
Date:   Fri, 13 May 2022 17:15:38 +0300
Message-Id: <20220513141548.6344-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

The current implementation of ov5640_find_mode() fails if the
frame rate programmed with s_frame_interval doesn't match the
maximum frame rate for the current mode.

This causes issues when moving from one mode with higher FPS to another
one which only supports a lower FPS range with tools like media-ctl.

It also forces users that do not use s_frame_interval(), but rather
configure blankings explicitly, to adjust the programmed FPS range to
avoid failures.

For this reason, remove the FPS check from ov5640_find_mode() and only
perform it at s_frame_interval() time.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 63d43bddb8386..63d435ccde559 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1995,8 +1995,7 @@ static int ov5640_set_virtual_channel(struct ov5640_dev *sensor)
 }
 
 static const struct ov5640_mode_info *
-ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
-		 int width, int height, bool nearest)
+ov5640_find_mode(struct ov5640_dev *sensor, int width, int height, bool nearest)
 {
 	const struct ov5640_mode_info *mode;
 
@@ -2009,10 +2008,6 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	     (mode->width != width || mode->height != height)))
 		return NULL;
 
-	/* Check to see if the current mode exceeds the max frame rate */
-	if (ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
-		return NULL;
-
 	return mode;
 }
 
@@ -2649,7 +2644,7 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 	fi->denominator = best_fps;
 
 find_mode:
-	mode = ov5640_find_mode(sensor, rate, width, height, false);
+	mode = ov5640_find_mode(sensor, width, height, false);
 	return mode ? rate : -EINVAL;
 }
 
@@ -2687,7 +2682,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	const struct ov5640_mode_info *mode;
 	int i;
 
-	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
+	mode = ov5640_find_mode(sensor, fmt->width, fmt->height, true);
 	if (!mode)
 		return -EINVAL;
 	fmt->width = mode->width;
@@ -3481,13 +3476,17 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 		goto out;
 	}
 
-	mode = ov5640_find_mode(sensor, frame_rate, mode->width,
-				mode->height, true);
+	mode = ov5640_find_mode(sensor, mode->width, mode->height, true);
 	if (!mode) {
 		ret = -EINVAL;
 		goto out;
 	}
 
+	if (ov5640_framerates[frame_rate] > ov5640_framerates[mode->max_fps]) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (mode != sensor->current_mode ||
 	    frame_rate != sensor->current_fr) {
 		sensor->current_fr = frame_rate;
-- 
2.30.2

