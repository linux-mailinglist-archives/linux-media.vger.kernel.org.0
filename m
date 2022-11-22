Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710E9634A1D
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbiKVWd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235216AbiKVWd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664679DBA6
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E37451180;
        Tue, 22 Nov 2022 23:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156406;
        bh=lCd+0Rify8OxctodoF85rFQq0gcmx9kyLzEQ57TonAI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KeHUq+5uOryO16ICDWoAd4uHJiA4Y+yjdUQVkK0YmtuxtcswjkwYHStY3SDsSWa6g
         qRbioAX92fggiXKrM8YJd49yIKCeatVqkMBef1SW6DEpoDyKhmY1dDJzHVMLriZP5G
         0Dgh/Vl8nyiDDOU/+gdgjGuB+uyxNkHsFVh9AKnU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 14/15] media: i2c: imx290: Configure data lanes at start time
Date:   Wed, 23 Nov 2022 00:32:49 +0200
Message-Id: <20221122223250.21233-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index dbed703fa199..4dfa090f918d 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -753,6 +753,9 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
+	/* Set data lane count */
+	imx290_set_data_lanes(imx290);
+
 	/* Apply the register values related to current frame format */
 	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
 	ret = imx290_setup_format(imx290, format);
@@ -1052,9 +1055,6 @@ static int imx290_power_on(struct device *dev)
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

