Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4907CDD0C
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 15:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjJRNRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 09:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbjJRNRk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 09:17:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1226195
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 06:17:39 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D918B2B3;
        Wed, 18 Oct 2023 15:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697635050;
        bh=+ozrzQQSGP1QwCylozlA5ZbUcJOXCNAT1SFWc6r4OSs=;
        h=From:To:Cc:Subject:Date:From;
        b=hlL2jDrukXKNObAzAqjvT8I53hEiykGwkaiQJHWKnHmKiPiDMGw+wXo6JSOmtAd6B
         n3pZJw6kEqoLOMyI5ybWlEynniLQqYLt4xZzedG6DXPAMUC8FRDEBnVZC+/G9sfC8V
         L9ddnI9ZrAVj42cCUGCscgwFyIyrasMKAdS2By24=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: css: Write LINE_LENGTH_PCK correctly
Date:   Wed, 18 Oct 2023 18:47:29 +0530
Message-Id: <20231018131729.1022521-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
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

According to MIPI CCS v1.1 specification, the LINE_LENGTH_PCK
units is in VT pixel clocks (Section 8.2.6).

To compute how many pixel clocks it takes, simply divide the
VT pixel clock frequency by the number of pixels in a single line.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Testing:

The patch is tested using IMX519 with CCS.
This patch makes the frame buffer being filled to the fullest
(instead of getting 1/3rd only previously) - without any workarounds.
---
 drivers/media/i2c/ccs/ccs-core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 16de66a37fad..12c75a843dfe 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -734,9 +734,11 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		break;
 	case V4L2_CID_HBLANK:
-		rval = ccs_write(sensor, LINE_LENGTH_PCK,
-				 sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
-				 + ctrl->val);
+		/* LINE_LENGTH_PCK units are in VT pixel clocks. */
+		u16 line_length_pck =
+			sensor->pll.vt_bk.pix_clk_freq_hz /
+			(sensor->pixel_array->crop[CCS_PA_PAD_SRC].width + ctrl->val);
+		rval = ccs_write(sensor, LINE_LENGTH_PCK, line_length_pck);
 
 		break;
 	case V4L2_CID_TEST_PATTERN:
-- 
2.40.1

