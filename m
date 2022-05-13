Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC7A526394
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345013AbiEMOQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245555AbiEMOP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:15:58 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAB25D674
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451356; x=1683987356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=juFTw9GaQLQ7wEp26nQzuX8T2KLWFEJc/dvT7nhNU1Y=;
  b=JLsEeCN1pE4HIyesQ9ZsV4u9c8Il3XP9z5VxfiBZAije/G6OeeJD4HkV
   4ZoAvidj5B2jsibRF7x4T9hORupibKbpeHi+43AG4+XfT50/w6BLWUdPK
   BGkj07OAbPoN84H/dkexy0eOCURUiD8BKqGpikOAuMMcZbXUMT/jAF083
   5xrhrdkaKQQtZSRDQyphpWF46ioDH7oMS7S9buoDCsyc7ewEx8kCA/A3t
   Me8oKdWCNfPdBA7Xszf2n7Zbc+mHHFe/lW5fJ7tZKtIqnyQKoMM7k4I2U
   Dqp61TxKCsvI4aGi7XOdGOCYkuG+a3e3zzqRPnQ6gpgWpUpQbMH4jfDx3
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="250212478"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="250212478"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="698498627"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 98CA5210C1;
        Fri, 13 May 2022 17:15:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW56-0001fi-VS; Fri, 13 May 2022 17:15:48 +0300
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
Subject: [PATCH v7 03/28] media: ov5640: Add ov5640_is_csi2() function
Date:   Fri, 13 May 2022 17:15:23 +0300
Message-Id: <20220513141548.6344-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

Checking if the sensor is used in DVP or MIPI CSI-2 mode is a repeated
pattern which is about to be repeated more often.

Provide an inline function to shortcut that.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1f3cb84c284eb..0697c9bf03ed9 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -294,6 +294,11 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 			     ctrls.handler)->sd;
 }
 
+static inline bool ov5640_is_csi2(const struct ov5640_dev *sensor)
+{
+	return sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY;
+}
+
 /*
  * FIXME: all of these register tables are likely filled with
  * entries that set the register to their power-on default values,
@@ -1208,7 +1213,7 @@ static int ov5640_load_regs(struct ov5640_dev *sensor,
 		/* remain in power down mode for DVP */
 		if (regs->reg_addr == OV5640_REG_SYS_CTRL0 &&
 		    val == OV5640_REG_SYS_CTRL0_SW_PWUP &&
-		    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
+		    !ov5640_is_csi2(sensor))
 			continue;
 
 		if (mask)
@@ -1843,7 +1848,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	 * the same rate than YUV, so we can just use 16 bpp all the time.
 	 */
 	rate = ov5640_calc_pixel_rate(sensor) * 16;
-	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
+	if (ov5640_is_csi2(sensor)) {
 		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
 		ret = ov5640_set_mipi_pclk(sensor, rate);
 	} else {
@@ -3020,7 +3025,7 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 			sensor->pending_fmt_change = false;
 		}
 
-		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+		if (ov5640_is_csi2(sensor))
 			ret = ov5640_set_stream_mipi(sensor, enable);
 		else
 			ret = ov5640_set_stream_dvp(sensor, enable);
-- 
2.30.2

