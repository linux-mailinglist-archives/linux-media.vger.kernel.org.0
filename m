Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB405FFD80
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiJPGQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiJPGQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA8B3ED53
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76C091ABC;
        Sun, 16 Oct 2022 08:16:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900967;
        bh=N7uJwSzjIV9D1+cRu4HSYz7Umdhyi88lNvpOJo9WY9U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CYYqesxCUbs3K3QIzZLQsGthcNGwp4y1h51lTu9WQJbbkia9maNBb/Dwzkeir+F08
         yBVlbHKn/TPftJl0kZ9hdxA2ZooUNQ6Xmk8CV7yrdtsl5sXHOGkLaQfjAsnwrOiqiY
         ehzPPFdi2N2vkm74PpB10uSKA9qLOuu6dtc0/dq0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 13/20] media: i2c: imx290: Fix max gain value
Date:   Sun, 16 Oct 2022 09:15:16 +0300
Message-Id: <20221016061523.30127-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
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

The gain is expressed in multiple of 0.3dB, as a value between 0.0dB
and 72.0dB. Gains between 0.0dB and 30.0dB (included) apply analog gain
only, higher gains from 30.3dB to 72dB apply additional digital gain.

The maximum gain value is erroneously set to 72. Increase it to 100 to
cover the whole analog gain range. Support for digital gain can be added
separately if needed.

The IMX327 and IMX462 are largely compatible with the IMX290, but have
an analog gain range of 0.0dB to 29.4dB and 42dB of digital gain. When
support for those sensors gets added to the driver, the gain control
should be adjusted accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes since v1:

- Limit gain to 100
- Add comment
---
 drivers/media/i2c/imx290.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index a3d1394819ec..43ac6244c3a2 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1019,8 +1019,21 @@ static int imx290_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
 	imx290->ctrls.lock = &imx290->lock;
 
+	/*
+	 * The sensor has an analog gain and a digital gain, both controlled
+	 * through a single gain value, expressed in 0.3dB increments. Values
+	 * from 0.0dB (0) to 30.0dB (100) apply analog gain only, higher values
+	 * up to 72.0dB (240) add further digital gain. Limit the range to
+	 * analog gain only, support for digital gain can be added separately
+	 * if needed.
+	 *
+	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
+	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
+	 * gain. When support for those sensors gets added to the driver, the
+	 * gain control should be adjusted accordingly.
+	 */
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_GAIN, 0, 72, 1, 0);
+			  V4L2_CID_GAIN, 0, 100, 1, 0);
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
-- 
Regards,

Laurent Pinchart

