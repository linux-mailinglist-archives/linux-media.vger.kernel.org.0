Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F165879EA30
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241126AbjIMN4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241084AbjIMN4f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CEF19B1
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AF0E1AF0;
        Wed, 13 Sep 2023 15:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613298;
        bh=KlkTrlEiC9UxqDYIUDdy0n61YvSJpy2S7v3R4Ecs99U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tRT6z8Or3HWVEyAOkVog4ypSFFvWdsz82KXa6bj3gRLnXR54Ud5dPUV1d78abn9Qb
         WdhHg3V7bl3Gi0J8FSQXOjq9e97TmSgQUp4RDInW5s4U3hQ/MoQooEgMOQIBQFWnY1
         QyXMIpIOHg8QoxynreYQJYEt413Z54cMLdi8unxo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 04/20] media: i2c: imx219: Drop IMX219_REG_CSI_LANE_MODE from common regs array
Date:   Wed, 13 Sep 2023 16:56:22 +0300
Message-ID: <20230913135638.26277-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX219_REG_CSI_LANE_MODE is configured twice, once with a hardcoded
value in the imx219_common_regs registers array, and once with the value
appropriate for the system in imx219_configure_lanes(). The latter is
enough, drop the former.

Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index fbf4c69577f7..d8840aa67c42 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -214,7 +214,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ IMX219_REG_Y_ODD_INC_A, 1 },
 
 	/* Output setup registers */
-	{ IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
 	{ IMX219_REG_DPHY_CTRL, IMX219_DPHY_CTRL_TIMING_AUTO },
 	{ IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1000000) },
 };
-- 
Regards,

Laurent Pinchart

