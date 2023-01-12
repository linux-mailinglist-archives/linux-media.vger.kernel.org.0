Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D69667D53
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 19:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbjALSDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 13:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240156AbjALSC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 13:02:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A9755647
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 09:25:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1BF7491;
        Thu, 12 Jan 2023 18:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673544315;
        bh=antwnTO/zTzZxh/Yc0caKQNnv2yZA+GpHGmlEvDFv5w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EHMJ4NjRguSMxfmhPNJvw3t3FilESC2Q6TYboqupWhesScX7d4rLcNXM+HChyGC1v
         fkV1bzFSvLJlms3g0Bqe+QcIG4fuIQWZWmGbdnUpks25vBLofQKhmDPrMZn4siqHxz
         hT2Y5nmrajhiPIMEPyS0mMARMB/EGuOcrjfcA6Y8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 5/7] media: imx-pxp: Implement frame size enumeration
Date:   Thu, 12 Jan 2023 19:25:05 +0200
Message-Id: <20230112172507.30579-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
References: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Use 1 << ALIGN_*
---
 drivers/media/platform/nxp/imx-pxp.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 2566a7821982..580824efa3f5 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1389,6 +1389,26 @@ static int pxp_s_fmt_vid_out(struct file *file, void *priv,
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
+	fsize->stepwise.step_width = 1 << ALIGN_W;
+	fsize->stepwise.min_height = MIN_H;
+	fsize->stepwise.max_height = MAX_H;
+	fsize->stepwise.step_height = 1 << ALIGN_H;
+
+	return 0;
+}
+
 static u8 pxp_degrees_to_rot_mode(u32 degrees)
 {
 	switch (degrees) {
@@ -1457,6 +1477,8 @@ static const struct v4l2_ioctl_ops pxp_ioctl_ops = {
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

