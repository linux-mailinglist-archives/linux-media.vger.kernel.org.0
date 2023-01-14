Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB6366AD03
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 18:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjANRSd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 12:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjANRS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 12:18:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7363AB76B
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 09:18:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F219F824;
        Sat, 14 Jan 2023 18:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673716705;
        bh=UD1YWSW22RUrwYKr9T3h7n/vPt9JRmeaDNvdsMcvqA4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i58/ciFrN3Ic1IvWTyFl26nG407axYtRZhUvIwniL0qBD0GgCD8j8SamQXzgqiCOr
         SM61EQpPhsGz8eZRweR+qJAVAx/itH3O2+3SZH2/yGIMRefAJ87zkkrudEULrbMudB
         YS4/6gs+8dl3h1lGqXHw6gFm0wif4haHcd0KoGQM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 17/17] media: i2c: imx290: Handle error from imx290_set_data_lanes()
Date:   Sat, 14 Jan 2023 19:18:02 +0200
Message-Id: <20230114171802.13878-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
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

Check the error status returned by imx290_set_data_lanes() in its
caller and propagate it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- New patch
---
 drivers/media/i2c/imx290.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index a8167119534b..62d8d75aec3e 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -761,7 +761,11 @@ static int imx290_start_streaming(struct imx290 *imx290,
 	}
 
 	/* Set data lane count */
-	imx290_set_data_lanes(imx290);
+	ret = imx290_set_data_lanes(imx290);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not set data lanes\n");
+		return ret;
+	}
 
 	/* Apply the register values related to current frame format */
 	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
-- 
Regards,

Laurent Pinchart

