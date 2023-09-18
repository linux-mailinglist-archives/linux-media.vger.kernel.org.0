Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9517A4A15
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240061AbjIRMt5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241556AbjIRMtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:49:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E2D1BD
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:48:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7770A1257;
        Mon, 18 Sep 2023 14:46:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695041210;
        bh=UXwlMJbgk6hhsBHhaEzwUSBkyrse5nEW69gE1DWcpbs=;
        h=From:To:Cc:Subject:Date:From;
        b=MNevpwxfdFhzCynKnyEHLtTkbsV6zrr0aybPO0fGCUZMhrMdZCeV9XxNT7ClFNJbB
         MgAIUluGpw+O7k7kRayDCeME6pzdaX2UEGzp7lrVvGirKlHQrlA/KbrZ3BhbKXdJ/8
         BBoBruRsY89sj5Sc/WYoTofb3GvEhyOLtYa8vyo0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v2] media: v4l2-subdev: Document and enforce .s_stream() requirements
Date:   Mon, 18 Sep 2023 15:48:38 +0300
Message-ID: <20230918124838.14210-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev .s_stream() operation must not be called to start an already
started subdev, or stop an already stopped one. This requirement has
never been formally documented. Fix it, and catch possible offenders
with a WARN_ON() in the call_s_stream() wrapper.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Add WARN_ON() in call_s_stream()
- Fix typo and language in documentation
---
I'm resending this patch individually to avoid spamming the list with
the 56 other patches included in v1. You can find the original series at
https://lore.kernel.org/linux-media/20230914181704.4811-1-laurent.pinchart@ideasonboard.com
---
 drivers/media/v4l2-core/v4l2-subdev.c | 17 ++++++++++++++++-
 include/media/v4l2-subdev.h           |  4 +++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b92348ad61f6..32b7d9cd43e6 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -359,6 +359,18 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	int ret;
 
+	/*
+	 * The .s_stream() operation must never be called to start or stop an
+	 * already started or stopped subdev. Catch offenders but don't return
+	 * an error yet to avoid regressions.
+	 *
+	 * As .s_stream() is mutually exclusive with the .enable_streams() and
+	 * .disable_streams() operation, we can use the enabled_streams field
+	 * to store the subdev streaming state.
+	 */
+	if (WARN_ON(!!sd->enabled_streams == !!enable))
+		return 0;
+
 #if IS_REACHABLE(CONFIG_LEDS_CLASS)
 	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
 		if (enable)
@@ -372,9 +384,12 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 
 	if (!enable && ret < 0) {
 		dev_warn(sd->dev, "disabling streaming failed (%d)\n", ret);
-		return 0;
+		ret = 0;
 	}
 
+	if (!ret)
+		sd->enabled_streams = enable ? BIT(0) : 0;
+
 	return ret;
 }
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d9fca929c10b..ab2a7ef61d42 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -446,7 +446,9 @@ enum v4l2_subdev_pre_streamon_flags {
  * @s_stream: start (enabled == 1) or stop (enabled == 0) streaming on the
  *	sub-device. Failure on stop will remove any resources acquired in
  *	streaming start, while the error code is still returned by the driver.
- *	Also see call_s_stream wrapper in v4l2-subdev.c.
+ *	The caller shall track the subdev state, and shall not start or stop an
+ *	already started or stopped subdev. Also see call_s_stream wrapper in
+ *	v4l2-subdev.c.
  *
  * @g_pixelaspect: callback to return the pixelaspect ratio.
  *

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
Regards,

Laurent Pinchart

