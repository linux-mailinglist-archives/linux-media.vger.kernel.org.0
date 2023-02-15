Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 419B36987E1
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjBOWab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjBOWab (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8D2252B2
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82454478;
        Wed, 15 Feb 2023 23:30:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500228;
        bh=Ji2c3clnXw/f6wET1fa+7SGldKPX/TxAxd3Ypsj94g0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XrRmJ882wXi+8AePFIT4EWHniAilADSH7gfVrFIf/Z7LbCt6bOsIgoep387emjblm
         AYgGgp88iLGm01kWRyxfGVyV+XeEV4TJncbhlmX98yl0uivdiaXjrcACJ8ldQQbf/v
         3tnxY7U6Gsg5O8ogdMjvGsVlIx5yWvkFzgW2I9os=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 12/15] media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
Date:   Thu, 16 Feb 2023 00:30:00 +0200
Message-Id: <20230215223003.30170-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

IMX290_CTRL_07 was written from both imx290_global_init_settings
and imx290_1080p_settings and imx290_720p_settings.

Remove it from imx290_global_init_settings as the setting varies
based on the mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 36d6fe12336d..2d41b5403933 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -238,7 +238,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
  */
 
 static const struct imx290_regval imx290_global_init_settings[] = {
-	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
 	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
-- 
Regards,

Laurent Pinchart

