Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B129E5FFD87
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiJPGQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiJPGQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D503ED51
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAF92E65;
        Sun, 16 Oct 2022 08:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900978;
        bh=SKUDYxfWarqX95ElYU1IkMHkQFJtE8to8v78smkrr4g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j92kUbcZLEjBeo9PLa0yjbQb6D/Z+Cyh0tMX9Y3QVEpMoaNNG0SkZgu5A7zXkJmPV
         yhvBvSvnYrzwAhP/LJibMvWRYQAhleXlQcxPv/krBqXsn9fE8xcUjP2GoSSyxXMoKC
         IvYAFb3Ah2qBynQtjbFP5tPtxRtKbOxgq/LIG79w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 20/20] media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
Date:   Sun, 16 Oct 2022 09:15:23 +0300
Message-Id: <20221016061523.30127-21-laurent.pinchart@ideasonboard.com>
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

The IMX290 gain register controls the analogue gain. Replace the
V4L2_CID_GAIN control with V4L2_CID_ANALOGUE_GAIN.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 53db66068538..ffc072535be0 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -524,7 +524,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	switch (ctrl->id) {
-	case V4L2_CID_GAIN:
+	case V4L2_CID_ANALOGUE_GAIN:
 		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
 		break;
 
@@ -1015,7 +1015,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	 * gain control should be adjusted accordingly.
 	 */
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_GAIN, 0, 100, 1, 0);
+			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
-- 
Regards,

Laurent Pinchart

