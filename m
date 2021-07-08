Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092083C1450
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 15:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhGHNgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 09:36:08 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:41158 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhGHNgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 09:36:07 -0400
X-Greylist: delayed 569 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Jul 2021 09:36:07 EDT
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 75D6A3C003F;
        Thu,  8 Jul 2021 15:23:53 +0200 (CEST)
Received: from vmlxhi-082.localdomain (10.72.92.227) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 8 Jul
 2021 15:23:53 +0200
From:   Dennis Rachui <drachui@de.adit-jv.com>
To:     <niklas.soderlund@ragnatech.se>
CC:     <drachui@de.adit-jv.com>, Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: rcar-csi2: do not update format while streaming
Date:   Thu, 8 Jul 2021 15:22:58 +0200
Message-ID: <1625750578-108454-1-git-send-email-drachui@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.92.227]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Verify that streaming is not active before setting the pad format.

According to the VIDIOC documentation [1] changes to the active
format of a media pad via the VIDIOC_SUBDEV_S_FMT ioctl are
applied to the underlying hardware.
In rcar-csi2 a format change only applies to hardware, when the
pipeline is started. While the device is not in use, it is therefore
okay to update the format.

However, when the pipeline is active, this leads to a format
mismatch between driver and device.
Other applications can query the format with
VIDIOC_SUBDEV_G_FMT at any time and would be reported
a format that does not fit the current stream.

This commit prevents format update while streaming is active
and returns -EBUSY to user space, as suggested by [1].

[1] Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst

Note: after creation of this commit, it was noticed that Steve
Longerbeam has a very similar solution in his fork.

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Signed-off-by: Dennis Rachui <drachui@de.adit-jv.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e28eff0..98152e1 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -724,18 +724,37 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
 	struct v4l2_mbus_framefmt *framefmt;
+	int ret = 0;
+
+	mutex_lock(&priv->lock);
 
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+
+		/*
+		 * Do not apply changes to active format while streaming.
+		 *
+		 * Since video streams could be forwarded from sink pad to any
+		 * source pad (depending on CSI-2 channel routing), all
+		 * media pads are effected by this rule.
+		 */
+		if (priv->stream_count > 0) {
+			ret = -EBUSY;
+			goto out;
+		}
+
 		priv->mf = format->format;
 	} else {
 		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		*framefmt = format->format;
 	}
 
-	return 0;
+out:
+	mutex_unlock(&priv->lock);
+
+	return ret;
 }
 
 static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
-- 
2.7.4

