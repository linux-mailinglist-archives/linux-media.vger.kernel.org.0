Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C13C66C2FA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbjAPO4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbjAPO4M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:56:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EFA22DCF
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEB1718DE;
        Mon, 16 Jan 2023 15:45:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880318;
        bh=bbgHEooFIcy+t6hXkBwDOqKZmbohbYDseFhseLV33Q4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DwfIW0LGRC5cxxtDO6jo5HkpW9Zg/H/zII0qBj9H1tM+tmxQpNZ6BXTvhcoNVsG1a
         9ea6hINO/2hxMVIin2Ig4PHmu4o9G/a5wlO5GTDSOx1cddrfFWocayswjFw6+ES4Pq
         Gb6QH3yeIxWvBAnYSHSXqs00PkeI23c5U7GM3TrM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 17/17] media: i2c: imx290: Handle error from imx290_set_data_lanes()
Date:   Mon, 16 Jan 2023 16:44:54 +0200
Message-Id: <20230116144454.1012-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes since v1:

- New patch
---
 drivers/media/i2c/imx290.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index bb8713813e29..49d6c8bdec41 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -756,7 +756,11 @@ static int imx290_start_streaming(struct imx290 *imx290,
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

