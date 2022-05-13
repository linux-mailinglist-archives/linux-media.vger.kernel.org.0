Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183AE5263A2
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346893AbiEMOQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347753AbiEMOQQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:16 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03DF11B407
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451370; x=1683987370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6ofoCKuWCsMr3gx7rodnJeAFifES6yzInam8PQ80aJk=;
  b=bLDUZkMSGB6sOFmVkCE98JOz2kaqS7zWAcuO0sllbJpdXJLeEiWllLyV
   eNJiDh9HKaIxmOtvuRxpGZ1WyNplHDtj5sm1mRoT6EY2V/tidm3l4cGLz
   NE/4Z9dwkuF1AckYTiwsEWUnV20toiVeWWo46o5VgkiOoeqXakI7aiQHd
   1vi5QXxtYDcP6/LuHPnf4Ih4l1g+X41ZYxvR+wsHw2tJnWz0Z5t+7eNUV
   OQeGIAbylk7i8b60r3B9bFVxhx81CPHO14h7jjyfvW3pOnTxfNidg/5v/
   w/dUIfrbIdzOood2rJTRXDRWaftPDedWE3FUT/mUYj0sOw89DfhW4x9iw
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252360911"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="252360911"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="815393376"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:04 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 722BA21ABD;
        Fri, 13 May 2022 17:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW58-0001gq-Nb; Fri, 13 May 2022 17:15:50 +0300
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
Subject: [PATCH v7 21/28] media: ov5640: Implement get_selection
Date:   Fri, 13 May 2022 17:15:41 +0300
Message-Id: <20220513141548.6344-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

Implement the get_selection pad operation for the OV5640 sensor driver.

The supported targets report the sensor's native size, the active pixel
array size and the analog crop rectangle from which the image is
produced.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1981436f40177..2c3c49bbaaa54 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2866,6 +2866,45 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int ov5640_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+	const struct ov5640_timings *timings;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		mutex_lock(&sensor->lock);
+		timings = ov5640_timings(sensor, mode);
+		sel->r = timings->analog_crop;
+		mutex_unlock(&sensor->lock);
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV5640_NATIVE_WIDTH;
+		sel->r.height = OV5640_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV5640_PIXEL_ARRAY_TOP;
+		sel->r.left = OV5640_PIXEL_ARRAY_LEFT;
+		sel->r.width = OV5640_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV5640_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 			       struct v4l2_mbus_framefmt *format)
 {
@@ -3565,9 +3604,15 @@ static int ov5640_init_cfg(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *fmt =
 				v4l2_subdev_get_try_format(sd, state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
 
 	*fmt = ov5640_default_fmt;
 
+	crop->left = OV5640_PIXEL_ARRAY_LEFT;
+	crop->top = OV5640_PIXEL_ARRAY_TOP;
+	crop->width = OV5640_PIXEL_ARRAY_WIDTH;
+	crop->height = OV5640_PIXEL_ARRAY_HEIGHT;
+
 	return 0;
 }
 
@@ -3589,6 +3634,7 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
 	.enum_mbus_code = ov5640_enum_mbus_code,
 	.get_fmt = ov5640_get_fmt,
 	.set_fmt = ov5640_set_fmt,
+	.get_selection = ov5640_get_selection,
 	.enum_frame_size = ov5640_enum_frame_size,
 	.enum_frame_interval = ov5640_enum_frame_interval,
 };
-- 
2.30.2

