Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6C7660150
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 14:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbjAFNeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 08:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234740AbjAFNdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 08:33:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA62077AC9
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 05:32:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C217A6F0;
        Fri,  6 Jan 2023 14:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673011959;
        bh=MGpoxU+SQNQxScq8Zfu41/hu46zTVwB9AeWWyAdEZqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Np+2o0mNMrw3C6IRtTMp0QJt3Aj41+GkQmC2Hf5MgxMNC//UUN2AraDTZSYQ1Ux5B
         2YVBjukhraR9/zwUdn9/73NjsiX5HEBqi7UdNsbnFd+uSbe+lc7H+RtLyMwUS9/TXh
         arFsnJIZzAkbyzGXCPnsClfPgrDgEQThUkfXnmDA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 4/6] media: imx-pxp: Implement frame size enumeration
Date:   Fri,  6 Jan 2023 15:32:25 +0200
Message-Id: <20230106133227.13685-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
References: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for the VIDIOC_ENUM_FRAMESIZES ioctl.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-pxp.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index fd4c055c01eb..68f838e3069d 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1391,6 +1391,26 @@ static int pxp_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
+static int pxp_enum_framesizes(struct file *file, void *fh,
+			       struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	if (!find_format(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = MIN_W;
+	fsize->stepwise.max_width = MAX_W;
+	fsize->stepwise.step_width = ALIGN_W;
+	fsize->stepwise.min_height = MIN_H;
+	fsize->stepwise.max_height = MAX_H;
+	fsize->stepwise.step_height = ALIGN_H;
+
+	return 0;
+}
+
 static u8 pxp_degrees_to_rot_mode(u32 degrees)
 {
 	switch (degrees) {
@@ -1459,6 +1479,8 @@ static const struct v4l2_ioctl_ops pxp_ioctl_ops = {
 	.vidioc_try_fmt_vid_out	= pxp_try_fmt_vid_out,
 	.vidioc_s_fmt_vid_out	= pxp_s_fmt_vid_out,
 
+	.vidioc_enum_framesizes	= pxp_enum_framesizes,
+
 	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
 	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
 	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
-- 
Regards,

Laurent Pinchart

