Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114B966AD01
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 18:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjANRS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 12:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjANRSY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 12:18:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72429B752
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 09:18:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 024984DD;
        Sat, 14 Jan 2023 18:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673716702;
        bh=m4eq2QGANKB5k5Q6erW/PQ92at9PuF9FY0y09YvTFfs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jGE8Zeo0LacYMuikeXERa/MPjBNZ97caKjaPrGFGTY4LISZVtNGz2kLihA4Uj7mZA
         Yu2GWGjwSkNizyTR0Np3mu0XsXMRKJI/s84qTiVEBBzMEce2K9LlrRI5e6OmboASil
         blQCT/w/9cmHZ2gXBLnhMQWV12jFhhQ23g0RrLIU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 15/17] media: i2c: imx290: Configure data lanes at start time
Date:   Sat, 14 Jan 2023 19:18:00 +0200
Message-Id: <20230114171802.13878-15-laurent.pinchart@ideasonboard.com>
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

There's no need to configure the data lanes in the runtime PM resume
handler. Do so in imx290_start_streaming() instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index c3ffb23104bf..67a2edd38e91 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -767,6 +767,9 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
+	/* Set data lane count */
+	imx290_set_data_lanes(imx290);
+
 	/* Apply the register values related to current frame format */
 	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
 	ret = imx290_setup_format(imx290, format);
@@ -1074,9 +1077,6 @@ static int imx290_power_on(struct imx290 *imx290)
 	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
 	usleep_range(30000, 31000);
 
-	/* Set data lane count */
-	imx290_set_data_lanes(imx290);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

