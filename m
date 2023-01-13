Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2FA669383
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbjAMJ5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234010AbjAMJ5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 04:57:05 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7500168CA2
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 01:54:19 -0800 (PST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pGGlM-0003cp-W1; Fri, 13 Jan 2023 10:54:17 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Jan 2023 10:54:19 +0100
Subject: [PATCH v2 13/16] media: imx-pxp: Implement frame size enumeration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230112-imx-pxp-v2-13-e2281da1db55@pengutronix.de>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
In-Reply-To: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement support for the VIDIOC_ENUM_FRAMESIZES ioctl.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes since v1:

- Use 1 << ALIGN_*
- Pick from https://lore.kernel.org/linux-media/20230112172507.30579-1-laurent.pinchart@ideasonboard.com/
---
 drivers/media/platform/nxp/imx-pxp.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 9e2e522d9241..f34eba62f7d6 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1379,6 +1379,26 @@ static int pxp_s_fmt_vid_out(struct file *file, void *priv,
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
@@ -1447,6 +1467,8 @@ static const struct v4l2_ioctl_ops pxp_ioctl_ops = {
 	.vidioc_try_fmt_vid_out	= pxp_try_fmt_vid_out,
 	.vidioc_s_fmt_vid_out	= pxp_s_fmt_vid_out,
 
+	.vidioc_enum_framesizes	= pxp_enum_framesizes,
+
 	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
 	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
 	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,

-- 
2.30.2
