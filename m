Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFD45263B6
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354007AbiEMORA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350746AbiEMOQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:48 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C0412463B
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451405; x=1683987405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEMlo/SgpNN/+xV5dMppXNYq9KNsUHPSnH3M46a4lO0=;
  b=S4hhku+dQd8Mw5Hc5OZhWiPUuIghGcr4il6D9Osd/SknhYzDQ6JLVS3b
   YaCCs8rRcSDRsgvzySGqFD7DP3YMLXm6NpcG80JSOrIoLnESx8RUr8syD
   MHqBUM+/XyX2JC+qdzPuq2+OE90cc/uWFc9mmWb6VRkX/dFE6vR3PFOVj
   NW4ppmeFTTOnYSNsQZ6SNNdZnf0IDEIGoSfSM/59vd26lNu+WVUzHgTbo
   U8tm5HXyeUVzRzwwfRGO8V80MCki68Zhe3D9jyfrB3l8J2Z22mepeg0Yq
   +lXtuNDt6Q/sXTXIomPEPqiiMEvdbL1bP9Pc6DiDqg7614QM0lDZt8O4b
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="330912100"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="330912100"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="624879509"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:34 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 888AA21AD8;
        Fri, 13 May 2022 17:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW58-0001gv-RU; Fri, 13 May 2022 17:15:50 +0300
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
Subject: [PATCH v7 22/28] media: ov5640: Register device properties
Date:   Fri, 13 May 2022 17:15:42 +0300
Message-Id: <20220513141548.6344-23-sakari.ailus@linux.intel.com>
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

Parse the device properties and register the rotation and orientation
V4L2 controls using v4l2_ctrl_new_fwnode_properties().

Remove the open-coded parsing of the rotation property and assume the
DTS is correct is providing either <0> or <180> as possible rotations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2c3c49bbaaa54..b3159375d34b4 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3347,6 +3347,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
 	struct ov5640_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct v4l2_fwnode_device_properties props;
 	const struct ov5640_timings *timings;
 	unsigned int max_vblank;
 	unsigned int hblank;
@@ -3426,6 +3427,17 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 		goto free_ctrls;
 	}
 
+	ret = v4l2_fwnode_device_parse(&sensor->i2c_client->dev, &props);
+	if (ret)
+		goto free_ctrls;
+
+	if (props.rotation == 180)
+		sensor->upside_down = true;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+	if (ret)
+		goto free_ctrls;
+
 	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -3690,7 +3702,6 @@ static int ov5640_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct fwnode_handle *endpoint;
 	struct ov5640_dev *sensor;
-	u32 rotation;
 	int ret;
 
 	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
@@ -3714,22 +3725,6 @@ static int ov5640_probe(struct i2c_client *client)
 
 	sensor->ae_target = 52;
 
-	/* optional indication of physical rotation of sensor */
-	ret = fwnode_property_read_u32(dev_fwnode(&client->dev), "rotation",
-				       &rotation);
-	if (!ret) {
-		switch (rotation) {
-		case 180:
-			sensor->upside_down = true;
-			fallthrough;
-		case 0:
-			break;
-		default:
-			dev_warn(dev, "%u degrees rotation is not supported, ignoring...\n",
-				 rotation);
-		}
-	}
-
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
 						  NULL);
 	if (!endpoint) {
-- 
2.30.2

