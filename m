Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549FA526399
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349121AbiEMOQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245555AbiEMOQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:05 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D70118006
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451364; x=1683987364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p7begUTuvEGe+svOx6Qa949LCAqCvelOezsK33pK2+Y=;
  b=knczObeA3I516qOQ7sy0FHXcIwMDHvigufkdHNOYpzhJ/57tIv2/uVQS
   WpHyIAauiwSaT9Zi2JclX3geH0xg0qlL8uXwATU3ZHYKsb3LKmSh+Gjho
   AlecumGCArrgO3uP1eBJ9p3It1m/XbmUUFwAUN4pM/nutGnoyZoFyN4AC
   e8Cxrk1GKYi8HY7RNWd2ln5TBlXMf4ilu1ZKxtXJ+S2dJZ8uS37U+6ZJd
   dPMqWXoQVJpCwYhLhQxXzEoGDvP096uW+qJNUNWUz10LHZhT77k6yXAXB
   tyYJshHzXfQLEL+tZkz8ZPg9IAwt/IrMNlEm03buMINUqYX24koDf7RDx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="295573094"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="295573094"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="671351647"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 5BAEA214DD;
        Fri, 13 May 2022 17:15:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW57-0001gD-Li; Fri, 13 May 2022 17:15:49 +0300
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
Subject: [PATCH v7 11/28] media: ov5640: Provide timings accessor
Date:   Fri, 13 May 2022 17:15:31 +0300
Message-Id: <20220513141548.6344-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

Provide a function to shortcut access to the correct timings definition
to avoid repeating the same pattern when accessing the sensor timings.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8bb8a463dc7dc..936ee62eb2ab7 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1123,6 +1123,16 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 	},
 };
 
+static const struct ov5640_timings *
+ov5640_timings(const struct ov5640_dev *sensor,
+	       const struct ov5640_mode_info *mode)
+{
+	if (ov5640_is_csi2(sensor))
+		return &mode->csi2_timings;
+
+	return &mode->dvp_timings;
+}
+
 static int ov5640_init_slave_id(struct ov5640_dev *sensor)
 {
 	struct i2c_client *client = sensor->i2c_client;
@@ -1635,11 +1645,7 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
 			return ret;
 	}
 
-	if (ov5640_is_csi2(sensor))
-		timings = &mode->csi2_timings;
-	else
-		timings = &mode->dvp_timings;
-
+	timings = ov5640_timings(sensor, mode);
 	analog_crop = &timings->analog_crop;
 	crop = &timings->crop;
 
-- 
2.30.2

