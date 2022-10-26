Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E25F60DB97
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 08:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbiJZGvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 02:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbiJZGvH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 02:51:07 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F595578AC
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 23:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666767064; x=1698303064;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OpdL22wdhyWFPa05OhWTUGg4/Dw/UL4CdVsDAMqe0S4=;
  b=gYK6nRF1fF322EO7h/Y+C0Mk0A3XGukuedy0iWfvtCKInFVoltBX1Czx
   VIrlMWdTlfWe18Ot/VoUN7arl/DJwt9qmP59qR1KRkbyU6jlH0pZdLaEo
   L9r12pqmFjVjgXgDE485LAp6RZXeHNnSg1J86UYuDtdKWNW/AzHw3KcoU
   OVKZwQrwA976zdzckEDAaHhPLx6T6Q9nmy2q9QxrKraTjni+motszMn7A
   YQFv2KvsM9cqUQZbQBaIBuwS9Ad/S7CHpdcoodyZ+SuwxHCC/pX8LQtvr
   61YQ6AXeMgeWSGyUjTc68b5i3MYTV8AxFn6zmmlHJuiDQ1Aqt7DnrivQP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="394187467"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="394187467"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 23:50:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="877082821"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="877082821"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 23:50:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id A826620210;
        Wed, 26 Oct 2022 09:50:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1onaG4-002V06-1T; Wed, 26 Oct 2022 09:51:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: [PATCH 1/1] v4l: subdev: Warn if disabling streaming failed, return success
Date:   Wed, 26 Oct 2022 09:51:23 +0300
Message-Id: <20221026065123.595777-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Complain in the newly added s_stream video op wrapper if disabling
streaming failed. Also return zero in this case as there's nothing the
caller can do to return the error.

This way drivers also won't need to bother with printing error messages.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++++
 include/media/v4l2-subdev.h           |  6 ++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5c27bac772ea4..8a4ca2bd1584d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -318,6 +318,20 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
 
+static int call_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	int ret;
+
+	ret = sd->ops->video->s_stream(sd, enable);
+
+	if (!enable && ret < 0) {
+		dev_warn(sd->dev, "disabling streaming failed (%d)\n", ret);
+		return 0;
+	}
+
+	return ret;
+}
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 /*
  * Create state-management wrapper for pad ops dealing with subdev state. The
@@ -377,6 +391,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 static const struct v4l2_subdev_video_ops v4l2_subdev_call_video_wrappers = {
 	.g_frame_interval	= call_g_frame_interval,
 	.s_frame_interval	= call_s_frame_interval,
+	.s_stream		= call_s_stream,
 };
 
 const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 54566d139da79..b15fa9930f30c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -440,8 +440,10 @@ enum v4l2_subdev_pre_streamon_flags {
  * @g_input_status: get input status. Same as the status field in the
  *	&struct v4l2_input
  *
- * @s_stream: used to notify the driver that a video stream will start or has
- *	stopped.
+ * @s_stream: start (enabled == 1) or stop (enabled == 0) streaming on the
+ *	sub-device. Failure on stop will remove any resources acquired in
+ *	streaming start, while the error code is still returned by the driver.
+ *	Also see call_s_stream wrapper in v4l2-subdev.c.
  *
  * @g_pixelaspect: callback to return the pixelaspect ratio.
  *
-- 
2.30.2

