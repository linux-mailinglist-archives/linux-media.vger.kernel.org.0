Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC22A183D92
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgCLXro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgCLXrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:42 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E442C1944;
        Fri, 13 Mar 2020 00:47:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056859;
        bh=Xs3miPnvFIH4auPohDDAGjHhkhXDnsWroynki4IfJQs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JBkCDkCiTTuWjip/7EH9eqqiTjCjQZSbbfXpiy845KCPmr+G54DWM+vhyonLb/JOA
         Ec2wPvO1k303EB68bcm/c2UE4EJWylEWyorg0HzikQ4xNiOczmlFS8Of0apOMzVr8Y
         amYV4uN//UNsh0FHLqr8KXd5S6+Em80p24wPJIE0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 14/14] media: imx: imx7-mipi-csis: Implement the .enum_mbus_code() operation
Date:   Fri, 13 Mar 2020 01:47:22 +0200
Message-Id: <20200312234722.23483-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the subdev pad .enum_mbus_code() operation to enumerate media
bus codes on the sink and source pads.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 66ff73919371..38f465256879 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -752,6 +752,38 @@ static int mipi_csis_get_fmt(struct v4l2_subdev *mipi_sd,
 	return 0;
 }
 
+static int mipi_csis_enum_mbus_code(struct v4l2_subdev *mipi_sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+
+	/*
+	 * The CSIS can't transcode in any way, the source format is identical
+	 * to the sink format.
+	 */
+	if (code->pad == CSIS_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = mipi_csis_get_format(state, cfg, code->which, code->pad);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->pad != CSIS_PAD_SINK)
+		return -EINVAL;
+
+	if (code->index >= ARRAY_SIZE(mipi_csis_formats))
+		return -EINVAL;
+
+	code->code = mipi_csis_formats[code->index].code;
+
+	return 0;
+}
+
 static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 			     struct v4l2_subdev_pad_config *cfg,
 			     struct v4l2_subdev_format *sdformat)
@@ -881,6 +913,7 @@ static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
 
 static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
 	.init_cfg		= mipi_csis_init_cfg,
+	.enum_mbus_code		= mipi_csis_enum_mbus_code,
 	.get_fmt		= mipi_csis_get_fmt,
 	.set_fmt		= mipi_csis_set_fmt,
 };
-- 
Regards,

Laurent Pinchart

